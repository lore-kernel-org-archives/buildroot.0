From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 22:45:00 +0200
Subject: [Buildroot] [git commit] core/download: fix when the BR2_DL_DIR
 does not accept hardlinks
Message-ID: <20180403204608.D743581100@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d19fcf6c24f7dcf585ad3423518068b5789f3b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the BR2_DL_DIR is a mountpoint (presumably shared between various
machine, or mounted from the local host when running in a VM), it is
possible that it does not support hardlinks (e.g. samba, or the VMWare
VMFS, etc...).

If the hardlink fails, fallback to copying the file. As a last resort,
if that also fails, eventually fallback to doing the download.

Note: this means that the dl-wrapper is no longer atomic-safe: the code
suffers of a TOCTTOU condition: the file may be created in-between the
check and the moment we try to ln/cp it. Fortunately, the dl-wrapper is
now run under an flock, so we're still safe. If we eventually go for a
more fine-grained implementation, we'll have to be careful then.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/dl-wrapper | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index ce44752df0..38430738eb 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -56,8 +56,13 @@ main() {
     # Legacy handling: check if the file already exists in the global
     # download directory. If it does, hard-link it. If it turns out it
     # was an incorrect download, we'd still check it below anyway.
+    # If we can neither link nor copy, fallback to doing a download.
+    # NOTE! This is not atomic, is subject to TOCTTOU, but the whole
+    # dl-wrapper runs under an flock, so we're safe.
     if [ ! -e "${output}" -a -e "${old_dl_dir}/${filename}" ]; then
-        ln "${old_dl_dir}/${filename}" "${output}"
+        ln "${old_dl_dir}/${filename}" "${output}" || \
+        cp "${old_dl_dir}/${filename}" "${output}" || \
+        true
     fi
 
     # If the output file already exists and:
