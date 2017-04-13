From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:31:56 +0200
Subject: [Buildroot] [git commit] bind: bump version to 9.11.0-P5 (security)
Message-ID: <20170413193200.B263C82717@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1727ea972bb8202ba15247e53bc54b47fa76c69e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security Fixes:
 - rndc "" could trigger an assertion failure in named. This flaw is
   disclosed in (CVE-2017-3138). [RT #44924]
 - Some chaining (i.e., type CNAME or DNAME) responses to upstream
   queries could trigger assertion failures. This flaw is disclosed in
   CVE-2017-3137. [RT #44734]
 - dns64 with break-dnssec yes; can result in an assertion failure. This
   flaw is disclosed in CVE-2017-3136. [RT #44653]
 - If a server is configured with a response policy zone (RPZ) that
   rewrites an answer with local data, and is also configured for DNS64
   address mapping, a NULL pointer can be read triggering a server
   crash. This flaw is disclosed in CVE-2017-3135. [RT #44434]
 - A coding error in the nxdomain-redirect feature could lead to an
   assertion failure if the redirection namespace was served from a
   local authoritative data source such as a local zone or a DLZ instead
   of via recursive lookup. This flaw is disclosed in CVE-2016-9778.
   [RT #43837]
 - named could mishandle authority sections with missing RRSIGs,
   triggering an assertion failure. This flaw is disclosed in
   CVE-2016-9444. [RT #43632]
 - named mishandled some responses where covering RRSIG records were
   returned without the requested data, resulting in an assertion
   failure. This flaw is disclosed in CVE-2016-9147. [RT #43548]
 - named incorrectly tried to cache TKEY records which could trigger an
   assertion failure when there was a class mismatch. This flaw is
   disclosed in CVE-2016-9131. [RT #43522]
 - It was possible to trigger assertions when processing responses
   containing answers of type DNAME. This flaw is disclosed in
   CVE-2016-8864. [RT #43465]

Full release notes:

  ftp://ftp.isc.org/isc/bind9/9.11.0-P5/RELEASE-NOTES-bind-9.11.0-P5.html

Also, remove --enable-rrl configure option from bind.mk as it doesn't
exist anymore.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 780e43b..8d44d99 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.0-P3/bind-9.11.0-P3.tar.gz.sha256.asc
-sha256 0feee0374bcbdee73a9d4277f3c5007622279572d520d7c27a4b64015d8ca9e9  bind-9.11.0-P3.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.0-P5/bind-9.11.0-P5.tar.gz.sha256.asc
+sha256 1e283f0567b484687dfd7b936e26c9af4f64043daf73cbd8f3eb1122c9fb71f5  bind-9.11.0-P5.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 37ba17c..4290455 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.0-P3
+BIND_VERSION = 9.11.0-P5
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
@@ -29,7 +29,6 @@ BIND_CONF_OPTS = \
 	--enable-epoll \
 	--with-libtool \
 	--with-gssapi=no \
-	--enable-rrl \
 	--enable-filter-aaaa
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
