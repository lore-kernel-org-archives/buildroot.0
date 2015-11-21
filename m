From: Martin Bark <martin@barkynet.com>
Date: Sat, 21 Nov 2015 14:45:52 +0000
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <20151120001552.51c1b21b@free-electrons.com>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com>
Message-ID: <CAFGQKxd7LUYDN-whwsdhenu=bMJXnd7nQ=ungrxvt2NnMG5fiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 19 November 2015 at 23:15, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> J?r?me, Johan, Bernd, Yann, Martin, Gustavo, R?mi, Samuel, Alexey,
> Waldemar, Clayton, please read below, there are some interesting issues
> for you :-) Thanks !
>
> On Thu, 19 Nov 2015 08:30:13 +0100 (CET), Thomas Petazzoni wrote:
>
>>      aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/ac790191127cf4d8b19d0c7c640981264772f503/
>
> png symbols problems on AArch64. Looks similar to
> https://sourceforge.net/p/libpng/bugs/230/, but it was fixed in libpng
> 1.6.15 and we have 1.6.19. J?r?me, since you wrote the apitrace
> package, can you have a look ?
>
>>       x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/3d36403ba80089faea5dd06bc7e4414d593bbfc1/
>
> Classical musl build issue. Interestingly, Alpine Linux has a package
> for conntrack-tools, but they don't seem to do anything special for
> musl. See
> http://git.alpinelinux.org/cgit/aports/tree/main/conntrack-tools.
>
> Anyone to look into this?
>
>>          arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/0b29531f2cdf6d141cec5373fbf876e7fb9961eb/
>
> src/sync.c: In function 'sync_arg':
> src/sync.c:144:23: error: void value not ignored as it ought to be
>            sync_status = syncfs (fd);
>                        ^
>
> This was a bug in musl, it's fixed since musl 1.1.11. I have rebuilt
> all the Buildroot pre-built toolchains, I need to deploy them, which
> should fix this issue.
>
>>      aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/c1cf967adb6014e3a15f0dc75dc1aeebf66c6d1b/
>
> Weird atomic stuff. Johan, you are our Erlang person, can you have a
> look ?
>
>>         mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/1f97a7063ed9cbddc893b82595966748ec2c9784/
>>         mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/1383e403bdc92cfc42c768e593be263657bd0392/
>>         mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9d7d38093bef41961484fa728f928db0767e6c03/
>
> All three are:
>
>         ERROR: gnutls not found using pkg-config
>
> Bernd, can you have a look ?
>
>>         i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/93a11a24edc999ea129922ab1505f65a110f908c/
>
> /home/autobuild/instance-0/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/gstreamer-1.0/gst/gstelement.h:55:27:
> fatal error: gst/gstconfig.h: No such file or directory
>
> Yann, you are the freerdp guy. Can you have a look ?
>
>>          arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/79a6d94cbe221592b943e7b6dc957537fd94a307/
>
> Fixed by
> http://git.buildroot.net/buildroot/commit/?id=e9b415ace06b416a5743c97e13f4fd7df9666d85.
>
>>       x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/3fd1d18f0535bb8b969f808a5837c4a8111e69b9/
>
> Seems like nodejs doesn't like the native gcc 4.7 that this machine
> uses. Martin, can you have a look ?
>
> BTW Martin, there's also this other error that popped up on a different
> machine:
> http://autobuild.buildroot.org/results/72b/72b80a434547931e1deb6f0ba793a6d68accc9a2/build-end.log.

Yes i think you're right, the issue looks like gcc 4.7 on the host.
This issue https://github.com/nodejs/node-gyp/issues/790 and this one
https://github.com/nodejs/node/issues/432 have similar build issues
and they both come down to node.js needs at least gcc 4.8

The Config.in already has BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 for node.js
4.x, is there a way to specify this for the host build too?

Thanks

Martin

