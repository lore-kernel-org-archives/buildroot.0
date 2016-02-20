From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:45:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/vim: add optional support for acl
Message-ID: <1456008342-10748-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When acl was compiled before, vim will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/vim | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libacl.so.1]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vim/vim.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index a6b75d0..d9e0b60 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -27,6 +27,13 @@ VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
 VIM_LICENSE = Charityware
 VIM_LICENSE_FILES = README.txt
 
+ifeq ($(BR2_PACKAGE_ACL),y)
+VIM_CONF_OPTS += --enable-acl
+VIM_DEPENDENCIES += acl
+else
+VIM_CONF_OPTS += --disable-acl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 VIM_CONF_OPTS += --enable-selinux
 VIM_DEPENDENCIES += libselinux
-- 
2.7.0
