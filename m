From: Jonathan Nalley <buildroot@bluebot.org>
Date: Mon, 29 Oct 2007 10:55:49 -0500
Subject: [Buildroot] Several issues with building multiple "projects" for
	same architecture
Message-ID: <d83696340710290855s5e4e4f44y7b5777bfeacf4ec2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using the buildroot to build for several different boards, some of them
have the same CPU architecture (PPC405GP/EP).  I have noticed some issues
with the "project" concept in the buildroot.  Since the builds are for the
same architecture the toolchain is created under "build_powerpc".
Everything works fine for the first board, but for subsequent builds for
different "project" names things are missing under
"project_build_powerpc/PROJECT_NAME/root".  Specifically:

/root/lib/libgcc_s.so
/root/usr/lib/libstdc++.so
/root/usr/sbin/ethtool

This is because the make files that install those files check for:

$(GCC_BUILD_DIR2)/.libs_installed

and

$(ETHTOOL_DIR)/.installed

(There are several other packages whose make files also behave this way)

The problem with this is that the files are only installed for the first
project, subsequent projects see the .installed file in the BUILD directory
and think that files have already been copied to the TARGET directory.  Is
there a reason that the buildroot relies on .installed files instead of the
actual target file?

For example to fix ethtool I made the following change:

diff -r ff93bc269d3d buildroot/package/ethtool/ethtool.mk
--- a/buildroot/package/ethtool/ethtool.mk      Mon Oct 29 10:03:23 2007
-0500
+++ b/buildroot/package/ethtool/ethtool.mk      Mon Oct 29 10:50:36 2007
-0500
@@ -33,11 +33,11 @@ ETHTOOL_CAT:=$(ZCAT)
 $(ETHTOOL_DIR)/ethtool: $(ETHTOOL_DIR)/.configured
        $(MAKE) CC=$(TARGET_CC) -C $(ETHTOOL_DIR)

-$(ETHTOOL_DIR)/.installed: $(ETHTOOL_DIR)/ethtool
+$(TARGET_DIR)/usr/sbin/ethtool: $(ETHTOOL_DIR)/ethtool
        cp $(ETHTOOL_DIR)/ethtool $(TARGET_DIR)/usr/sbin
        touch $@

-ethtool: uclibc $(ETHTOOL_DIR)/.installed
+ethtool: uclibc $(TARGET_DIR)/usr/sbin/ethtool

 ethtool-source: $(DL_DIR)/$(ETHTOOL_SOURCE)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071029/04a8e654/attachment-0001.htm 
