From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Apr 2014 21:58:05 +0200
Subject: [Buildroot] [PATCH 3/6] tzdata: allow host build
In-Reply-To: <cover.1396900553.git.yann.morin.1998@free.fr>
References: <cover.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <e9034753bdf5bfff2e3d60a23232356d23ee0282.1396900553.git.yann.morin.1998@free.fr>
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
index 762a31e..64bec79 100644
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
