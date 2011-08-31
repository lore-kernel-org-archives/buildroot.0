From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:29:13 +0200
Subject: [Buildroot] [PATCH 05/16] package: implement a 'local' site method
In-Reply-To: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ce42237e617ced0e7fd8ebb84d2adec456fda6a1.1314826051.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/Makefile.package.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 7af689d..fdec8e1 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -438,6 +438,12 @@ ifndef $(2)_SITE_METHOD
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
-- 
1.7.4.1
