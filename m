From: J Evans <g4@novadsp.com>
Date: Sat, 29 Apr 2017 15:58:04 +0100
Subject: [Buildroot] [PATCH 1/1] mke2img: Sanity check block size and fail
	if zero or missing.
Message-ID: <1493477884-121871-1-git-send-email-g4@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J Evans <g4@novadsp.com>
---
 package/mke2img/mke2img | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index b773aa9..0a3ed6c 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -39,10 +39,16 @@ main() {
 
     # Sanity checks
     if [ -z "${root_dir}" ]; then
-        error "you must specify a root directory with '-d'\n"
+        error "Error: you must specify a root directory with '-d'\n"
     fi
     if [ -z "${image}" ]; then
-        error "you must specify an output image file with '-o'\n"
+        error "Error: you must specify an output image file with '-o'\n"
+    fi
+    if [ -z "${nb_blocks}" ]; then
+        error "Error: you must specify a file system block count with '-b'. This cannot be zero, e.g. 61440 == 60MB\n"
+    fi
+    if [ "${nb_blocks}" -eq 0]; then
+        error "Error: The file system block count size cannot be zero. e.g. 61440 == 60MB \n"
     fi
     case "${gen}:${rev}" in
     2:0|2:1|3:1|4:1)
-- 
2.7.4
