From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 22:32:14 +0200
Subject: [Buildroot] [git commit] package: implement a 'local' site method
Message-ID: <20110930063209.4B0548DC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=793a2ea5174e5352ec18ca32f7914c7071bf3108
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new override source directory mechanism allows to tell Buildroot
to use a particular directory as the source directory for a
package. However, this mechanism works with a local override makefile
and not directly within the package recipe itself.

For some use cases, it might be desirable to write a package recipe
which always refers to a local source directory (and not a http, git,
svn or bazaar download). This commit makes this possible by adding the
'local' site method. It allows to write package recipes as follows:

MYPKG_SITE = /tmp/mypkg-source-code
MYPKG_SITE_METHOD = local

[...]

$(eval $(call GENTARGETS,package,mypkg))

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 53cc8eb..5987d38 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -439,6 +439,12 @@ ifndef $(2)_SITE_METHOD
  endif
 endif
 
+ifeq ($$($(2)_SITE_METHOD),local)
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+$(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
+endif
+endif
+
 $(2)_DEPENDENCIES		?=
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
