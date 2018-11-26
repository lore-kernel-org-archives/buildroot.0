From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:21:27 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/netplug: fix
 quoting of ${NETWORKING} in init script
Message-ID: <20181126161818.786CD88714@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8603656ec8c88bd499e27b5465679b4922241fc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Since 4adaa581b27dc27298eb7cc421ee8f530f88e18e, S29netplug looks for
/etc/default/network instead of /etc/sysconfig/network.  When this
file exists but does not define $NETWORKING, the script fails on line
29 with something like:

/etc/init.d/S29netplug: 29: [: =: unexpected operator

Fix quoting so this error no longer happens.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
[Thomas: keep double quotes around "no", keep curly braces when
referencing the variable.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 5682ba9363d262a67567ed9b0531a414e6aae1bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netplug/S29netplug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
index 66459061b3..cef0e6a945 100755
--- a/package/netplug/S29netplug
+++ b/package/netplug/S29netplug
@@ -26,7 +26,7 @@ if [ -f /etc/default/network ]; then
 	. /etc/default/network
 
 	# Check that networking is up.
-	[ ${NETWORKING} = "no" ] && exit 0
+	[ "${NETWORKING}" = "no" ] && exit 0
 elif [ ! -f /etc/network/interfaces ]; then
 	# No network support
 	exit 0
