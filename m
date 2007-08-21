From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 21 Aug 2007 10:23:16 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
In-Reply-To: <20070821013237.256CCA470E@busybox.net>
References: <20070821013237.256CCA470E@busybox.net>
Message-ID: <20070821082316.GC14397@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2007 at 06:32:37PM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-08-20 18:32:37 -0700 (Mon, 20 Aug 2007)
>New Revision: 19595
>
>Log:
>Fix configure problem with libdaemon, by patching result from autotools
>
>Added:
>   trunk/buildroot/package/libdaemon/libdaemon-0.10.patch.bz2
>
>Modified:
>   trunk/buildroot/package/libdaemon/libdaemon.mk
>
>
>Changeset:
>Added: trunk/buildroot/package/libdaemon/libdaemon-0.10.patch.bz2
>===================================================================
>(Binary files differ)
>
>
>Property changes on: trunk/buildroot/package/libdaemon/libdaemon-0.10.patch.bz2
>___________________________________________________________________
>Name: svn:mime-type
>   + application/octet-stream
>
>Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
>===================================================================
>--- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-08-21 01:28:12 UTC (rev 19594)
>+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-08-21 01:32:37 UTC (rev 19595)
>@@ -12,9 +12,10 @@
> # later version.
> 
> LIBDAEMON_VERSION:=0.10
>-LIBDAEMON_DIR:=$(BUILD_DIR)/libdaemon-$(LIBDAEMON_VERSION)
>+LIBDAEMON_NAME:=libdaemon-$(LIBDAEMON_VERSION)
>+LIBDAEMON_DIR:=$(BUILD_DIR)/$(LIBDAEMON_NAME)
> LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
>-LIBDAEMON_SOURCE:=libdaemon-$(LIBDAEMON_VERSION).tar.gz
>+LIBDAEMON_SOURCE:=$(LIBDAEMON_NAME).tar.gz
> LIBDAEMON_CAT:=$(ZCAT)
> 
> $(DL_DIR)/$(LIBDAEMON_SOURCE):
>@@ -25,6 +26,10 @@
> $(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
> 	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
>+	mkdir	-p $(PROJECT_BUILD_DIR)/patches
>+	bzcat package/libdaemon/$(LIBDAEMON_NAME).patch.bz2 \

This will break on a variety of hosts. Use BR2_BZCAT instead (i.e.
honour what the user told us).
