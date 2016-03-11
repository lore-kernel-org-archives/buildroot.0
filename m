From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:11:02 +0100
Subject: [Buildroot] [PATCH 2/3 v2] package/x11r7/*: fixup all install paths
In-Reply-To: <cover.1457719643.git.yann.morin.1998@free.fr>
References: <cover.1457719643.git.yann.morin.1998@free.fr>
Message-ID: <16cce2a6e24e5ea409c7f1a050463af9a431b3a0.1457719643.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the newly-introduced Xorg-wide ./configure option to fixup install
paths.

Only two packages are not impacted by this change. Both are
generic-packages, and neither is using pkg-config:
  - mcookie
  - xdriver_xf86-video-imx-viv

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Romain Naour <romain.naour@openwide.fr>

---
This is a purely mechanical change, obtained with the following script:

$ cat foo.sh

COMMENT="# Fixup incorrect paths"

main() {
    local base_dir="${1}"

    if [ -z "${base_dir}" ]; then
        printf "error, no basedir specified\n" >&2
        exit 1
    fi
    if [ ! -d "${base_dir}" ]; then
        printf "basedir '%s' not a directory\n" "${base_dir}" >&2
        exit 1
    fi

    find "${base_dir}" -type f -name '*.mk' -exec grep -l -E 'eval \$\(autotools' {} + \
    |while read file; do
        pkg="${file##*/}"
        pkg="${pkg%.mk}"
        PKG="$( sed -r -e 's/-/_/g;' <<<"${pkg^^}" )"
        grep -E "^${PKG}_VERSION" "${file}" >/dev/null 2>&1 || continue
        printf "%s\n" "${pkg}"
        PKG_CONF_OPTS="${PKG}_CONF_OPTS += \$(X11R7_CONF_OPTS)"
        sed -r -i -e '/^(\$\(eval \$\(autotools-package\)\))$/s//'"${COMMENT}"'\n'"${PKG_CONF_OPTS}"'\n\n\1/' "${file}"
    done
}
main "${@}"

