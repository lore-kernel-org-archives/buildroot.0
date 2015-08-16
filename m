From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 16:38:47 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/libnetfilter_queue: fix
	build with musl
Message-ID: <1439735927-10364-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a patch from upstream.

Fixes:
    http://autobuild.buildroot.org/results/59b/59bd31c10a0d445d2ea56550a36920ecb2ef89ed/
    http://autobuild.buildroot.org/results/60a/60ab98b4cf909b04a57207b2326e9f8080d1721b/
    http://autobuild.buildroot.org/results/7db/7db3a5c2bebabfdc26947f45382893bb14656617/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libnetfilter_queue/0002-musl.patch | 45 ++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/libnetfilter_queue/0002-musl.patch

diff --git a/package/libnetfilter_queue/0002-musl.patch b/package/libnetfilter_queue/0002-musl.patch
new file mode 100644
index 0000000..3765d58
--- /dev/null
+++ b/package/libnetfilter_queue/0002-musl.patch
@@ -0,0 +1,45 @@
+From 5348da83403383a60831f4c297841afb98692887 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 14:45:46 +0200
+Subject: [PATCH] extra: Define _GNU_SOURCE to get members of tcphdr&ucphdr
+
+The source uses linux names for members of tcphdr. For example
+"source" instead of "th_sport", ... musl libc's headers need
+_GNU_SOURCE defined in order to expose these.
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+[yann.morin.1998 at free.fr: backported from upstream]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ src/extra/tcp.c | 1 +
+ src/extra/udp.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/extra/tcp.c b/src/extra/tcp.c
+index bf161aa..d1cd79d 100644
+--- a/src/extra/tcp.c
++++ b/src/extra/tcp.c
+@@ -15,6 +15,7 @@
+ #include <arpa/inet.h>
+ #include <netinet/ip.h>
+ #include <netinet/ip6.h>
++#define _GNU_SOURCE
+ #include <netinet/tcp.h>
+ 
+ #include <libnetfilter_queue/libnetfilter_queue.h>
+diff --git a/src/extra/udp.c b/src/extra/udp.c
+index 6e6baed..8c44a66 100644
+--- a/src/extra/udp.c
++++ b/src/extra/udp.c
+@@ -14,6 +14,7 @@
+ #include <arpa/inet.h>
+ #include <netinet/ip.h>
+ #include <netinet/ip6.h>
++#define _GNU_SOURCE
+ #include <netinet/udp.h>
+ 
+ #include <libnetfilter_queue/libnetfilter_queue.h>
+-- 
+1.9.1
+
-- 
1.9.1
