From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 21:25:28 +0100
Subject: [Buildroot] [git commit branch/next] package/freerdp: optional
 systemd's journald support
Message-ID: <20171113221623.25D3B807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57c0ac59a54a82ccec7473bd7e126daf15ae71a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

FreeRDP now has support for writing to the journal, so we must ensure
proper dependency and correct options.

Partially fixes:
    http://autobuild.buildroot.org/results/81aa66ddd88919295ccb5f34b527b737627263a7/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 6d1664b..458bd5e 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -56,6 +56,14 @@ else
 FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
 endif
 
+# For the systemd journal
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FREERDP_CONF_OPTS += -DWITH_LIBSYSTEMD=ON
+FREERDP_DEPENDENCIES += systemd
+else
+FREERDP_CONF_OPTS += -DWITH_LIBSYSTEMD=OFF
+endif
+
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 FREERDP_CONF_OPTS += -DWITH_NEON=ON
 else
