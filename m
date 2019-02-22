From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 17:58:55 +0100
Subject: [Buildroot] [git commit] package/bind: security bump to version
 9.11.5-P4
Message-ID: <20190222191611.E3C0F8B875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12f644e2c52336579df74ac59089dc2aa0469c2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- named could crash during recursive processing of DNAME records when
  deny-answer-aliases was in use.  This flaw is disclosed in CVE-2018-5740.
  [GL #387]

- When recursion is enabled but the allow-recursion and allow-query-cache
  ACLs are not specified, they should be limited to local networks, but they
  were inadvertently set to match the default allow-query, thus allowing
  remote queries.  This flaw is disclosed in CVE-2018-5738.  [GL #309]

- Code change #4964, intended to prevent double signatures when deleting an
  inactive zone DNSKEY in some situations, introduced a new problem during
  zone processing in which some delegation glue RRsets are incorrectly
  identified as needing RRSIGs, which are then created for them using the
  current active ZSK for the zone.  In some, but not all cases, the
  newly-signed RRsets are added to the zone's NSEC/NSEC3 chain, but
  incompletely -- this can result in a broken chain, affecting validation of
  proof of nonexistence for records in the zone.  [GL #771]

- named could crash if it managed a DNSSEC security root with managed-keys
  and the authoritative zone rolled the key to an algorithm not supported by
  BIND 9.  This flaw is disclosed in CVE-2018-5745.  [GL #780]

- named leaked memory when processing a request with multiple Key Tag EDNS
  options present.  ISC would like to thank Toshifumi Sakaguchi for bringing
  this to our attention.  This flaw is disclosed in CVE-2018-5744.  [GL
  #772]

- Zone transfer controls for writable DLZ zones were not effective as the
  allowzonexfr method was not being called for such zones.  This flaw is
  disclosed in CVE-2019-6465.  [GL #790]

For more details, see the release notes:

http://ftp.isc.org/isc/bind9/9.11.5-P4/RELEASE-NOTES-bind-9.11.5-P4.html

Change the upstream URL to HTTPS as the webserver uses HSTS:

>>> bind 9.11.5-P4 Downloading
URL transformed to HTTPS due to an HSTS policy

Update the hash of the license file to account for a change of copyright
year:

-Copyright (C) 1996-2018  Internet Systems Consortium, Inc. ("ISC")
+Copyright (C) 1996-2019  Internet Systems Consortium, Inc. ("ISC")

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index ea76108cc0..3072d2d2a0 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.5/bind-9.11.5.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.11.5-P4/bind-9.11.5-P4.tar.gz.asc
 # with key BE0E9748B718253A28BB89FFF1B11BF05CF02E57
-sha256 a4cae11dad954bdd4eb592178f875bfec09fcc7e29fe0f6b7a4e5b5c6bc61322 bind-9.11.5.tar.gz
-sha256 336f3c40e37a1a13690efb4c63e20908faa4c40498cc02f3579fb67d3a1933a5 COPYRIGHT
+sha256 7e8c08192bcbaeb6e9f2391a70e67583b027b90e8c4bc1605da6eb126edde434 bind-9.11.5-P4.tar.gz
+sha256 cd02c93b8dcda794f55dfd1231828d69633072a98eee4874f9cf732d22d9dcde COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 19d9d1cf5c..572eacd11a 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.5
-BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
+BIND_VERSION = 9.11.5-P4
+BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
