From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  3 Oct 2011 23:20:36 +0200
Subject: [Buildroot] Derive HOST_FOO_DEPENDENCIES automatically
In-Reply-To: <201110032133.44496.arnout@mind.be>
References: <201110032133.44496.arnout@mind.be>
Message-ID: <1317676858-3407-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As requested by Luca, this patch series derives HOST_FOO_DEPENDENCIES
automatically from FOO_DEPENDENCIES.

I only compile-tested some of the modified packages.  However, I
checked that 'make host-foo-show-depends' outputs the same result.
There are two exceptions:

host-libxcb: the dependency on host-xcb-proto now appears twice.
This is harmless.

host-xlib_libX11: also some reordering, which should be OK. I also
removed the dependency on xproto_bigreqsproto, which doesn't seem to
be needed.  *This one really requires testing.*

---
Arnout Vandecappelle (Essensium/Mind) (22):
      package: derive HOST_FOO_DEPENDENCIES from FOO_DEPENDENCIES
      atk: removed redundant HOST_FOO_DEPENDENCIES
      cramfs: removed redundant HOST_FOO_DEPENDENCIES
      fontconfig: removed redundant HOST_FOO_DEPENDENCIES
      libpng: removed redundant HOST_FOO_DEPENDENCIES
      libxml-parser-perl: removed redundant HOST_FOO_DEPENDENCIES
      mpc: removed redundant HOST_FOO_DEPENDENCIES
      mpfr: removed redundant HOST_FOO_DEPENDENCIES
      squashfs3: removed redundant HOST_FOO_DEPENDENCIES
      libxcb: removed redundant HOST_FOO_DEPENDENCIES
      xapp_bdftopcf: removed redundant HOST_FOO_DEPENDENCIES
      xapp_mkfontdir: removed redundant HOST_FOO_DEPENDENCIES
      xapp_mkfontscale: removed redundant HOST_FOO_DEPENDENCIES
      xapp_xkbcomp: removed redundant HOST_FOO_DEPENDENCIES
      xfont_encodings: removed redundant HOST_FOO_DEPENDENCIES
      xfont_font-util: removed redundant HOST_FOO_DEPENDENCIES
      xlib_libX11: removed redundant HOST_FOO_DEPENDENCIES and incorrect target dependency
      xlib_libXau: removed redundant HOST_FOO_DEPENDENCIES
      xlib_libXdmcp: removed redundant HOST_FOO_DEPENDENCIES
      xlib_libXfont: removed redundant HOST_FOO_DEPENDENCIES
      xlib_libfontenc: removed redundant HOST_FOO_DEPENDENCIES
      xlib_libxkbfile: removed redundant HOST_FOO_DEPENDENCIES

 package/Makefile.autotools.in                      |   10 ++++++++++
 package/Makefile.package.in                        |    7 ++++++-
 package/atk/atk.mk                                 |    2 --
 package/cramfs/cramfs.mk                           |    1 -
 package/fontconfig/fontconfig.mk                   |    1 -
 package/libpng/libpng.mk                           |    2 --
 package/libxml-parser-perl/libxml-parser-perl.mk   |    1 -
 package/mpc/mpc.mk                                 |    1 -
 package/mpfr/mpfr.mk                               |    1 -
 package/squashfs3/squashfs3.mk                     |    1 -
 package/x11r7/libxcb/libxcb.mk                     |    4 ----
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |    1 -
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |    1 -
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    1 -
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    1 -
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    1 -
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    2 --
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    4 +---
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    2 --
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    2 --
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    1 -
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    2 --
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    2 --
 23 files changed, 17 insertions(+), 34 deletions(-)
