From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:51:21 +0100
Subject: [Buildroot] [git commit] sysv init scripts: replace &>/dev/null
	redirection
Message-ID: <20141026175158.DAF04B0B9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5065d475fb9e33f8b6cceb2d44326cffece22999
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"<command> &>/dev/null" is supposed to redirect all output to /dev/null.

However, in shells that don't support it (dash, ash without bash extensions),
a command like "echo a &>/dev/null" is interpreted as

(a) "echo a" in background
(b) write nothing to /dev/null (redirect <empty command> to /dev/null)

This commit replaces "&>..." with ">/dev/null 2>&1".

Signed-off-by: Andr?? Erdmann <dywi@mailerd.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/network-manager/S45network-manager |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
index 112aa66..7880891 100755
--- a/package/network-manager/S45network-manager
+++ b/package/network-manager/S45network-manager
@@ -24,7 +24,7 @@ case "$1" in
 		;;
 	stop)
 		echo -n "Stopping NetworkManager ... "
-			[ ! -z "$PID" ] && kill $PID &> /dev/null
+			[ ! -z "$PID" ] && kill $PID > /dev/null 2>&1
 		if [ $? -gt 0 ]; then
 			echo "failed!"
 		else
