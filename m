From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 09:46:23 +0200
Subject: [Buildroot] [git commit] package/bison: fix parallel build issue
Message-ID: <20190802074340.91C2B8C6B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9c2894298a11e414c1fa276ad28de8d4960a1f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the bump of Bison to 3.4.1 in commit
d3c2f33543b91670f8ead627ec7975142b9e6b5a, the build started failing on
autobuilders using a fairly old version of make (3.81). The failure is
caused by a parallel build problem in examples/c/reccalc/.

Fixing it is not trivial, and would require autoreconf, which then
fails due to help2man being missing. So for the time being, simply
disable parallel build on bison.

The issue has been reported to the bug-bison@ mailing list, but the
e-mail doesn't appear yet in the mailing list archives.

Fixes:

  http://autobuild.buildroot.net/results/856/8568bcef944096f2c21470d36f02b520989af5eb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bison/bison.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index e5d09a4514..32ffa3aec9 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -9,6 +9,8 @@ BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
 BISON_LICENSE_FILES = COPYING
+# parallel build issue in examples/c/reccalc/
+BISON_MAKE = $(MAKE1)
 HOST_BISON_DEPENDENCIES = host-m4
 
 $(eval $(host-autotools-package))
