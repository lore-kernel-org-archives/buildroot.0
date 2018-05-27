From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:13:15 +0200
Subject: [Buildroot] [PATCH] poppler: fix sparc compilation error
In-Reply-To: <20180525173607.GA27418@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Fri, 25 May 2018 19:36:07 +0200")
References: <20180525173607.GA27418@waldemar-brodkorb.de>
Message-ID: <87muwkn6ok.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Fixes:
 >   http://autobuild.buildroot.net/results/64a96663a48ab644bc03c9a3ec2d6a644119dee6
 >   http://autobuild.buildroot.net/results/82e85e12478fc1972b70ad728ed7c1554920c9e3

A bit more detailed commit description would be nice. Why is this only
happening on Sparc? Who uses atomic operations, Qt5?

Is it related to the snippet we have in qt5base.mk:

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
# Qt 5.8 needs atomics, which on various architectures are in -latomic
define QT5BASE_CONFIGURE_ARCH_CONFIG
	printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
endef
endif

And E.G. is only needed for QT5_VERSION_LATEST?

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  package/poppler/poppler.mk | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
 > index 5946cbe..6223bf1 100644
 > --- a/package/poppler/poppler.mk
 > +++ b/package/poppler/poppler.mk
 > @@ -94,6 +94,9 @@ POPPLER_CONF_OPTS += --enable-poppler-qt5
 >  ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 >  POPPLER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 >  endif
 > +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 > +POPPLER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -latomic"
 > +endif

Doesn't that override the -std=c++11 just above? Why is this passed in
CXXFLAGS and not E.G. LIBS?

-- 
Bye, Peter Korsgaard
