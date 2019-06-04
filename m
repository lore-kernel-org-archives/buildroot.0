From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  4 Jun 2019 08:44:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjdk: sets AWK
Message-ID: <20190604064446.6929-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AWK must be set to $(HOST_DIR)/bin/gawk otherwise build fails on:
/bin/bash: gawk: command not found

When build fails, config.log contains the following line:

configure:13709: checking for gawk
configure:13725: found /home/buildroot/autobuild/run/instance-3/output/host/bin/gawk
configure:13736: result: gawk
[...]
ac_cv_prog_AWK=gawk

Fixes:
 - http://autobuild.buildroot.org/results/43c5d08f599e8f44b59a576d243ae1c7b27de7a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openjdk/openjdk.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 318e4bade3..2002da7386 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -46,12 +46,13 @@ OPENJDK_DEPENDENCIES += libffi
 endif
 
 # OpenJDK ignores some variables unless passed via the environment.
-# These variables are PATH, LD, CC, CXX, and CPP.
+# These variables are PATH, AWK, LD, CC, CXX, and CPP.
 # OpenJDK defaults ld to the ld binary but passes -Xlinker and -z as
 # arguments during the linking process, which causes compilation failures.
 # To fix this issue, LD is set to point to gcc.
 OPENJDK_CONF_ENV = \
 	PATH=$(BR_PATH) \
+	AWK=$(HOST_DIR)/bin/gawk \
 	CC=$(TARGET_CC) \
 	CPP=$(TARGET_CPP) \
 	CXX=$(TARGET_CXX) \
-- 
2.14.1
