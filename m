From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:27:39 +0100
Subject: [Buildroot] [git commit] package/vim: add optional support for gpm
Message-ID: <20160221112751.ACB40817EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab0f1bf29bd861f3a2274a7c6755e40ddba0830c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vim/vim.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index a6b75d0..0749366 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -27,6 +27,13 @@ VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
 VIM_LICENSE = Charityware
 VIM_LICENSE_FILES = README.txt
 
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