$ ./foo.sh package/x11r7
---
 package/x11r7/libepoxy/libepoxy.mk                                     | 3 +++
 package/x11r7/libxcb/libxcb.mk                                         | 3 +++
 package/x11r7/xapp_appres/xapp_appres.mk                               | 3 +++
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk                           | 3 +++
 package/x11r7/xapp_beforelight/xapp_beforelight.mk                     | 3 +++
 package/x11r7/xapp_bitmap/xapp_bitmap.mk                               | 3 +++
 package/x11r7/xapp_editres/xapp_editres.mk                             | 3 +++
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk                       | 3 +++
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk                         | 3 +++
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk                             | 3 +++
 package/x11r7/xapp_iceauth/xapp_iceauth.mk                             | 3 +++
 package/x11r7/xapp_ico/xapp_ico.mk                                     | 3 +++
 package/x11r7/xapp_listres/xapp_listres.mk                             | 3 +++
 package/x11r7/xapp_luit/xapp_luit.mk                                   | 3 +++
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk                         | 3 +++
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk                     | 3 +++
 package/x11r7/xapp_oclock/xapp_oclock.mk                               | 3 +++
 package/x11r7/xapp_rgb/xapp_rgb.mk                                     | 3 +++
 package/x11r7/xapp_rstart/xapp_rstart.mk                               | 3 +++
 package/x11r7/xapp_scripts/xapp_scripts.mk                             | 3 +++
 package/x11r7/xapp_sessreg/xapp_sessreg.mk                             | 3 +++
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk                         | 3 +++
 package/x11r7/xapp_showfont/xapp_showfont.mk                           | 3 +++
 package/x11r7/xapp_smproxy/xapp_smproxy.mk                             | 3 +++
 package/x11r7/xapp_twm/xapp_twm.mk                                     | 3 +++
 package/x11r7/xapp_viewres/xapp_viewres.mk                             | 3 +++
 package/x11r7/xapp_x11perf/xapp_x11perf.mk                             | 3 +++
 package/x11r7/xapp_xauth/xapp_xauth.mk                                 | 3 +++
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk                       | 3 +++
 package/x11r7/xapp_xbiff/xapp_xbiff.mk                                 | 3 +++
 package/x11r7/xapp_xcalc/xapp_xcalc.mk                                 | 3 +++
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk                       | 3 +++
 package/x11r7/xapp_xclock/xapp_xclock.mk                               | 3 +++
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk                               | 3 +++
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk                           | 3 +++
 package/x11r7/xapp_xconsole/xapp_xconsole.mk                           | 3 +++
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk                       | 3 +++
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk                         | 3 +++
 package/x11r7/xapp_xditview/xapp_xditview.mk                           | 3 +++
 package/x11r7/xapp_xdm/xapp_xdm.mk                                     | 3 +++
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk                           | 3 +++
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk                           | 3 +++
 package/x11r7/xapp_xedit/xapp_xedit.mk                                 | 3 +++
 package/x11r7/xapp_xev/xapp_xev.mk                                     | 3 +++
 package/x11r7/xapp_xeyes/xapp_xeyes.mk                                 | 3 +++
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk                             | 3 +++
 package/x11r7/xapp_xfd/xapp_xfd.mk                                     | 3 +++
 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk                       | 3 +++
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk                           | 3 +++
 package/x11r7/xapp_xfs/xapp_xfs.mk                                     | 3 +++
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk                             | 3 +++
 package/x11r7/xapp_xgamma/xapp_xgamma.mk                               | 3 +++
 package/x11r7/xapp_xgc/xapp_xgc.mk                                     | 3 +++
 package/x11r7/xapp_xhost/xapp_xhost.mk                                 | 3 +++
 package/x11r7/xapp_xinit/xapp_xinit.mk                                 | 3 +++
 package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk         | 3 +++
 package/x11r7/xapp_xinput/xapp_xinput.mk                               | 3 +++
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk                             | 3 +++
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk                               | 3 +++
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk                           | 3 +++
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk                           | 3 +++
 package/x11r7/xapp_xkill/xapp_xkill.mk                                 | 3 +++
 package/x11r7/xapp_xload/xapp_xload.mk                                 | 3 +++
 package/x11r7/xapp_xlogo/xapp_xlogo.mk                                 | 3 +++
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk                           | 3 +++
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk                       | 3 +++
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk                           | 3 +++
 package/x11r7/xapp_xmag/xapp_xmag.mk                                   | 3 +++
 package/x11r7/xapp_xman/xapp_xman.mk                                   | 3 +++
 package/x11r7/xapp_xmessage/xapp_xmessage.mk                           | 3 +++
 package/x11r7/xapp_xmh/xapp_xmh.mk                                     | 3 +++
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk                             | 3 +++
 package/x11r7/xapp_xmore/xapp_xmore.mk                                 | 3 +++
 package/x11r7/xapp_xpr/xapp_xpr.mk                                     | 3 +++
 package/x11r7/xapp_xprop/xapp_xprop.mk                                 | 3 +++
 package/x11r7/xapp_xrandr/xapp_xrandr.mk                               | 3 +++
 package/x11r7/xapp_xrdb/xapp_xrdb.mk                                   | 3 +++
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk                           | 3 +++
 package/x11r7/xapp_xset/xapp_xset.mk                                   | 3 +++
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk                           | 3 +++
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk                     | 3 +++
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk                           | 3 +++
 package/x11r7/xapp_xsm/xapp_xsm.mk                                     | 3 +++
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk                           | 3 +++
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk                           | 3 +++
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk                               | 3 +++
 package/x11r7/xapp_xwd/xapp_xwd.mk                                     | 3 +++
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk                           | 3 +++
 package/x11r7/xapp_xwud/xapp_xwud.mk                                   | 3 +++
 package/x11r7/xcb-proto/xcb-proto.mk                                   | 3 +++
 package/x11r7/xcb-util-cursor/xcb-util-cursor.mk                       | 3 +++
 package/x11r7/xcb-util-image/xcb-util-image.mk                         | 3 +++
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk                     | 3 +++
 package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk               | 3 +++
 package/x11r7/xcb-util-wm/xcb-util-wm.mk                               | 3 +++
 package/x11r7/xcb-util/xcb-util.mk                                     | 3 +++
 package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk   | 3 +++
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk                         | 3 +++
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk             | 3 +++
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk     | 3 +++
 .../x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk   | 3 +++
 .../x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk   | 3 +++
 .../x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk   | 3 +++
 package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk     | 3 +++
 .../x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk | 3 +++
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk     | 3 +++
 package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk | 3 +++
 package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk       | 3 +++
 package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk         | 3 +++
 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk         | 3 +++
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk         | 3 +++
 package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk   | 3 +++
 package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk     | 3 +++
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk     | 3 +++
 package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk | 3 +++
 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk     | 3 +++
 package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk     | 3 +++
 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk     | 3 +++
 package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk       | 3 +++
 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk         | 3 +++
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk     | 3 +++
 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk   | 3 +++
 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk         | 3 +++
 .../x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk   | 3 +++
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk           | 3 +++
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk     | 3 +++
 package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk         | 3 +++
 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk       | 3 +++
 package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk   | 3 +++
 .../xdriver_xf86-video-siliconmotion.mk                                | 3 +++
 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk         | 3 +++
 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk       | 3 +++
 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk         | 3 +++
 package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk | 3 +++
 package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk         | 3 +++
 package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk       | 3 +++
 package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk   | 3 +++
 package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk   | 3 +++
 package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk       | 3 +++
 package/x11r7/xfont_encodings/xfont_encodings.mk                       | 3 +++
 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk       | 3 +++
 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk         | 3 +++
 .../xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk   | 3 +++
 .../xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk     | 3 +++
 .../xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk     | 3 +++
 package/x11r7/xfont_font-alias/xfont_font-alias.mk                     | 3 +++
 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk         | 3 +++
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk             | 3 +++
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk               | 3 +++
 .../xfont_font-bh-lucidatypewriter-100dpi.mk                           | 3 +++
 .../xfont_font-bh-lucidatypewriter-75dpi.mk                            | 3 +++
 package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk                   | 3 +++
 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk               | 3 +++
 .../x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk   | 3 +++
 package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk | 3 +++
 package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk | 3 +++
 package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk | 3 +++
 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk         | 3 +++
 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk         | 3 +++
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk               | 3 +++
 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk             | 3 +++
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk             | 3 +++
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk               | 3 +++
 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk           | 3 +++
 package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk     | 3 +++
 package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk     | 3 +++
 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk         | 3 +++
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk             | 3 +++
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk             | 3 +++
 package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk | 3 +++
 package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk | 3 +++
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk             | 3 +++
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk               | 3 +++
 package/x11r7/xfont_font-util/xfont_font-util.mk                       | 3 +++
 .../x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk | 3 +++
 package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk     | 3 +++
 package/x11r7/xkeyboard-config/xkeyboard-config.mk                     | 3 +++
 package/x11r7/xlib_libFS/xlib_libFS.mk                                 | 3 +++
 package/x11r7/xlib_libICE/xlib_libICE.mk                               | 3 +++
 package/x11r7/xlib_libSM/xlib_libSM.mk                                 | 3 +++
 package/x11r7/xlib_libX11/xlib_libX11.mk                               | 3 +++
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk                 | 3 +++
 package/x11r7/xlib_libXau/xlib_libXau.mk                               | 3 +++
 package/x11r7/xlib_libXaw/xlib_libXaw.mk                               | 3 +++
 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk                 | 3 +++
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk                       | 3 +++
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk                       | 3 +++
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk                           | 3 +++
 package/x11r7/xlib_libXext/xlib_libXext.mk                             | 3 +++
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk                         | 3 +++
 package/x11r7/xlib_libXfont/xlib_libXfont.mk                           | 3 +++
 package/x11r7/xlib_libXft/xlib_libXft.mk                               | 3 +++
 package/x11r7/xlib_libXi/xlib_libXi.mk                                 | 3 +++
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk                     | 3 +++
 package/x11r7/xlib_libXmu/xlib_libXmu.mk                               | 3 +++
 package/x11r7/xlib_libXpm/xlib_libXpm.mk                               | 3 +++
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk                         | 3 +++
 package/x11r7/xlib_libXrender/xlib_libXrender.mk                       | 3 +++
 package/x11r7/xlib_libXres/xlib_libXres.mk                             | 3 +++
 package/x11r7/xlib_libXt/xlib_libXt.mk                                 | 3 +++
 package/x11r7/xlib_libXtst/xlib_libXtst.mk                             | 3 +++
 package/x11r7/xlib_libXv/xlib_libXv.mk                                 | 3 +++
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk                             | 3 +++
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk                     | 3 +++
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk                       | 3 +++
 package/x11r7/xlib_libdmx/xlib_libdmx.mk                               | 3 +++
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk                       | 3 +++
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk                       | 3 +++
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk                   | 3 +++
 package/x11r7/xlib_xtrans/xlib_xtrans.mk                               | 3 +++
 package/x11r7/xproto_applewmproto/xproto_applewmproto.mk               | 3 +++
 package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk               | 3 +++
 package/x11r7/xproto_compositeproto/xproto_compositeproto.mk           | 3 +++
 package/x11r7/xproto_damageproto/xproto_damageproto.mk                 | 3 +++
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk                       | 3 +++
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk                     | 3 +++
 package/x11r7/xproto_dri3proto/xproto_dri3proto.mk                     | 3 +++
 package/x11r7/xproto_fixesproto/xproto_fixesproto.mk                   | 3 +++
 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk           | 3 +++
 package/x11r7/xproto_fontsproto/xproto_fontsproto.mk                   | 3 +++
 package/x11r7/xproto_glproto/xproto_glproto.mk                         | 3 +++
 package/x11r7/xproto_inputproto/xproto_inputproto.mk                   | 3 +++
 package/x11r7/xproto_kbproto/xproto_kbproto.mk                         | 3 +++
 package/x11r7/xproto_presentproto/xproto_presentproto.mk               | 3 +++
 package/x11r7/xproto_randrproto/xproto_randrproto.mk                   | 3 +++
 package/x11r7/xproto_recordproto/xproto_recordproto.mk                 | 3 +++
 package/x11r7/xproto_renderproto/xproto_renderproto.mk                 | 3 +++
 package/x11r7/xproto_resourceproto/xproto_resourceproto.mk             | 3 +++
 package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk           | 3 +++
 package/x11r7/xproto_videoproto/xproto_videoproto.mk                   | 3 +++
 package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk           | 3 +++
 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk                 | 3 +++
 package/x11r7/xproto_xextproto/xproto_xextproto.mk                     | 3 +++
 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk       | 3 +++
 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk               | 3 +++
 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk               | 3 +++
 package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk       | 3 +++
 package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk             | 3 +++
 package/x11r7/xproto_xproto/xproto_xproto.mk                           | 3 +++
 .../xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk | 3 +++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk               | 3 +++
 package/x11r7/xutil_makedepend/xutil_makedepend.mk                     | 3 +++
 package/xutil_util-macros/xutil_util-macros.mk                         | 3 +++
 243 files changed, 729 insertions(+)

diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
index 12ddd03..bced6a4 100644
--- a/package/x11r7/libepoxy/libepoxy.mk
+++ b/package/x11r7/libepoxy/libepoxy.mk
@@ -13,4 +13,7 @@ LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros libegl \
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
 
+# Fixup incorrect paths
+LIBEPOXY_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index c46ee26..8fbc6ea 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -19,5 +19,8 @@ LIBXCB_DEPENDENCIES = \
 LIBXCB_CONF_OPTS = --with-doxygen=no
 HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
 
+# Fixup incorrect paths
+LIBXCB_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index b84d742..c3ef032 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -11,4 +11,7 @@ XAPP_APPRES_LICENSE = MIT
 XAPP_APPRES_LICENSE_FILES = COPYING
 XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
 
+# Fixup incorrect paths
+XAPP_APPRES_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index ebdcda5..c3e013c 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -14,5 +14,8 @@ XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
 # needed for linking against libXfont
 XAPP_BDFTOPCF_MAKE_OPTS += LIBS=-ldl
 
+# Fixup incorrect paths
+XAPP_BDFTOPCF_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index b39fe78..4a9966f 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -11,4 +11,7 @@ XAPP_BEFORELIGHT_LICENSE = MIT
 XAPP_BEFORELIGHT_LICENSE_FILES = COPYING
 XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
 
+# Fixup incorrect paths
+XAPP_BEFORELIGHT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 851af31..684ca3e 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -11,4 +11,7 @@ XAPP_BITMAP_LICENSE = MIT
 XAPP_BITMAP_LICENSE_FILES = COPYING
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
 
