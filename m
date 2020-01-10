From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 15:07:58 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] docs/manual: dependency
 documentation updates
Message-ID: <20200110135931.4C6A98854B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad4fe257aba8fb26428449ea1a62d992b21a8355
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Update dependency documentation to detail the order-only relationship
associated with the DEPENDENCIES variable.  See the thread at [1] for
details.

[1] http://lists.busybox.net/pipermail/buildroot/2019-October/262685.html

Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
[yann.morin.1998 at free.fr: indentation & slight rephrasing]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 05d4ce444580ae54107f3f990e2902169e943d30)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt |  8 +++++---
 docs/manual/rebuilding-packages.txt     | 10 ++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b2386f2c01..c9c3c7fadf 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -358,9 +358,11 @@ not and can not work as people would expect it should:
 * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
   name) that are required for the current target package to
   compile. These dependencies are guaranteed to be compiled and
-  installed before the configuration of the current package starts. In
-  a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for
-  the current host package.
+  installed before the configuration of the current package starts.
+  However, modifications to configuration of these dependencies will
+  not force a rebuild of the current package. In a similar way,
+  +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for the current
+  host package.
 
 * +LIBFOO_EXTRACT_DEPENDENCIES+ lists the dependencies (in terms of
   package name) that are required for the current target package to be
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 8f4d40d4d6..621493776c 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -65,6 +65,16 @@ can help you understand how to work with Buildroot:
    there is no need for a full rebuild: a simple +make+ invocation
    will take the changes into account.
 
+ * When a pacjage listed in +FOO_DEPENDENCIES+ is rebuilt or removed,
+   the package +foo+ is not automatically rebuilt. For example, if a
+   package +bar+ is listed in +FOO_DEPENDENCIES+ with +FOO_DEPENDENCIES
+   = bar+ and the configuration of the +bar+ package is changed, the
+   configuration change would not result in a rebuild of package +foo+
+   automatically. In this scenario, you may need to either rebuild any
+   packages in your build which reference +bar+ in their +DEPENDENCIES+,
+   or perform a full rebuild to ensure any +bar+ dependent packages are
+   up to date.
+
 Generally speaking, when you're facing a build error and you're unsure
 of the potential consequences of the configuration changes you've
 made, do a full rebuild. If you get the same build error, then you are
