From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Mar 2019 11:16:30 +0100
Subject: [Buildroot] [PATCH 2/8 v2] support/graph-depends: add option to
 exclude mandatory deps
In-Reply-To: <cover.1551608168.git.yann.morin.1998@free.fr>
References: <cover.1551608168.git.yann.morin.1998@free.fr>
Message-ID: <6e0fb4d5b76d1188367a039f5b9102086d4ac8f8.1551608168.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some times, multiple dependency graphs for a set of packages (mostly
the application-level packages for the project) are included in reports
(e.g. delivery notes). Repeating the mandatory dependencies on all
those graphs is useless and clutters the important dependencies.

When we had only two such mandatory dependencies (toolchain, skeleton),
it was manageable to list them as manual exclusions:
    -x toolchain -x skeleton

But we now have quite a few such dependencies, and it becomes a bit more
cumbersome to manage, not counting the ones we may add in the future.

Add an option to exclude all those mandatory dependencies, to generate
neat graphs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 5a6f6930e9..5c5de7dd0b 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -311,6 +311,8 @@ def parse_args():
                         "'host' to stop on host packages.")
     parser.add_argument("--exclude", "-x", metavar="PACKAGE", dest="exclude_list", action="append",
                         help="Like --stop-on, but do not add PACKAGE to the graph.")
+    parser.add_argument("--exclude-mandatory", "-X", action="store_true",
+                        help="Like if -x was passed for all mandatory dependencies.")
     parser.add_argument("--colors", "-c", metavar="COLOR_LIST", dest="colors",
                         default="lightblue,grey,gainsboro",
                         help="Comma-separated list of the three colors to use" +
@@ -364,6 +366,9 @@ def main():
     else:
         exclude_list = args.exclude_list
 
+    if args.exclude_mandatory:
+        exclude_list += MANDATORY_DEPS
+
     if args.direct:
         get_depends_func = brpkgutil.get_depends
         arrow_dir = "forward"
-- 
2.14.1
