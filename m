From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 23:58:25 +0200
Subject: [Buildroot] [git commit] tzdata: allow host build
Message-ID: <20140408224018.BE5409C3B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56af48791726c256c2acbe9aa7c499dc05abbea8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc uses its own format for timezone info. OTOH, we can generate
uClibc-compatible timezone info from existing tzdata.

Add a host-version of tzdata, so we can harvest its installed timezone
info.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.mk |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index c9824dc..05a82a2 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -50,4 +50,24 @@ define TZDATA_INSTALL_TARGET_CMDS
 	fi
 endef
 
+define HOST_TZDATA_EXTRACT_CMDS
+	gzip -d -c $(DL_DIR)/$(TZDATA_SOURCE) \
+		| $(TAR) --strip-components=0 -C $(@D) -xf -
+endef
+
+define HOST_TZDATA_BUILD_CMDS
+	(cd $(@D); \
+		for zone in $(TZDATA_ZONELIST); do \
+			$(ZIC) -d _output/posix -y yearistype.sh $$zone; \
+			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone; \
+		done; \
+	)
+endef
+
+define HOST_TZDATA_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/share/zoneinfo
+	cp -a $(@D)/_output/* $(HOST_DIR)/usr/share/zoneinfo
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