+# Fixup incorrect paths
+XAPP_BITMAP_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index 6cc4805..5a32665 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -11,4 +11,7 @@ XAPP_EDITRES_LICENSE = MIT
 XAPP_EDITRES_LICENSE_FILES = COPYING
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
+# Fixup incorrect paths
+XAPP_EDITRES_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index 1571a3b..a54540c 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -11,4 +11,7 @@ XAPP_FONTTOSFNT_LICENSE = MIT
 XAPP_FONTTOSFNT_LICENSE_FILES = COPYING
 XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
 
+# Fixup incorrect paths
+XAPP_FONTTOSFNT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 27786a5..cc93b2d 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -11,4 +11,7 @@ XAPP_FSLSFONTS_LICENSE = MIT
 XAPP_FSLSFONTS_LICENSE_FILES = COPYING
 XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
 
+# Fixup incorrect paths
+XAPP_FSLSFONTS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index e897514..d49b36f 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -11,4 +11,7 @@ XAPP_FSTOBDF_LICENSE = MIT
 XAPP_FSTOBDF_LICENSE_FILES = COPYING
 XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
 
+# Fixup incorrect paths
+XAPP_FSTOBDF_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index d30ff6f..1703738 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -11,4 +11,7 @@ XAPP_ICEAUTH_LICENSE = MIT
 XAPP_ICEAUTH_LICENSE_FILES = COPYING
 XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
 
+# Fixup incorrect paths
+XAPP_ICEAUTH_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 621d1e4..db6be92 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -11,4 +11,7 @@ XAPP_ICO_LICENSE = MIT
 XAPP_ICO_LICENSE_FILES = COPYING
 XAPP_ICO_DEPENDENCIES = xlib_libX11
 
+# Fixup incorrect paths
+XAPP_ICO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index 88cdd4f..707f4af 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -11,4 +11,7 @@ XAPP_LISTRES_LICENSE = MIT
 XAPP_LISTRES_LICENSE_FILES = COPYING
 XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
+# Fixup incorrect paths
+XAPP_LISTRES_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
index d3217fe..468be6f 100644
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ b/package/x11r7/xapp_luit/xapp_luit.mk
@@ -11,4 +11,7 @@ XAPP_LUIT_LICENSE = MIT
 XAPP_LUIT_LICENSE_FILES = COPYING
 XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
 
+# Fixup incorrect paths
+XAPP_LUIT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index b74f993..e2b50ac 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -11,5 +11,8 @@ XAPP_MKFONTDIR_LICENSE = MIT
 XAPP_MKFONTDIR_LICENSE_FILES = COPYING
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
 
+# Fixup incorrect paths
+XAPP_MKFONTDIR_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index b99a646..93ccca8 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -11,5 +11,8 @@ XAPP_MKFONTSCALE_LICENSE = MIT
 XAPP_MKFONTSCALE_LICENSE_FILES = COPYING
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
 
+# Fixup incorrect paths
+XAPP_MKFONTSCALE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 17d544c..8fe4a6a 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -18,4 +18,7 @@ else
 XAPP_OCLOCK_CONF_OPTS += --without-xkb
 endif
 
+# Fixup incorrect paths
+XAPP_OCLOCK_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index 82878ab..bc57196 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -11,4 +11,7 @@ XAPP_RGB_LICENSE = MIT
 XAPP_RGB_LICENSE_FILES = COPYING
 XAPP_RGB_DEPENDENCIES = xproto_xproto
 
+# Fixup incorrect paths
+XAPP_RGB_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index 2bcc292..dfaf59f 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -11,4 +11,7 @@ XAPP_RSTART_LICENSE = MIT
 XAPP_RSTART_LICENSE_FILES = COPYING
 XAPP_RSTART_DEPENDENCIES = xlib_libX11
 
+# Fixup incorrect paths
+XAPP_RSTART_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_scripts/xapp_scripts.mk b/package/x11r7/xapp_scripts/xapp_scripts.mk
index 5146db5..877cddd 100644
--- a/package/x11r7/xapp_scripts/xapp_scripts.mk
+++ b/package/x11r7/xapp_scripts/xapp_scripts.mk
@@ -11,4 +11,7 @@ XAPP_SCRIPTS_LICENSE = MIT
 XAPP_SCRIPTS_LICENSE_FILES = COPYING
 XAPP_SCRIPTS_DEPENDENCIES = xlib_libX11
 
+# Fixup incorrect paths
+XAPP_SCRIPTS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index 08811c0..88ac06c 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -11,4 +11,7 @@ XAPP_SESSREG_LICENSE = MIT
 XAPP_SESSREG_LICENSE_FILES = COPYING
 XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
 
+# Fixup incorrect paths
+XAPP_SESSREG_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index b923d60..1ba4473 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -11,4 +11,7 @@ XAPP_SETXKBMAP_LICENSE = MIT
 XAPP_SETXKBMAP_LICENSE_FILES = COPYING
 XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
+# Fixup incorrect paths
+XAPP_SETXKBMAP_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index c0b8c9a..a8122dc 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -11,4 +11,7 @@ XAPP_SHOWFONT_LICENSE = MIT
 XAPP_SHOWFONT_LICENSE_FILES = COPYING
 XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
 
+# Fixup incorrect paths
+XAPP_SHOWFONT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index f51c1ec..8af75c9 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -11,4 +11,7 @@ XAPP_SMPROXY_LICENSE = MIT
 XAPP_SMPROXY_LICENSE_FILES = COPYING
 XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
 
+# Fixup incorrect paths
+XAPP_SMPROXY_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 1f576e1..17dcef0 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -12,4 +12,7 @@ XAPP_TWM_LICENSE_FILES = COPYING
 XAPP_TWM_DEPENDENCIES = \
 	host-bison xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_TWM_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 3e1fd8d..3d0a408 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -11,4 +11,7 @@ XAPP_VIEWRES_LICENSE = MIT
 XAPP_VIEWRES_LICENSE_FILES = COPYING
 XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_VIEWRES_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index 8cba79d..5fc74ba 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -11,4 +11,7 @@ XAPP_X11PERF_LICENSE = MIT
 XAPP_X11PERF_LICENSE_FILES = COPYING
 XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
 
+# Fixup incorrect paths
+XAPP_X11PERF_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index a2307f2..f9afce4 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -11,4 +11,7 @@ XAPP_XAUTH_LICENSE = MIT
 XAPP_XAUTH_LICENSE_FILES = COPYING
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XAUTH_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 88c4bc5..ef413c8 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -11,4 +11,7 @@ XAPP_XBACKLIGHT_LICENSE = MIT
 XAPP_XBACKLIGHT_LICENSE_FILES = COPYING
 XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender xcb-util
 
+# Fixup incorrect paths
+XAPP_XBACKLIGHT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 73e0350..d489c5f 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -11,4 +11,7 @@ XAPP_XBIFF_LICENSE = MIT
 XAPP_XBIFF_LICENSE_FILES = COPYING
 XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
+# Fixup incorrect paths
+XAPP_XBIFF_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index 58fbdf5..d1ed42d 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -12,4 +12,7 @@ XAPP_XCALC_LICENSE_FILES = COPYING
 XAPP_XCALC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec install-data
 XAPP_XCALC_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_XCALC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index 3620f75..0fefbcb 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -11,4 +11,7 @@ XAPP_XCLIPBOARD_LICENSE = MIT
 XAPP_XCLIPBOARD_LICENSE_FILES = COPYING
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw xlib_libXmu xlib_libXt
 
+# Fixup incorrect paths
+XAPP_XCLIPBOARD_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 282d753..c231e42 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -11,4 +11,7 @@ XAPP_XCLOCK_LICENSE = MIT
 XAPP_XCLOCK_LICENSE_FILES = COPYING
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
 
+# Fixup incorrect paths
+XAPP_XCLOCK_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index 3cccacc..c8cc5c5 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -11,4 +11,7 @@ XAPP_XCMSDB_LICENSE = MIT
 XAPP_XCMSDB_LICENSE_FILES = COPYING
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
 
+# Fixup incorrect paths
+XAPP_XCMSDB_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
index 918c1e5..0b894f2 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
@@ -16,4 +16,7 @@ XAPP_XCOMPMGR_DEPENDENCIES = \
 	xlib_libXfixes \
 	xlib_libXrender
 
+# Fixup incorrect paths
+XAPP_XCOMPMGR_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index 971b1b3..8c9532e 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -13,4 +13,7 @@ XAPP_XCONSOLE_DEPENDENCIES = \
 	xlib_libX11 xlib_libXaw xlib_libXt xproto_xproto \
 	xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XCONSOLE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index f9ca39d..410e708 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -11,5 +11,8 @@ XAPP_XCURSORGEN_LICENSE = MIT
 XAPP_XCURSORGEN_LICENSE_FILES = COPYING
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
 
