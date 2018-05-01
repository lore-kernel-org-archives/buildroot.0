From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 21:53:45 +0200
Subject: [Buildroot] [git commit] skeleton: add /dev/fd, /dev/std{in, out,
 err} symlinks for static /dev on readonly rootfs
Message-ID: <20180501195400.B91F388D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b21ba2fac486cf550399be7e6247de4e269595a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some applications, e.g. bashs process subsitution feature, rely on the
convention of `/dev/fd` being a symbolic link to `/proc/self/fd`.

When a static /dev is used on a readonly rootfs then the runtime ln
invocations in the inittab will fail, so we need to add the symlinks at
build time.  Makedevs doesn't support creating symlinks, so instead add the
symlinks to the default skeleton.

For non-static /dev setups, the kernel will mount devtmpfs which shadows the
/dev of the rootfs, but then the runtime ln invocations in inittab will
create the symlinks.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/dev/fd     | 1 +
 system/skeleton/dev/stderr | 1 +
 system/skeleton/dev/stdin  | 1 +
 system/skeleton/dev/stdout | 1 +
 4 files changed, 4 insertions(+)

diff --git a/system/skeleton/dev/fd b/system/skeleton/dev/fd
new file mode 120000
index 0000000000..10e8ab734e
--- /dev/null
+++ b/system/skeleton/dev/fd
@@ -0,0 +1 @@
+../proc/self/fd
\ No newline at end of file
diff --git a/system/skeleton/dev/stderr b/system/skeleton/dev/stderr
new file mode 120000
index 0000000000..c67586eb4a
--- /dev/null
+++ b/system/skeleton/dev/stderr
@@ -0,0 +1 @@
+../proc/self/fd/2
\ No newline at end of file
diff --git a/system/skeleton/dev/stdin b/system/skeleton/dev/stdin
new file mode 120000
index 0000000000..2825dc0f4f
--- /dev/null
+++ b/system/skeleton/dev/stdin
@@ -0,0 +1 @@
+../proc/self/fd/0
\ No newline at end of file
diff --git a/system/skeleton/dev/stdout b/system/skeleton/dev/stdout
new file mode 120000
index 0000000000..35e0f6203f
--- /dev/null
+++ b/system/skeleton/dev/stdout
@@ -0,0 +1 @@
+../proc/self/fd/1
\ No newline at end of file
