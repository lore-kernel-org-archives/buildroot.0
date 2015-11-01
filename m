From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Nov 2015 00:00:09 +0100
Subject: [Buildroot] [PATCH 0/4 RFC] xorg: fix installation paths (branch
	yem/xorg)
Message-ID: <cover.1446416019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt to fix the installation paths of many
Xorg-related packages.

*This is an RFC.*  There is an alternate proposal after the explanations
on the series.

The new pkconf bumped in d7f6d320 introduced a change in behaviour: all
path variables returned by pkgconf are now prefixed with the sysroot
directory.

This has an impact on a lot of Xorg packages (and maybe others as well),
since they use such paths verbatim to install files in either of:
    $(STAGING_DIR)/$(SYSROOT_DIR)/some/path
    $(TARGET_DIR)/$(SYSROOT_DIR)/some/path

This series is articulated around two main changes:

  - first, we fix the Xorg packages to no longer use those paths as-is,
    by removing the sysroot from select paths returned by pkgconf. We do
    that in two steps:

    - we introduce a new variable, X11R7_CONF_OPTS, which contains a set
      of --with-XXX options with fixed paths,

    - we append the content that variable to all Xorg related packages'
      ./configure options;

  - second, we introduce a new step hook, that checks that no package
    installs files in either problematic locations:

    - we allow step hooks to properly abort a step, by calling them
      before we touch our stamp files,

    - we eventually add the new step hook proper, and exit as soon as we
      detect an incorrect location, printing an error message to inform
      the user of the issue.

I've done a build with most of the Xorg stack enabled (but 8 video
drivers that FTBFS for other reasons), and it all went well with this
series.  

To be honest, I've spent a lot of time this WE to come up with this
series. However, all that series shows, is how deeply broken our
pkg-config support is now and how complex it will be to fix properly.

The only part of the series that I'd like see committed are the last two
patches. The first two patches are just to demonstrate how much changes
we'll have to do to fix things. Only the Xorg stack has been fixed here;
probably many other packages are bound to fail in the same way.

Note: we have 245 packages in package/x11r7, and changing only the
broken ones is a tedious task, and very time-consuming. After trying to
fix 5 or 6 packages, each with various build failures, I just reverted
to the solution above (patches 1 & 2).


------------------------------------
Alternate proposal:

We revert d7f6d320 (pkgconf: bump to version 0.9.12). Since that would
break nettle's install hogweed.pc, since it has in-lined comments. This
is what (at least partially) prompted the pkconf bump initially.

The solution would be to fixup .pc files, like we do fixup .la files, at
the end of the staging install commands, to remove comments from .pc
files.
------------------------------------


Needless to say, I'd be more than happy to ditch the first two patches
in this series and work on the alternate proposal.

Comments most welcome.

Regards,
Yann E. MORIN.


