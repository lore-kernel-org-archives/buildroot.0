From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Sep 2015 00:51:56 +0200
Subject: [Buildroot] [PATCH 2/6 RFC] core/pkg-generic: always dereference
	hardlinks from archives
In-Reply-To: <cover.1441233378.git.yann.morin.1998@free.fr>
References: <cover.1441233378.git.yann.morin.1998@free.fr>
Message-ID: <175fe503a9643013b377148eb847d0437c9a1c78.1441233378.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, hardlinks in archives are extracted as hard-links on the
filesystem.

While the vast majority of archives do not have hard-links in them,
there are a few (the Blackfin prebuilt toolchains, most notably) that
have hard-links, and for which we want to break the hard-linking on
extract because [--see Thomas--]...

Since the case for hard-links in archives is very rare, we can probably
accept the size impact of breaking hard-links always.

Note: This will come handy when the toolchains are converted to using
the generic extract commands.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d1877a7..45b4218 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -478,6 +478,7 @@ $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
 	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
 		-C $$($(2)_DIR) \
+		--hard-dereference \
 		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
 		$$(TAR_OPTIONS) -)
 
-- 
1.9.1
