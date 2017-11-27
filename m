From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:30:56 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: is not parallel-safe
Message-ID: <20171127202545.22EC3800E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba6796c7ccb856fc34a7983c9ac031168f1e0b65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvb-apps/dvb-apps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 8aa4a29..ffab0db 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -27,7 +27,7 @@ DVB_APPS_INSTALL_STAGING = YES
 
 define DVB_APPS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) LDLIBS="$(DVB_APPS_LDLIBS)" \
-		$(MAKE) -C $(@D) CROSS_ROOT=$(STAGING_DIR) \
+		$(MAKE1) -C $(@D) CROSS_ROOT=$(STAGING_DIR) \
 		$(DVB_APPS_MAKE_OPTS)
 endef
 
