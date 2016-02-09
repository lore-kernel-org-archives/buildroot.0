From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue,  9 Feb 2016 16:06:28 +0100
Subject: [Buildroot] [PATCH RESEND 1/1] skeleton: Have /etc/profile source
	[A-Za-z0-9_-]+ files in profile.d.
In-Reply-To: <1890083.agaboDjt8N@hardbit>
References: <1890083.agaboDjt8N@hardbit>
Message-ID: <1455030388-10858-1-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of sourcing all files ending with .sh (which is unexpected
enough that /etc/profile.d/umask was missed), source all files which
matches [A-Za-z0-9_-]+.  This way, backup files from most text editors
(e.g.  umask~, umask.dpkg-old, .umask.swp~) will not be sourced.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---

Resend with the correct list address.

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 3a97427..2fb7743 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -12,9 +12,14 @@ export PAGER='/bin/more '
 export EDITOR='/bin/vi'
 
 # Source configuration files from /etc/profile.d
-for i in /etc/profile.d/*.sh ; do
-	if [ -r "$i" ]; then
-		. $i
-	fi
-	unset i
+for i in /etc/profile.d/* ; do
+	case "$i" in
+	/etc/profile.d/*[^A-Za-z0-9_-]*)
+		continue;;
+	*)
+		if [ -r "$i" ]; then
+			. $i
+		fi
+	esac
 done
+unset i
-- 
2.7.0
