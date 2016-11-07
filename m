From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Nov 2016 22:23:35 +0100
Subject: [Buildroot] [PATCH 1/6] core: export a variable with the host's
	bitness
In-Reply-To: <cover.1478553802.git.yann.morin.1998@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
Message-ID: <103fbc9d355da745c4a5a8ba34c7dbae2ea4c07a.1478553802.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some host packages (e.g. host-pseudo) wants to know the host bitness,
and they can fail to detect it in some corner cases (as reported by a
few users on IRC).

Export a variable with the bitness of the host, so that those packages
can be made to behave.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 4ea64b3..78f72bc 100644
--- a/Makefile
+++ b/Makefile
@@ -340,6 +340,12 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
 	    -e 's/macppc/powerpc/' \
 	    -e 's/sh.*/sh/' )
 
+ifeq ($(filter %64,$(HOSTARCH)),)
+HOSTARCH_BITS := 32
+else
+HOSTARCH_BITS := 64
+endif
+
 HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
 	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p')
 
-- 
2.7.4