+# Fixup incorrect paths
+XAPP_XCURSORGEN_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index 72d04f8..e570454 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -11,4 +11,7 @@ XAPP_XDBEDIZZY_LICENSE = MIT
 XAPP_XDBEDIZZY_LICENSE_FILES = COPYING
 XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext
 
+# Fixup incorrect paths
+XAPP_XDBEDIZZY_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 4744c1f..253893e 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -11,4 +11,7 @@ XAPP_XDITVIEW_LICENSE = MIT
 XAPP_XDITVIEW_LICENSE_FILES = COPYING
 XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_XDITVIEW_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 8f846a8..fb26446 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -20,4 +20,7 @@ define XAPP_XDM_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S99xdm
 endef
 
+# Fixup incorrect paths
+XAPP_XDM_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index cf94f70..c63a2a1 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -34,4 +34,7 @@ else
 XAPP_XDPYINFO_CONF_OPTS += --without-xinerama
 endif
 
+# Fixup incorrect paths
+XAPP_XDPYINFO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index bb00d3b..834bb14 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -11,4 +11,7 @@ XAPP_XDRIINFO_LICENSE = MIT
 XAPP_XDRIINFO_LICENSE_FILES = COPYING
 XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
 
+# Fixup incorrect paths
+XAPP_XDRIINFO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 0f42e2c..815dfbd 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -13,4 +13,7 @@ XAPP_XEDIT_DEPENDENCIES = xlib_libXaw
 
 XAPP_XEDIT_CONF_OPTS = --disable-selective-werror
 
+# Fixup incorrect paths
+XAPP_XEDIT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 2a798db..8e6a541 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -11,4 +11,7 @@ XAPP_XEV_LICENSE = MIT
 XAPP_XEV_LICENSE_FILES = COPYING
 XAPP_XEV_DEPENDENCIES = xlib_libX11 xlib_libXrandr
 
+# Fixup incorrect paths
+XAPP_XEV_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 07c1200..4f36b5e 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -11,4 +11,7 @@ XAPP_XEYES_LICENSE = MIT
 XAPP_XEYES_LICENSE_FILES = COPYING
 XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXrender xlib_libXt
 
+# Fixup incorrect paths
+XAPP_XEYES_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index fe8e427..1ff24ea 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -14,4 +14,7 @@ XAPP_XF86DGA_DEPENDENCIES = \
 	xlib_libX11 \
 	xlib_libXxf86dga
 
+# Fixup incorrect paths
+XAPP_XF86DGA_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index e3c770b..4422dde 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -11,4 +11,7 @@ XAPP_XFD_LICENSE = MIT
 XAPP_XFD_LICENSE_FILES = COPYING
 XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
 
+# Fixup incorrect paths
+XAPP_XFD_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
index 7662a90..4423ede 100644
--- a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
+++ b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
@@ -15,4 +15,7 @@ XAPP_XFINDPROXY_DEPENDENCIES = \
 	xproto_xproto \
 	xproto_xproxymanagementprotocol
 
+# Fixup incorrect paths
+XAPP_XFINDPROXY_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 781b4d3..c62c96f 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -11,4 +11,7 @@ XAPP_XFONTSEL_LICENSE = MIT
 XAPP_XFONTSEL_LICENSE_FILES = COPYING
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_XFONTSEL_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 3e70455..4209338 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -11,4 +11,7 @@ XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
 
+# Fixup incorrect paths
+XAPP_XFS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index 38d01e4..fa11759 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -11,4 +11,7 @@ XAPP_XFSINFO_LICENSE = MIT
 XAPP_XFSINFO_LICENSE_FILES = COPYING
 XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
 
+# Fixup incorrect paths
+XAPP_XFSINFO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index a73a29e..9c7049f 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -11,4 +11,7 @@ XAPP_XGAMMA_LICENSE = MIT
 XAPP_XGAMMA_LICENSE_FILES = COPYING
 XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
 
+# Fixup incorrect paths
+XAPP_XGAMMA_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 41d42c4..ec9e75e 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -11,4 +11,7 @@ XAPP_XGC_LICENSE = MIT
 XAPP_XGC_LICENSE_FILES = COPYING
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_XGC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index a4bb16b..6328346 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -11,4 +11,7 @@ XAPP_XHOST_LICENSE = MIT
 XAPP_XHOST_LICENSE_FILES = COPYING
 XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XHOST_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index a67ba14..dd31bd2 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -11,4 +11,7 @@ XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
 XAPP_XINIT_LICENSE = MIT
 XAPP_XINIT_LICENSE_FILES = COPYING
 
+# Fixup incorrect paths
+XAPP_XINIT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
index 974b83d..928ab5f 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
@@ -11,4 +11,7 @@ XAPP_XINPUT_CALIBRATOR_LICENSE = MIT
 XAPP_XINPUT_CALIBRATOR_LICENSE_FILES = COPYING
 XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
 
+# Fixup incorrect paths
+XAPP_XINPUT_CALIBRATOR_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index aaa7a80..9c45f3b 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -11,4 +11,7 @@ XAPP_XINPUT_LICENSE = MIT
 XAPP_XINPUT_LICENSE_FILES = COPYING
 XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi xlib_libXrandr xlib_libXinerama
 
+# Fixup incorrect paths
+XAPP_XINPUT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index fea7fa8..17413d1 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -12,5 +12,8 @@ XAPP_XKBCOMP_LICENSE_FILES = COPYING
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 XAPP_XKBCOMP_CONF_ENV = ac_cv_file___xkbparse_c=yes
 
+# Fixup incorrect paths
+XAPP_XKBCOMP_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 7a9a8fb..a86f580 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -11,4 +11,7 @@ XAPP_XKBEVD_LICENSE = MIT
 XAPP_XKBEVD_LICENSE_FILES = COPYING
 XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
 
+# Fixup incorrect paths
+XAPP_XKBEVD_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index 5f2300f..1157610 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -11,4 +11,7 @@ XAPP_XKBPRINT_LICENSE = MIT
 XAPP_XKBPRINT_LICENSE_FILES = COPYING
 XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
 
+# Fixup incorrect paths
+XAPP_XKBPRINT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 96ca8a4..ff8949b 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -11,4 +11,7 @@ XAPP_XKBUTILS_LICENSE = MIT
 XAPP_XKBUTILS_LICENSE_FILES = COPYING
 XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
 
+# Fixup incorrect paths
+XAPP_XKBUTILS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 76af1b9..ce599f5 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -11,4 +11,7 @@ XAPP_XKILL_LICENSE = MIT
 XAPP_XKILL_LICENSE_FILES = COPYING
 XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XKILL_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index 1db0db5..f693d3c 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -11,4 +11,7 @@ XAPP_XLOAD_LICENSE = MIT
 XAPP_XLOAD_LICENSE_FILES = COPYING
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_XLOAD_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index 380acfc..1757ed0 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -13,4 +13,7 @@ XAPP_XLOGO_DEPENDENCIES = \
 	xlib_libXaw xlib_libXrender \
 	xlib_libXft host-pkgconf
 
+# Fixup incorrect paths
+XAPP_XLOGO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index d6d9338..1b34fa9 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -11,4 +11,7 @@ XAPP_XLSATOMS_LICENSE = MIT
 XAPP_XLSATOMS_LICENSE_FILES = COPYING
 XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XLSATOMS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index 798dce0..b247afc 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -11,4 +11,7 @@ XAPP_XLSCLIENTS_LICENSE = MIT
 XAPP_XLSCLIENTS_LICENSE_FILES = COPYING
 XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu libxcb xcb-util
 
+# Fixup incorrect paths
+XAPP_XLSCLIENTS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 1c42a61..bb974a7 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -11,4 +11,7 @@ XAPP_XLSFONTS_LICENSE = MIT
 XAPP_XLSFONTS_LICENSE_FILES = COPYING
 XAPP_XLSFONTS_DEPENDENCIES = xlib_libX11
 
+# Fixup incorrect paths
+XAPP_XLSFONTS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index bfc60c3..039f7f0 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -11,4 +11,7 @@ XAPP_XMAG_LICENSE = MIT
 XAPP_XMAG_LICENSE_FILES = COPYING
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_XMAG_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index bca6bbf..fdb5329 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -17,4 +17,7 @@ XAPP_XMAN_CONF_ENV = \
 	ac_cv_file__etc_manpath_config=no \
 	ac_cv_file__usr_share_misc_man_conf=no
 
+# Fixup incorrect paths
+XAPP_XMAN_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 9c85563..05a764f 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -11,4 +11,7 @@ XAPP_XMESSAGE_LICENSE = MIT
 XAPP_XMESSAGE_LICENSE_FILES = COPYING
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_XMESSAGE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index c18bbfe..390ec81 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -11,4 +11,7 @@ XAPP_XMH_LICENSE = MIT
 XAPP_XMH_LICENSE_FILES = COPYING
 XAPP_XMH_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
+# Fixup incorrect paths
+XAPP_XMH_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index 670bf9f..a96342d 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -11,4 +11,7 @@ XAPP_XMODMAP_LICENSE = MIT
 XAPP_XMODMAP_LICENSE_FILES = COPYING
 XAPP_XMODMAP_DEPENDENCIES = xlib_libX11
 
+# Fixup incorrect paths
+XAPP_XMODMAP_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index b0b0edf..a5074cc 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -11,4 +11,7 @@ XAPP_XMORE_LICENSE = MIT
 XAPP_XMORE_LICENSE_FILES = COPYING
 XAPP_XMORE_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_XMORE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index b2c4e04..a7e66b2 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -11,4 +11,7 @@ XAPP_XPR_LICENSE = MIT
 XAPP_XPR_LICENSE_FILES = COPYING
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XPR_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 40a8577..5a8c86c 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -11,4 +11,7 @@ XAPP_XPROP_LICENSE = MIT
 XAPP_XPROP_LICENSE_FILES = COPYING
 XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XPROP_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index d2e4cf3..bfcc5ae 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -12,4 +12,7 @@ XAPP_XRANDR_LICENSE_FILES = COPYING
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
 XAPP_XRANDR_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XAPP_XRANDR_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index f32afa4..1acee9b 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -11,4 +11,7 @@ XAPP_XRDB_LICENSE = MIT
 XAPP_XRDB_LICENSE_FILES = COPYING
 XAPP_XRDB_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XRDB_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 8403762..1dd7353 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -11,4 +11,7 @@ XAPP_XREFRESH_LICENSE = MIT
 XAPP_XREFRESH_LICENSE_FILES = COPYING
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
 
+# Fixup incorrect paths
+XAPP_XREFRESH_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 157cd22..21f2c41 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -11,4 +11,7 @@ XAPP_XSET_LICENSE = MIT
 XAPP_XSET_LICENSE_FILES = COPYING
 XAPP_XSET_DEPENDENCIES = xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XSET_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
index c4599a9..e511760 100644
--- a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
+++ b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
@@ -11,4 +11,7 @@ XAPP_XSETMODE_LICENSE = MIT
 XAPP_XSETMODE_LICENSE_FILES = COPYING
 XAPP_XSETMODE_DEPENDENCIES = xlib_libX11 xlib_libXi
 
+# Fixup incorrect paths
+XAPP_XSETMODE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
index f56cdd5..607d35d 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -11,4 +11,7 @@ XAPP_XSETPOINTER_LICENSE = MIT
 XAPP_XSETPOINTER_LICENSE_FILES = COPYING
 XAPP_XSETPOINTER_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXi
 
+# Fixup incorrect paths
+XAPP_XSETPOINTER_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 9000867..6caca45 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -11,4 +11,7 @@ XAPP_XSETROOT_LICENSE = MIT
 XAPP_XSETROOT_LICENSE_FILES = COPYING
 XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXcursor xdata_xbitmaps
 
+# Fixup incorrect paths
+XAPP_XSETROOT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index d4d2407..54ade50 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -11,4 +11,7 @@ XAPP_XSM_LICENSE = MIT
 XAPP_XSM_LICENSE_FILES = COPYING
 XAPP_XSM_DEPENDENCIES = xlib_libXaw
 
+# Fixup incorrect paths
+XAPP_XSM_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index a4d6dc3..37101a2 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -11,4 +11,7 @@ XAPP_XSTDCMAP_LICENSE = MIT
 XAPP_XSTDCMAP_LICENSE_FILES = COPYING
 XAPP_XSTDCMAP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XSTDCMAP_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index d7c4d5b..aa26164 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -11,4 +11,7 @@ XAPP_XVIDTUNE_LICENSE = MIT
 XAPP_XVIDTUNE_LICENSE_FILES = COPYING
 XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
 
+# Fixup incorrect paths
+XAPP_XVIDTUNE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 5b05a63..9a54dd8 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -11,4 +11,7 @@ XAPP_XVINFO_LICENSE = MIT
 XAPP_XVINFO_LICENSE_FILES = COPYING
 XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
 
+# Fixup incorrect paths
+XAPP_XVINFO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 0cda34e..e16fc17 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -11,4 +11,7 @@ XAPP_XWD_LICENSE = MIT
 XAPP_XWD_LICENSE_FILES = COPYING
 XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libxkbfile
 
+# Fixup incorrect paths
+XAPP_XWD_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index 8ae5961..2828738 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -11,4 +11,7 @@ XAPP_XWININFO_LICENSE = MIT
 XAPP_XWININFO_LICENSE_FILES = COPYING
 XAPP_XWININFO_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
+# Fixup incorrect paths
+XAPP_XWININFO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 60afd86..e23f7bd 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -11,4 +11,7 @@ XAPP_XWUD_LICENSE = MIT
 XAPP_XWUD_LICENSE_FILES = COPYING
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
 
+# Fixup incorrect paths
+XAPP_XWUD_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 931573a..e26631a 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -24,5 +24,8 @@ endef
 
 XCB_PROTO_POST_INSTALL_STAGING_HOOKS += XCB_PROTO_FIXUP_PC_FILE
 
+# Fixup incorrect paths
+XCB_PROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
index 65704a1..4f66ae8 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
@@ -12,4 +12,7 @@ XCB_UTIL_CURSOR_LICENSE_FILES = COPYING
 XCB_UTIL_CURSOR_INSTALL_STAGING = YES
 XCB_UTIL_CURSOR_DEPENDENCIES = xcb-util xcb-util-image xcb-util-renderutil
 
+# Fixup incorrect paths
+XCB_UTIL_CURSOR_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
index 705b8a7..61c4b58 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.mk
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -11,4 +11,7 @@ XCB_UTIL_IMAGE_INSTALL_STAGING = YES
 XCB_UTIL_IMAGE_LICENSE = MIT
 XCB_UTIL_IMAGE_DEPENDENCIES = xcb-util
 
+# Fixup incorrect paths
+XCB_UTIL_IMAGE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 9036b06..9c9ccac 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -15,4 +15,7 @@ XCB_UTIL_KEYSYMS_INSTALL_STAGING = YES
 
 XCB_UTIL_KEYSYMS_DEPENDENCIES = host-pkgconf libxcb
 
+# Fixup incorrect paths
+XCB_UTIL_KEYSYMS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
index 9e6683b..cc2f03f 100644
--- a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
+++ b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
@@ -12,4 +12,7 @@ XCB_UTIL_RENDERUTIL_LICENSE_FILES = COPYING
 XCB_UTIL_RENDERUTIL_INSTALL_STAGING = YES
 XCB_UTIL_RENDERUTIL_DEPENDENCIES = xcb-util
 
+# Fixup incorrect paths
+XCB_UTIL_RENDERUTIL_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.mk b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
index 95aeb22..9754cde 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.mk
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
@@ -11,4 +11,7 @@ XCB_UTIL_WM_INSTALL_STAGING = YES
 XCB_UTIL_WM_LICENSE = MIT
 XCB_UTIL_WM_DEPENDENCIES = libxcb
 
+# Fixup incorrect paths
+XCB_UTIL_WM_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index 4416d80..548e7e6 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -14,4 +14,7 @@ XCB_UTIL_LICENSE = MIT
 XCB_UTIL_INSTALL_STAGING = YES
 XCB_UTIL_DEPENDENCIES = host-gperf libxcb
 
+# Fixup incorrect paths
+XCB_UTIL_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index 5c6f2d2..4eb1753 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -17,4 +17,7 @@ endef
 
 XCURSOR_TRANSPARENT_THEME_POST_INSTALL_TARGET_HOOKS += ICONS_DEFAULT_CONFIG_INSTALL
 
