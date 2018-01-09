From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  9 Jan 2018 22:29:56 +0100
Subject: [Buildroot] [PATCH autobuild] autobuild-run: enforce a sane umask
Message-ID: <20180109212956.13278-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the umask of the user the autobuild-run script runs as is not what
Buildroot expects, Buildroot will respawn another make instance with the
expected umask.

However, in case of failure, the error message of the inner make are
printed, followed by the error message of the outter make. And we are
interested to catch only the errors from the inner make (the real one).

This means that we can miss the reason for the failure.

So we enforce a correct umask value from within the autobuild-run script
itself.

Reported-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 scripts/autobuild-run | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 2949417..b3f3c65 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -666,6 +666,11 @@ def main():
     if not sysinfo.check_requirements():
         sys.exit(1)
 
+    # Enforce the sanest umask here, to avoid buildroot doing it on its
+    # own and causing a double-make call, thus adding extraneous lines
+    # in case of failures.
+    os.umask(0022)
+
     def sigterm_handler(signum, frame):
         """Kill all children"""
 
-- 
2.14.1
