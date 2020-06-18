From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 18 Jun 2020 12:43:27 -0700
Subject: [Buildroot] [PATCH 1/1] package/maven-bin: new package
Message-ID: <20200618194327.94076-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Apache Maven is a software project management and comprehension tool. Based on
the concept of a project object model (POM), Maven can manage a project's
build, reporting, and documentation from a central piece of information.

As Maven requires Maven to build, and the Apache foundation provides a
self-encompassing tarball with Maven already compiled, it is much easier to
treat this package much like we do with host-openjdk-bin.

Traditionally, Maven's installation directory is either
usr/share/maven or /usr/lib/maven with the mvn binary symlinked to /usr/bin.
This installation method keeps all of the various libraries and conf files
provided in the maven tarball separated from the rest of the host directory
and prevents any libraries from potentially overwriting previously installed
host-package libraries.

By default, Maven downloads dependency modules of a given package to ~/.m2,
which goes against Buildroot being a sandbox.
There are two options to change this path:

1) Hardcode a path in the provided settings.xml file to the desired location.

2) Set the path to a variable and pass the path via to Maven during runtime.

Option 2 has the advantage of ensuring all the paths are relocatable.

Instead of using sed on the provided settings.xml, which would be very
difficult to do, as the default settings file has the localRepository variable
commented out,  a settings.xml file in package/maven-bin has the
localRepository variable pre-set to the MAVEN_REPO_DIR environment variable.

Finally, maven-bin.mk provides the MAVEN environment variable helper,
which provides all of the needed variables needed to invoke Maven in a single
command, making it much easier to integrate packages that need to use Maven.

An example of using Maven with a package would be as such:

FOO_DEPENDENCIES = host-maven-bin

define FOO_BUILD_CMDS
    cd $(@D) && $(MAVEN) compile
endef

define FOO_INSTALL_TARGET_CMDS
    $(INSTALL) -m 755 $(@D)/target/foo.jar $(TARGET_DIR)/usr/bin/foo.jar
endef

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                       |  1 +
 package/maven-bin/Config.in      | 13 +++++++
 package/maven-bin/maven-bin.hash |  3 ++
 package/maven-bin/maven-bin.mk   | 36 +++++++++++++++++++
 package/maven-bin/settings.xml   | 61 ++++++++++++++++++++++++++++++++
 5 files changed, 114 insertions(+)
 create mode 100644 package/maven-bin/Config.in
 create mode 100644 package/maven-bin/maven-bin.hash
 create mode 100644 package/maven-bin/maven-bin.mk
 create mode 100644 package/maven-bin/settings.xml

diff --git a/DEVELOPERS b/DEVELOPERS
index cbe6bc1856..8227ce4318 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -50,6 +50,7 @@ F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/libtextstyle/
 F:	package/libwebsockets/
+F:	package/maven-bin/
 F:	package/mender-grubenv/
 F:	package/nginx-naxsi/
 F:	package/openjdk/
