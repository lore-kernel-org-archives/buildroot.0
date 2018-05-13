From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:23:13 +0200
Subject: [Buildroot] [git commit] support/download/file: fix file://
 protocol handling
Message-ID: <20180513202456.7C6EA8C5EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9bb361435532d00bbcff6fed97618b68441b9cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the rework of the download infrastructure, the "file" download
helper gets passed an URL that starts with file://, but forgets to
strip it before passing it to "cp", causing a failure as the "cp"
program isn't prepared for file paths starting with file://. This is
fixed by stripping the file:// at the beginning of the URL.

In addition, the path passed to cp lacked a slash between the
directory path and the filename part of the url. This is fixed by
adding a slash at the appropriate places.

Fixes the following build failure when the "file" download method is
used:

cp: cannot stat 'file:///home/angelo/DEV/TOOLCHAINSarmv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2': No such file or directory

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/file | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/file b/support/download/file
index fefd6d271c..6dd37b04dc 100755
--- a/support/download/file
+++ b/support/download/file
@@ -40,4 +40,4 @@ _localfiles() {
     eval ${LOCALFILES} "${@}"
 }
 
-_localfiles ${verbose} "'${dir}${file}'" "'${output}'"
+_localfiles ${verbose} "'${dir##file://}/${file}'" "'${output}'"
