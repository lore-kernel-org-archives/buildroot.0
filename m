From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2019 23:38:37 +0200
Subject: [Buildroot] [git commit] package/hostapd: disable TEAP for internal
 TLS implementation
Message-ID: <20191011213647.266F58D4D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47d14e3b1c209985557f452b5642fc7eb064e67e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hostapd TEAP support fails to build when internal TLS implementation
is selected. TEAP is still an experimental feature that is not
recommmended for production use. Currently it should not be used for
anything else than experimentation and interoperability testing.

Disable TEAP when internal TLS implementation is selected. Those
who needs experimenting with TEAP are encouraged to enable openssl
in their buildroot configuration.

Fixes:
http://autobuild.buildroot.net/results/f88/f880b1a430ebd6f97885103a622f1a4d9ec6de3a

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hostapd/hostapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 0e5e5b2962..f8c144c236 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -27,7 +27,7 @@ HOSTAPD_DEPENDENCIES += host-pkgconf libopenssl
 HOSTAPD_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
-HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
+HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD CONFIG_EAP_TEAP
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
