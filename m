From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 08:29:44 +0200
Subject: [Buildroot] [git commit] package/freeswitch: fix build error
Message-ID: <20200727062537.19293885DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c2e8b2b29a88c35c8a9867537d3ce3d0af85bc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Freeswitch has been tested agains tan older version of libcheck, 0.12.0
or earlier, while Buildroot has 0.15.1. With 0.13.0, the API of libcheck
has changed, and Freeswitch does not account for this.

Fixes
http://autobuild.buildroot.net/results/5db/5dbce5860f57c1457962aa295857689f49a60bc6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr: expand commit log with the root cause]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../freeswitch/0001-sofia-sip-fix-s2tcase.c.patch  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch b/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch
new file mode 100644
index 0000000000..1f74b4a5a3
--- /dev/null
+++ b/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch
@@ -0,0 +1,38 @@
+From d66a2e55daf223737c07c59b1be45a2d91212ef6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 26 Jul 2020 13:47:16 +0200
+Subject: [PATCH] [sofia-sip] fix s2tcase.c
+
+Fixes build error with recent libcheck:
+https://github.com/signalwire/freeswitch/issues/681
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libs/sofia-sip/s2check/s2tcase.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libs/sofia-sip/s2check/s2tcase.c b/libs/sofia-sip/s2check/s2tcase.c
+index 382aaa3ad7..d67694c2ce 100644
+--- a/libs/sofia-sip/s2check/s2tcase.c
++++ b/libs/sofia-sip/s2check/s2tcase.c
+@@ -57,7 +57,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
+       if (strcmp(*patterns, "*")) {
+ 	printf("%s: selected\n", name);
+       }
+-      _tcase_add_test(tc, tf, name, signo, 0, start, end);
++      _tcase_add_test(tc, tf, name, signo, start, end);
+       return;
+     }
+   }
+@@ -67,7 +67,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
+       if (strcmp(*patterns, "*")) {
+ 	printf("%s: selected\n", name);
+       }
+-      _tcase_add_test(tc, tf, name, signo, 0, start, end);
++      _tcase_add_test(tc, tf, name, signo, start, end);
+       return;
+     }
+   }
+-- 
+2.27.0
+
