From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 22:00:33 +0200
Subject: [Buildroot] [git commit branch/next] package/libegl: add option for
	wayland extensions
Message-ID: <20160823200112.C1B478211A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e3dfef19d8ae3804671a03b30003fa2d8115fc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Wayland requires that an OpenGL/EGL implementation provides a few
extensions, so that wayland servers and clients can exchange buffers.

Currently, only one OpenGL/EGL implementation provides those extensions:
mesa3d.

However, other implementations are catching up, especially the
proprietary NVidia driver, which has as of late introduced those
extensions. Other, non-public implementations may also provide those
extensions.

A lot of wayland-related packages require those extensions, and
currently they have to depend on mesa3d to provide OpenGL/EGL, which
precludes using those packages when a non-mesa3d provider is enabled,
even when that providers implements the necessary extensions.

Add an option to the libegl virtual package, that providers on
OpenGL/EGL can select to state they provide those extensions.

Packages that need those extensions can additionally depend on this new
option, instead of the existing libegl package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opengl/libegl/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opengl/libegl/Config.in b/package/opengl/libegl/Config.in
index 8401bb2..f756fbe 100644
--- a/package/opengl/libegl/Config.in
+++ b/package/opengl/libegl/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_HAS_LIBEGL
 	bool
 
+config BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	bool
+	depends on BR2_PACKAGE_HAS_LIBEGL
+
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	string
