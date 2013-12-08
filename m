From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 23:30:26 +0100
Subject: [Buildroot] [git commit] Config.in: Add a menu around BR2_EXTERNAL
	configuration options
Message-ID: <20131208223124.702489BF89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4ea4b9824138c7e24c9e4876ff09f14e5d48e87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make it clear to the user that these options are external to Buildroot
and no support is provided by the Buildroot community.

With this, there's no need to recommend people to their options inside
a menu, so remove that from the documentation.

Kconfig nicely allows us to hide the menu completely if BR2_EXTERNAL isn't
used, so make use of that to not confuse people. It would be nice if we
could add some help text to explain the BR2_EXTERNAL stuff as well, but
that isn't supported on menus :/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                            |    5 +++++
 docs/manual/customize-outside-br.txt |    4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 12d36b5..2b401cb 100644
--- a/Config.in
+++ b/Config.in
@@ -493,4 +493,9 @@ source "package/Config.in.host"
 
 source "Config.in.legacy"
 
+menu "User-provided options"
+	depends on BR2_EXTERNAL != "support/dummy-external"
+
 source "$BR2_EXTERNAL/Config.in"
+
+endmenu
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 0aabf5a..19257e6 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -89,12 +89,8 @@ The main usage of this is to store package recipes. The recommended
    like:
 +
 ------
-menu "<somecompany> packages"
-
 source "$BR2_EXTERNAL/package/package1/Config.in"
 source "$BR2_EXTERNAL/package/package2/Config.in"
-
-endmenu
 ------
 +
 Then, have a +BR2_EXTERNAL/external.mk+ file that looks like:
