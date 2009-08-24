From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] Remove --without-html-dir from
	DISABLE_DOCUMENTATION
Message-ID: <20090824202957.645E8775A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7e62e8ec723f91e07bb4ac9ae3e55b65e3123082
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In an attempt to disable the compilation and installation of
documentation of gtk packages, a DISABLE_DOCUMENTATION variable
containing --without-html-dir has been added to
package/Makefile.in. This variable is used by
package/Makefile.autotools.in so that --without-html-dir is in effect
passed to all autotools-based packaging relying on the
Makefile.autotools.in infrastructure.

Unfortunately, --without-html-dir doesn't work. It leads libglib2
./configure script to think that HTML_DIR is "no", which leads to the
installation of the documentation in $(STAGING_DIR)no (yes, with the
"no" suffix at the end). The issue is that --with-html-dir is not an
enable/disable type of option, it's an option that only allows to pass
a PATH for documentation installation.

As we don't want the documentation to be installed in this odd
$(STAGING_DIR)no directory, we simply get rid of this option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0829e8f..2dbf37f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -354,7 +354,7 @@ DISABLE_LARGEFILE= --disable-largefile
 endif
 
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-DISABLE_DOCUMENTATION=--without-html-dir --disable-gtk-doc
+DISABLE_DOCUMENTATION=--disable-gtk-doc
 endif
 
 ifneq ($(BR2_INET_IPV6),y)
-- 
1.6.3.3
