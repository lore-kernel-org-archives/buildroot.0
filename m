From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 09:58:27 +0100
Subject: [Buildroot] [PATCH 1/1] libcap: depend on host-attr for the host
In-Reply-To: <1445722754-3477-2-git-send-email-mathstuf@gmail.com>
References: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
 <1445722754-3477-2-git-send-email-mathstuf@gmail.com>
Message-ID: <20151026095827.2679c61f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ben Boeckel,

On Sat, 24 Oct 2015 17:39:14 -0400, Ben Boeckel wrote:
> When a host-libcap is built, it is built without libattr support.
> However, libcap does not define some symbols based on this flag. This
> becomes a problem when a build-host tool is run (e.g., ls) which uses
> these symbols gets the host-libcap library via LD_LIBRARY_PATH.

Ok, so let me try to understand this a bit better. You say that if you
have host-libcap built and installed in $(HOST_DIR), then when you
build another package, if the build process of that package uses your
system 'ls' (i.e /bin/ls), then this ls doesn't work properly because
it uses $(HOST_DIR)/usr/lib/libacl.so instead of /usr/lib/libacl.so.

Is that correct ?

If that is correct, then I think your proposed change is not the right
solution, because it is just a workaround for the specific situation,
on your distribution, where ls gets linked against an acl that has attr
support. A similar problem can appear with other binaries/libraries,
and we don't want to clutter our host package dependencies to solve
such problems IMO.

Instead, I believe we should look at removing $(HOST_DIR)/usr/lib from
LD_LIBRARY_PATH, i.e do something like:

diff --git a/package/Makefile.in b/package/Makefile.in
index 8a592d4..10f3a47 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -298,12 +298,10 @@ HOST_CONFIGURE_OPTS = \
        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
        PKG_CONFIG_SYSROOT_DIR="/" \
        PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-       LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
        INTLTOOL_PERL=$(PERL)
 
 HOST_MAKE_ENV = \
        PATH=$(BR_PATH) \
-       LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
        PKG_CONFIG_SYSROOT_DIR="/" \
        PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"

We do build all host binaries in $(HOST_DIR) with a rpath that points
to $(HOST_DIR)/usr/lib, so this LD_LIBRARY_PATH should not be
necessary. And this LD_LIBRARY_PATH is indeed wrong as it means that
any system binary will first use the Buildroot-built host libraries
rather than the system ones, as you experienced. These LD_LIBRARY_PATH
were introduced back in February 2010, at a time when we were not
building host binaries with a rpath. So I believe they should by now be
unnecessary, and as you found out, potentially harmful.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
