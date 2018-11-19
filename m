From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:25:30 +0100
Subject: [Buildroot] [git commit] package/pkg-generic.mk: fix
 show-build-order stdout pollution
Message-ID: <20181119212358.4BC1A83B4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75c81a12f68f943af2966e737f882b3f4fc7a909
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commands like "make show-build-order" or "make
<package>-show-build-order" show the build order and then print
"make[1]: Nothing to be done for 'show-build-order'" to stdout. It
pollutes output. Technically this message is true but it's not true
for user because he gets an information.

The <package>-show-build-order targets use $(info) for package name
printing.  The make utility doesn't consider the internal directive as
a command so it think that it's "Nothing to be done". The patch adds
the empty command to <package>-show-build-order to inform make utility
that taget makes some real actions.

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: invert $(info) and @:, as suggested by Yann.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f34f46afc8..7a95ea19cc 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -818,6 +818,7 @@ $(1)-show-recursive-rdepends:
 			$$(TOPDIR)/support/scripts/graph-depends -p $(1) --reverse -f -q
 
 $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
+	@:
 	$$(info $(1))
 
 $(1)-graph-depends: graph-depends-requirements
