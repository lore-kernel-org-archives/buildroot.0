From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:02:36 +0100
Subject: [Buildroot] [git commit] package/openrc: cleanup sysv-rcs script
Message-ID: <20191221215334.D2B7A8D399@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc66a64193741900863cabc38d45dad264c7acef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the sysv-rcs script has two issues:
  - The return code of each RCS script is not checked.
  - The output does not match the formatting of the other openrc
    init scripts.

Modify the script in the following ways to fix both issues:
  - Remove the "einfo "Starting sysv rc scripts"" at the top of the
    start function in favor of "einfo "Starting $i" in the loop
    itself.

  - Add a "> /dev/null" to the end of $i start; this suppresses
    stdout while still allowing for stderr messages to print to the
    terminal.

  - add an "eend $? to both the start and stop functions, this
    allows for openrc to show if an RCS script returned 0 or
    not.

The following is the startup output of OpenRC on a minimal system
with S01syslogd modified to exit with a return code 1 for testing
purposes:

Before:
 * Adding static routes ...
 [ ok ]
Starting default runlevel
 * Starting sysv rc scripts
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK

After:
 * Adding static routes ...
 [ ok ]
Starting default runlevel
 * Starting /etc/init.d/S01syslogd ...
 [ !! ]
 * Starting /etc/init.d/S02klogd ...
 [ ok ]
 * Starting /etc/init.d/S02sysctl ...
 [ ok ]

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openrc/sysv-rcs | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/openrc/sysv-rcs b/package/openrc/sysv-rcs
index 606a73d2b4..1564cbe603 100755
--- a/package/openrc/sysv-rcs
+++ b/package/openrc/sysv-rcs
@@ -7,19 +7,21 @@ depend() {
 }
 
 start() {
-    einfo "Starting sysv rc scripts"
     for i in /etc/init.d/S??*; do
         # Ignore dangling symlinks (if any).
         [ -e "$i" ] || continue
-        $i start
+        einfo "Starting $i"
+        $i start > /dev/null
+        eend $?
     done
 }
 
 stop() {
-    einfo "Stopping sysv rc scripts"
     for i in $(ls -r /etc/init.d/S??*); do
         # Ignore dangling symlinks (if any).
         [ -e "$i" ] || continue
-        $i stop
+        einfo "Stopping $i"
+        $i stop > /dev/null
+        eend $?
     done
 }
