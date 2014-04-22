From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 23:36:40 +0200
Subject: [Buildroot] [PATCH] evtest: bump version to 1.31
In-Reply-To: <1398202048-28811-1-git-send-email-ps.report@gmx.net>
References: <1398202048-28811-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140422233640.601f7697@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 22 Apr 2014 23:27:28 +0200, Peter Seiderer wrote:

> -if BR2_PACKAGE_EVTEST
> -
> -config BR2_PACKAGE_EVTEST_CAPTURE
> -	bool "evtest-capture"
> -	select BR2_PACKAGE_LIBXML2
> -	help
> -	  evtest-capture captures the information and events from the
> -	  input device specified on the command line and writes it to
> -	  the xml file given.

Since you're removing one option, this option should be added to
Config.in.legacy so that users are notified of the removal.

> -EVTEST_VERSION = 1.30
> -EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.bz2
> -# no official upstream tarball
> -EVTEST_SITE = http://pkgs.fedoraproject.org/repo/pkgs/evtest/evtest-1.30.tar.bz2/27c0902839babfd07136f232c63c895c/
> +EVTEST_VERSION = 1.31
> +EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.gz
> +EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
>  EVTEST_LICENSE = GPLv2

According to evtest.c, the license seems to be GPLv2+ now.

>  EVTEST_LICENSE_FILES = COPYING
>  EVTEST_DEPENDENCIES = host-pkgconf
> -
> -ifeq ($(BR2_PACKAGE_EVTEST_CAPTURE),y)
> -EVTEST_DEPENDENCIES += libxml2
> -else
> -# evtest-capture will unconditionally be built/installed if libxml2 is present
> -define EVTEST_REMOVE_EVTEST_CAPTURE
> -	rm -rf $(TARGET_DIR)/usr/bin/evtest-capture \
> -	       $(TARGET_DIR)/usr/share/evtest \
> -	       $(TARGET_DIR)/usr/share/man/man1/evtest-capture.1
> -endef
> -
> -EVTEST_POST_INSTALL_TARGET_HOOKS += EVTEST_REMOVE_EVTEST_CAPTURE
> -endif
> +# needed because source package contains no generated files
> +EVTEST_AUTORECONF = YES
>  
>  $(eval $(autotools-package))

Otherwise, looks good, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
