From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2013 08:36:49 +0100
Subject: [Buildroot] [git commit] pv: support ccache builds
Message-ID: <20131117075009.E213D9BCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21161a0889ae5b6c416773597bb24475340619bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using ccache TARGET_CC is something like
    ccache gcc

This causes problems in the pv build which attempts to
override LD because the command ends up being
    make [...] LD=/tools/ccache /tools/gcc LDFLAGS="[...]

As a result, during the build phase it attempts to build
/tools/gcc which succeeds by doing nothing:
    make[1]: Nothing to be done for `/tools/gcc'.

and during the install phase you get the real build which
errors out on the LD error this snippet was attempting to
fix:
    ld -r -o src/library.o src/library/getopt.o \
        src/library/gettext.o
    ld: src/library/gettext.o: Relocations in generic ELF \
        (EM: 40)
    src/library/gettext.o: error adding symbols: File in \
        wrong format

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/pv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 00502d3..5f1a54b 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -17,7 +17,7 @@ PV_LICENSE_FILES = doc/COPYING
 # the correct one. By passing the below values for LD and LDFLAGS, we
 # ensure that 'gcc' is used to do these partial linking steps.
 PV_MAKE_OPT = \
-	LD=$(TARGET_CC) \
+	LD="$(TARGET_CC)" \
 	LDFLAGS="-Wl,-r -nostdlib"
 
 $(eval $(autotools-package))
