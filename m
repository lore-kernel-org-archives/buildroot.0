From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 11:48:55 +0100
Subject: [Buildroot] [PATCH 2/3] package/dvb-apps: is not parallel-safe
In-Reply-To: <cover.1511779719.git.yann.morin.1998@free.fr>
References: <cover.1511779719.git.yann.morin.1998@free.fr>
Message-ID: <a5cb242853434b99a016d430dc3030ba10602d09.1511779719.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is invisible because the timings make it excessively difficult to
hit, but the Makefile is inherently flawed for parallel build, as it
contains:

    $(objects): atsc_psip_section.c atsc_psip_section.h

    atsc_psip_section.c atsc_psip_section.h:
        perl section_generate.pl atsc_psip_section.pl

and the perl script section_generate.pl will create both the .c and .h
files in one go, but given the construct above, there can be two such
script that run in parallel, which can clobber the generated .c and/or
.h files.

So, make dvb-apps a MAKE1 package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
The time to build increased by one third, from ~7.5s to ~10s, on a
core-i7 quad-core, which is not much in the end, and totally acceptable.
---
 package/dvb-apps/dvb-apps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 8aa4a29307..ffab0db682 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -27,7 +27,7 @@ DVB_APPS_INSTALL_STAGING = YES
 
 define DVB_APPS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) LDLIBS="$(DVB_APPS_LDLIBS)" \
-		$(MAKE) -C $(@D) CROSS_ROOT=$(STAGING_DIR) \
+		$(MAKE1) -C $(@D) CROSS_ROOT=$(STAGING_DIR) \
 		$(DVB_APPS_MAKE_OPTS)
 endef
 
-- 
2.11.0
