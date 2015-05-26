From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:14 +0200
Subject: [Buildroot] [PATCH 19/21 RFC] support/scripts: teach
	gen-manual-lists about BR2_EXTERNAL
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <66a04ef770db393a305d62f2e4a084be747446e2.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using BR2_EXTERNAL, generate the list of packages from there.

This is currently effectively unused for now, as BR2_EXTERNAL is not
available (not exported in the environment); that will be updated in a
later patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 support/scripts/gen-manual-lists.py | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index ec59030..7d9356c 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -146,7 +146,6 @@ class Buildroot:
 
     """
     root_config = "Config.in"
-    package_dirname = "package"
     package_prefixes = ["BR2_PACKAGE_", "BR2_PACKAGE_HOST_"]
     re_pkg_prefix = re.compile(r"^(" + "|".join(package_prefixes) + ").*")
     deprecated_symbol = "BR2_DEPRECATED"
@@ -187,12 +186,22 @@ class Buildroot:
             'format': "_format_symbol_prompt_location",
             'sorted': False,
         },
+        'external': {
+            'filename': "br2-external-package-list",
+            'root_menu': "User-provided options",
+            'filter': "_is_real_package",
+            'format': "_format_symbol_prompt_location",
+            'sorted': True,
+        },
     }
 
     def __init__(self):
         self.base_dir = os.environ.get("TOPDIR")
         self.output_dir = os.environ.get("O")
-        self.package_dir = os.path.join(self.base_dir, self.package_dirname)
+        self.package_dirs = []
+        self.package_dirs.append(os.path.join(self.base_dir, "package"))
+        if os.getenv('BR2_EXTERNAL'):
+            self.package_dirs.extend(os.environ["BR2_EXTERNAL"].split())
         # The kconfiglib requires an environment variable named "srctree" to
         # load the configuration, so set it.
         os.environ.update({'srctree': self.base_dir})
@@ -266,9 +275,10 @@ class Buildroot:
         #   symbol.
         if not hasattr(self, "_package_list"):
             pkg_list = []
-            for _, _, files in os.walk(self.package_dir):
-                for file_ in (f for f in files if f.endswith(".mk")):
-                    pkg_list.append(re.sub(r"(.*?)\.mk", r"\1", file_))
+            for d in self.package_dirs:
+                for _, _, files in os.walk(d):
+                    for file_ in (f for f in files if f.endswith(".mk")):
+                        pkg_list.append(re.sub(r"(.*?)\.mk", r"\1", file_))
             setattr(self, "_package_list", pkg_list)
         for pkg in getattr(self, "_package_list"):
             if type == 'real':
@@ -495,6 +505,8 @@ class Buildroot:
 
 if __name__ == '__main__':
     list_types = ['target-packages', 'host-packages', 'virtual-packages', 'deprecated']
+    if os.getenv('BR2_EXTERNAL'):
+        list_types.append('external')
     parser = ArgumentParser()
     parser.add_argument("list_type", nargs="?", choices=list_types,
                         help="""\
@@ -509,6 +521,8 @@ Generate the given list (generate all lists if unspecified)""")
                         help="Output virtual package file")
     parser.add_argument("--output-deprecated", dest="output_deprecated",
                         help="Output deprecated file")
+    parser.add_argument("--output-external", dest="output_external",
+                        help="Output br2-external file")
     args = parser.parse_args()
     lists = [args.list_type] if args.list_type else list_types
     buildroot = Buildroot()
-- 
1.9.1
