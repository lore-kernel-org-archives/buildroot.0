From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:41:12 +0200
Subject: [Buildroot] [git commit] manual/user guide/customization: change
	recommendation for package paths
Message-ID: <20140921174201.730349D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a373ad02561e6c744d7849822d427f97858b6565
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Buildroot manual was recommending following paths for project-specific
packages:
    package/<company>/<boardname>/foo/
    $BR2_EXTERNAL/package/<boardname>/foo/

However, if a company has several boards, it is often the case that some
packages are common for different boards. Therefore, introducing a
<boardname> path component is not ideal.

This patch changes the recommendation to:
    package/<company>/foo/
    $BR2_EXTERNAL/package/foo/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-directory-structure.txt |   13 ++++++-------
 docs/manual/customize-outside-br.txt          |   12 +++++++-----
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
index 2ba9d28..ce2b0d7 100644
--- a/docs/manual/customize-directory-structure.txt
+++ b/docs/manual/customize-directory-structure.txt
@@ -40,13 +40,12 @@ it using +BR2_EXTERNAL+. Both options are valid, the choice is up to you.
 |   +-- <company>/
 |       +-- Config.in (if not using BR2_EXTERNAL)
 |       +-- <company>.mk (if not using BR2_EXTERNAL)
-|       +-- <boardname>/
-|           +-- package1/
-|           |    +-- Config.in
-|           |    +-- package1.mk
-|           +-- package2/
-|               +-- Config.in
-|               +-- package2.mk
+|       +-- package1/
+|       |    +-- Config.in
+|       |    +-- package1.mk
+|       +-- package2/
+|           +-- Config.in
+|           +-- package2.mk
 |
 +-- Config.in (if using BR2_EXTERNAL)
 +-- external.mk (if using BR2_EXTERNAL)
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 5fe7b60..1109843 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -81,19 +81,21 @@ The main usage of this is to store package recipes. The recommended
    looks like:
 +
 ------
-source "$BR2_EXTERNAL/package/<boardname>/package1/Config.in"
-source "$BR2_EXTERNAL/package/<boardname>/package2/Config.in"
+source "$BR2_EXTERNAL/package/package1/Config.in"
+source "$BR2_EXTERNAL/package/package2/Config.in"
 ------
 +
 Then, have a +$(BR2_EXTERNAL)/external.mk+ file that looks like:
 +
 ------
-include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*/*.mk))
+include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
 ------
 +
-And then in +$(BR2_EXTERNAL)/package/<boardname>/package1+ and
-   +$(BR2_EXTERNAL)/package/<boardname>/package2+ create normal Buildroot
+And then in +$(BR2_EXTERNAL)/package/package1+ and
+   +$(BR2_EXTERNAL)/package/package2+ create normal Buildroot
    package recipes, as explained in xref:adding-packages[].
+   If you prefer, you can also group the packages in subdirectories
+   called <boardname> and adapt the above paths accordingly.
 
  * One can store Buildroot defconfigs in the +configs+ subdirectory of
    +$(BR2_EXTERNAL)+. Buildroot will automatically show them in the
