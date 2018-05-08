From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  8 May 2018 15:28:31 +0200
Subject: [Buildroot] [PATCH v2] support/download/file: fix file:// protocol
 handling
Message-ID: <1525786111-6206-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a file is used a source for download using the file:// protocol, a
malformed url is passed to the file download script which then crashes.
Following an example of a wrong path passed to the script:

eval cp -v ''\''file:///home/angelo/DEV/TOOLCHAINSarmv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2'\''' ''\''/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/.armv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2.f403PT/output'\'''.

Path passed to cp lacks of a / between dir and file part of the url,
moreover it presents a wrong file:// prefix.

Fixes:

cp: cannot stat
'file:///home/angelo/DEV/TOOLCHAINSarmv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2':
No such file or directory

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 support/download/file | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/file b/support/download/file
index fefd6d2..6dd37b0 100755
--- a/support/download/file
+++ b/support/download/file
@@ -40,4 +40,4 @@ _localfiles() {
     eval ${LOCALFILES} "${@}"
 }
 
-_localfiles ${verbose} "'${dir}${file}'" "'${output}'"
+_localfiles ${verbose} "'${dir##file://}/${file}'" "'${output}'"
-- 
2.7.4
