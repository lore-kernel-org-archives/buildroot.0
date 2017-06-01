From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:03:50 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] dropbear: security bump
	to version 2017.75
Message-ID: <20170601144623.1B5398296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdf7dc37a225131d7d855ceb1ecbd5a38ea9b8fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes:

- CVE-2017-9078: A double-free in the server could be triggered by an
  authenticated user if dropbear is running with -a (Allow connections to
  forwarded ports from any host) This could potentially allow arbitrary code
  execution as root by an authenticated user.  Affects versions 2013.56 to
  2016.74.  Thanks to Mark Shepard for reporting the crash.

- CVE-2017-9079: Dropbear parsed authorized_keys as root, even if it were a
  symlink.  The fix is to switch to user permissions when opening
  authorized_keys.
  A user could symlink their ~/.ssh/authorized_keys to a root-owned file
  they couldn't normally read.  If they managed to get that file to contain
  valid authorized_keys with command= options it might be possible to read
  other contents of that file.  This information disclosure is to an already
  authenticated user.  Thanks to Jann Horn of Google Project Zero for
  reporting this.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8644a83bd806d1e6efdfd972908798e8e00f7006)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 88f3e6e..98776e7 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256 2720ea54ed009af812701bcc290a2a601d5c107d12993e5d92c0f5f81f718891 dropbear-2016.74.tar.bz2
+sha256 6cbc1dcb1c9709d226dff669e5604172a18cf5dbf9a201474d5618ae4465098c dropbear-2017.75.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 743d524..144619f 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2016.74
+DROPBEAR_VERSION = 2017.75
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
