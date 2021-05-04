From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  4 May 2021 14:00:25 -0700
Subject: [Buildroot] [PATCH v2 2/3] package/openjdk: Change URL to Github
In-Reply-To: <20210504210026.1916260-1-aduskett@gmail.com>
References: <20210504210026.1916260-1-aduskett@gmail.com>
Message-ID: <20210504210026.1916260-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When introducing OpenJDK to buildroot, the OpenJDK project did not put releases
on their GitHub page. Since then, the OpenJDK developers have not only added
OpenJDK releases to Github; they are starting to phase out adding releases to
their public-facing mercurial repository.

Compare the following URLs:
https://wiki.openjdk.java.net/display/JDKUpdates/JDK+14u
https://wiki.openjdk.java.net/display/JDKUpdates/JDK+15u
https://wiki.openjdk.java.net/display/JDKUpdates/JDK+16u

With JDK14, only the mercurial repository is listed. With OpenJDK15, both the
GitHub and mercurial repository are listed. Finally, with OpenJDK16, only the
GitHub repository is listed.

For consistency's sake, and for the upcoming version bump of JDK latest from
14 to 16 do the following:
  - Change the repositories of both OpenJDK14 and OpenJDK11 to point to
    their official GitHub repositories, respectively.

  - In order to simplify and reuse the GitHub URL, modify the
    OPENJDK_VERSION_MAJOR and OPENJDK_VERSION_MINOR definitions to only
    include a single number for the MAJOR definition.

  - Change openjdk-bin.mk to also use the same format as the openjdk.mk file

Note:
The change in SHA sums for the tarballs is due to removing the
.hg_archival.txt in the tarballs. All other files are an exact match.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/openjdk-bin/openjdk-bin.mk | 18 ++++++++----------
 package/openjdk/openjdk.hash       |  4 ++--
 package/openjdk/openjdk.mk         | 18 +++++++-----------
 3 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 61e7ecac4c..2d8c018403 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -5,18 +5,16 @@
 ################################################################################
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-HOST_OPENJDK_BIN_VERSION_MAJOR = 14.0.2
-HOST_OPENJDK_BIN_VERSION_MINOR = 12
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
-HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
-HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_VERSION_MAJOR = 14
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.2_12
 else
-HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.11
-HOST_OPENJDK_BIN_VERSION_MINOR = 9
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
-HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
-HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_VERSION_MAJOR = 11
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.11_9
 endif
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
+
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 05a0c12c45..35cd827d2d 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  dfb3607f1b675458f29a185a40f1dbbf896439cf33b3aa0f3d89df297e604935  jdk-14.0.2+12.tar.gz
-sha256  c8b9d92028f6e46d94bde65ebce3b593fdcc0d1ca1fa00482f38815ed37c92a1  jdk-11.0.11+9.tar.gz
+sha256  582e3d805ab74582332250f95f9845608c8f3d3273aa92af6f683c45d1a4f8e8  jdk-14.0.2+12.tar.gz
+sha256  55841c01dbe6606e0d5f88045fb2da02632ce3a2d9d9b25d030a06eadeee0f62  jdk-11.0.11+9.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 6ed5085fdb..cda038805b 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -5,19 +5,15 @@
 ################################################################################
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-OPENJDK_VERSION_MAJOR = 14.0.2
-OPENJDK_VERSION_MINOR = 12
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
-OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
-OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
+OPENJDK_VERSION_MAJOR = 14
+OPENJDK_VERSION_MINOR = 0.2+12
 else
-OPENJDK_VERSION_MAJOR = 11.0.11
-OPENJDK_VERSION_MINOR = 9
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
-OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
-OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk11u/archive
+OPENJDK_VERSION_MAJOR = 11
+OPENJDK_VERSION_MINOR = 0.11+9
 endif
-
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
+OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 OPENJDK_INSTALL_STAGING = YES
-- 
2.31.1
