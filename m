From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 23:28:44 +0100
Subject: [Buildroot] [git commit] package/pkg-meson.mk: fix multiple
 _MESON_EXTRA_BINARIES
Message-ID: <20200311221718.958D290A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1e3c7b69310856c73a9eb4dce286a7a745f116f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If multiple entries are specified for _MESON_EXTRA_BINARIES, the current
sed expression will only replace the first one.

Specifically, from GNU sed 4.8 the manual says:

    /regexp/
        Match  lines matching the regular expression regexp.  Matching
        is performed on the current pattern space, which can be modified
        with commands such as ``s///''.

so after the first binary has been added, the next entry no longer
matches since the pattern space has been modifed.

Instead of adding a script for each value, apply the match once and add
a subsitution for all entries at once.

Signed-off-by: John Keeping <john@metanate.com>
Tested-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr: do a single substitution]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-meson.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index a0b467caba..835098b85c 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -76,9 +76,7 @@ define $(2)_CONFIGURE_CMDS
 	    -e 's%@TARGET_CXXFLAGS@%$$(call make-comma-list,$$($(2)_CXXFLAGS))%g' \
 	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
 	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
-	    $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
-	        -e "/^\[binaries\]$$$$/s:$$$$:\n$$(x):" \
-	    ) \
+	    -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
