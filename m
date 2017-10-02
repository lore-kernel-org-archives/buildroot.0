From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  2 Oct 2017 20:38:25 +0300
Subject: [Buildroot] [PATCH v2 1/2] dnsmasq: security bump to version 2.78
Message-ID: <9b9ffd72d158a792696b98b6612e4e66ee11892a.1506965906.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supported Lua version is now 5.2.

Add licenses hash.

Fixes a number of security issues:

CVE-2017-13704 - Crash when DNS query exceeded 512 bytes (a regression
in 2.77, so technically not fixed by this bump)

CVE-2017-14491 - Heap overflow in DNS code

CVE-2017-14492 - Heap overflow in IPv6 router advertisement code

CVE-2017-14493 - Stack overflow in DHCPv6 code

CVE-2017-14494 - Information leak in DHCPv6

CVE-2017-14496 - Invalid boundary checks allows a malicious DNS queries
to trigger DoS

CVE-2017-14495 - Out-of-memory Dos vulnerability

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Bump to 2.78
    Note security fixes in the commit log
---
 package/dnsmasq/dnsmasq.hash | 6 +++++-
 package/dnsmasq/dnsmasq.mk   | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index a73e911a2654..28e2e658e276 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	4b92698dee19ca0cb2a8f2e48f1d2dffd01a21eb15d1fbed4cf085630c8c9f96	dnsmasq-2.76.tar.xz
+# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.78.tar.xz.asc
+sha256	89949f438c74b0c7543f06689c319484bd126cc4b1f8c745c742ab397681252b	dnsmasq-2.78.tar.xz
+# Locally calculated
+sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 63295ce41090..7322170432a0 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.76
+DNSMASQ_VERSION = 2.78
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
@@ -58,7 +58,7 @@ DNSMASQ_MAKE_OPTS += LIBS+="-ldl"
 endif
 
 define DNSMASQ_ENABLE_LUA
-	$(SED) 's/lua5.1/lua/g' $(DNSMASQ_DIR)/Makefile
+	$(SED) 's/lua5.2/lua/g' $(DNSMASQ_DIR)/Makefile
 	$(SED) 's^.*#define HAVE_LUASCRIPT.*^#define HAVE_LUASCRIPT^' \
 		$(DNSMASQ_DIR)/src/config.h
 endef
-- 
2.14.2
