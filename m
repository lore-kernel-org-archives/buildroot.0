From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 28 Aug 2019 09:02:51 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-stats: more upstream names
In-Reply-To: <20190828070251.22886-1-francois.perrad@gadz.org>
References: <20190828070251.22886-1-francois.perrad@gadz.org>
Message-ID: <20190828070251.22886-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the python infrastructure populates the variables _NAME_UPSTREAM
(like the luarocks one).
and pkg-stats uses them.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-python.mk     | 1 +
 support/scripts/pkg-stats | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e90692041..7ec6f215a 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -108,6 +108,7 @@ define inner-python-package
 $(2)_ENV         ?=
 $(2)_BUILD_OPTS   ?=
 $(2)_INSTALL_OPTS ?=
+$(2)_NAME_UPSTREAM ?= $(subst python-,,$(1))
 
 ifndef $(2)_SETUP_TYPE
  ifdef $(3)_SETUP_TYPE
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e03f714a6..92159c30f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -237,7 +237,7 @@ def get_pkglist(npackages, package_list):
 def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
-                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_DISTNAME"])
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_DISTNAME %_NAME_UPSTREAM"])
     variable_list = variables.splitlines()
 
     # We process first the host package VERSION, and then the target
@@ -276,6 +276,11 @@ def package_init_make_info():
             pkgvar = pkgvar[:-9]
             Package.all_upstream_names[pkgvar] = value
 
+        elif pkgvar.endswith("_NAME_UPSTREAM"):
+            # populated by some infra: luarocks, python
+            pkgvar = pkgvar[:-14]
+            Package.all_upstream_names[pkgvar] = value
+
 
 def check_url_status_worker(url, url_status):
     if url_status != "Missing" and url_status != "No Config.in":
-- 
2.20.1
