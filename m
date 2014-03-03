From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Mar 2014 23:10:22 +0100
Subject: [Buildroot] [PATCH 3/7] tzdata: allow host build
In-Reply-To: <cover.1393884458.git.yann.morin.1998@free.fr>
References: <cover.1393884458.git.yann.morin.1998@free.fr>
Message-ID: <0c93f21aeb33c72b0f368c6478c1218fae917683.1393884458.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre Belloni <alexandre.belloni@free-electrons.com>

uClibc uses its own format for timezone info. OTOH, we can generate
uClibc-compatible timezone info from existing tzdata.

Add a host-version of tzdata, so we can harvest its installed timezone
info.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tzdata/tzdata.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index c23b3df..7a60c2c 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -48,4 +48,24 @@ define TZDATA_INSTALL_TARGET_CMDS
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
-- 
1.8.3.2
