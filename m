From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 08:58:23 +0100
Subject: [Buildroot] [git commit] cairo: improve the Blackfin build fix
Message-ID: <20140224083833.6063899B79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=848c5b948092c7904a53119e7760e61c391667e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch cairo-001-blackfin-build-fix.patch was added in commit
d372d0b6777f52cd493dc0a892593d4390536ec5 ('cairo: add patch to fix
Blackfin build failure') to take into account the fact that Blackfin
has a non-empty USER_LABEL_PREFIX: C symbol 'foo' corresponds to
assembly symbol '_foo', contrary to most other architectures where
they are the same.

However, the patch was only fixing the relevant macros in
src/cairo-compiler-private.h and did not take into account the
duplicated version of these macros in
util/cairo-script/cairo-script-private.h. This commit fixes that.

This commit is fixing a build failure on Blackfin, for which there was
no recorded autobuilder result because this problem was hidden by the
problem fixed by the previous commit ('cairo: fix build on Blackfin in
test/cairo-test-runner.c').

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cairo/cairo-001-blackfin-build-fix.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/cairo/cairo-001-blackfin-build-fix.patch b/package/cairo/cairo-001-blackfin-build-fix.patch
index 94dff6b..0e8dd3a 100644
--- a/package/cairo/cairo-001-blackfin-build-fix.patch
+++ b/package/cairo/cairo-001-blackfin-build-fix.patch
@@ -34,3 +34,22 @@ Index: b/src/cairo-compiler-private.h
  #else
  # define slim_hidden_proto(name)		int _cairo_dummy_prototype(void)
  # define slim_hidden_proto_no_warn(name)	int _cairo_dummy_prototype(void)
+Index: b/util/cairo-script/cairo-script-private.h
+===================================================================
+--- a/util/cairo-script/cairo-script-private.h
++++ b/util/cairo-script/cairo-script-private.h
+@@ -109,12 +109,13 @@
+ 	__asm__ (slim_hidden_asmname (internal))
+ # define slim_hidden_def1(name, internal)				\
+   extern __typeof (name) EXT_##name __asm__(slim_hidden_asmname(name))	\
+-	__attribute__((__alias__(slim_hidden_asmname(internal))))
++	__attribute__((__alias__(slim_hidden_realname(internal))))
+ # define slim_hidden_ulp		slim_hidden_ulp1(__USER_LABEL_PREFIX__)
+ # define slim_hidden_ulp1(x)		slim_hidden_ulp2(x)
+ # define slim_hidden_ulp2(x)		#x
+ # define slim_hidden_asmname(name)	slim_hidden_asmname1(name)
+ # define slim_hidden_asmname1(name)	slim_hidden_ulp #name
++# define slim_hidden_realname(name)     #name
+ #else
+ # define slim_hidden_proto(name)		int _csi_dummy_prototype(void)
+ # define slim_hidden_proto_no_warn(name)	int _csi_dummy_prototype(void)
