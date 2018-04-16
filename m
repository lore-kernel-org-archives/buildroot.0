From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:59 +0200
Subject: [Buildroot] [git commit] tpm2-abrmd: don't test if the binary
 exists in the init script
Message-ID: <20180416053719.23AD788325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab1184fd69990dabd4f7be4e622809a6ab2d2dcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. Buildroot installs both abrmd and its init
script as part of the same package. But if it ever happens for some
reason, the error message from start-stop-daemon should be pretty clear.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-abrmd/S80tpm2-abrmd | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/tpm2-abrmd/S80tpm2-abrmd b/package/tpm2-abrmd/S80tpm2-abrmd
index 3db5e6fa1d..d54c220c04 100755
--- a/package/tpm2-abrmd/S80tpm2-abrmd
+++ b/package/tpm2-abrmd/S80tpm2-abrmd
@@ -3,14 +3,10 @@
 my_name="$0"
 
 check_required_files() {
-	[ -x "$1" ] || {
+	[ -f "$1" ] || {
 		echo "$my_name: $1 is missing"
 		exit 1
 	}
-	[ -z "$2" ] || [ -f "$2" ] || {
-		echo "$my_name: $2 is missing"
-		exit 1
-	}
 }
 
 check_device() {
@@ -50,7 +46,7 @@ stop() {
 	echo "OK"
 }
 
-check_required_files /usr/sbin/tpm2-abrmd /etc/dbus-1/system.d/tpm2-abrmd.conf
+check_required_files /etc/dbus-1/system.d/tpm2-abrmd.conf
 
 # defaults
 DAEMON_OPTS="--tcti=device --logger=syslog --max-connections=20 --max-transient-objects=20 --fail-on-loaded-trans"
