From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 23:15:52 +0100
Subject: [Buildroot] [git commit] icu: don't build object files twice
Message-ID: <20130310223431.1C7B39AFF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a33baa1ef9dadbec8e45d411c30d636fa6b8872a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When passed --enable-static and --enable-shared, icu will generate
both a shared and a static version of its libraries.

However, in order to do so, it builds each and every object file
twice: once with -fPIC (for the shared library), and once without
-fPIC (for the static library). While admittedly building -fPIC for a
static library generates a slightly suboptimal code, this is what all
the autotools-based project are doing. They build each object file
once, and they use it for both the static and shared libraries.

icu builds the object files for the shared library as .o files, and
the object files for static library as .ao files. By simply changing
the suffix of object files used for static libraries to ".o", we tell
icu to use the ones built for the shared library (i.e, with -fPIC),
and avoid the double build of icu.

On a fast build server, this brings the target icu build from
3m41.302s down to 1m43.926s (approximate numbers: some other builds
are running on the system at the same time).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../icu/icu-dont-build-static-dynamic-twice.patch  |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/icu/icu-dont-build-static-dynamic-twice.patch b/package/icu/icu-dont-build-static-dynamic-twice.patch
new file mode 100644
index 0000000..ccbe534
--- /dev/null
+++ b/package/icu/icu-dont-build-static-dynamic-twice.patch
@@ -0,0 +1,37 @@
+Don't build object files twice
+
+When passed --enable-static and --enable-shared, icu will generate
+both a shared and a static version of its libraries.
+
+However, in order to do so, it builds each and every object file
+twice: once with -fPIC (for the shared library), and once without
+-fPIC (for the static library). While admittedly building -fPIC for a
+static library generates a slightly suboptimal code, this is what all
+the autotools-based project are doing. They build each object file
+once, and they use it for both the static and shared libraries.
+
+icu builds the object files for the shared library as .o files, and
+the object files for static library as .ao files. By simply changing
+the suffix of object files used for static libraries to ".o", we tell
+icu to use the ones built for the shared library (i.e, with -fPIC),
+and avoid the double build of icu.
+
+On a fast build server, this brings the target icu build from
+3m41.302s down to 1m43.926s (approximate numbers: some other builds
+are running on the system at the same time).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/source/config/mh-linux
+===================================================================
+--- a/source/config/mh-linux
++++ b/source/config/mh-linux
+@@ -35,7 +35,7 @@
+ ## Shared object suffix
+ SO = so
+ ## Non-shared intermediate object suffix
+-STATIC_O = ao
++STATIC_O = o
+ 
+ ## Compilation rules
+ %.$(STATIC_O): $(srcdir)/%.c
