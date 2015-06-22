From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2015 22:54:40 +0200
Subject: [Buildroot] [git commit] package/pinentry: fix build with Qt4
Message-ID: <20150622205852.4837F807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b59802dc0dcf1cb9332b2d7f9475343719b1d2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Help configure find the correct moc, as the comment in m4/qt.m4 states:

    #configure tried to run $ac_cv_path_moc and the test didn't
    #succeed. If configure shouldn't have tried this one, set
    #the environment variable MOC to the right one before running
    #configure.

Fixes:
    http://autobuild.buildroot.org/results/06c/06c5c2762ec22271fec20a6d15548011e40875d1
    http://autobuild.buildroot.org/results/0d7/0d78a2ff8c952cd104794f5049b07216978fdf11
    http://autobuild.buildroot.org/results/af8/af8f7f588dfa64d82c98a4b42ec78fd17dde137c

Also fixes using the host moc:
    http://autobuild.buildroot.org/results/836/836962f23dcad77b145fcdfeffb40e38e64d6971

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pinentry/pinentry.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index e8db342..d3e6b7a 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -39,7 +39,7 @@ endif
 ifeq ($(BR2_PACKAGE_PINENTRY_QT4),y)
 # -pthread needs to be passed for certain toolchains
 # http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/
-PINENTRY_CONF_OPTS += LIBS=-pthread
+PINENTRY_CONF_OPTS += LIBS=-pthread MOC=$(HOST_DIR)/usr/bin/moc
 PINENTRY_CONF_OPTS += --enable-pinentry-qt4
 PINENTRY_DEPENDENCIES += qt
 else
