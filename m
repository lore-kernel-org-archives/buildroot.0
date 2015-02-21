From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 18:39:02 +0100
Subject: [Buildroot] [PATCH 09/14 v6] package/nvidia-driver: add
 NVidia's OpenGL binary blob
In-Reply-To: <74d12982c60d0c697e816489109c038ebf86b4e1.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
 <74d12982c60d0c697e816489109c038ebf86b4e1.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <20150221183902.7a37db02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 24 Jan 2015 00:24:38 +0100, Yann E. MORIN wrote:
> This patch only adds the userland part. Unless other such other packages
> (which we named like: rpi-userland), we do not replicate this naming
> scheme with this package, as a future patch will also enable building
> the kernel part of the driver. So, it is better to just name that
> package with -driver, rather than with -userland and renaming it
> afterwards.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I've applied to next, after doing some changes:

    [Thomas:
     - Rewrap Config.in help text.
     - Add a comment to explain why mesa3d-headers, xlib_libX11 and
       xlib_libXext are part of the dependencies.
     - Fix typo in comment about library installation: s/The/Then/
     - Use 'addsuffix' instead of 'patsubst' to calculate the final
       filename of libraries to install.
     - Use more temporary variables to make the library installation
    loop clearer: 'libpath' is the relative path of the library in
       nvidia-driver sources, 'libname' the base name of the library,
       'libsoname' the soname of the library, and 'baseso' the base .so
       symlink name.]

See my diff below for the details.

However, one thing that I find a bit unclear and that might need
improvement is that you are making this package depend on X.org while
it does provide an EGL implementation. So you install the 36 MB
libnvidia-eglcore.so.346.35 unconditionally, even though I believe it's
probably unused when X.org is used.

Same for libGLES: do we really need to install both libGL and libGLES ?
Though I agree libGLES* are very small.

So I believe at least the EGL stuff should be separated out: either you
do X.org, or you do EGL. But I don't think both can be used at the same
time. Doing this would allow to drastically cut the installed size of
this huge package.

So now, the diff of the changes I made:

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 9be6764..18453ab 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -41,11 +41,12 @@ config BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
 config BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS
 	bool "Install private libraries"
 	help
-	  Two libraries require special agreement with NVidia to develop code
-	  linking to those libraries: libnvidia-ifr.so and libnvidia-fbc.so
-	  (to grab and encode an OpenGL buffer or an X framebuffer.)
+	  Two libraries require special agreement with NVidia to
+	  develop code linking to those libraries: libnvidia-ifr.so
+	  and libnvidia-fbc.so (to grab and encode an OpenGL buffer or
+	  an X framebuffer.)
 
-	  Say 'y' here if you plan on running a program that uses those
-	  private libraries.
+	  Say 'y' here if you plan on running a program that uses
+	  those private libraries.
 
 endif # BR2_PACKAGE_NVIDIA_DRIVER
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 30b2ab6..f703fab 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -13,6 +13,11 @@ NVIDIA_DRIVER_LICENSE_FILES = LICENSE
 NVIDIA_DRIVER_REDISTRIBUTE = NO
 NVIDIA_DRIVER_INSTALL_STAGING = YES
 
+# Since nvidia-driver are binary blobs, the below dependencies are not
+# strictly speaking build dependencies of nvidia-driver. However, they
+# are build dependencies of packages that depend on nvidia-driver, so
+# they should be built prior to those packages, and the only simple
+# way to do so is to make nvidia-driver depend on them.
 NVIDIA_DRIVER_DEPENDENCIES = mesa3d-headers xlib_libX11 xlib_libXext
 NVIDIA_DRIVER_PROVIDES = libgl libegl libgles
 
@@ -69,22 +74,23 @@ endef
 # $1: destination directory (target or staging)
 #
 # For all libraries that need it, we append the NVidia version string.
-# The for all libraries, we install them and create a symlink using their
-# SONAME, so we can link to them at runtime; we also create the no-version
-# symlink, so we can link to them at build time.
+# Then for all libraries, we install them and create a symlink using
+# their SONAME, so we can link to them at runtime; we also create the
+# no-version symlink, so we can link to them at build time.
 define NVIDIA_DRIVER_INSTALL_LIBS
-	for lib in $(patsubst %,%.so.$(NVIDIA_DRIVER_VERSION),$(NVIDIA_DRIVER_LIBS)) \
+	for libpath in $(addsuffix .so.$(NVIDIA_DRIVER_VERSION),$(NVIDIA_DRIVER_LIBS)) \
 	           $(NVIDIA_DRIVER_LIBS_NO_VERSION); \
 	do \
-		$(INSTALL) -D -m 0644 $(@D)/$${lib} $(1)/usr/lib/$${lib##*/}; \
-		n="$$( $(TARGET_READELF) -d "$(@D)/$${lib}" \
+		libname="$${libpath##*/}"; \
+		$(INSTALL) -D -m 0644 $(@D)/$${libpath} $(1)/usr/lib/$${libname}; \
+		libsoname="$$( $(TARGET_READELF) -d "$(@D)/$${libpath}" \
 		       |sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
-		if [ -n "$${n}" -a "$${n}" != "$${lib##*/}" ]; then \
-			ln -sf $${lib##*/} $(1)/usr/lib/$${n}; \
+		if [ -n "$${libsoname}" -a "$${libsoname}" != "$${libname}" ]; then \
+			ln -sf $${libname} $(1)/usr/lib/$${libsoname}; \
 		fi; \
-		n="$${lib##*/}"; n="$${n/.so*}.so"; \
-		if [ -n "$${n}" -a "$${n}" != "$${lib##*/}" ]; then \
-			ln -sf $${lib##*/} $(1)/usr/lib/$${n}; \
+		baseso="$${libname/.so*}.so"; \
+		if [ -n "$${baseso}" -a "$${baseso}" != "$${libname}" ]; then \
+			ln -sf $${libname} $(1)/usr/lib/$${baseso}; \
 		fi; \
 	done
 endef


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
