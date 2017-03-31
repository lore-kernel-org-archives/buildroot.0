From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:09:46 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] core/br2-external:
	properly report unexpected errors
Message-ID: <20170331071607.4CFA3826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e29fa95b8368f9b85a1bfb2cef9741c6218c59b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Unextected error in the br2-external script are properly caught, but
they are not reported properly, and we end up in either of two
situations:

  - the .br2-external.mk file is not generated, in which case make will
    try to find a rule to generate it (because the 'include' directive
    tries to generate missing files);

  - the .br-external.mk file is generated but does not contain the error
    variable, and thus the build might not get interrupted.

We fix that by using a trap on the pseudo ERR signal, to emit the error
variable on unexpected errors.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c5fa9308ea4e3810a7f7d9d0df75cbf090c414c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/br2-external | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 26bcac8..7e81608 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -40,6 +40,9 @@ main() {
 
     exec >"${ofile}"
 
+    # Trap any unexpected error to generate a meaningful error message
+    trap "error 'unexpected error while generating ${ofile}\n'" ERR
+
     do_validate ${@//:/ }
 
     do_${ofmt}