The following changes since commit dc3935ea1d3553591438211ec8b6072429ac7e60:

  linux: Add zImage.epapr target (2015-10-31 19:01:21 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/xorg

for you to fetch changes up to ef39f35c76cbac03be14009c1a8db59d7e3f59e3:

  core/pkg-generic: check proper package installation (2015-11-01 23:03:42 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/x11r7: introduce X11-global configure options
      package/x11r7/*: fixup all install paths
      core/pkg-generic: allow step hooks to fail a step
      core/pkg-generic: check proper package installation

 package/pkg-generic.mk                             | 31 ++++++++++++++++------
 package/x11r7/libepoxy/libepoxy.mk                 |  3 +++
 package/x11r7/libxcb/libxcb.mk                     |  3 +++
 package/x11r7/x11r7.mk                             | 16 +++++++++++
 package/x11r7/xapp_appres/xapp_appres.mk           |  3 +++
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |  3 +++
 package/x11r7/xapp_beforelight/xapp_beforelight.mk |  3 +++
 package/x11r7/xapp_bitmap/xapp_bitmap.mk           |  3 +++
 package/x11r7/xapp_editres/xapp_editres.mk         |  3 +++
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |  3 +++
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk     |  3 +++
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk         |  3 +++
 package/x11r7/xapp_iceauth/xapp_iceauth.mk         |  3 +++
 package/x11r7/xapp_ico/xapp_ico.mk                 |  3 +++
 package/x11r7/xapp_listres/xapp_listres.mk         |  3 +++
 package/x11r7/xapp_luit/xapp_luit.mk               |  3 +++
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |  3 +++
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |  3 +++
 package/x11r7/xapp_oclock/xapp_oclock.mk           |  3 +++
 package/x11r7/xapp_rgb/xapp_rgb.mk                 |  3 +++
 package/x11r7/xapp_rstart/xapp_rstart.mk           |  3 +++
 package/x11r7/xapp_scripts/xapp_scripts.mk         |  3 +++
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |  3 +++
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk     |  3 +++
 package/x11r7/xapp_showfont/xapp_showfont.mk       |  3 +++
 package/x11r7/xapp_smproxy/xapp_smproxy.mk         |  3 +++
 package/x11r7/xapp_twm/xapp_twm.mk                 |  3 +++
 package/x11r7/xapp_viewres/xapp_viewres.mk         |  3 +++
 package/x11r7/xapp_x11perf/xapp_x11perf.mk         |  3 +++
 package/x11r7/xapp_xauth/xapp_xauth.mk             |  3 +++
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |  3 +++
 package/x11r7/xapp_xbiff/xapp_xbiff.mk             |  3 +++
 package/x11r7/xapp_xcalc/xapp_xcalc.mk             |  3 +++
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   |  3 +++
 package/x11r7/xapp_xclock/xapp_xclock.mk           |  3 +++
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk           |  3 +++
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk       |  3 +++
 package/x11r7/xapp_xconsole/xapp_xconsole.mk       |  3 +++
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   |  3 +++
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk     |  3 +++
 package/x11r7/xapp_xditview/xapp_xditview.mk       |  3 +++
 package/x11r7/xapp_xdm/xapp_xdm.mk                 |  3 +++
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |  3 +++
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk       |  3 +++
 package/x11r7/xapp_xedit/xapp_xedit.mk             |  3 +++
 package/x11r7/xapp_xev/xapp_xev.mk                 |  3 +++
 package/x11r7/xapp_xeyes/xapp_xeyes.mk             |  3 +++
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk         |  3 +++
 package/x11r7/xapp_xfd/xapp_xfd.mk                 |  3 +++
 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk   |  3 +++
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk       |  3 +++
 package/x11r7/xapp_xfs/xapp_xfs.mk                 |  3 +++
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk         |  3 +++
 package/x11r7/xapp_xgamma/xapp_xgamma.mk           |  3 +++
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |  3 +++
 package/x11r7/xapp_xhost/xapp_xhost.mk             |  3 +++
 package/x11r7/xapp_xinit/xapp_xinit.mk             |  3 +++
 .../xapp_xinput-calibrator.mk                      |  3 +++
 package/x11r7/xapp_xinput/xapp_xinput.mk           |  3 +++
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |  3 +++
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk           |  3 +++
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk       |  3 +++
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk       |  3 +++
 package/x11r7/xapp_xkill/xapp_xkill.mk             |  3 +++
 package/x11r7/xapp_xload/xapp_xload.mk             |  3 +++
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |  3 +++
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk       |  3 +++
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   |  3 +++
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk       |  3 +++
 package/x11r7/xapp_xmag/xapp_xmag.mk               |  3 +++
 package/x11r7/xapp_xman/xapp_xman.mk               |  3 +++
 package/x11r7/xapp_xmessage/xapp_xmessage.mk       |  3 +++
 package/x11r7/xapp_xmh/xapp_xmh.mk                 |  3 +++
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |  3 +++
 package/x11r7/xapp_xmore/xapp_xmore.mk             |  3 +++
 package/x11r7/xapp_xpr/xapp_xpr.mk                 |  3 +++
 package/x11r7/xapp_xprop/xapp_xprop.mk             |  3 +++
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |  3 +++
 package/x11r7/xapp_xrdb/xapp_xrdb.mk               |  3 +++
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk       |  3 +++
 package/x11r7/xapp_xset/xapp_xset.mk               |  3 +++
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk       |  3 +++
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk |  3 +++
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk       |  3 +++
 package/x11r7/xapp_xsm/xapp_xsm.mk                 |  3 +++
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk       |  3 +++
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk       |  3 +++
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk           |  3 +++
 package/x11r7/xapp_xwd/xapp_xwd.mk                 |  3 +++
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk       |  3 +++
 package/x11r7/xapp_xwud/xapp_xwud.mk               |  3 +++
 package/x11r7/xcb-proto/xcb-proto.mk               |  3 +++
 package/x11r7/xcb-util-cursor/xcb-util-cursor.mk   |  3 +++
 package/x11r7/xcb-util-image/xcb-util-image.mk     |  3 +++
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |  3 +++
 .../xcb-util-renderutil/xcb-util-renderutil.mk     |  3 +++
 package/x11r7/xcb-util-wm/xcb-util-wm.mk           |  3 +++
 package/x11r7/xcb-util/xcb-util.mk                 |  3 +++
 .../xcursor-transparent-theme.mk                   |  3 +++
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk     |  3 +++
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |  3 +++
 .../xdriver_xf86-input-evdev.mk                    |  3 +++
 .../xdriver_xf86-input-joystick.mk                 |  3 +++
 .../xdriver_xf86-input-keyboard.mk                 |  3 +++
 .../xdriver_xf86-input-libinput.mk                 |  3 +++
 .../xdriver_xf86-input-mouse.mk                    |  3 +++
 .../xdriver_xf86-input-synaptics.mk                |  3 +++
 .../xdriver_xf86-input-tslib.mk                    |  3 +++
 .../xdriver_xf86-input-vmmouse.mk                  |  3 +++
 .../xdriver_xf86-input-void.mk                     |  3 +++
 .../xdriver_xf86-video-ark.mk                      |  3 +++
 .../xdriver_xf86-video-ast.mk                      |  3 +++
 .../xdriver_xf86-video-ati.mk                      |  3 +++
 .../xdriver_xf86-video-cirrus.mk                   |  3 +++
 .../xdriver_xf86-video-dummy.mk                    |  3 +++
 .../xdriver_xf86-video-fbdev.mk                    |  3 +++
 .../xdriver_xf86-video-fbturbo.mk                  |  3 +++
 .../xdriver_xf86-video-geode.mk                    |  3 +++
 .../xdriver_xf86-video-glide.mk                    |  3 +++
 .../xdriver_xf86-video-glint.mk                    |  3 +++
 .../xdriver_xf86-video-i128.mk                     |  3 +++
 .../xdriver_xf86-video-imx.mk                      |  3 +++
 .../xdriver_xf86-video-intel.mk                    |  3 +++
 .../xdriver_xf86-video-mach64.mk                   |  3 +++
 .../xdriver_xf86-video-mga.mk                      |  3 +++
 .../xdriver_xf86-video-neomagic.mk                 |  3 +++
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |  3 +++
 .../xdriver_xf86-video-openchrome.mk               |  3 +++
 .../xdriver_xf86-video-qxl.mk                      |  3 +++
 .../xdriver_xf86-video-r128.mk                     |  3 +++
 .../xdriver_xf86-video-savage.mk                   |  3 +++
 .../xdriver_xf86-video-siliconmotion.mk            |  3 +++
 .../xdriver_xf86-video-sis.mk                      |  3 +++
 .../xdriver_xf86-video-tdfx.mk                     |  3 +++
 .../xdriver_xf86-video-tga.mk                      |  3 +++
 .../xdriver_xf86-video-trident.mk                  |  3 +++
 .../xdriver_xf86-video-v4l.mk                      |  3 +++
 .../xdriver_xf86-video-vesa.mk                     |  3 +++
 .../xdriver_xf86-video-vmware.mk                   |  3 +++
 .../xdriver_xf86-video-voodoo.mk                   |  3 +++
 .../xdriver_xf86-video-wsfb.mk                     |  3 +++
 package/x11r7/xfont_encodings/xfont_encodings.mk   |  3 +++
 .../xfont_font-adobe-100dpi.mk                     |  3 +++
 .../xfont_font-adobe-75dpi.mk                      |  3 +++
 .../xfont_font-adobe-utopia-100dpi.mk              |  3 +++
 .../xfont_font-adobe-utopia-75dpi.mk               |  3 +++
 .../xfont_font-adobe-utopia-type1.mk               |  3 +++
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |  3 +++
 .../xfont_font-arabic-misc.mk                      |  3 +++
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |  3 +++
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |  3 +++
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |  3 +++
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |  3 +++
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |  3 +++
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |  3 +++
 .../xfont_font-bitstream-100dpi.mk                 |  3 +++
 .../xfont_font-bitstream-75dpi.mk                  |  3 +++
 .../xfont_font-bitstream-type1.mk                  |  3 +++
 .../xfont_font-cronyx-cyrillic.mk                  |  3 +++
 .../xfont_font-cursor-misc.mk                      |  3 +++
 .../xfont_font-daewoo-misc.mk                      |  3 +++
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |  3 +++
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |  3 +++
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |  3 +++
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |  3 +++
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |  3 +++
 .../xfont_font-misc-cyrillic.mk                    |  3 +++
 .../xfont_font-misc-ethiopic.mk                    |  3 +++
 .../xfont_font-misc-meltho.mk                      |  3 +++
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |  3 +++
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |  3 +++
 .../xfont_font-schumacher-misc.mk                  |  3 +++
 .../xfont_font-screen-cyrillic.mk                  |  3 +++
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |  3 +++
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |  3 +++
 package/x11r7/xfont_font-util/xfont_font-util.mk   |  3 +++
 .../xfont_font-winitzki-cyrillic.mk                |  3 +++
 .../xfont_font-xfree86-type1.mk                    |  3 +++
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |  3 +++
 package/x11r7/xlib_libFS/xlib_libFS.mk             |  3 +++
 package/x11r7/xlib_libICE/xlib_libICE.mk           |  3 +++
 package/x11r7/xlib_libSM/xlib_libSM.mk             |  3 +++
 package/x11r7/xlib_libX11/xlib_libX11.mk           |  3 +++
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |  3 +++
 package/x11r7/xlib_libXau/xlib_libXau.mk           |  3 +++
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |  3 +++
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |  3 +++
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |  3 +++
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |  3 +++
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |  3 +++
 package/x11r7/xlib_libXext/xlib_libXext.mk         |  3 +++
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |  3 +++
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |  3 +++
 package/x11r7/xlib_libXft/xlib_libXft.mk           |  3 +++
 package/x11r7/xlib_libXi/xlib_libXi.mk             |  3 +++
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |  3 +++
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |  3 +++
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |  3 +++
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |  3 +++
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |  3 +++
 package/x11r7/xlib_libXres/xlib_libXres.mk         |  3 +++
 package/x11r7/xlib_libXt/xlib_libXt.mk             |  3 +++
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |  3 +++
 package/x11r7/xlib_libXv/xlib_libXv.mk             |  3 +++
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |  3 +++
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |  3 +++
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |  3 +++
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |  3 +++
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |  3 +++
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |  3 +++
 .../x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   |  3 +++
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |  3 +++
 .../xproto_applewmproto/xproto_applewmproto.mk     |  3 +++
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |  3 +++
 .../xproto_compositeproto/xproto_compositeproto.mk |  3 +++
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |  3 +++
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk   |  3 +++
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |  3 +++
 package/x11r7/xproto_dri3proto/xproto_dri3proto.mk |  3 +++
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |  3 +++
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |  3 +++
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |  3 +++
 package/x11r7/xproto_glproto/xproto_glproto.mk     |  3 +++
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |  3 +++
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |  3 +++
 .../xproto_presentproto/xproto_presentproto.mk     |  3 +++
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |  3 +++
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |  3 +++
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |  3 +++
 .../xproto_resourceproto/xproto_resourceproto.mk   |  3 +++
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |  3 +++
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |  3 +++
 .../xproto_windowswmproto/xproto_windowswmproto.mk |  3 +++
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |  3 +++
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |  3 +++
 .../xproto_xf86bigfontproto.mk                     |  3 +++
 .../xproto_xf86dgaproto/xproto_xf86dgaproto.mk     |  3 +++
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |  3 +++
 .../xproto_xf86vidmodeproto.mk                     |  3 +++
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |  3 +++
 package/x11r7/xproto_xproto/xproto_xproto.mk       |  3 +++
 .../xproto_xproxymanagementprotocol.mk             |  3 +++
 .../xserver_xorg-server/xserver_xorg-server.mk     |  3 +++
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |  3 +++
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |  3 +++
 245 files changed, 768 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
