From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Sun, 26 Oct 2014 18:41:45 +0100
Subject: [Buildroot] [PATCH 3/4] sysv init scripts: replace &>/dev/null
	redirection
In-Reply-To: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
References: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
Message-ID: <1414345306-27184-3-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"<command> &>/dev/null" is supposed to redirect all output to /dev/null.

However, in shells that don't support it (dash, ash without bash extensions),
a command like "echo a &>/dev/null" is interpreted as

(a) "echo a" in background
(b) write nothing to /dev/null (redirect <empty command> to /dev/null)

This commit replaces "&>..." with ">/dev/null 2>&1".

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 package/network-manager/S45network-manager | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.1.2
