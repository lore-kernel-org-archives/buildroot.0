From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:45:42 +0100
Subject: [Buildroot] [PATCH 2/2] package/vim: add optional support for gmp
In-Reply-To: <1456008342-10748-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456008342-10748-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456008342-10748-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When gmp was compiled before, vim will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/vim | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libacl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libgpm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libncurses.so.5]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vim/vim.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index d9e0b60..6e05050 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -34,6 +34,13 @@ else
 VIM_CONF_OPTS += --disable-acl
 endif
 
+ifeq ($(BR2_PACKAGE_GPM),y)
+VIM_CONF_OPTS += --enable-gpm
+VIM_DEPENDENCIES += gpm
+else
+VIM_CONF_OPTS += --disable-gpm
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 VIM_CONF_OPTS += --enable-selinux
 VIM_DEPENDENCIES += libselinux
-- 
2.7.0
