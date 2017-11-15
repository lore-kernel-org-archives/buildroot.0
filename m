From: Markus Mayer <code@mmayer.net>
Date: Wed, 15 Nov 2017 11:45:09 -0800
Subject: [Buildroot] [PATCH] dropbear: change start-up script to honour
 pre-existing keys
Message-ID: <20171115194509.78132-1-code@mmayer.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markus Mayer <mmayer@broadcom.com>

Rather than starting dropbear with option -R at all times, we only do
so if no existing key file is found. This lets dropbear honour
pre-existing key files, including keys copied into the root file system
at build time.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/dropbear/S50dropbear | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index 9474eaa..8eea9ae 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -7,7 +7,7 @@
 test -r /etc/default/dropbear && . /etc/default/dropbear
 
 start() {
-	DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
+	msg=' '
 
 	# If /etc/dropbear is a symlink to /var/run/dropbear, and
 	#   - the filesystem is RO (i.e. we can not rm the symlink),
@@ -26,7 +26,14 @@ start() {
 		fi
 	fi
 
-	printf "Starting dropbear sshd: "
+	ls /etc/dropbear/*host_key >/dev/null 2>&1
+	if [ $? != 0 ]; then
+		# No key files found. We need to generate a key.
+		DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
+		msg='(with new key) '
+	fi
+
+	printf "Starting dropbear sshd: $msg"
 	umask 077
 
 	start-stop-daemon -S -q -p /var/run/dropbear.pid \
-- 
2.7.4
