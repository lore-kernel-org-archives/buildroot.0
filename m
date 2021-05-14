From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 23:01:19 +0200
Subject: [Buildroot] [git commit] package/prosody: security bump to version
 0.11.9
Message-ID: <20210514203259.943838672C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c108afab81b675eddc1f71cc496b47d9077bdb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-32918: DoS via insufficient memory consumption controls

  It was discovered that default settings leave Prosody susceptible to
  remote unauthenticated denial-of-service (DoS) attacks via memory
  exhaustion when running under Lua 5.2 or Lua 5.3.  Lua 5.2 is the default
  and recommended Lua version for Prosody 0.11.x series.

- CVE-2021-32920: DoS via repeated TLS renegotiation causing excessive CPU
  consumption

  It was discovered that Prosody does not disable SSL/TLS renegotiation,
  even though this is not used in XMPP.  A malicious client may flood a
  connection with renegotiation requests to consume excessive CPU resources
  on the server.

- CVE-2021-32921: Use of timing-dependent string comparison with sensitive
  values

  It was discovered that Prosody does not use a constant-time algorithm for
  comparing certain secret strings when running under Lua 5.2 or later.
  This can potentially be used in a timing attack to reveal the contents of
  secret strings to an attacker.

- CVE-2021-32917: Use of mod_proxy65 is unrestricted in default
  configuration

  mod_proxy65 is a file transfer proxy provided with Prosody to facilitate
  the transfer of files and other data between XMPP clients.

  It was discovered that the proxy65 component of Prosody allows open access
  by default, even if neither of the users have an XMPP account on the local
  server, allowing unrestricted use of the server???s bandwidth.

- CVE-2021-32919: Undocumented dialback-without-dialback option insecure

  The undocumented option ???dialback_without_dialback??? enabled an
  experimental feature for server-to-server authentication.  A flaw in this
  feature meant it did not correctly authenticate remote servers, allowing a
  remote server to impersonate another server when this option is enabled.

For more details, see the advisory:
https://prosody.im/security/advisory_20210512/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 309ae0181f..50d5964712 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  24cd3c1f7ab16a6b3726423d2fff802d  prosody-0.11.8.tar.gz
-sha1  f1f030c75abde6e3c7232fedbe8371f5cb913245  prosody-0.11.8.tar.gz
-sha256  830f183b98d5742d81e908d2d8e3258f1b538dad7411f06fda5b2cc5c75068f8  prosody-0.11.8.tar.gz
-sha512  b0b7e1d3e41f47f0f88ad5b76444e4959b20f4c7a937f3cc605ba6ed5d92e713a3054dcb61ee6629063883a8f9ff1a03952893de4a0d840dcec4e5e42079eb57  prosody-0.11.8.tar.gz
+md5  be7e1c66c06b0eb4bdce37b67bcc6b51  prosody-0.11.9.tar.gz
+sha1  632c2dd7794d344d4edbcea18fc1b5f623da5ca4  prosody-0.11.9.tar.gz
+sha256  ccc032aea49d858635fb93644db276de6812be83073a8d80e9b4508095deff09  prosody-0.11.9.tar.gz
+sha512  fabbbbb1acb3de4ff01e3e8c6e9e4dc37cb161259f1649683a1f9d925ed9f1709e052bfc831cba3f1861a9cca599f2b725ee739bfcb57164d6f50ac07011b52a  prosody-0.11.9.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index a4482ad3c5..92c812ebfa 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.8
+PROSODY_VERSION = 0.11.9
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
