From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:49:09 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] moarvm: fix build on
 powerpc64 / powerpc64le
Message-ID: <20180928124840.66FDA8A3A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd37f6065e200da654081b7adbe5c591fded3143
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Build fails with:
 In file included from dyncall_callback.c:35:0:
dyncall_callback_ppc64.c: In function 'dcbNewCallback':
dyncall_callback_ppc64.c:42:13: warning: implicit declaration of function 'dcAllocWX' [-Wimplicit-function-declaration]
   int err = dcAllocWX(sizeof(DCCallback), (void**) &pcb);
             ^~~~~~~~~
dyncall_callback_ppc64.c: In function 'dcbFreeCallback':
dyncall_callback_ppc64.c:53:3: warning: implicit declaration of function 'dcFreeWX' [-Wimplicit-function-declaration]
   dcFreeWX(pcb, sizeof(DCCallback));
   ^~~~~~~~
dyncall_callback_ppc64.S: Assembler messages:
dyncall_callback_ppc64.S:180: Error: operand out of range (3 is not between 0 and 1)

So select BR2_PACKAGE_LIBFFI for BR2_powerpc64 and BR2_powerpc64le as it
is already done for MIPS

Fixes:
 - http://autobuild.buildroot.org/results/97b53a74d9847c07f26178daeb1daff3b6c24813
 - http://autobuild.buildroot.org/results/c35ac4bbc5fb04aabf5a719eddeedf55f7f1f4eb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1b35eb9c5743cf179029bdbe763f258515273f4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index 3ff4f827e0..c370a0f229 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -12,7 +12,8 @@ config BR2_PACKAGE_MOARVM
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	# dyncall does not work on MIPS; libffi needs to be used.
 	# See: https://github.com/MoarVM/MoarVM/issues/222
-	select BR2_PACKAGE_LIBFFI if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	# dyncall does not work also on powerpc64 and powerpc64le
+	select BR2_PACKAGE_LIBFFI if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc64 || BR2_powerpc64le
 	help
 	  Short for "Metamodel On A Runtime", MoarVM is a virtual
 	  machine built especially for Rakudo Perl 6 and the NQP
