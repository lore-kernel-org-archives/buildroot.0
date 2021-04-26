From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 21:29:17 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/hostapd: ignore
 CVE-2021-30004 when using openssl
Message-ID: <20210426203328.6D75D815DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ad89a34716525f82ed59f1bb6fad3c6b01a8abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The CVE can be ignored when the internal TLS impl isn't used.

https://security-tracker.debian.org/tracker/CVE-2021-30004
 "Issue only affects the "internal" TLS implementation
 (CONFIG_TLS=internal)"

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3d3348fd032f00695432582d748b87f91609bb9d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/hostapd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index efeefd8b35..2995545d18 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -38,6 +38,8 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 HOSTAPD_DEPENDENCIES += host-pkgconf libopenssl
 HOSTAPD_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
+# Issue only affects the "internal" TLS implementation
+HOSTAPD_IGNORE_CVES += CVE-2021-30004
 else
 HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD CONFIG_EAP_TEAP
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
