From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:35:03 +0100
Subject: [Buildroot] [git commit] support/graph-depends: add option to
 exclude mandatory deps
Message-ID: <20190317144806.830BE7FF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66cf4201f92082162a7be6e58f5e11368e226ae3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
