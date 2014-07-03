From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Jul 2014 16:34:43 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix build
In-Reply-To: <1404394272-5894-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Thu, 3 Jul 2014 15:31:12 +0200")
References: <1404394272-5894-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87mwcq8q9o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > add $(2)_CONV_ENV in perl infrastructure

Please send that as a seperate patch.

 > see http://autobuild.buildroot.net/results/135/135867ef85535863e3647cc5fb82accb6f77612c/


 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/perl-net-ssleay/perl-net-ssleay.mk | 7 +++++++
 >  package/pkg-perl.mk                        | 4 ++++
 >  2 files changed, 11 insertions(+)

 > diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
 > index 413fdf0..48ff715 100644
 > --- a/package/perl-net-ssleay/perl-net-ssleay.mk
 > +++ b/package/perl-net-ssleay/perl-net-ssleay.mk
 > @@ -11,4 +11,11 @@ PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
 >  PERL_NET_SSLEAY_LICENSE = OpenSSL
 >  PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 
 > +PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
 > +
 > +define PERL_NET_SSLEAY_FIX_MAKEFILE
 > +	$(SED) 's/^LDDLFLAGS =.*/LDDLFLAGS = -shared/' $(@D)/Makefile

What about BR2_PREFER_STATIC_LIB builds?

Looking at the build failure, the problem seems to be about a mix of
host and target flags (E.G. the -L/usr/lib), rather than anything about
static/shared linking.

 > +endef
 > +PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
 > +
 >  $(eval $(perl-package))
 > diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
 > index 5cfdc77..8c45001 100644
 > --- a/package/pkg-perl.mk
 > +++ b/package/pkg-perl.mk
 > @@ -49,6 +49,7 @@ ifeq ($(4),target)
 >  # Configure package for target
 >  define $(2)_CONFIGURE_CMDS
 >  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 > +		$$($(2)_CONF_ENV) \
 >  		PERL_MM_USE_DEFAULT=1 \
 >  		perl Build.PL \
 >  			--config ar="$$(TARGET_AR)" \
 > @@ -69,6 +70,7 @@ define $(2)_CONFIGURE_CMDS
 >  			--install_path libdoc=/usr/share/man/man3 \
 >  			$$($(2)_CONF_OPT); \
 >  	else \
 > +		$$($(2)_CONF_ENV) \
 >  		PERL_MM_USE_DEFAULT=1 \
 >  		PERL_AUTOINSTALL=--skipdeps \
 >  		perl Makefile.PL \
 > @@ -95,12 +97,14 @@ else
 >  # Configure package for host
 >  define $(2)_CONFIGURE_CMDS
 >  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 > +		$$($(2)_CONF_ENV) \
 >  		PERL_MM_USE_DEFAULT=1 \
 >  		perl Build.PL \
 >  			--install_base $$(HOST_DIR)/usr \
 >  			--installdirs vendor \
 >  			$$($(2)_CONF_OPT); \
 >  	else \
 > +		$$($(2)_CONF_ENV) \
 >  		PERL_MM_USE_DEFAULT=1 \
 >  		PERL_AUTOINSTALL=--skipdeps \
 >  		perl Makefile.PL \
 > -- 
 > 1.9.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