+# Fixup incorrect paths
+XCURSOR_TRANSPARENT_THEME_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index 9767f2c..6a6ff58 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -12,4 +12,7 @@ XDATA_XBITMAPS_LICENSE_FILES = COPYING
 
 XDATA_XBITMAPS_INSTALL_STAGING = YES
 
+# Fixup incorrect paths
+XDATA_XBITMAPS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index a2987a0..f32109f 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -13,4 +13,7 @@ XDATA_XCURSOR_THEMES_LICENSE_FILES = COPYING
 XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
 XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 
+# Fixup incorrect paths
+XDATA_XCURSOR_THEMES_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 4a2ed36..15edbba 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -19,4 +19,7 @@ XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = \
 	xproto_xproto \
 	udev
 
+# Fixup incorrect paths
+XDRIVER_XF86_INPUT_EVDEV_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index c63312d..4b8d48a 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_INPUT_JOYSTICK_LICENSE = MIT
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_INPUT_JOYSTICK_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index eb2d582..18e9083 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -12,4 +12,7 @@ XDRIVER_XF86_INPUT_KEYBOARD_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
 XDRIVER_XF86_INPUT_KEYBOARD_CONF_OPTS = --disable-selective-werror
 
+# Fixup incorrect paths
+XDRIVER_XF86_INPUT_KEYBOARD_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 9e48886..464e69c 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_LIBINPUT_DEPENDENCIES = libinput xserver_xorg-server xproto_inputproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_INPUT_LIBINPUT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 0e19467..2cd1e94 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_MOUSE_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_INPUT_MOUSE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index b6ade4c..3163a1a 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = libevdev xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto mtdev
 
+# Fixup incorrect paths
+XDRIVER_XF86_INPUT_SYNAPTICS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index cd8c10a..12abca9 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -16,4 +16,7 @@ XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = \
 	xproto_xproto \
 	tslib
 
+# Fixup incorrect paths
+XDRIVER_XF86_INPUT_TSLIB_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index 6e9cf8b..8beed11 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -18,4 +18,7 @@ else
 XDRIVER_XF86_INPUT_VMMOUSE_CONF_OPTS += --without-libudev
 endif
 
+# Fixup incorrect paths
+XDRIVER_XF86_INPUT_VMMOUSE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index 5baa528..7038f62 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_INPUT_VOID_LICENSE = MIT
 XDRIVER_XF86_INPUT_VOID_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_INPUT_VOID_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index c0b905b..cdd1829 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_ARK_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ARK_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_ARK_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index d040ccd..fa21191 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_AST_LICENSE = MIT
 XDRIVER_XF86_VIDEO_AST_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_AST_DEPENDENCIES = xproto_fontsproto xproto_xproto xserver_xorg-server
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_AST_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 3dd3d07..5ab0b90 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -31,4 +31,7 @@ endif
 # xdriver_xf86-video-ati requires O_CLOEXEC
 XDRIVER_XF86_VIDEO_ATI_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_ATI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index 78e8a9c..d22dc1d 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_CIRRUS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_CIRRUS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 58d9925..b844dc7 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_DUMMY_LICENSE = MIT
 XDRIVER_XF86_VIDEO_DUMMY_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_DUMMY_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index 7d08c7d..7163a89 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_FBDEV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_FBDEV_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_FBDEV_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
index b2053d3..2ed618a 100644
--- a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
@@ -32,4 +32,7 @@ endef
 
 XDRIVER_XF86_VIDEO_FBTURBO_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_FBTURBO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index b882f1f..fb771af 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_GEODE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_GEODE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index 3518789..6e308fa 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_GLIDE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_GLIDE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_GLIDE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index 76c3da1..6aab645 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -12,4 +12,7 @@ XDRIVER_XF86_VIDEO_GLINT_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_GLINT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index 1bb760c..9df956a 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_I128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_I128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_I128_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
index 5684a6d..5b9279f 100644
--- a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
@@ -12,4 +12,7 @@ XDRIVER_XF86_VIDEO_IMX_DEPENDENCIES = linux libz160 xserver_xorg-server \
 	xproto_xf86dgaproto xproto_xproto
 XDRIVER_XF86_VIDEO_IMX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_IMX_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index bf4f7a6..fdb5019 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -48,4 +48,7 @@ else
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += --disable-dri
 endif
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 9b438cb..00f40a8 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -12,4 +12,7 @@ XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index dcf751c..dd9fcfe 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -12,4 +12,7 @@ XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_MGA_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index cfd5536..7be982b 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_NEOMAGIC_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NEOMAGIC_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_NEOMAGIC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 655bee9..1fa7ee8 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NV_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_NV_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 345beb1..0b47446 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -24,4 +24,7 @@ XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
 	xproto_xf86driproto \
 	xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_OPENCHROME_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
index ddc4191..c8972dc 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
@@ -29,4 +29,7 @@ else
 XDRIVER_XF86_VIDEO_QXL_CONF_OPTS += --disable-kms
 endif
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_QXL_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index f9fcfdb..5d9d66e 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -12,4 +12,7 @@ XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_R128_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index dc5644a..5a9f208 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -12,4 +12,7 @@ XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index f8ea403..f94d82d 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -13,4 +13,7 @@ XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fonts
 
 XDRIVER_XF86_VIDEO_SILICONMOTION_CONF_OPTS = --disable-selective-werror
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_SILICONMOTION_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index b1fce83..5020c5c 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -12,4 +12,7 @@ XDRIVER_XF86_VIDEO_SIS_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_SIS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 4d0ba60..d2c01c9 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -12,4 +12,7 @@ XDRIVER_XF86_VIDEO_TDFX_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_TDFX_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index 8af5ac8..084b457 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_TGA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_TGA_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_TGA_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index a136e87..57a7241 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_TRIDENT_LICENSE = MIT
 XDRIVER_XF86_VIDEO_TRIDENT_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_TRIDENT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
index 607b605..e312a20 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
+++ b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_V4L_LICENSE = MIT
 XDRIVER_XF86_VIDEO_V4L_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_V4L_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_videoproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_V4L_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index 1184821..006a040 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_VESA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VESA_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_VESA_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index ea4dd48..b45767a 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_VMWARE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = mesa3d xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_VMWARE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index e1ef0c6..0d62474 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_VOODOO_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_VOODOO_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_VOODOO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index c2d7d4d..773725f 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -11,4 +11,7 @@ XDRIVER_XF86_VIDEO_WSFB_LICENSE = MIT
 XDRIVER_XF86_VIDEO_WSFB_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
+# Fixup incorrect paths
+XDRIVER_XF86_VIDEO_WSFB_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 568dbcb..42b8c06 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -12,5 +12,8 @@ XFONT_ENCODINGS_LICENSE_FILES = COPYING
 
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale host-pkgconf xutil_util-macros
 
+# Fixup incorrect paths
+XFONT_ENCODINGS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 85a6884..724713d 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_ADOBE_100DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index bb0a184..5808ab5 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE
 XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_ADOBE_75DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 390ca67..3906184 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKF
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_ADOBE_UTOPIA_100DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index 7ecd46e..604a974 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFO
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_ADOBE_UTOPIA_75DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 6c780e2..383216b 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -14,4 +14,7 @@ XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFO
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index e2ac236..f1a57e2 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -14,4 +14,7 @@ XFONT_FONT_ALIAS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOS
 XFONT_FONT_ALIAS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_ALIAS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index fa1269b..862ac50 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE
 XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_ARABIC_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index fb16658..5da8797 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$
 XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_BH_100DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index c8ade59..dc09688 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_BH_75DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index a1b61db..c1c0380 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_D
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 00a6bd6..48ce8b3 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DI
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index f393dd3..98920f1 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -14,4 +14,7 @@ XFONT_FONT_BH_TTF_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HO
 XFONT_FONT_BH_TTF_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_BH_TTF_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index bf418d5..4cb9a0a 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -14,4 +14,7 @@ XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_BH_TYPE1_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index 5ddca73..267999d 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONT
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_BITSTREAM_100DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index d7fea27..780559a 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -14,4 +14,7 @@ XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_BITSTREAM_75DPI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 813e3cb..d66b7d2 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -14,4 +14,7 @@ XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_BITSTREAM_TYPE1_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 6dc9015..c1f3f61 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -14,4 +14,7 @@ XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_CRONYX_CYRILLIC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 59d6a84..bdf1f78 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE
 XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_CURSOR_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index 59a84c7..92351e1 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -13,4 +13,7 @@ XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE
 XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_DAEWOO_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index b26296d..be5b14b 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_DEC_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 6cec198..94fb5ba 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -14,4 +14,7 @@ XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$
 XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_IBM_TYPE1_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 4ac4b9b..c48f466 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$
 XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_ISAS_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 5f8b001..b7e5175 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -13,4 +13,7 @@ XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_JIS_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 11b4199..2716813 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_MICRO_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 16fd46b..e706d94 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -14,4 +14,7 @@ XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCA
 XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_MISC_CYRILLIC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 7d0825e..68a7d62 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -14,4 +14,7 @@ XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCA
 XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_MISC_ETHIOPIC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index 5667869..de98d4d 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -14,4 +14,7 @@ XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE
 XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_MISC_MELTHO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index 700837c..2d492b0 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_MISC_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 53fc192..461c45c 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$
 XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_MUTT_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 0fa4d39..beca9b5 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_SCHUMACHER_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 8158ce5..8b32257 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -14,4 +14,7 @@ XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_SCREEN_CYRILLIC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 035255f..ed3d788 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$
 XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_SONY_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 395cb87..e5b837a 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -14,4 +14,7 @@ XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_SUN_MISC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 1c43d6a..8e0c1aa 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -14,5 +14,8 @@ XFONT_FONT_UTIL_DEPENDENCIES = host-pkgconf
 XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XFONT_FONT_UTIL_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 665fb90..0786fd0 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -14,4 +14,7 @@ XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFON
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_WINITZKI_CYRILLIC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index e1a2ef6..9bf649b 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -14,4 +14,7 @@ XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCA
 XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+# Fixup incorrect paths
