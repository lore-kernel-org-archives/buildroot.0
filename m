From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 16:16:30 +0200
Subject: [Buildroot] [PATCH v4 00/18] package/x11r7/xserver_xorg-server:
 bump version to 1.20.0
Message-ID: <20180721141648.29939-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

upstream merged all xproto packages in a new package called xorgproto,
for details read the announcement
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

This new package is a prerequisite for bumping xserver_xorg-server to
version 1.20.0 because it depends on randrproto version 1.6.0:
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?id=b91c787c4cd2d20685db69426c539938c556128a

This randrproto version is not part of the standalone package
xproto_randrproto anymore which was deprecated upstream:
https://cgit.freedesktop.org/xorg/proto/randrproto/

Randrproto 1.6.0 is now part of the new xorgproto package:
https://cgit.freedesktop.org/xorg/proto/xorgproto/commit/?id=14f68c7b006dbc11fa2134ccd48a107f97fd8f2a

Patch 1 introduces the new xorgproto package.

Patches 2-13 switch all packages needing xproto stuff to the xorgproto
package. For easier handling these patches can contain mass switching.
We also need to remove optional handling of some of the previous xproto
packages, namely dri2 and dri3. These protocol support files are now
always installed by the xorgproto package.

Patch 14 removes the deprecated xproto packages and introduces legacy
handling. The help texts of the legacy options was created using a
script, sorry for being lazy and not adding package specific texts ;)

Patches 15-17 add patches to three xdriver_xf86-video packages to be
compatible with xserver_xorg-server 1.20.0. Please note that bumping
xdriver_xf86-video-r128 to the newly released version 6.11.0 does not
work due to a broken build. We keep the current patched version until
upstream fixes the bug.

Patch 18 finally bumps xserver_xorg-server to version 1.20.0.

Regards, Bernd

Changelog:
v4: removed some version bumps already committed to buildroot
    addressed all issues found in Yann's review (Yann)
v3: rebased gstreamer1 patch
    bumped xdriver_xf86-input-mouse instead of patching it
v2: added patches 14-22

