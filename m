From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 21:15:12 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: bump version to
 0.10.3
Message-ID: <20200727191108.2B0ED82AFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89fc19e8311acaa0589745ed973daa8eaca0060d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove upstream patch.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...002-Add-test-for-Wunused-but-set-variable.patch |  2 +-
 ...us_audiobridge.c-fix-build-without-libogg.patch | 74 ----------------------
 package/janus-gateway/janus-gateway.hash           |  2 +-
 package/janus-gateway/janus-gateway.mk             |  2 +-
 4 files changed, 3 insertions(+), 77 deletions(-)

diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index c68d6b3b02..b54c8cbec6 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -60,7 +60,7 @@ index ca17a29..beef91a 100644
 +		-Wunsafe-loop-optimizations"
  esac
  
- JANUS_VERSION=101
+ JANUS_VERSION=103
 diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
 new file mode 100644
 index 0000000..51df0c0
diff --git a/package/janus-gateway/0003-plugins-janus_audiobridge.c-fix-build-without-libogg.patch b/package/janus-gateway/0003-plugins-janus_audiobridge.c-fix-build-without-libogg.patch
deleted file mode 100644
index 1d25b1a071..0000000000
--- a/package/janus-gateway/0003-plugins-janus_audiobridge.c-fix-build-without-libogg.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From b728e30508101093331b08ac617e6315ba82caa1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 20 Jun 2020 15:38:08 +0200
-Subject: [PATCH] plugins/janus_audiobridge.c: fix build without libogg
-
-Build without libogg is broken since commit
-53761d07c5456424d368c708fda2757e6606a4bf:
-
-plugins/janus_audiobridge.c:1337:41: error: 'janus_audiobridge_participant' {aka 'struct janus_audiobridge_participant'} has no member named 'annc'
- 1337 |  janus_audiobridge_file_free(participant->annc);
-      |                                         ^~
-  CC       plugins/plugins_libjanus_nosip_la-janus_nosip.lo
-plugins/janus_audiobridge.c: In function 'janus_audiobridge_mixer_thread':
-plugins/janus_audiobridge.c:6394:9: error: 'janus_audiobridge_participant' {aka 'struct janus_audiobridge_participant'} has no member named 'annc'
- 6394 |     if(p->annc == NULL || g_atomic_int_get(&p->destroyed)) {
-      |         ^~
-plugins/janus_audiobridge.c:6398:16: warning: implicit declaration of function 'janus_audiobridge_file_read'; did you mean 'janus_audiobridge_mixer_thread'? [-Wimplicit-function-declaration]
- 6398 |     int read = janus_audiobridge_file_read(p->annc, p->decoder, resampled, sizeof(resampled));
-      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
-      |                janus_audiobridge_mixer_thread
-plugins/janus_audiobridge.c:6398:16: warning: nested extern declaration of 'janus_audiobridge_file_read' [-Wnested-externs]
-plugins/janus_audiobridge.c:6398:45: error: 'janus_audiobridge_participant' {aka 'struct janus_audiobridge_participant'} has no member named 'annc'
- 6398 |     int read = janus_audiobridge_file_read(p->annc, p->decoder, resampled, sizeof(resampled));
-      |                                             ^~
-plugins/janus_audiobridge.c:6401:10: error: 'janus_audiobridge_participant' {aka 'struct janus_audiobridge_participant'} has no member named 'annc'
- 6401 |      if(p->annc->started) {
-      |          ^~
-plugins/janus_audiobridge.c:6428:10: error: 'janus_audiobridge_participant' {aka 'struct janus_audiobridge_participant'} has no member named 'annc'
- 6428 |     if(!p->annc->started) {
-      |          ^~
-plugins/janus_audiobridge.c:6430:7: error: 'janus_audiobridge_participant' {aka 'struct janus_audiobridge_participant'} has no member named 'annc'
- 6430 |      p->annc->started = TRUE;
-      |       ^~
-  CC       plugins/plugins_libjanus_streaming_la-janus_streaming.lo
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/meetecho/janus-gateway/pull/2238]
----
- plugins/janus_audiobridge.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/plugins/janus_audiobridge.c b/plugins/janus_audiobridge.c
-index 200a1f1d..ee931e24 100644
---- a/plugins/janus_audiobridge.c
-+++ b/plugins/janus_audiobridge.c
-@@ -1334,7 +1334,9 @@ static void janus_audiobridge_participant_free(const janus_refcount *participant
- 		}
- 		g_async_queue_unref(participant->outbuf);
- 	}
-+#ifdef HAVE_LIBOGG
- 	janus_audiobridge_file_free(participant->annc);
-+#endif
- 	g_free(participant);
- }
- 
-@@ -6385,6 +6387,7 @@ static void *janus_audiobridge_mixer_thread(void *data) {
- 			janus_mutex_unlock(&p->qmutex);
- 			ps = ps->next;
- 		}
-+#ifdef HAVE_LIBOGG
- 		/* If there are announcements playing, mix those too */
- 		GList *anncs_list = g_hash_table_get_values(audiobridge->anncs);
- 		if(anncs_list != NULL) {
-@@ -6458,6 +6461,7 @@ static void *janus_audiobridge_mixer_thread(void *data) {
- 				ps = ps->next;
- 			}
- 		}
-+#endif
- 		/* Are we recording the mix? (only do it if there's someone in, though...) */
- 		if(audiobridge->recording != NULL && g_list_length(participants_list) > 0) {
- 			for(i=0; i<samples; i++) {
--- 
-2.26.2
-
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 64af919519..ee71979b88 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  731760e6911908bc523815809487e51320a738f3533f267d4beb83eaa725de85  janus-gateway-0.10.1.tar.gz
+sha256  7f8c58e5c5ed94821ce877169da90c00e4adf81920ed383a2e0ec241960d121b  janus-gateway-0.10.3.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 94d83eb33e..444c396b97 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.10.1
+JANUS_GATEWAY_VERSION = 0.10.3
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
