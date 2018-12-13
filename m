From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Thu, 13 Dec 2018 14:47:26 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/swupdate: Update to version
 2018.11
In-Reply-To: <20181213211658.058e01cb@windsurf>
References: <20181212142056.7722-1-jared.bents@rockwellcollins.com>
 <20181213211658.058e01cb@windsurf>
Message-ID: <CAM=7fbdKpSYh-a4GMULf_177H+idSvGXN0AMzBvKcv7OFNW9BA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Dec 13, 2018 at 2:17 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Jared,
>
> On Wed, 12 Dec 2018 08:20:56 -0600, Jared Bents wrote:
> > Update to version 2018.11 to resolve build errors due to the changes
> > in libcurl at version 7.62.0
>
> Which build failure? I don't see any in the autobuilders. Why don't we
> see any failure in the autobuilders?

libcurl in version 7.62.0 updated CURLE_SSL_CACERT to share the same
value as CURLE_PEER_FAILED_VERIFICATION so if you build with the
kconfig option CONFIG_DOWNLOAD turned on and it detects that libcurl
is included in the build, the build will fail on versions of swupdate
that don't account for the 7.62.0 version of libcurl.  The default
config used by swupdate does not have CONFIG_DOWNLOAD turned on.

Here is the error:

>>> swupdate 2018.03 Building
PATH="/accts/jmbents/rclinux/target_build/qoriq_t1042_fomax_factory_defconfig/host/bin:/accts/jmbents/rclinux/target_build/qoriq_t1042_fomax_factory_defconfig/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
HAVE_JSON_C=n HAVE_LIBARCHIVE=y HAVE_LIBCONFIG=y HAVE_LIBCURL=y
HAVE_LUA=n HAVE_LIBMTD=y HAVE_LIBUBI=y HAVE_LIBSSL=y HAVE_LIBCRYPTO=y
HAVE_LIBUBOOTENV=y HAVE_LIBZEROMQ=n HAVE_ZLIB=y /usr/bin/make -j13 -C
/accts/jmbents/rclinux/target_build/qoriq_t1042_fomax_factory_defconfig/build/swupdate-2018.03
  CC      corelib/channel_curl.o
  CC      corelib/installer.o
  CC      corelib/mtd-interface.o
  CC      corelib/network_thread.o
  CC      corelib/parsing_library.o
  CC      corelib/progress_thread.o
  CC      corelib/stream_interface.o
  CC      corelib/parsing_library_libconfig.o
  CC      corelib/swupdate_dict.o
  CC      corelib/swupdate_settings.o
corelib/channel_curl.c: In function ?channel_map_curl_error?:
corelib/channel_curl.c:298:2: error: duplicate case value
  case CURLE_SSL_CACERT:
  ^~~~
corelib/channel_curl.c:297:2: error: previously used here
  case CURLE_PEER_FAILED_VERIFICATION:
  ^~~~
corelib/channel_curl.c: In function ?channel_get_file?:
corelib/channel_curl.c:864:16: warning: unused variable ?md_len?
[-Wunused-variable]
   unsigned int md_len;
                ^~~~~~
scripts/Makefile.build:168: recipe for target 'corelib/channel_curl.o' failed
make[3]: *** [corelib/channel_curl.o] Error 1
make[3]: *** Waiting for unfinished jobs....
Makefile:437: recipe for target 'corelib' failed
make[2]: *** [corelib] Error 2
package/pkg-generic.mk:230: recipe for target
'/accts/jmbents/rclinux/target_build/qoriq_t1042_fomax_factory_defconfig/build/swupdate-2018.03/.stamp_built'
failed
make[1]: *** [/accts/jmbents/rclinux/target_build/qoriq_t1042_fomax_factory_defconfig/build/swupdate-2018.03/.stamp_built]
Error 2
Makefile:23: recipe for target '_all' failed
make: *** [_all] Error 2

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thank you,
Jared