diff --git a/package/maven-bin/Config.in b/package/maven-bin/Config.in
new file mode 100644
index 0000000000..95deedd371
--- /dev/null
+++ b/package/maven-bin/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MAVEN_BIN
+	bool "maven-bin"
+	depends on BR2_PACKAGE_OPENJDK
+	help
+	  Apache Maven is a software project management and
+	  comprehension tool. Based on the concept of a project object
+	  model (POM), Maven can manage a project's build, reporting and
+	  documentation from a central piece of information.
+
+	  https://github.com/apache/maven
+
+comment "maven-bin needs openjdk"
+	depends on !BR2_PACKAGE_OPENJDK
diff --git a/package/maven-bin/maven-bin.hash b/package/maven-bin/maven-bin.hash
new file mode 100644
index 0000000000..3673b33573
--- /dev/null
+++ b/package/maven-bin/maven-bin.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  26ad91d751b3a9a53087aefa743f4e16a17741d3915b219cf74112bf87a438c5  apache-maven-3.6.3-bin.tar.gz
+sha256  8b79d3d26bfbfd31fc50b22b149c2ecd2863345abb62d15048157a6f2e774411  LICENSE
diff --git a/package/maven-bin/maven-bin.mk b/package/maven-bin/maven-bin.mk
new file mode 100644
index 0000000000..1bf40b7d55
--- /dev/null
+++ b/package/maven-bin/maven-bin.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# host-maven-bin
+#
+################################################################################
+
+HOST_MAVEN_BIN_VERSION = 3.6.3
+HOST_MAVEN_BIN_SOURCE = apache-maven-$(HOST_MAVEN_BIN_VERSION)-bin.tar.gz
+HOST_MAVEN_BIN_SITE = https://www-us.apache.org/dist/maven/maven-3/$(HOST_MAVEN_BIN_VERSION)/binaries
+HOST_MAVEN_BIN_LICENSE = Apache-2.0
+HOST_MAVEN_BIN_LICENSE_FILES = LICENSE
+HOST_MAVEN_BIN_DEPENDENCIES = host-openjdk-bin
+
+# Maven is traditionally installed in it's own seperate directory in either
+# usr/share/maven or /usr/lib/maven with the mvn binary symlinked to /usr/bin.
+define HOST_MAVEN_BIN_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/lib/maven
+	mkdir -p $(HOST_DIR)/bin
+	cp -dprf $(@D)/* $(HOST_DIR)/usr/lib/maven/
+	ln -sf $(HOST_DIR)/usr/lib/maven/bin/mvn $(HOST_DIR)/bin/mvn
+
+# The settings.xml file sets the localRepository directory to the
+# MAVEN_REPO_DIR environment variable.
+	$(INSTALL) -D -m 755 $(HOST_MAVEN_BIN_PKGDIR)/settings.xml \
+		$(HOST_DIR)/usr/lib/maven/conf/settings.xml
+endef
+
+$(eval $(host-generic-package))
+
+# variables used by other packages
+MAVEN = \
+	JAVA_HOME="$(HOST_DIR)/usr/lib/jvm" \
+	M2_HOME="$(HOST_DIR)/usr/lib/maven" \
+	MAVEN_HOME="$(HOST_DIR)/usr/lib/maven" \
+	MAVEN_REPO_DIR="$(BR2_DL_DIR)/maven-repo" \
+	$(HOST_DIR)/bin/mvn
diff --git a/package/maven-bin/settings.xml b/package/maven-bin/settings.xml
new file mode 100644
index 0000000000..950ceab907
--- /dev/null
+++ b/package/maven-bin/settings.xml
@@ -0,0 +1,61 @@
+<?xml version="1.0" encoding="UTF-8"?>
+
+<!--
+Licensed to the Apache Software Foundation (ASF) under one
+or more contributor license agreements.  See the NOTICE file
+distributed with this work for additional information
+regarding copyright ownership.  The ASF licenses this file
+to you under the Apache License, Version 2.0 (the
+"License"); you may not use this file except in compliance
+with the License.  You may obtain a copy of the License at
+
+    http://www.apache.org/licenses/LICENSE-2.0
+
+Unless required by applicable law or agreed to in writing,
+software distributed under the License is distributed on an
+"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
+KIND, either express or implied.  See the License for the
+specific language governing permissions and limitations
+under the License.
+-->
+
+<!--
+ | This is the configuration file for Maven. It can be specified@two levels:
+ |
+ |  1. User Level. This settings.xml file provides configuration for a single user,
+ |                 and is normally provided in ${user.home}/.m2/settings.xml.
+ |
+ |                 NOTE: This location can be overridden with the CLI option:
+ |
+ |                 -s /path/to/user/settings.xml
+ |
+ |  2. Global Level. This settings.xml file provides configuration for all Maven
+ |                 users on a machine (assuming they're all using the same Maven
+ |                 installation). It's normally provided in
+ |                 ${maven.conf}/settings.xml.
+ |
+ |                 NOTE: This location can be overridden with the CLI option:
+ |
+ |                 -gs /path/to/global/settings.xml
+ |
+ | The sections in this sample file are intended to give you a running start at
+ | getting the most out of your Maven installation. Where appropriate, the default
+ | values (values used when the setting is not specified) are provided.
+ |
+ |-->
+<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
+          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
+
+  <localRepository>${MAVEN_REPO_DIR}</localRepository>
+  <pluginGroups>
+  </pluginGroups>
+  <proxies>
+  </proxies>
+  <servers>
+  </servers>
+  <mirrors>
+  </mirrors>
+  <profiles>
+  </profiles>
+</settings>
-- 
2.26.2
