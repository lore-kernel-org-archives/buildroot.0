From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon,  1 Apr 2019 16:20:57 +0300
Subject: [Buildroot] [PATCH 1/1] package/vim: fix build for the host if NLS
 is disabled
Message-ID: <1554124857-10946-1-git-send-email-email@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

host-vim started fail after gettext-tiny was introduced in:

    5367a1b package/gettext-tiny: new package

which forces to use host-gettext-tiny as gnu's host-gettext replacament
if NLS is disabled, and msgfmt from gettext-tiny's package crashes while
processing translation files, so fix it by use '--disable-nls' for
a host-vim because host variant does not require any tranalations.

Fixes:
	http://autobuild.buildroot.net/results/0948ab6fd959940c836e06f5b632b36443a53451
	http://autobuild.buildroot.net/results/cfa6f78caea012ea4423e807ce8ceb997bc1f908
	http://autobuild.buildroot.net/results/6d417ab6a0e369b6c7023ce7d40d9b31fa0adeaf
	http://autobuild.buildroot.net/results/4369725cdea72b168dfa760d54ac038f2e0506de
	http://autobuild.buildroot.net/results/a9b72f138595e39be51b37d93bc43e0e8a39e5f6
	http://autobuild.buildroot.net/results/dadf5e71942b807bb4d18108c043ce81b349781c
	http://autobuild.buildroot.net/results/05d48cc5ef1068537d45169a4930927060e1cd7a
	http://autobuild.buildroot.net/results/993392c1213889e4e2bb9c06235d2f2f16a5cafe
	http://autobuild.buildroot.net/results/314acaa9e87e8e896a6af7d49ee0e59643ced500

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/vim/vim.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index ee0c8b6..1e2d85d 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -80,6 +80,13 @@ VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
 endif
 
 HOST_VIM_DEPENDENCIES = host-ncurses
+HOST_VIM_CONF_OPTS = --with-tlib=ncurses \
+		     --enable-gui=no \
+		     --without-x \
+		     --disable-acl \
+		     --disable-gpm \
+		     --disable-selinux \
+		     --disable-nls
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.7.4
