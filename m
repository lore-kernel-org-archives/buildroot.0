From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 28 Sep 2019 20:36:31 +0300
Subject: [Buildroot] [PATCH 2/3] package/hostapd: disable TEAP for internal
 TLS implementation
In-Reply-To: <20190928173632.21119-1-geomatsi@gmail.com>
References: <20190928173632.21119-1-geomatsi@gmail.com>
Message-ID: <20190928173632.21119-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hostapd TEAP support fails to build when internal TLS implementation
is selected. TEAP is still an experimental feature that is not
recommmended for production use. Currently it should not be used for
anything else than experimentation and interoperability testing.

Disable TEAP when internal TLS implementation is selected. Those
who needs experimenting with TEAP are encouraged to enable openssl
in their buildroot configuration.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
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
 
-- 
2.23.0
