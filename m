From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 09 Mar 2020 14:21:42 -0000
Subject: [Buildroot] [git commit] package/pkgconf: prepend sysroot paths to
 common gobject-introspection utils
Message-ID: <20200309140904.244517F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0157b6032d600f9b12778e425316076dffca9cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many autotools packages call pkg-conf to inquire as to where the following
utilities are:

g_ir_scanner
g_ir_compiler
g_ir_generate

Because gobject uses wrappers to call qemu, prepending the sysroot to the paths
of these compilers is necessary.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...Only-prefix-with-the-sysroot-a-subset-of-variables.patch | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
index 5a9713d651..a7811752d2 100644
--- a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
+++ b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
@@ -15,11 +15,13 @@ be prefixed by the sysroot, and which path should not be prefixed by
 the sysroot.
 
 So, let's simply have a whitelist of paths that should be prefixed:
-includedir, libdir, mapdir, pkgdatadir and sdkdir. This list of
-variables was collected over years of Buildroot development. All other
-paths are not prefixed by the sysroot.
+g_ir_scanner, g_ir_compiler, g_ir_generate, includedir, libdir, mapdir,
+pkgdatadir and sdkdir. This list of variables was collected over years of
+Buildroot development. All other paths are not prefixed by the sysroot.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Updated to include gobject-introspection paths]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  libpkgconf/tuple.c | 60 ++++++++++++++++++++++++++++++++--------------
  1 file changed, 42 insertions(+), 18 deletions(-)
@@ -28,7 +30,7 @@ diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
 index 8523709..7cd2fff 100644
 --- a/libpkgconf/tuple.c
 +++ b/libpkgconf/tuple.c
-@@ -160,6 +160,18 @@ dequote(const char *value)
+@@ -160,6 +160,21 @@ dequote(const char *value)
  	return buf;
  }
  
@@ -36,6 +38,9 @@ index 8523709..7cd2fff 100644
 +pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, bool add_sysroot);
 +
 +const char *sysrooted_keys[] = {
++	"g_ir_scanner",
++	"g_ir_compiler",
++	"g_ir_generate",
 +	"includedir",
 +	"libdir",
 +	"mapdir",
