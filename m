From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Dec 2014 00:09:41 +0100
Subject: [Buildroot] [git commit] Build shared libraries only as the default
Message-ID: <20141211230954.474F57FD6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1d3e09895b245da9d54bbaef36e5de95269034e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have more options in terms of static/shared libraries,
switch from the existing default of building both shared and static
libraries to building shared libraries only (of course only on
platforms that support shared libraries).

Building both shared and static takes time (since the shared objects
must be built with -fPIC, while static objects are generally built
without, as -fPIC has some performance impact) and consumes a little
bit more disk space.

For example, a static+shared build of libglib2 takes 1 minutes and 59
seconds, with a final build directory of 96 MB. A shared-only build of
libglib2 takes only 1 minutes and 31 seconds (almost a 25% reduction
of the build time), and the final build directory weights 89 MB (a
reduction of almost 8%).

So, switching to a shared library only build brings some useful build
time and build size benefits.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index 4592139..f5b6c73 100644
--- a/Config.in
+++ b/Config.in
@@ -527,7 +527,7 @@ comment "enabling Stack Smashing Protection requires support in the toolchain"
 
 choice
 	bool "libraries"
-	default BR2_SHARED_STATIC_LIBS if BR2_BINFMT_SUPPORTS_SHARED
+	default BR2_SHARED_LIBS if BR2_BINFMT_SUPPORTS_SHARED
 	default BR2_STATIC_LIBS if !BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  Select the type of libraries you want to use on the target.
