From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 13:06:03 +0200
Subject: [Buildroot] [git commit] package/apparmor: fixing installation os
 detection
Message-ID: <20200424105529.9FF1B8FEAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf56da5481e2d34e98503c382bff17e9cf6b8a80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Actually the install target of some tools like the parser tries to do
an os detection to understand what install and where.
Incidentally, when the install is invoked on SuSE, this will trig a bug
in parallel install which manifests as "target/lib/apparmor: File exists"
error. For this problem, a patch is already sent upstream.

For buildroot instead, the os detection is useless so we disable it
and use a generic install method.

Fixes:
http://autobuild.buildroot.net/results/b18c6a9ce67065dcb7968c6f473b3b403d2925d2

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apparmor/apparmor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 311a79799f..9180fcd803 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -15,7 +15,7 @@ APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
 APPARMOR_DEPENDENCIES = libapparmor
 
 APPARMOR_TOOLS = parser
-APPARMOR_MAKE_OPTS = USE_SYSTEM=1
+APPARMOR_MAKE_OPTS = USE_SYSTEM=1 DISTRO=unknown
 
 ifeq ($(BR2_PACKAGE_APPARMOR_BINUTILS),y)
 APPARMOR_TOOLS += binutils
