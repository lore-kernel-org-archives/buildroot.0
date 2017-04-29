From: J Evans <g4@novadsp.com>
Date: Sat, 29 Apr 2017 17:01:22 +0100
Subject: [Buildroot] [PATCH 2/2] mke2img: add parameter sanity checks to
	prevent odd error messages from genext2.fs
In-Reply-To: <1493481682-128366-1-git-send-email-g4@novadsp.com>
References: <1493481682-128366-1-git-send-email-g4@novadsp.com>
Message-ID: <1493481682-128366-2-git-send-email-g4@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J Evans <g4@novadsp.com>
---
 package/mke2img/mke2img | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index b773aa9..c50dc66 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -44,6 +44,12 @@ main() {
     if [ -z "${image}" ]; then
         error "you must specify an output image file with '-o'\n"
     fi
+    if [ -z "${nb_blocks}" ]; then
+        error "Error: you must specify a file system block count with '-b'. This cannot be zero, e.g. 61440 == 60MB\n"
+    fi
+    if [ "${nb_blocks}" -eq 0 ]; then
+        error "Error: The file system block count size cannot be zero. e.g. 61440 == 60MB \n"
+    fi
     case "${gen}:${rev}" in
     2:0|2:1|3:1|4:1)
         ;;
-- 
2.7.4
