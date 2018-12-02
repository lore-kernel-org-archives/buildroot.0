From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Dec 2018 10:04:36 +0100
Subject: [Buildroot] [PATCH 04/11] support/graph-depends: add option to
 exclude mandatory deps
In-Reply-To: <cover.1543741464.git.yann.morin.1998@free.fr>
References: <cover.1543741464.git.yann.morin.1998@free.fr>
Message-ID: <6581a18cbfdec59edd39dfdc20e989563a4f6a03.1543741464.git.yann.morin.1998@free.fr>
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

Add an option to exclude all those mandatory dependencies, tio generate
neat graphs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index d2b100f385..d17efe4cc0 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -302,6 +302,8 @@ def parse_args():
                         "'host' to stop on host packages.")
     parser.add_argument("--exclude", "-x", metavar="PACKAGE", dest="exclude_list", action="append",
                         help="Like --stop-on, but do not add PACKAGE to the graph.")
+    parser.add_argument("--exclude-mandatory", "-X", action="store_true",
+                        help="Like if -x was passed for all mandatory dependencies.")
     parser.add_argument("--colors", "-c", metavar="COLOR_LIST", dest="colors",
                         default="lightblue,grey,gainsboro",
                         help="Comma-separated list of the three colors to use" +
@@ -355,6 +357,9 @@ def main():
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
