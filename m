From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:40 -0300
Subject: [Buildroot] [PATCH 22/26] tpm2-abrmd: don't test if the binary
 exists in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-23-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. Buildroot installs both abrmd and its init
script as part of the same package. But if it ever happens for some
reason, the error message from start-stop-daemon should be pretty clear.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
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
-- 
2.14.3
