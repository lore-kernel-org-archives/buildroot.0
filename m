From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2016 01:04:13 +0100
Subject: [Buildroot] [PATCH] unrar: new package
In-Reply-To: <1452084540-12198-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 6 Jan 2016 09:49:00 -0300")
References: <1452084540-12198-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vb687zb6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/Config.in        |  1 +
 >  package/unrar/Config.in  | 13 +++++++++++++
 >  package/unrar/unrar.hash |  2 ++
 >  package/unrar/unrar.mk   | 22 ++++++++++++++++++++++
 >  4 files changed, 38 insertions(+)
 >  create mode 100644 package/unrar/Config.in
 >  create mode 100644 package/unrar/unrar.hash
 >  create mode 100644 package/unrar/unrar.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 5f331d7..dba9ef3 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -56,6 +56,7 @@ endif
 >  	source "package/lz4/Config.in"
 >  	source "package/lzip/Config.in"
 >  	source "package/lzop/Config.in"
 > +	source "package/unrar/Config.in"
 >  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 >  	source "package/unzip/Config.in"
 >  endif
 > diff --git a/package/unrar/Config.in b/package/unrar/Config.in
 > new file mode 100644
 > index 0000000..29696c3
 > --- /dev/null
 > +++ b/package/unrar/Config.in
 > @@ -0,0 +1,13 @@
 > +config BR2_PACKAGE_UNRAR
 > +	bool "unrar"
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	depends on BR2_USE_WCHAR
 > +	help
 > +	  RAR file uncompressor.
 > +
 > +	  http://www.rarlab.com/rar_add.htm
 > +
 > +comment "unrar needs a toolchain w/ C++, wchar, threads"
 > +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 > +		|| !BR2_TOOLCHAIN_HAS_THREADS
 > diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
 > new file mode 100644
 > index 0000000..4490d70
 > --- /dev/null
 > +++ b/package/unrar/unrar.hash
 > @@ -0,0 +1,2 @@
 > +# Locally computed:
 > +sha256	ff593728aed0ac865908b8ea52cff449a4c298f095db2f3d27438ffbc3e35d5b	unrarsrc-5.3.9.tar.gz
 > diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
 > new file mode 100644
 > index 0000000..d0112e9
 > --- /dev/null
 > +++ b/package/unrar/unrar.mk
 > @@ -0,0 +1,22 @@
 > +################################################################################
 > +#
 > +# unrar
 > +#
 > +################################################################################
 > +
 > +UNRAR_VERSION = 5.3.9
 > +UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 > +UNRAR_SITE = http://www.rarlab.com/rar
 > +UNRAR_LICENSE = unrar
 > +UNRAR_LICENSE_FILES = license.txt
 > +
 > +define UNRAR_BUILD_CMDS
 > +	$(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
 > +		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread" -C $(@D)

The makefile also uses LDFLAGS but you didn't pass TARGET_LDFLAGS.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
