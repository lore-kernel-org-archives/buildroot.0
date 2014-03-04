From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:34:15 +0100
Subject: [Buildroot] [git commit] hostapd: fix static linking
Message-ID: <20140304183523.0D64C9BD19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30a8b49576437555ef98e632121dc52d0969c077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A rebase of Samuel Martin's http://patchwork.ozlabs.org/patch/312320/
hostapd doesn't use pkg-config and upstream likely wouldn't take a patch
to do so (hostapd/wpa_supplicant are used in android builds, and it
doesn't use any auto* stuff either) so pass it in LIBS since we
always build openssl with libz support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/hostapd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 37de60d..5b7dd77 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -43,6 +43,7 @@ endif
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
+	HOSTAPD_LIBS += $(if $(BR2_PREFER_STATIC_LIB),-lcrypto -lz)
 	HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
 	HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
