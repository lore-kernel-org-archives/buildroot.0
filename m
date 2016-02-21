From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 07:32:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/vim: add optional support for gpm
Message-ID: <1456036379-10200-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When gpm was compiled before, vim will use it as optional dependency:

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
v2: fixed typos gmp -> gpm (Ricardo)

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
