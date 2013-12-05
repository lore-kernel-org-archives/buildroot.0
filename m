From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 5 Dec 2013 14:36:55 +0100
Subject: [Buildroot] [PATCH v3] infra: introduce github helper function
In-Reply-To: <1385999266-30632-1-git-send-email-mjonker@synopsys.com>
References: <1385999266-30632-1-git-send-email-mjonker@synopsys.com>
Message-ID: <CAAXf6LUGc8Mzme3ShFESL7vrW7ghTGZdF0=-X++Ru96p0qXesg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mischa,

On Mon, Dec 2, 2013 at 4:47 PM, Mischa Jonker
<Mischa.Jonker@synopsys.com> wrote:
> In order to make it easier to cope with changes in github download-URL's,
> this patch introduces the github helper function. It generates the site
> URL of a github repository. It's usage is $(call github,user,pkg,version).
>
> Cc: Arnout Vandecapelle <arnout@mind.be>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
>  v3:
>   - rebase on master
>   - removed reference to old github method and added xref
>   - _no_ change in defconfigs, as there is no consensus yet on policy, and
>      we can add it later in a separate patch.
>
>  docs/manual/adding-packages-generic.txt          |    5 +++--
>  docs/manual/adding-packages-tips.txt             |    5 +++--
>  package/a10disp/a10disp.mk                       |    2 +-
>  package/civetweb/civetweb.mk                     |    2 +-
>  package/cpuload/cpuload.mk                       |    2 +-
>  package/fb-test-app/fb-test-app.mk               |    2 +-
>  package/input-event-daemon/input-event-daemon.mk |    2 +-
>  package/jsmin/jsmin.mk                           |    2 +-
>  package/knock/knock.mk                           |    2 +-
>  package/libcec/libcec.mk                         |    2 +-
>  package/libcofi/libcofi.mk                       |    2 +-
>  package/libiqrf/libiqrf.mk                       |    2 +-
>  package/liblog4c-localtime/liblog4c-localtime.mk |    2 +-
>  package/libsha1/libsha1.mk                       |    2 +-
>  package/libsoc/libsoc.mk                         |    2 +-
>  package/libtpl/libtpl.mk                         |    2 +-
>  package/linenoise/linenoise.mk                   |    2 +-
>  package/lua-ev/lua-ev.mk                         |    2 +-
>  package/luacrypto/luacrypto.mk                   |    2 +-
>  package/luaexpatutils/luaexpatutils.mk           |    2 +-
>  package/luasql/luasql.mk                         |    2 +-
>  package/mongrel2/mongrel2.mk                     |    2 +-
>  package/mtdev2tuio/mtdev2tuio.mk                 |    2 +-
>  package/neardal/neardal.mk                       |    2 +-
>  package/omap-u-boot-utils/omap-u-boot-utils.mk   |    2 +-
>  package/on2-8170-modules/on2-8170-modules.mk     |    2 +-
>  package/pkg-utils.mk                             |    3 +++
>  package/python-ipy/python-ipy.mk                 |    2 +-
>  package/qjson/qjson.mk                           |    2 +-
>  package/rpi-firmware/rpi-firmware.mk             |    2 +-
>  package/rpi-userland/rpi-userland.mk             |    2 +-
>  package/socketcand/socketcand.mk                 |    2 +-
>  package/sqlcipher/sqlcipher.mk                   |    2 +-
>  package/sunxi-boards/sunxi-boards.mk             |    2 +-
>  package/sunxi-cedarx/sunxi-cedarx.mk             |    2 +-
>  package/sunxi-mali-prop/sunxi-mali-prop.mk       |    2 +-
>  package/sunxi-mali/sunxi-mali.mk                 |    2 +-
>  package/sunxi-tools/sunxi-tools.mk               |    2 +-
>  package/tinymembench/tinymembench.mk             |    2 +-
>  package/tslib/tslib.mk                           |    2 +-
>  package/xl2tp/xl2tp.mk                           |    2 +-
>  package/yajl/yajl.mk                             |    2 +-
>  42 files changed, 48 insertions(+), 43 deletions(-)

