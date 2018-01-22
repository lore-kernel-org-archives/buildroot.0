From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 16:13:39 +0100
Subject: [Buildroot] [PATCH 2/2] squid: add upstream post-3.5.27 security
 patches
In-Reply-To: <20180122151339.23040-1-peter@korsgaard.com>
References: <20180122151339.23040-1-peter@korsgaard.com>
Message-ID: <20180122151339.23040-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

SQUID-2018:1 Due to incorrect pointer handling Squid is vulnerable to denial
of service attack when processing ESI responses.

http://www.squid-cache.org/Advisories/SQUID-2018_1.txt

SQUID-2018:2  Due to incorrect pointer handling Squid is vulnerable to
denial of service attack when processing ESI responses or downloading
intermediate CA certificates.

http://www.squid-cache.org/Advisories/SQUID-2018_2.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 2 ++
 package/squid/squid.mk   | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 8787cb25ef..89955eb4ad 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -3,3 +3,5 @@ md5 39ef8199675d48a314b540f92c00c545 squid-3.5.27.tar.xz
 sha1 1e69c96d13cd49844da3bcf33a0b428fbe7b6f77 squid-3.5.27.tar.xz
 # Locally calculated
 sha256 58f5d05257af1fb964fde20e134d660fac9afa86b6fd8c70d63ead63068378fa COPYING
+sha256 a85bac80f9bf0b389a0b0fe24630eda59a4fbaf6a1b398ba2f57d5799662fb6e eb2db98a676321b814fc4a51c4fb7928a8bb45d9.patch
+sha256 78a44073ebd68c9c8c05bb590690ba57b5eaf6ee0465a06fcad82dba65612f60 8232b83d3fa47a1399f155cb829db829369fbae9.patch
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 8ade55ee37..b088766470 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -12,6 +12,9 @@ SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 # For 0001-assume-get-certificate-ok.patch
 SQUID_AUTORECONF = YES
+SQUID_PATCH = \
+	https://github.com/squid-cache/squid/commit/eb2db98a676321b814fc4a51c4fb7928a8bb45d9.patch \
+	https://github.com/squid-cache/squid/commit/8232b83d3fa47a1399f155cb829db829369fbae9.patch
 SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
-- 
2.11.0
