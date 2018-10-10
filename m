From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:30:51 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: increase precision
 of timestamps
Message-ID: <20181010192943.2491782790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2c24f584d163a6e5170f4a025aa1094b468527a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the timestamps that we keep in build-time.log use a
second-level precision. However, as we are going to introduce a new
type of graph to draw the time line of a build, this precision is
going to be insufficient, as a number of steps are so short that they
are not even one second long, and generally the rounding to the second
gives a not so great looking graph.

Therefore, we add to the timestamps the nanoseconds using the %N date
specifier. A milli-second precision would have been sufficient, but %N
is all what date(1) provides at the sub-second level.

Since this is changing the format of the build-time.log file, this
commit adjusts the support/scripts/graph-build-time script
accordingly, to account for the floating point numbers that we have as
timestamps.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk           | 2 +-
 support/scripts/graph-build-time | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 91b61c6de0..daf24594de 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -50,7 +50,7 @@ endef
 # Time steps
 define step_time
 	printf "%s:%-5.5s:%-20.20s: %s\n"           \
-	       "$$(date +%s)" "$(1)" "$(2)" "$(3)"  \
+	       "$$(date +%s.%N)" "$(1)" "$(2)" "$(3)"  \
 	       >>"$(BUILD_DIR)/build-time.log"
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_time
diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 415d431f23..892e08bf07 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -260,7 +260,7 @@ def read_data(input_file):
         return None
 
     for row in reader:
-        time = int(row[0].strip())
+        time = float(row[0].strip())
         state = row[1].strip()
         step = row[2].strip()
         pkg = row[3].strip()
