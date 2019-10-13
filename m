From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Oct 2019 22:16:59 +0200
Subject: [Buildroot] [git commit] package/gst1-plugins-bad: drop patch
Message-ID: <20191013201236.C0C5C814A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa36ff8f1aadefdf118f84bcb9667dfd6472d744
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is already in version in 1.16.1 thanks to
https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/commit/93a374d18e09d00f903dedee2a3427218691f6b0

Fixes:
 - http://autobuild.buildroot.org/results/9d54bf2ff8d557f98afdcb03f38053bcebf72e48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-fix-hls-meson-logic.patch                 | 48 ----------------------
 1 file changed, 48 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/0002-fix-hls-meson-logic.patch b/package/gstreamer1/gst1-plugins-bad/0002-fix-hls-meson-logic.patch
deleted file mode 100644
index 84b0739110..0000000000
--- a/package/gstreamer1/gst1-plugins-bad/0002-fix-hls-meson-logic.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 172e4bc2a694162c1a38a758874b647234081b4c Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Wed, 29 May 2019 13:29:51 -0400
-Subject: [PATCH] ext/hls/meson.build: fix dependency logic
-
-Currently, if one was to set -Dhls-crypto to either libgcrypt or openssl
-instead of auto, the following lines would fail because hls_crypto_dep is not
-yet set:
-
-if not hls_crypto_dep.found() and ['auto', 'libgcrypt'].contains(hls_crypto)
-if not hls_crypto_dep.found() and ['auto', 'openssl'].contains(hls_crypto)
-
-Instead, change "if not hls_crypto_dep.found()" to "if not have_hls_crypto"
-which fixes the error.
-
-Upstream status: Accepted
-https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/merge_requests/372
-
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- ext/hls/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ext/hls/meson.build b/ext/hls/meson.build
-index fb5a7d4cc..0d33327ad 100644
---- a/ext/hls/meson.build
-+++ b/ext/hls/meson.build
-@@ -23,7 +23,7 @@ if not hls_option.disabled()
-     endif
-   endif
- 
--  if not hls_crypto_dep.found() and ['auto', 'libgcrypt'].contains(hls_crypto)
-+  if not have_hls_crypto and ['auto', 'libgcrypt'].contains(hls_crypto)
-     hls_crypto_dep = cc.find_library('gcrypt', required : false)
-     if hls_crypto_dep.found()
-       have_hls_crypto = true
-@@ -31,7 +31,7 @@ if not hls_option.disabled()
-     endif
-   endif
- 
--  if not hls_crypto_dep.found() and ['auto', 'openssl'].contains(hls_crypto)
-+  if not have_hls_crypto and ['auto', 'openssl'].contains(hls_crypto)
-     hls_crypto_dep = dependency('openssl', required : false)
-     if hls_crypto_dep.found()
-       have_hls_crypto = true
--- 
-2.21.0
-
