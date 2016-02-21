From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:29:08 +0100
Subject: [Buildroot] [git commit] package/vim: add optional support for acl
Message-ID: <20160221112922.1A605803C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46b084368e4f3e4c98194fc108ce0aaa60b6820f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When acl was compiled before, vim will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/vim | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libacl.so.1]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vim/vim.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 0749366..6e05050 100644
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
 ifeq ($(BR2_PACKAGE_GPM),y)
 VIM_CONF_OPTS += --enable-gpm
 VIM_DEPENDENCIES += gpm
