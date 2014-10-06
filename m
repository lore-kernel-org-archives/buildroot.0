From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 20:58:06 +0200
Subject: [Buildroot] [git commit] legal-info: fix bug leading to one package
	not being considered
Message-ID: <20141006185813.75DABB0C75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c00522972312f164d55f24cc14da6d3af7a6956
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to excessive parenthesis, the TARGETS_LEGAL_INFO expression was
evaluated to something like this:

  toolchain-legal-info toolchain-external-legal-info busybox-legal-info zlib-legal-info))

Yes, with the last two parenthesis. This had the effect that the
zlib-legal-info rule was never called: the last package of $(TARGETS)
$(TARGET_HOST_DEPS) $(HOST_DEPS) was never added in the legal-info
information.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 6068e7f..3f56648 100644
--- a/Makefile
+++ b/Makefile
@@ -414,7 +414,7 @@ HOST_DEPS = $(sort $(foreach dep,\
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
 TARGETS_LEGAL_INFO := $(patsubst %,%-legal-info,\
-		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
+		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
