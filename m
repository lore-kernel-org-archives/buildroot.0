From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 May 2010 00:57:34 +0200
Subject: [Buildroot] [PATCH 1/2] dependencies: fix tests on LD_LIBRARY_PATH
In-Reply-To: <cover.1274482644.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274482644.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6b8b829508a98667267b6a5ec8342ddd1f2b3377.1274482644.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Things like LD_LIBRARY_PATH=. or even LD_LIBRARY_PATH=.:/usr/lib were
not detected as incorrect.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/dependencies/dependencies.sh |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 923c76b..f5d9163 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -23,10 +23,10 @@ fi
 # sanity check for CWD in LD_LIBRARY_PATH
 # try not to rely on egrep..
 if test -n "$LD_LIBRARY_PATH" ; then
-	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep ':.:' >/dev/null 2>&1 ||
-	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep 'TRiGGER_start:' >/dev/null 2>&1 ||
-	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep ':TRiGGER_end' >/dev/null 2>&1 ||
-	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep '::' >/dev/null 2>&1
+	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep ':\.:' >/dev/null 2>&1 ||
+	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep 'TRiGGER_start\.:' >/dev/null 2>&1 ||
+	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
+	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
 	if test $? = 0; then
 		/bin/echo -e "\nYou seem to have the current working directory in your"
 		/bin/echo -e "LD_LIBRARY_PATH environment variable. This doesn't work.\n"
-- 
1.6.3.3
