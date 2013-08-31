From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] package: make *-rebuild and *-reconfigure
	only rebuild the given package
Message-ID: <20130831213337.3F6799B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a1aa342357decd4e21f34d2b54d58df20d1fc0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Originally, the <pkg>-rebuild and <pkg>-reconfigure targets were meant
to restart the build of the package from a given step (build for
<pkg>-rebuild and configure for <pkg>-reconfigure) and then re-create
the entire root filesystem.

However, further discussion from the community has shown that this is
not really the desired behavior: we instead want <pkg>-rebuild and
<pkg>-reconfigure to only take care of rebuilding the given package,
and not the entire root filesystem.

People willing to rebuild this package and the root filesystem can do:

       make <pkg>-rebuild all

[Thomas P: rewrite commit log, since it's not fixing a bug, but
instead changing what was an intended behavior. ]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b8eaa98..2e2e66f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -435,12 +435,12 @@ endif
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
 
-$(1)-rebuild:		$(1)-clean-for-rebuild all
+$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 			rm -f $$($(2)_TARGET_CONFIGURE)
 
-$(1)-reconfigure:	$(1)-clean-for-reconfigure all
+$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