+XFONT_FONT_XFREE86_TYPE1_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 352c55d..4eb1a2c 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -13,4 +13,7 @@ XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 XKEYBOARD_CONFIG_CONF_OPTS = --disable-runtime-deps
 XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
 
+# Fixup incorrect paths
+XKEYBOARD_CONFIG_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index a3c58b9..db2c2e2 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -13,4 +13,7 @@ XLIB_LIBFS_INSTALL_STAGING = YES
 XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto host-pkgconf
 XLIB_LIBFS_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBFS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index e2a4e7d..d766a7e 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -12,4 +12,7 @@ XLIB_LIBICE_LICENSE_FILES = COPYING
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto host-pkgconf
 
+# Fixup incorrect paths
+XLIB_LIBICE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 30640bd..4551318 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -13,4 +13,7 @@ XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPTS = --without-libuuid
 
+# Fixup incorrect paths
+XLIB_LIBSM_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index fc19aa1..be65e1b 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -45,5 +45,8 @@ endef
 XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 HOST_XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 
+# Fixup incorrect paths
+XLIB_LIBX11_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index f22ee98..3711c86 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -13,4 +13,7 @@ XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
 XLIB_LIBXSCRNSAVER_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXSCRNSAVER_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 8ef48e4..1e9bbcc 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -12,5 +12,8 @@ XLIB_LIBXAU_LICENSE_FILES = COPYING
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = host-pkgconf xutil_util-macros xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXAU_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index d78adff..a182c5c 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -12,4 +12,7 @@ XLIB_LIBXAW_LICENSE_FILES = COPYING
 XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXAW_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index f0e59cb..771b0a6 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -12,4 +12,7 @@ XLIB_LIBXCOMPOSITE_LICENSE_FILES = COPYING
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
 XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXCOMPOSITE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 508b5e2..d940ed1 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -12,5 +12,8 @@ XLIB_LIBXCURSOR_LICENSE_FILES = COPYING
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXCURSOR_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 9f982ee..dc78ff5 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -12,4 +12,7 @@ XLIB_LIBXDAMAGE_LICENSE_FILES = COPYING
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
 XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXDAMAGE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 119c018..3552a18 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -12,5 +12,8 @@ XLIB_LIBXDMCP_LICENSE_FILES = COPYING
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXDMCP_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 211c853..16b3aa4 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -13,4 +13,7 @@ XLIB_LIBXEXT_INSTALL_STAGING = YES
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
 XLIB_LIBXEXT_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXEXT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index b94cd0f..2b2c3eb 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -12,5 +12,8 @@ XLIB_LIBXFIXES_LICENSE_FILES = COPYING
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXFIXES_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index adc22b4..974a417 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -26,5 +26,8 @@ ifeq ($(BR2_microblaze),y)
 XLIB_LIBXFONT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D__ELF__"
 endif
 
+# Fixup incorrect paths
+XLIB_LIBXFONT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index de9b470..a7f0126 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -13,4 +13,7 @@ XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXFT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 54c9af4..a5807ac 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -20,4 +20,7 @@ XLIB_LIBXI_DEPENDENCIES = \
 
 XLIB_LIBXI_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXI_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index ee8bf55..d512c7b 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -13,4 +13,7 @@ XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
 XLIB_LIBXINERAMA_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXINERAMA_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index 261f871..0930aeb 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -12,4 +12,7 @@ XLIB_LIBXMU_LICENSE_FILES = COPYING
 XLIB_LIBXMU_INSTALL_STAGING = YES
 XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXMU_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 997ef95..5472a01 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -17,4 +17,7 @@ XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	host-gettext
 
+# Fixup incorrect paths
+XLIB_LIBXPM_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 5abd8b1..5ca6763 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -13,4 +13,7 @@ XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
 XLIB_LIBXRANDR_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXRANDR_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 949dea3..ae869ea 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -13,5 +13,8 @@ XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXRENDER_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 853f542..2e761cb 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -13,4 +13,7 @@ XLIB_LIBXRES_INSTALL_STAGING = YES
 XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
 XLIB_LIBXRES_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXRES_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 4715ac6..35bc1ef 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -14,4 +14,7 @@ XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xc
 XLIB_LIBXT_CONF_OPTS = --disable-malloc0returnsnull --disable-install-makestrs
 XLIB_LIBXT_AUTORECONF = YES
 
+# Fixup incorrect paths
+XLIB_LIBXT_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index ad3caea..e66a771 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -17,4 +17,7 @@ XLIB_LIBXTST_DEPENDENCIES = \
 	xlib_libXi \
 	xproto_recordproto
 
+# Fixup incorrect paths
+XLIB_LIBXTST_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index ef5c746..4999d08 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -13,4 +13,7 @@ XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
 XLIB_LIBXV_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXV_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 101c15d..3c6adee 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -13,4 +13,7 @@ XLIB_LIBXVMC_INSTALL_STAGING = YES
 XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
 XLIB_LIBXVMC_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXVMC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index eea756b..2774b6b 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -13,4 +13,7 @@ XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
 XLIB_LIBXXF86DGA_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXXF86DGA_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index f650fe4..0a7de2a 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -13,4 +13,7 @@ XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
 XLIB_LIBXXF86VM_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBXXF86VM_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index fbe3067..ae27129 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -13,4 +13,7 @@ XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
 XLIB_LIBDMX_CONF_OPTS = --disable-malloc0returnsnull
 
+# Fixup incorrect paths
+XLIB_LIBDMX_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index aff1f1a..f80273d 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -12,5 +12,8 @@ XLIB_LIBFONTENC_LICENSE_FILES = COPYING
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBFONTENC_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 51c58c0..50cc4eb 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -12,5 +12,8 @@ XLIB_LIBXKBFILE_LICENSE_FILES = COPYING
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
 
+# Fixup incorrect paths
+XLIB_LIBXKBFILE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index 3a2f326..2144103 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -12,4 +12,7 @@ XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
 XLIB_LIBXSHMFENCE_INSTALL_STAGING = YES
 XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xproto_xproto
 
+# Fixup incorrect paths
+XLIB_LIBXSHMFENCE_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 40f613c..667286d 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -11,5 +11,8 @@ XLIB_XTRANS_LICENSE = MIT
 XLIB_XTRANS_LICENSE_FILES = COPYING
 XLIB_XTRANS_INSTALL_STAGING = YES
 
