From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 27 Apr 2014 01:59:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-25
In-Reply-To: <20140426063011.24622100FA4@stock.ovh.net>
References: <20140426063011.24622100FA4@stock.ovh.net>
Message-ID: <20140426235953.GA15466@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Sat, Apr 26, 2014 at 08:30:11AM +0200, Thomas Petazzoni wrote:
>     x86_64 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d8c703043220ec95be9c793712570843ca7c0a16/

This is not a cairo issue, but a mesa3d one: in the defconfig file, mesa3d is
configured with Gallium3D drivers and GLES support only. In this case, the
Makefile of the package adds --disable-shared-glapi to the configure options,
but anyway, the configure script will also sets it by itself, as support for
DRI is disabled.

The build fails because libGLESv2.so has undefined references to
_glapi_get_dispatch() which is defined... in libglapi.so! See
http://www.mesa3d.org/dispatch.html to learn about this function.

Looking at src/mapi/es2api/Makefile.am, we can see that, when
--disable-shared-glapi is passed, the libglapi is not added as dependency:

  if HAVE_SHARED_GLAPI
  libGLESv2_la_LIBADD += ../shared-glapi/libglapi.la
  endif

But unfortunately, this is not correctly handled in src/mapi/entry.c, which
is used to build libGLESv{1,2}.so and libglapi.so. In this file, we have:

  /* in bridge mode, mapi is a user of glapi */
  #ifdef MAPI_MODE_BRIDGE
  #define ENTRY_CURRENT_TABLE_GET "_glapi_get_dispatch"
  #else
  #define ENTRY_CURRENT_TABLE_GET U_STRINGIFY(u_current_get_internal)
  #endif

When comparing src/mapi/glapi/Makefile.am and src/map/es2api/Makefile.am, we
can see that, when passing --disable-shared-glapi, MAPI_MODE_BRIDGE is handled
differently. For libGLESv2.so, entry.c will be compiled with
-DMAPI_MODE_BRIDGE, hence the reference to _glapi_get_dispatch().

I tried to build libGLESv2.so without -DMAPI_MODE_BRIDGE, but I ended up with
new header issues...

So it looks that building GLES with Gallium3D only is currently broken. I'll
query upstream about this: finding the right configure options for building
only specific parts of Mesa3D is not straight forward.

Best regards,
ELB
