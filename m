From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 23:58:06 +0100
Subject: [Buildroot] [PATCH 2/7] cairo: improve the Blackfin build fix
In-Reply-To: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393196291-12636-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/cairo/cairo-001-blackfin-build-fix.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

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
-- 
1.8.3.2