+# Fixup incorrect paths
+XLIB_XTRANS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
index 998d0aa..47c5bf2 100644
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
@@ -12,4 +12,7 @@ XPROTO_APPLEWMPROTO_LICENSE_FILES = COPYING
 XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
 XPROTO_APPLEWMPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_APPLEWMPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index bca5a3c..98ec670 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -12,4 +12,7 @@ XPROTO_BIGREQSPROTO_LICENSE_FILES = COPYING
 XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
 XPROTO_BIGREQSPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_BIGREQSPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index 2161358..37f6c1c 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -12,4 +12,7 @@ XPROTO_COMPOSITEPROTO_LICENSE_FILES = COPYING
 XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
 XPROTO_COMPOSITEPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_COMPOSITEPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index 0311ea4..4644865 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -12,4 +12,7 @@ XPROTO_DAMAGEPROTO_LICENSE_FILES = COPYING
 XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES
 XPROTO_DAMAGEPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_DAMAGEPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index 4cc795c..97b3119 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -12,4 +12,7 @@ XPROTO_DMXPROTO_LICENSE_FILES = COPYING
 XPROTO_DMXPROTO_INSTALL_STAGING = YES
 XPROTO_DMXPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_DMXPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index e4ed7d8..435a572 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -12,4 +12,7 @@ XPROTO_DRI2PROTO_LICENSE_FILES = COPYING
 XPROTO_DRI2PROTO_INSTALL_STAGING = YES
 XPROTO_DRI2PROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_DRI2PROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk b/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
index bdbff74..4c986a4 100644
--- a/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
+++ b/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
@@ -12,4 +12,7 @@ XPROTO_DRI3PROTO_INSTALL_STAGING = YES
 # this package does not contain any binary files
 XPROTO_DRI3PROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_DRI3PROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index 55212b2..36c86e0 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -12,5 +12,8 @@ XPROTO_FIXESPROTO_LICENSE_FILES = COPYING
 XPROTO_FIXESPROTO_INSTALL_STAGING = YES
 XPROTO_FIXESPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_FIXESPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 0cb205a..c700930 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -12,5 +12,8 @@ XPROTO_FONTCACHEPROTO_LICENSE_FILES = COPYING
 XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
 XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_FONTCACHEPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index b4e6d6a..df32431 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -12,5 +12,8 @@ XPROTO_FONTSPROTO_LICENSE_FILES = COPYING
 XPROTO_FONTSPROTO_INSTALL_STAGING = YES
 XPROTO_FONTSPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_FONTSPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index ccfc6de..4820134 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -12,4 +12,7 @@ XPROTO_GLPROTO_LICENSE_FILES = COPYING
 XPROTO_GLPROTO_INSTALL_STAGING = YES
 XPROTO_GLPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_GLPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index a3a6065..54ae4ab 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -12,5 +12,8 @@ XPROTO_INPUTPROTO_LICENSE_FILES = COPYING
 XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_INPUTPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index b6c818f..8780c26 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -12,5 +12,8 @@ XPROTO_KBPROTO_LICENSE_FILES = COPYING
 XPROTO_KBPROTO_INSTALL_STAGING = YES
 XPROTO_KBPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_KBPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.mk b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
index 6fea0a2..37b3ee1 100644
--- a/package/x11r7/xproto_presentproto/xproto_presentproto.mk
+++ b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
@@ -13,4 +13,7 @@ XPROTO_PRESENTPROTO_DEPENDENCIES = host-pkgconf xutil_util-macros
 XPROTO_PRESENTPROTO_INSTALL_STAGING = YES
 XPROTO_PRESENTPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_PRESENTPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index f6c4878..c9c1844 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -12,4 +12,7 @@ XPROTO_RANDRPROTO_LICENSE_FILES = COPYING
 XPROTO_RANDRPROTO_INSTALL_STAGING = YES
 XPROTO_RANDRPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_RANDRPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
index 2d2ccea..8bbcff5 100644
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
@@ -12,4 +12,7 @@ XPROTO_RECORDPROTO_LICENSE_FILES = COPYING
 XPROTO_RECORDPROTO_INSTALL_STAGING = YES
 XPROTO_RECORDPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_RECORDPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index 41a8445..de42df5 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -12,5 +12,8 @@ XPROTO_RENDERPROTO_LICENSE_FILES = COPYING
 XPROTO_RENDERPROTO_INSTALL_STAGING = YES
 XPROTO_RENDERPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_RENDERPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index 960ca13..02d8c60 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -12,4 +12,7 @@ XPROTO_RESOURCEPROTO_LICENSE_FILES = COPYING
 XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
 XPROTO_RESOURCEPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_RESOURCEPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index 57047cf..a967da5 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -12,4 +12,7 @@ XPROTO_SCRNSAVERPROTO_LICENSE_FILES = COPYING
 XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
 XPROTO_SCRNSAVERPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_SCRNSAVERPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 9226c73..15f7301 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -12,4 +12,7 @@ XPROTO_VIDEOPROTO_LICENSE_FILES = COPYING
 XPROTO_VIDEOPROTO_INSTALL_STAGING = YES
 XPROTO_VIDEOPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_VIDEOPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
index 067bccf..4d391b0 100644
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
@@ -12,4 +12,7 @@ XPROTO_WINDOWSWMPROTO_LICENSE_FILES = COPYING
 XPROTO_WINDOWSWMPROTO_INSTALL_STAGING = YES
 XPROTO_WINDOWSWMPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_WINDOWSWMPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index 3bef2e9..12b53f7 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -13,5 +13,8 @@ XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
 XPROTO_XCMISCPROTO_CONF_OPTS = --disable-specs
 HOST_XPROTO_XCMISCPROTO_CONF_OPTS = --disable-specs
 
+# Fixup incorrect paths
+XPROTO_XCMISCPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index c17dd93..131f3ff 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -13,5 +13,8 @@ XPROTO_XEXTPROTO_INSTALL_STAGING = YES
 XPROTO_XEXTPROTO_CONF_OPTS = --disable-specs
 HOST_XPROTO_XEXTPROTO_CONF_OPTS = --disable-specs
 
+# Fixup incorrect paths
+XPROTO_XEXTPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index f88f5ec..3922be7 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -12,5 +12,8 @@ XPROTO_XF86BIGFONTPROTO_LICENSE_FILES = COPYING
 XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
 XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_XF86BIGFONTPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
index d671bf0..162904b 100644
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
@@ -12,4 +12,7 @@ XPROTO_XF86DGAPROTO_LICENSE_FILES = COPYING
 XPROTO_XF86DGAPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DGAPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_XF86DGAPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
index e6bb0f1..b0bdbdf 100644
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -12,4 +12,7 @@ XPROTO_XF86DRIPROTO_LICENSE_FILES = COPYING
 XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DRIPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_XF86DRIPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
index 4163798..c52a103 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
@@ -12,4 +12,7 @@ XPROTO_XF86VIDMODEPROTO_LICENSE_FILES = COPYING
 XPROTO_XF86VIDMODEPROTO_INSTALL_STAGING = YES
 XPROTO_XF86VIDMODEPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_XF86VIDMODEPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index 4c9ae11..d73c373 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -12,4 +12,7 @@ XPROTO_XINERAMAPROTO_LICENSE_FILES = COPYING
 XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
 XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_XINERAMAPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index 7357b8c..709c436 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -12,5 +12,8 @@ XPROTO_XPROTO_LICENSE_FILES = COPYING
 XPROTO_XPROTO_INSTALL_STAGING = YES
 XPROTO_XPROTO_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_XPROTO_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk b/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
index a48269a..2a8ed59 100644
--- a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
+++ b/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
@@ -12,4 +12,7 @@ XPROTO_XPROXYMANAGEMENTPROTOCOL_LICENSE_FILES = COPYING
 XPROTO_XPROXYMANAGEMENTPROTOCOL_INSTALL_STAGING = YES
 XPROTO_XPROXYMANAGEMENTPROTOCOL_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XPROTO_XPROXYMANAGEMENTPROTOCOL_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 3f6cda7..a4266c7 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -237,4 +237,7 @@ XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
 XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
+# Fixup incorrect paths
+XSERVER_XORG_SERVER_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 81e348e..555f4ff 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -12,5 +12,8 @@ XUTIL_MAKEDEPEND_LICENSE_FILES = COPYING
 
 XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
 
+# Fixup incorrect paths
+XUTIL_MAKEDEPEND_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/xutil_util-macros/xutil_util-macros.mk b/package/xutil_util-macros/xutil_util-macros.mk
index 1451a06..3244148 100644
--- a/package/xutil_util-macros/xutil_util-macros.mk
+++ b/package/xutil_util-macros/xutil_util-macros.mk
@@ -13,5 +13,8 @@ XUTIL_UTIL_MACROS_LICENSE_FILES = COPYING
 XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
 
+# Fixup incorrect paths
+XUTIL_UTIL_MACROS_CONF_OPTS += $(X11R7_CONF_OPTS)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.9.1
