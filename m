From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 21:33:28 +0200
Subject: [Buildroot] [PATCH] package/iproute2: disable iptables support
	for static build
In-Reply-To: <1431982453-17867-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Mon, 18 May 2015 22:54:13 +0200")
References: <1431982453-17867-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87egmc5pmf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > If iptable support is enabled, it will try to build m_xt.so even
 > for static build only.

 > So, disable iptables support for static build and remove
 > TC_CONFIG_IPSET and TC_CONFIG_XT if previously added by the
 > configure script.

The first part I get, but what are those sed invocations needed for?

I see the configure script is using pkg-config but we don't depend on
host-pkgconf. Running the configure script with/without I see the
following differences:

--- output/build/iproute2-4.0.0/Config.without 2015-05-19 21:03:14.735183540 +0200
+++ output/build/iproute2-4.0.0/Config.with  2015-05-19 21:03:39.835184550 +0200
@@ -2,8 +2,9 @@
 PKG_CONFIG:=/home/peko/source/buildroot/output/host/usr/bin/pkg-config
 AR:=/home/peko/source/buildroot/output/host/usr/bin/arm-linux-ar
 CC:=/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc
+TC_CONFIG_XT:=y
 TC_CONFIG_IPSET:=y
-IPT_LIB_DIR:=/lib/xtables
+IPT_LIB_DIR:=/usr/lib/xtables
 HAVE_LATEX:=y
 HAVE_PDFLATEX:=y
 IPT_LIB_DIR:=/usr/lib/xtables


The whole iptables handling seems pretty broken. TC_CONFIG_XT gets
correctly detected if available, so we don't need to overwrite that, and
looking at the code, both -DIPT_LIB_DIR= and -DXT_LIB_DIR should be
passed to the compiler, as the default values fit neither of them.

I'm not sure why we are mangling CONFIG_IPSET as the only place it is
used is in tc/Makefile:

ifeq ($(TC_CONFIG_IPSET), y)
  ifeq ($(TC_CONFIG_XT), y)
    TCMODULES += em_ipset.o
  endif
endif

So as long as the detection works it should be enough to force
TC_CONFIG_XT off in the static case.

So what about we do:

- Add host-pkgconf to _DEPENDENCIES
- Add the BR2_STATIC_LIBS conditional for iptables and force
  TC_CONFIG_XT:=n in the else clause.
- Drop the TC_CONFIG_XT:=y and TC_CONFIG_IPSET:=n overrides
- Replace the s/-DIPT/-DXT/ handling for iptables with something like:
  $(SED) 's/XT_LIB_DIR/IPT_LIB_DIR/' $(@D)/tc/m_xt.c
- Drop the IPT_LIB_DIR override in _CONFIGURE_CMDS

Gustavo, you normally take care of iproute2, what do you say?


 > Fixes:
 
 > http://autobuild.buildroot.net/results/3b3/3b37871bdf5766677fc20dca22c13177091d104f/

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > ---
 >  package/iproute2/iproute2.mk | 5 ++++-
 >  1 file changed, 4 insertions(+), 1 deletion(-)

 > diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
 > index 9595165..d97e75e 100644
 > --- a/package/iproute2/iproute2.mk
 > +++ b/package/iproute2/iproute2.mk
 > @@ -18,7 +18,7 @@ IPROUTE2_DEPENDENCIES += busybox
 >  endif
 
 >  # If we've got iptables enable xtables support for tc
 > -ifeq ($(BR2_PACKAGE_IPTABLES),y)
 > +ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 >  IPROUTE2_DEPENDENCIES += iptables
 >  define IPROUTE2_WITH_IPTABLES
 >  	# Makefile is busted so it never passes IPT_LIB_DIR properly
 > @@ -27,6 +27,9 @@ define IPROUTE2_WITH_IPTABLES
 >  endef
 >  else
 >  define IPROUTE2_WITH_IPTABLES
 > +	# delete TC_CONFIG_IPSET and TC_CONFIG_XT if any
 > +	$(SED) '/TC_CONFIG_IPSET/d' $(IPROUTE2_DIR)/Config
 > +	$(SED) '/TC_CONFIG_XT/d' $(IPROUTE2_DIR)/Config
 >  	# em_ipset needs xtables, but configure misdetects it
 >  	echo "TC_CONFIG_IPSET:=n" >>$(IPROUTE2_DIR)/Config
 >  endef
 > -- 
 > 1.9.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
