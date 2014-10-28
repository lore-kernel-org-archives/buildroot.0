From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:55:16 +0100
Subject: [Buildroot] [git commit] schifra: fix build of examples and add hash
Message-ID: <20141028175520.01D8DB1CB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e6431708cc7c5fdee750d30be75a997d60c399e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OPTIONS argument passed to make had a redundant -o option, leading
to:

g++ -pipe -Os   -o -o schifra_reed_solomon_speed_evaluation schifra_reed_solomon_speed_evaluation.cpp -lstdc++ -lm
arm-linux-musleabi-g++: error: schifra_reed_solomon_speed_evaluation: No such file or directory

Fixes:
http://autobuild.buildroot.net/results/2143b4f6f22f50ccb4af36732cc7d9304daa3ff9/

This error didn't occur before because upstream has silently updated
the tarball. To protect against this in the future, a hash is added as
well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/schifra/schifra.hash |    3 +++
 package/schifra/schifra.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/schifra/schifra.hash b/package/schifra/schifra.hash
new file mode 100644
index 0000000..7f8e6c0
--- /dev/null
+++ b/package/schifra/schifra.hash
@@ -0,0 +1,3 @@
+# Calculated locally after download
+# Upstream doesn't store a version and tarball may change unexpectedly!
+sha256	3e60478cf024d87735d1cc1460aa2176c449e6c7f76914eefda25d3b20d22522	schifra.tgz
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 96387d3..e55bf02 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -12,7 +12,7 @@ SCHIFRA_LICENSE = schifra license
 SCHIFRA_LICENSE_FILES = schifra_license.txt
 
 SCHIFRA_MAKE_OPTS = COMPILER="$(TARGET_CXX)" \
-		   OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o"
+		   OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
 
 # The examples are the only buildable artefacts.
 ifeq ($(BR2_PACKAGE_SCHIFRA_EXAMPLES),y)
