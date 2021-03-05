From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 11:55:34 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/nodejs: security
 bump to version v12.21.0
Message-ID: <20210305103438.4F37783982@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=887d4fab3e0abfddd363d5a6001939a42dbb0c1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

CVE-2021-22883: HTTP2 'unknownProtocol' cause Denial of Service by resource exhaustion

Affected Node.js versions are vulnerable to denial of service attacks when
too many connection attempts with an 'unknownProtocol' are established.
This leads to a leak of file descriptors.  If a file descriptor limit is
configured on the system, then the server is unable to accept new
connections and prevent the process also from opening, e.g.  a file.  If no
file descriptor limit is configured, then this lead to an excessive memory
usage and cause the system to run out of memory.

CVE-2021-22884: DNS rebinding in --inspect

Affected Node.js versions are vulnerable to denial of service attacks when
the whitelist includes ???localhost6???.  When ???localhost6??? is not present in
/etc/hosts, it is just an ordinary domain that is resolved via DNS, i.e.,
over network.  If the attacker controls the victim's DNS server or can spoof
its responses, the DNS rebinding protection can be bypassed by using the
???localhost6??? domain.  As long as the attacker uses the ???localhost6??? domain,
they can still apply the attack described in CVE-2018-7160.

For more details, see the advisory:
https://nodejs.org/en/blog/vulnerability/february-2021-security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7cb44a20116fb95a8ef8f6406ef24c2041daa8a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index b3ea15ca31..7abb3c3b57 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.20.1/SHASUMS256.txt
-sha256  e00eee325d705b2bfa9929b7d061eb2315402d7e8548945eac9870bf84321853  node-v12.20.1.tar.xz
+# From https://nodejs.org/dist/v12.21.0/SHASUMS256.txt
+sha256  052f37ace6f569b513b5a1154b2a45d3c4d8b07d7d7c807b79f1566db61e979d  node-v12.21.0.tar.xz
 
 # Hash for license file
 sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 8916d47940..04b33bb9b6 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.20.1
+NODEJS_VERSION = 12.21.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