Given the large number of files touched, I'd find it easier to review
if this would be split in two patches: one for the infra changes, one
for the packages. You could put the doc changes even in a separate
patch. Note this is my personal opinion, I don't know if it is shared
by others.

There seem to be several packages missing in your patch. I think all
of the below can use the github helper too (even jq that uses a
special URL)

$ find -name "*.mk" | xargs grep _SITE | grep github | grep http
./package/inadyn/inadyn.mk:INADYN_SITE =
https://github.com/downloads/troglobit/inadyn
./package/jq/jq.mk:JQ_SITE = http://stedolan.github.io/jq/download/source
./package/snowball-init/snowball-init.mk:SNOWBALL_INIT_SITE =
https://github.com/igloocommunity/snowball-init
./package/libevent/libevent.mk:LIBEVENT_SITE =
https://github.com/downloads/libevent/libevent
./package/wsapi/wsapi.mk:WSAPI_SITE =
http://github.com/downloads/keplerproject/wsapi
./package/luafilesystem/luafilesystem.mk:LUAFILESYSTEM_SITE =
http://github.com/downloads/keplerproject/luafilesystem
./package/copas/copas.mk:COPAS_SITE =
http://github.com/downloads/keplerproject/copas
./package/ti-utils/ti-utils.mk:TI_UTILS_SITE =
http://github.com/gxk/ti-utils/tarball/$(TI_UTILS_VERSION)
./package/cgilua/cgilua.mk:CGILUA_SITE =
http://github.com/downloads/keplerproject/cgilua
./package/taglib/taglib.mk:TAGLIB_SITE =
http://github.com/downloads/taglib/taglib
./package/ne10/ne10.mk:NE10_SITE =
http://github.com/projectNe10/Ne10/tarball/$(NE10_VERSION)
./package/inotify-tools/inotify-tools.mk:INOTIFY_TOOLS_SITE =
http://github.com/downloads/rvoicilas/inotify-tools/
./package/luaposix/luaposix.mk:LUAPOSIX_SITE =
https://github.com/luaposix/luaposix/archive
./package/freerdp/freerdp.mk:FREERDP_SITE =
https://github.com/downloads/FreeRDP/FreeRDP
./package/rings/rings.mk:RINGS_SITE =
http://github.com/downloads/keplerproject/rings
./package/mrouted/mrouted.mk:MROUTED_SITE =
http://cloud.github.com/downloads/troglobit/mrouted
./package/cpanminus/cpanminus.mk:CPANMINUS_SITE =
https://github.com/miyagawa/cpanminus/archive
./package/libarchive/libarchive.mk:LIBARCHIVE_SITE =
http://github.com/downloads/libarchive/libarchive
./package/orbit/orbit.mk:ORBIT_SITE =
http://github.com/downloads/keplerproject/orbit
./package/lua-msgpack-native/lua-msgpack-native.mk:LUA_MSGPACK_NATIVE_SITE
= http://github.com/kengonakajima/lua-msgpack-native/tarball/$(LUA_MSGPACK_NATIVE_VERSION)
./package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk:XAPP_XINPUT_CALIBRATOR_SITE
= http://github.com/downloads/tias/xinput_calibrator
./package/xavante/xavante.mk:XAVANTE_SITE =
http://github.com/downloads/keplerproject/xavante
./package/snowball-hdmiservice/snowball-hdmiservice.mk:SNOWBALL_HDMISERVICE_SITE
= https://github.com/igloocommunity/hdmiservice
./package/lcdapi/lcdapi.mk:LCDAPI_SITE =
http://github.com/spdawson/lcdapi/tarball/$(LCDAPI_VERSION)
./package/libiscsi/libiscsi.mk:LIBISCSI_SITE            =
https://github.com/downloads/sahlberg/libiscsi

This patch only changes the existing http(s) github downloads. Do you
plan to create a follow-up patch to replace the current git:// github
packages to use the new helper too (and thus the http tarball method)?


Finally, you added the github helper in pkg-utils.mk, but I think
pkg-download.mk may be a more logical place.

Best regards,
Thomas