Bernd Kuhls (18):
  package/x11r7/xorgproto: new package
  package/efl: switch to xorgproto
  package/gstreamer1/gst1-plugins-base: switch to xorgproto
  package/libdri2: switch to xorgproto
  package/libvdpau: switch to xorgproto
  package/mesa3d: switch to xorgproto
  package/x11r7/xapp_*: mass switch to xorgproto
  package/x11r7/xdriver_xf86-input-*: mass switch to xorgproto
  package/x11r7/xdriver_xf86-video-*: mass switch to xorgproto
  package/x11r7/xkeyboard-config: switch to xorgproto
  package/x11r7/xlib_*: mass switch to xorgproto
  package/x11r7/xutil_makedepend: switch to xorgproto
  package/x11r7/xserver_xorg-server: switch to xorgproto
  package/x11r7/xproto_*: mass removal
  package/x11r7/xdriver_xf86-video-r128: add ustream patch to fix
    support for xserver_xorg-server 1.20.0
  package/x11r7/xdriver_xf86-video-savage: add patch to fix support for
    xserver_xorg-server 1.20.0
  package/x11r7/xdriver_xf86-video-sis: add upstream patch to fix
    support for xserver_xorg-server 1.20.0
  package/x11r7/xserver_xorg-server: bump version to 1.20.0

 Config.in.legacy                              | 247 ++++++++++++++++++
 package/efl/Config.in                         |   2 +-
 .../gstreamer1/gst1-plugins-base/Config.in    |   2 +-
 .../gst1-plugins-base/gst1-plugins-base.mk    |   2 +-
 package/libdri2/Config.in                     |   2 +-
 package/libdri2/libdri2.mk                    |   2 +-
 package/libvdpau/libvdpau.mk                  |   4 +-
 package/mesa3d/Config.in                      |  18 +-
 package/mesa3d/mesa3d.mk                      |   8 +-
 package/x11r7/Config.in                       |  31 +--
 package/x11r7/xapp_mkfontscale/Config.in      |   2 +-
 .../xapp_mkfontscale/xapp_mkfontscale.mk      |   4 +-
 package/x11r7/xapp_rgb/Config.in              |   2 +-
 package/x11r7/xapp_rgb/xapp_rgb.mk            |   2 +-
 package/x11r7/xapp_sessreg/Config.in          |   2 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.mk    |   2 +-
 package/x11r7/xapp_xconsole/Config.in         |   2 +-
 package/x11r7/xapp_xconsole/xapp_xconsole.mk  |   2 +-
 package/x11r7/xapp_xdm/Config.in              |   3 +-
 package/x11r7/xapp_xdm/xapp_xdm.mk            |  10 +-
 package/x11r7/xapp_xdriinfo/Config.in         |   2 +-
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk  |   2 +-
 package/x11r7/xapp_xfindproxy/Config.in       |   3 +-
 .../x11r7/xapp_xfindproxy/xapp_xfindproxy.mk  |   3 +-
 package/x11r7/xapp_xfs/Config.in              |   2 +-
 package/x11r7/xapp_xfs/xapp_xfs.mk            |   2 +-
 package/x11r7/xapp_xsetpointer/Config.in      |   2 +-
 .../xapp_xsetpointer/xapp_xsetpointer.mk      |   2 +-
 .../x11r7/xdriver_xf86-input-evdev/Config.in  |   4 +-
 .../xdriver_xf86-input-evdev.mk               |   4 +-
 .../xdriver_xf86-input-joystick/Config.in     |   4 +-
 .../xdriver_xf86-input-joystick.mk            |   2 +-
 .../xdriver_xf86-input-keyboard/Config.in     |   5 +-
 .../xdriver_xf86-input-keyboard.mk            |   2 +-
 .../xdriver_xf86-input-libinput/Config.in     |   3 +-
 .../xdriver_xf86-input-libinput.mk            |   2 +-
 .../x11r7/xdriver_xf86-input-mouse/Config.in  |   4 +-
 .../xdriver_xf86-input-mouse.mk               |   2 +-
 .../xdriver_xf86-input-synaptics/Config.in    |   4 +-
 .../xdriver_xf86-input-synaptics.mk           |   2 +-
 .../x11r7/xdriver_xf86-input-tslib/Config.in  |   4 +-
 .../xdriver_xf86-input-tslib.mk               |   4 +-
 .../xdriver_xf86-input-vmmouse/Config.in      |   4 +-
 .../xdriver_xf86-input-vmmouse.mk             |   2 +-
 .../x11r7/xdriver_xf86-video-amdgpu/Config.in |   9 +-
 .../xdriver_xf86-video-amdgpu.mk              |   9 +-
 .../x11r7/xdriver_xf86-video-ark/Config.in    |   6 +-
 .../xdriver_xf86-video-ark.mk                 |   2 +-
 .../x11r7/xdriver_xf86-video-ast/Config.in    |   3 +-
 .../xdriver_xf86-video-ast.mk                 |   2 +-
 .../x11r7/xdriver_xf86-video-ati/Config.in    |   9 +-
 .../xdriver_xf86-video-ati.mk                 |  11 +-
 .../x11r7/xdriver_xf86-video-cirrus/Config.in |   7 +-
 .../xdriver_xf86-video-cirrus.mk              |   2 +-
 .../x11r7/xdriver_xf86-video-dummy/Config.in  |   7 +-
 .../xdriver_xf86-video-dummy.mk               |   2 +-
 .../x11r7/xdriver_xf86-video-fbdev/Config.in  |   6 +-
 .../xdriver_xf86-video-fbdev.mk               |   2 +-
 .../xdriver_xf86-video-fbturbo/Config.in      |   8 +-
 .../xdriver_xf86-video-fbturbo.mk             |  11 +-
 .../x11r7/xdriver_xf86-video-geode/Config.in  |   6 +-
 .../xdriver_xf86-video-geode.mk               |   2 +-
 .../x11r7/xdriver_xf86-video-glint/Config.in  |  10 +-
 .../xdriver_xf86-video-glint.mk               |   2 +-
 .../x11r7/xdriver_xf86-video-i128/Config.in   |   7 +-
 .../xdriver_xf86-video-i128.mk                |   2 +-
 .../xdriver_xf86-video-imx-viv/Config.in      |   3 +-
 .../xdriver_xf86-video-imx-viv.mk             |   2 +-
 .../x11r7/xdriver_xf86-video-imx/Config.in    |   7 +-
 .../xdriver_xf86-video-imx.mk                 |   3 +-
 .../x11r7/xdriver_xf86-video-intel/Config.in  |   3 +-
 .../xdriver_xf86-video-intel.mk               |  21 +-
 .../x11r7/xdriver_xf86-video-mach64/Config.in |   6 +-
 .../xdriver_xf86-video-mach64.mk              |   2 +-
 .../x11r7/xdriver_xf86-video-mga/Config.in    |   9 +-
 .../xdriver_xf86-video-mga.mk                 |   2 +-
 .../xdriver_xf86-video-neomagic/Config.in     |   8 +-
 .../xdriver_xf86-video-neomagic.mk            |   2 +-
 .../xdriver_xf86-video-nouveau/Config.in      |   6 +-
 .../xdriver_xf86-video-nouveau.mk             |   6 +-
 package/x11r7/xdriver_xf86-video-nv/Config.in |   7 +-
 .../xdriver_xf86-video-nv.mk                  |   2 +-
 .../xdriver_xf86-video-openchrome/Config.in   |   7 +-
 .../xdriver_xf86-video-openchrome.mk          |   8 +-
 .../x11r7/xdriver_xf86-video-qxl/Config.in    |   3 +-
 .../xdriver_xf86-video-qxl.mk                 |   3 +-
 .../0002-include-stdint-h.patch               |  34 +++
 .../x11r7/xdriver_xf86-video-r128/Config.in   |   6 +-
 .../xdriver_xf86-video-r128.mk                |   2 +-
 .../0002-xorg-xserver120.patch                |  23 ++
 .../x11r7/xdriver_xf86-video-savage/Config.in |   8 +-
 .../xdriver_xf86-video-savage.mk              |   2 +-
 .../Config.in                                 |   7 +-
 .../xdriver_xf86-video-siliconmotion.mk       |   2 +-
 ...0002-Remove-reference-to-virtualFrom.patch |  33 +++
 .../x11r7/xdriver_xf86-video-sis/Config.in    |  10 +-
 .../xdriver_xf86-video-sis.mk                 |   2 +-
 .../x11r7/xdriver_xf86-video-tdfx/Config.in   |   8 +-
 .../xdriver_xf86-video-tdfx.mk                |   8 +-
 .../x11r7/xdriver_xf86-video-tga/Config.in    |   8 +-
 .../xdriver_xf86-video-tga.mk                 |   2 +-
 .../xdriver_xf86-video-trident/Config.in      |   8 +-
 .../xdriver_xf86-video-trident.mk             |   2 +-
 .../x11r7/xdriver_xf86-video-vesa/Config.in   |   6 +-
 .../xdriver_xf86-video-vesa.mk                |   2 +-
 .../x11r7/xdriver_xf86-video-vmware/Config.in |   7 +-
 .../xdriver_xf86-video-vmware.mk              |   2 +-
 .../x11r7/xdriver_xf86-video-voodoo/Config.in |   7 +-
 .../xdriver_xf86-video-voodoo.mk              |   2 +-
 package/x11r7/xkeyboard-config/Config.in      |   2 +-
 package/x11r7/xlib_libFS/Config.in            |   3 +-
 package/x11r7/xlib_libFS/xlib_libFS.mk        |   2 +-
 package/x11r7/xlib_libICE/Config.in           |   2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk      |   2 +-
 package/x11r7/xlib_libSM/Config.in            |   2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk        |   2 +-
 package/x11r7/xlib_libX11/Config.in           |   6 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk      |  14 +-
 package/x11r7/xlib_libXScrnSaver/Config.in    |   2 +-
 .../xlib_libXScrnSaver/xlib_libXScrnSaver.mk  |   2 +-
 package/x11r7/xlib_libXau/Config.in           |   2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk      |   4 +-
 package/x11r7/xlib_libXaw/Config.in           |   2 +-
 package/x11r7/xlib_libXaw/xlib_libXaw.mk      |   2 +-
 package/x11r7/xlib_libXcomposite/Config.in    |   3 +-
 .../xlib_libXcomposite/xlib_libXcomposite.mk  |   2 +-
 package/x11r7/xlib_libXcursor/Config.in       |   2 +-
 .../x11r7/xlib_libXcursor/xlib_libXcursor.mk  |   4 +-
 package/x11r7/xlib_libXdamage/Config.in       |   3 +-
 .../x11r7/xlib_libXdamage/xlib_libXdamage.mk  |   2 +-
 package/x11r7/xlib_libXdmcp/Config.in         |   2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk  |   4 +-
 package/x11r7/xlib_libXext/Config.in          |   3 +-
 package/x11r7/xlib_libXext/xlib_libXext.mk    |   2 +-
 package/x11r7/xlib_libXfixes/Config.in        |   4 +-
 .../x11r7/xlib_libXfixes/xlib_libXfixes.mk    |   5 +-
 package/x11r7/xlib_libXfont/Config.in         |   3 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk  |   4 +-
 package/x11r7/xlib_libXfont2/Config.in        |   3 +-
 .../x11r7/xlib_libXfont2/xlib_libXfont2.mk    |   6 +-
 package/x11r7/xlib_libXft/Config.in           |   2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk      |   2 +-
 package/x11r7/xlib_libXi/Config.in            |   3 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk        |   5 +-
 package/x11r7/xlib_libXinerama/Config.in      |   2 +-
 .../xlib_libXinerama/xlib_libXinerama.mk      |   2 +-
 package/x11r7/xlib_libXmu/Config.in           |   2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk      |   2 +-
 package/x11r7/xlib_libXpm/Config.in           |   2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk      |   2 +-
 package/x11r7/xlib_libXrandr/Config.in        |   4 +-
 .../x11r7/xlib_libXrandr/xlib_libXrandr.mk    |   2 +-
 package/x11r7/xlib_libXrender/Config.in       |   3 +-
 .../x11r7/xlib_libXrender/xlib_libXrender.mk  |   4 +-
 package/x11r7/xlib_libXres/Config.in          |   3 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk    |   2 +-
 package/x11r7/xlib_libXt/Config.in            |   3 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk        |   2 +-
 package/x11r7/xlib_libXtst/Config.in          |   2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk    |   2 +-
 package/x11r7/xlib_libXv/Config.in            |   3 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk        |   2 +-
 package/x11r7/xlib_libXvMC/Config.in          |   3 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk    |   2 +-
 package/x11r7/xlib_libXxf86dga/Config.in      |   3 +-
 .../xlib_libXxf86dga/xlib_libXxf86dga.mk      |   2 +-
 package/x11r7/xlib_libXxf86vm/Config.in       |   3 +-
 .../x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk  |   2 +-
 package/x11r7/xlib_libdmx/Config.in           |   2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk      |   2 +-
 package/x11r7/xlib_libfontenc/Config.in       |   2 +-
 .../x11r7/xlib_libfontenc/xlib_libfontenc.mk  |   4 +-
 package/x11r7/xlib_libxkbfile/Config.in       |   2 +-
 .../x11r7/xlib_libxkbfile/xlib_libxkbfile.mk  |   4 +-
 package/x11r7/xlib_libxshmfence/Config.in     |   2 +-
 .../xlib_libxshmfence/xlib_libxshmfence.mk    |   2 +-
 package/x11r7/xorgproto/Config.in             |   5 +
 package/x11r7/xorgproto/xorgproto.hash        |  43 +++
 package/x11r7/xorgproto/xorgproto.mk          |  53 ++++
 package/x11r7/xproto_applewmproto/Config.in   |   4 -
 .../xproto_applewmproto.hash                  |   3 -
 .../xproto_applewmproto.mk                    |  15 --
 package/x11r7/xproto_bigreqsproto/Config.in   |   4 -
 .../xproto_bigreqsproto.hash                  |   2 -
 .../xproto_bigreqsproto.mk                    |  15 --
 package/x11r7/xproto_compositeproto/Config.in |   4 -
 .../xproto_compositeproto.hash                |   3 -
 .../xproto_compositeproto.mk                  |  15 --
 package/x11r7/xproto_damageproto/Config.in    |   4 -
 .../xproto_damageproto.hash                   |   3 -
 .../xproto_damageproto/xproto_damageproto.mk  |  15 --
 package/x11r7/xproto_dmxproto/Config.in       |   4 -
 .../xproto_dmxproto/xproto_dmxproto.hash      |   3 -
 .../x11r7/xproto_dmxproto/xproto_dmxproto.mk  |  15 --
 package/x11r7/xproto_dri2proto/Config.in      |   4 -
 .../xproto_dri2proto/xproto_dri2proto.hash    |   2 -
 .../xproto_dri2proto/xproto_dri2proto.mk      |  15 --
 package/x11r7/xproto_dri3proto/Config.in      |   4 -
 .../xproto_dri3proto/xproto_dri3proto.hash    |   2 -
 .../xproto_dri3proto/xproto_dri3proto.mk      |  15 --
 package/x11r7/xproto_fixesproto/Config.in     |   4 -
 .../xproto_fixesproto/xproto_fixesproto.hash  |   3 -
 .../xproto_fixesproto/xproto_fixesproto.mk    |  16 --
 package/x11r7/xproto_fontcacheproto/Config.in |   4 -
 .../xproto_fontcacheproto.hash                |   3 -
 .../xproto_fontcacheproto.mk                  |  16 --
 package/x11r7/xproto_fontsproto/Config.in     |   4 -
 .../xproto_fontsproto/xproto_fontsproto.hash  |   2 -
 .../xproto_fontsproto/xproto_fontsproto.mk    |  16 --
 package/x11r7/xproto_glproto/Config.in        |   4 -
 .../x11r7/xproto_glproto/xproto_glproto.hash  |   2 -
 .../x11r7/xproto_glproto/xproto_glproto.mk    |  15 --
 package/x11r7/xproto_inputproto/Config.in     |   4 -
 .../xproto_inputproto/xproto_inputproto.hash  |   2 -
 .../xproto_inputproto/xproto_inputproto.mk    |  16 --
 package/x11r7/xproto_kbproto/Config.in        |   4 -
 .../x11r7/xproto_kbproto/xproto_kbproto.hash  |   2 -
 .../x11r7/xproto_kbproto/xproto_kbproto.mk    |  16 --
 package/x11r7/xproto_presentproto/Config.in   |   5 -
 .../xproto_presentproto.hash                  |   2 -
 .../xproto_presentproto.mk                    |  16 --
 package/x11r7/xproto_randrproto/Config.in     |   4 -
 .../xproto_randrproto/xproto_randrproto.hash  |   3 -
 .../xproto_randrproto/xproto_randrproto.mk    |  15 --
 package/x11r7/xproto_recordproto/Config.in    |   4 -
 .../xproto_recordproto.hash                   |   2 -
 .../xproto_recordproto/xproto_recordproto.mk  |  15 --
 package/x11r7/xproto_renderproto/Config.in    |   4 -
 .../xproto_renderproto.hash                   |   2 -
 .../xproto_renderproto/xproto_renderproto.mk  |  16 --
 package/x11r7/xproto_resourceproto/Config.in  |   4 -
 .../xproto_resourceproto.hash                 |   3 -
 .../xproto_resourceproto.mk                   |  15 --
 package/x11r7/xproto_scrnsaverproto/Config.in |   4 -
 .../xproto_scrnsaverproto.hash                |   2 -
 .../xproto_scrnsaverproto.mk                  |  15 --
 package/x11r7/xproto_videoproto/Config.in     |   4 -
 .../xproto_videoproto/xproto_videoproto.hash  |   2 -
 .../xproto_videoproto/xproto_videoproto.mk    |  15 --
 package/x11r7/xproto_windowswmproto/Config.in |   4 -
 .../xproto_windowswmproto.hash                |   3 -
 .../xproto_windowswmproto.mk                  |  15 --
 package/x11r7/xproto_xcmiscproto/Config.in    |   4 -
 .../xproto_xcmiscproto.hash                   |   2 -
 .../xproto_xcmiscproto/xproto_xcmiscproto.mk  |  17 --
 package/x11r7/xproto_xextproto/Config.in      |   4 -
 .../xproto_xextproto/xproto_xextproto.hash    |   2 -
 .../xproto_xextproto/xproto_xextproto.mk      |  17 --
 .../x11r7/xproto_xf86bigfontproto/Config.in   |   4 -
 .../xproto_xf86bigfontproto.hash              |   3 -
 .../xproto_xf86bigfontproto.mk                |  16 --
 package/x11r7/xproto_xf86dgaproto/Config.in   |   4 -
 .../xproto_xf86dgaproto.hash                  |   3 -
 .../xproto_xf86dgaproto.mk                    |  15 --
 package/x11r7/xproto_xf86driproto/Config.in   |   4 -
 .../xproto_xf86driproto.hash                  |   3 -
 .../xproto_xf86driproto.mk                    |  15 --
 .../x11r7/xproto_xf86vidmodeproto/Config.in   |   4 -
 .../xproto_xf86vidmodeproto.hash              |   3 -
 .../xproto_xf86vidmodeproto.mk                |  15 --
 package/x11r7/xproto_xineramaproto/Config.in  |   4 -
 .../xproto_xineramaproto.hash                 |   3 -
 .../xproto_xineramaproto.mk                   |  15 --
 package/x11r7/xproto_xproto/Config.in         |   4 -
 .../x11r7/xproto_xproto/xproto_xproto.hash    |   2 -
 package/x11r7/xproto_xproto/xproto_xproto.mk  |  16 --
 .../xproto_xproxymanagementprotocol/Config.in |   6 -
 .../xproto_xproxymanagementprotocol.hash      |   2 -
 .../xproto_xproxymanagementprotocol.mk        |  15 --
 ...-compositeext.h-if-COMPOSITE-is-supp.patch |  31 ---
 .../0001-modesettings-needs-dri2.patch        |   5 +-
 ...ure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |   0
 ...003-Remove-check-for-useSIGIO-option.patch |   0
 ...0004-include-misc.h-fix-uClibc-build.patch |  31 +++
 package/x11r7/xserver_xorg-server/Config.in   |  40 +--
 .../xserver_xorg-server.hash                  |  10 +-
 .../xserver_xorg-server.mk                    |  49 +---
 package/x11r7/xutil_makedepend/Config.in      |   1 +
 .../xutil_makedepend/xutil_makedepend.mk      |   4 +-
 279 files changed, 700 insertions(+), 1269 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-r128/0002-include-stdint-h.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/0002-Remove-reference-to-virtualFrom.patch
 create mode 100644 package/x11r7/xorgproto/Config.in
 create mode 100644 package/x11r7/xorgproto/xorgproto.hash
 create mode 100644 package/x11r7/xorgproto/xorgproto.mk
 delete mode 100644 package/x11r7/xproto_applewmproto/Config.in
 delete mode 100644 package/x11r7/xproto_applewmproto/xproto_applewmproto.hash
 delete mode 100644 package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
 delete mode 100644 package/x11r7/xproto_bigreqsproto/Config.in
 delete mode 100644 package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.hash
 delete mode 100644 package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
 delete mode 100644 package/x11r7/xproto_compositeproto/Config.in
 delete mode 100644 package/x11r7/xproto_compositeproto/xproto_compositeproto.hash
 delete mode 100644 package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
 delete mode 100644 package/x11r7/xproto_damageproto/Config.in
 delete mode 100644 package/x11r7/xproto_damageproto/xproto_damageproto.hash
 delete mode 100644 package/x11r7/xproto_damageproto/xproto_damageproto.mk
 delete mode 100644 package/x11r7/xproto_dmxproto/Config.in
 delete mode 100644 package/x11r7/xproto_dmxproto/xproto_dmxproto.hash
 delete mode 100644 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
 delete mode 100644 package/x11r7/xproto_dri2proto/Config.in
 delete mode 100644 package/x11r7/xproto_dri2proto/xproto_dri2proto.hash
 delete mode 100644 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
 delete mode 100644 package/x11r7/xproto_dri3proto/Config.in
 delete mode 100644 package/x11r7/xproto_dri3proto/xproto_dri3proto.hash
 delete mode 100644 package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
 delete mode 100644 package/x11r7/xproto_fixesproto/Config.in
 delete mode 100644 package/x11r7/xproto_fixesproto/xproto_fixesproto.hash
 delete mode 100644 package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
 delete mode 100644 package/x11r7/xproto_fontcacheproto/Config.in
 delete mode 100644 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.hash
 delete mode 100644 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
 delete mode 100644 package/x11r7/xproto_fontsproto/Config.in
 delete mode 100644 package/x11r7/xproto_fontsproto/xproto_fontsproto.hash
 delete mode 100644 package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
 delete mode 100644 package/x11r7/xproto_glproto/Config.in
 delete mode 100644 package/x11r7/xproto_glproto/xproto_glproto.hash
 delete mode 100644 package/x11r7/xproto_glproto/xproto_glproto.mk
 delete mode 100644 package/x11r7/xproto_inputproto/Config.in
 delete mode 100644 package/x11r7/xproto_inputproto/xproto_inputproto.hash
 delete mode 100644 package/x11r7/xproto_inputproto/xproto_inputproto.mk
 delete mode 100644 package/x11r7/xproto_kbproto/Config.in
 delete mode 100644 package/x11r7/xproto_kbproto/xproto_kbproto.hash
 delete mode 100644 package/x11r7/xproto_kbproto/xproto_kbproto.mk
 delete mode 100644 package/x11r7/xproto_presentproto/Config.in
 delete mode 100644 package/x11r7/xproto_presentproto/xproto_presentproto.hash
 delete mode 100644 package/x11r7/xproto_presentproto/xproto_presentproto.mk
 delete mode 100644 package/x11r7/xproto_randrproto/Config.in
 delete mode 100644 package/x11r7/xproto_randrproto/xproto_randrproto.hash
 delete mode 100644 package/x11r7/xproto_randrproto/xproto_randrproto.mk
 delete mode 100644 package/x11r7/xproto_recordproto/Config.in
 delete mode 100644 package/x11r7/xproto_recordproto/xproto_recordproto.hash
 delete mode 100644 package/x11r7/xproto_recordproto/xproto_recordproto.mk
 delete mode 100644 package/x11r7/xproto_renderproto/Config.in
 delete mode 100644 package/x11r7/xproto_renderproto/xproto_renderproto.hash
 delete mode 100644 package/x11r7/xproto_renderproto/xproto_renderproto.mk
 delete mode 100644 package/x11r7/xproto_resourceproto/Config.in
 delete mode 100644 package/x11r7/xproto_resourceproto/xproto_resourceproto.hash
 delete mode 100644 package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
 delete mode 100644 package/x11r7/xproto_scrnsaverproto/Config.in
 delete mode 100644 package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.hash
 delete mode 100644 package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
 delete mode 100644 package/x11r7/xproto_videoproto/Config.in
 delete mode 100644 package/x11r7/xproto_videoproto/xproto_videoproto.hash
 delete mode 100644 package/x11r7/xproto_videoproto/xproto_videoproto.mk
 delete mode 100644 package/x11r7/xproto_windowswmproto/Config.in
 delete mode 100644 package/x11r7/xproto_windowswmproto/xproto_windowswmproto.hash
 delete mode 100644 package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
 delete mode 100644 package/x11r7/xproto_xcmiscproto/Config.in
 delete mode 100644 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.hash
 delete mode 100644 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
 delete mode 100644 package/x11r7/xproto_xextproto/Config.in
 delete mode 100644 package/x11r7/xproto_xextproto/xproto_xextproto.hash
 delete mode 100644 package/x11r7/xproto_xextproto/xproto_xextproto.mk
 delete mode 100644 package/x11r7/xproto_xf86bigfontproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.hash
 delete mode 100644 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
 delete mode 100644 package/x11r7/xproto_xf86dgaproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash
 delete mode 100644 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
 delete mode 100644 package/x11r7/xproto_xf86driproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash
 delete mode 100644 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
 delete mode 100644 package/x11r7/xproto_xf86vidmodeproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.hash
 delete mode 100644 package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
 delete mode 100644 package/x11r7/xproto_xineramaproto/Config.in
 delete mode 100644 package/x11r7/xproto_xineramaproto/xproto_xineramaproto.hash
 delete mode 100644 package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
 delete mode 100644 package/x11r7/xproto_xproto/Config.in
 delete mode 100644 package/x11r7/xproto_xproto/xproto_xproto.hash
 delete mode 100644 package/x11r7/xproto_xproto/xproto_xproto.mk
 delete mode 100644 package/x11r7/xproto_xproxymanagementprotocol/Config.in
 delete mode 100644 package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.hash
 delete mode 100644 package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
 delete mode 100644 package/x11r7/xserver_xorg-server/1.19.6/0004-glx-Only-include-compositeext.h-if-COMPOSITE-is-supp.patch
 rename package/x11r7/xserver_xorg-server/{1.19.6 => 1.20.0}/0001-modesettings-needs-dri2.patch (88%)
 rename package/x11r7/xserver_xorg-server/{1.19.6 => 1.20.0}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
 rename package/x11r7/xserver_xorg-server/{1.19.6 => 1.20.0}/0003-Remove-check-for-useSIGIO-option.patch (100%)
 create mode 100644 package/x11r7/xserver_xorg-server/1.20.0/0004-include-misc.h-fix-uClibc-build.patch

-- 
2.18.0