>
>>     mips64el |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/4deb1c7b901d993fd4b50142fdc972851837caeb/
>
> OpenSSL parallel issue, should be fixed by
> http://patchwork.ozlabs.org/patch/546655/.
>
>>      powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/ec82752a6b20ed92beb703f68f591faf27b7724e/
>>      powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/763d9aff86085b67077fc665e462cee81962246d/
>
> Smells like wchar support is needed. Gustavo, can you have a look ?
>
> BTW, it seems like this package also needs thread support, according to
> http://autobuild.buildroot.org/results/ed4/ed410283871926f61175326dc7f2b48fee9038b9/build-end.log.
> Would be good to fix this at the same time.
>
>>          arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6adb592c80c8cc32abf2c16f8cf28ed372998d69/
>>          arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/1bf04bb4c3266023bed2753be41f7ad3fa7e8cfb/
>>          arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fff9b710f329320e535ccb7b8026984932c17d9d/
>
> Weird error:
>
> Source/LibWebP/./src/dsp/dsp.upsampling_mips_dsp_r2.c:37:34: error: invalid character ' ' in raw string delimiter
>        "shll_s.w         %["#R"],      %["#R"],        9              \n\t"     \
>                                   ^
>
> it seems to try to use some MIPS instructions on ARM. R?mi, you added
> the libfreeimage package, can you have a look at this issue ?
>
>>      powerpc |                libgtk3-3.14.15 | NOK | http://autobuild.buildroot.net/results/aae4266c16189b295cc7ceb60000c504ebb60752/
>
> gdkwindow-wayland.c:50:34: error: redefinition of typedef 'GdkWaylandWindow'
> ../../gdk/wayland/gdkwaylandwindow.h:32:34: note: previous declaration of 'GdkWaylandWindow' was here
>
> libgtk3 is for Gustavo :-)
>
>>      sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/a8dd84320e98d9a5021a7d9e69be1bd48352a55e/
>>      sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/5caa3a9566acf21f10a0ac2b66196fc8aeb68f38/
>
> Fixed by
> http://git.buildroot.net/buildroot/commit/?id=5972ea48c3515dd0ca28f5df101d71a2672256f6.
>
>>      arm     |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/fcf029714e5ba93049fe64c593ec048b2452aea5/
>
> ../../../src/common/.libs/libcommon.a(mi-lttng.o):(.data.rel.ro.local+0x0): multiple definition of `mi_lttng_element_snapshots'
> commands/enable_events.o:(.bss+0x48): first defined here
> collect2: error: ld returned 1 exit status
>
>>      arm     |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/0f1e015a0c5a5ac2beeb5011d31a1e0058a32a0d/
>
> checking for poptGetContext in -lpopt... no
> configure: error: Cannot find libpopt. Use LDFLAGS=-Ldir to specify its location.
>
> Samuel, you updated lttng-tools many times. Can you have a look at those issues?
>
>
>> arc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/6baca535cf492f23112e39e4ced677a969e15d64/
>
>   CXXLD    gallium_dri.la
> collect2: error: ld terminated with signal 11 [Segmentation fault]
>
> Alexey, this looks like an ARC toolchain bug.
>
>> microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/5b50695350b48cff6ac2eecd4cf9d7b2fb5c1beb/
>
> ./.libs/libglsl.a(glsl_parser_extras.o): In function `_mesa_glsl_compile_shader':
> (.text+0x3588): undefined reference to `__sync_val_compare_and_swap_1'
>
> I'm tempted to simply mark mesa3d as not available on microblaze. Bernd, any suggestion?
>
>
>> arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/e31d8f707ba7e976c84f860cbb944946146ef940/
>
> Fixed by http://git.buildroot.net/buildroot/commit/?id=de5bfeac56da3a49fadad9c60898bea4fadf54dd.
>
>
>> arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/8502e0d7bf88ab417059eae38c30ca629baf3077/
>> arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/669da3f122600ada97f47899ab6007d63d72b6d9/
>
> Could be fixed by http://patchwork.ozlabs.org/patch/514799/, but I
> don't quite understand the patch. Anyone willing to look into this?
>
>> sparc |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/8dcf5f73904de835bf66c46747cd544efc9d3a22/
>
> undefined reference to `__atomic_fetch_or_4'
>
> Waldemar, can you have a look ?
>
>> mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/963fc29a13ac5eedc31a6bc7fae3cedd22df2fcd/
>
> I guess fixed by http://git.buildroot.net/buildroot/commit/?id=2619ccbb948c6c7c383e95607e82eb1c304992d1.
>
>> x86_64   |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/cb0fe5b1c1dcdaa17b0290e5f1dca4bdc44036da/
>
> Ditto.
>
>> x86_64   |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/69a31bd69feb00da37cfa692ebe2f70ebf7e6092/
>
> Ditto.
>
>> i686     |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/dd599d83135ab25aebbdaf20e71d57075c9d5956/
>
> CC      libavcodec/x86/hpeldsp_init.o
> libavcodec/x86/hpeldsp_init.c: In function 'hpeldsp_init_mmxext':
> libavcodec/x86/hpeldsp_init.c:218:31: error: 'put_pixels16_y2_mmxext' undeclared (first use in this function)
>      c->put_pixels_tab[0][2] = put_pixels16_y2_mmxext;
>
> Bernd ?
>
>> mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/6ec4ed18cfaf46a0cfcbab8f1cd91f51aff72ea3/
>> mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/84f1cebf5d7852326b26775c1f533c34109ce3f6/
>> mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/db15632598d65044e63bdfe0ec4143db75a13d7d/
>
> Fixed by http://git.buildroot.net/buildroot/commit/?id=694fa0e332f8b3894a606619263c6ae38e4f6e20.
>
>> arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/73330e51b3c099d179004db0b9522ac13358b8f7/
>
> Fixed by http://git.buildroot.net/buildroot/commit/?id=508bb46bade489ca9eeff6e681548e7ba97f4330.
>
>> x86_64 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/bc3cca6e6a906afa4c57dcddfb4a9ecd0cb44398/
>
> Fixed by http://git.buildroot.net/buildroot/commit/?id=154c3ea73206ee7115b1730cfa1aaaec50374c07
>
>> aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e279f503b9c9d91e40b4009ff56f6f8ddebe10a1/
>> aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d6731774fe1a459dc42a213766ffba021c4e3129/
>> aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c0150ea76171b5b068bf3a1f58e99ad44a48e2d5/
>> aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/422e226f6c83d51fc6e4dbebea7ab980856050d1/
>
> I need to update my autobuild-run script it seems.
>
>> arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/150fa803fc3b65f75dce2847907ee768fc94c7a7/
>> arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/fc97e1ac52d40ced6a5f9cd980d7f448c98e5c78/
>> arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/64dac2a7e5a757ed23060c550b7d56f54659a368/
>
> ustr doesn't play well with gcc 5 it seems. Clayton, can you have a look ?
>
>> arc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/75960db671807091fe9155aee9e46a6245e32590/
>
> checking for prlimit... no
> configure: error: flock selected, but required timer_create function not available
>
> Not sure. Alexey ?
>
>> arm |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/420aa5dfc4dcac0f2fb4c7305bf42c249a335084/
>
> Fixed by http://git.buildroot.net/buildroot/commit/?id=868970bbaeba22fd8911ed5d32a7f9882d2f04b1.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
