From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 02 Jan 2014 13:34:21 +0100
Subject: [Buildroot] [PATCH alternative 1] dropbear: add support for port
 customization through config file
Message-ID: <dd980a2e00a9db7b2d4a.1388666061@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default port 22 used by dropbear for its SSH connections is not always
desired. Dropbear accepts an option '-p' to set the port, but doing this was
not possible from the buildroot-provided init script.

One way to fix this is by adding a custom S50dropbear in a project-specific
rootfs overlay. However, this approach has the big disadvantage that bug
fixes or improvements in the default init script (i.e. in newer buildroot
releases) are not available (unless you manually port these changes each
time you upgrade buildroot).

Another solution is to modify the default init script from a
project-specific post-build script. However, this is fragile because you'd
have to sed some line but this line may change in later buildroot releases.

Yet another solution is to change the default port at build time, by
patching the options.h header file in the dropbear sources. This was
proposed with a patch [1] before, but not accepted.

This patch implements another solution, hinted from the discussion in [1]:
the default init script now sources a config file /etc/default/dropbear, in
which the user can set some variables (currently DROPBEAR_PORT). This is in
line with the S81named init script in the bind package. The config file
would be added to a project-specific rootfs overlay, a custom skeleton, or
created from a post-build script.
This approach has the advantage of being simple and non-intrusive, without
any code duplication or fragile script modifications.

[1] http://lists.busybox.net/pipermail/buildroot/2013-November/083165.html


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/dropbear/S50dropbear |  9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

NOTE: this is alternative 1, using one variable per config knob.
The other alternative (that I will send immediately) uses one variable
DROPBEAR_ARGS for all knobs at the same time (the user then has to know the
right option letters). I'm OK with either alternative.

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -3,14 +3,20 @@
 # Starts dropbear sshd.
 #
 
+# Allow a few customizations from a config file
+test -r /etc/default/dropbear && . /etc/default/dropbear
+
 start() {
- 	echo -n "Starting dropbear sshd: "
+	ARGS="-R"
+	test -z "$DROPBEAR_PORT" || ARGS="$ARGS -p $DROPBEAR_PORT"
+
+	echo -n "Starting dropbear sshd: "
 	# Make sure dropbear directory exists
 	if [ ! -d /etc/dropbear ] ; then
 		mkdir -p /etc/dropbear
 	fi
 	umask 077
-	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear -- -R
+	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear -- $ARGS
 	[ $? == 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
