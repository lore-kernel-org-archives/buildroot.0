From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 30 Jul 2015 20:39:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/yaml-cpp: disable testing and parse
	tools
Message-ID: <1438281586-18052-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gmock testing framework uses fork() and therefor yaml-cpp fails to build
for a MMU-less targets. Since we are only interested in building the yaml-cpp
library we disable the testing and parse tools (command line tools).

Fixes:
http://autobuild.buildroot.net/results/2ce/2ce3c6d0140696cdf73f2ad1499b779c83ad8f6e/

Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/yaml-cpp/yaml-cpp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index cea54a9..6a01b02 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -12,4 +12,7 @@ YAML_CPP_LICENSE_FILES = license.txt
 
 YAML_CPP_DEPENDENCIES = boost
 
+# Disable testing and parse tools
+YAML_CPP_CONF_OPTS += -DYAML_CPP_BUILD_TOOLS=OFF
+
 $(eval $(cmake-package))
-- 
2.5.0
