From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 00:06:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-08-07
In-Reply-To: <20150808063018.735131014E7@stock.ovh.net>
References: <20150808063018.735131014E7@stock.ovh.net>
Message-ID: <20150809000631.487d0954@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Bernd, Alexey, Angelo, Vicente, Will, see below there are some
questions for you! :-)

On Sat,  8 Aug 2015 08:30:18 +0200 (CEST), Thomas Petazzoni wrote:

>          arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/46054f28d3fde173dd8f880fa8ac2784c8e1750f/

Fixed by:

	http://git.buildroot.net/buildroot/commit/?id=feaa241ce35de6c6b8c0ad6fa6a8c0e669919037

>        sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/b0ef923267153f1df0bd863f7c5175e8ce1789c3/

This particular issue can be solved by doing:

+ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
+BDWGC_CFLAGS += -DAO_NO_SPARC_V9
+endif

However, then there is another build failure in bdwgc on SPARC. This
build issue is fixed in bdgwc master, but not in the latest release,
and it's not trivial to backport it. Since bdwgc is only used for
guile, I would propose for now to mark it as not available on SPARC.

Does anyone disagree with this proposal?

>          arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2658feb999f457c4d88342f822c03aa7f9f983ed/
>          arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2e3e004d1b53e9b01d6071452ab2c95c1855f0d7/

Alexey, still the same issue. Should I make boost unavailable on ARC for now?

>       x86_64 |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/ebfc9a44a305ab45305f8b393761304576ae9077/
>          arm |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/5322032525dff6a6f2c99ec09bff47b99566b2a5/

Both fixed by http://git.buildroot.net/buildroot/commit/?id=60974ee92dd8ff9e43cc6b785ea5131a8851e74c

>        sparc |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/a5d34ef58d45be6fe0b6c8a71ed665d5dc29dfd9/

Fixed by http://git.buildroot.net/buildroot/commit/?id=c5e96d8935016456bea342db170ae6a139a8470f

>       x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/66a5cea527ce4624b378e049243d0a8d89b33530/

Would be fixed by a rebuild of the toolchain (in progress).

>         bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/d51f51bb9554a8d4ae5d0f6e7de6533a66ccfe0d/
>         bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/38a6a6208abe10e8e159da970940f95ff8358b02/
>         bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/7faa7fce7b03be8ec7fd541535d74f7c6fe8a8fd/

Fixed by http://git.buildroot.net/buildroot/commit/?id=cf4bdbe74d5d8a45286facd58bfbaf9a3c8af71f

>          arm |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/631e7ecd468e258279486fc95844a0ddd328a12f/

musl build issue.

>          arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/2e46630d655596aa13ee3704c4d0c5ac5b66d8bb/

musl build issue, _WORDSIZE is not defined.

>          arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/ee7eaf80247dd96548d66be9884b179e20204a98/

Fixed by http://git.buildroot.net/buildroot/commit/?id=eb60820c0a9b3f938f32516f24df2eee9aac1e26

>          arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/e0fdfc9782c0529983d6a868dc17daf4035c20b0/
>       xtensa | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/db049849f2011d444cc2b299f40313c73b653f18/

Fixed by http://git.buildroot.net/buildroot/commit/?id=0b84959fbbe824e1a7e9918ffe49943046982c27

>          arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/5bc483843aa2f603f01795c9353c286893d5f839/

musl build issue, we need to use PTHREAD_MUTEX_RECURSIVE instead of
PTHREAD_MUTEX_RECURSIVE_NP on musl.

>          arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/701ec868bed18d18a99316c6f81c57013619566a/

Fixed by http://git.buildroot.net/buildroot/commit/?id=49593aba5a56c9c297c31c12fc4dc3de5679e7b1

>         i686 |                 harfbuzz-1.0.1 | NOK | http://autobuild.buildroot.net/results/3dac814296ebb514b1dc086ae7fd7d0aa0a33405/
>        sparc |                 harfbuzz-1.0.1 | NOK | http://autobuild.buildroot.net/results/dc02e3a1c94f06c3a8ffebbfe437b854600692e6/

Romain Naour said that the issue is:

configure:18553: checking for CAIRO
configure:18560: $PKG_CONFIG --exists --print-errors "cairo >= 1.8.0"
configure:18563: $? = 0
configure:18577: $PKG_CONFIG --exists --print-errors "cairo >= 1.8.0"
configure:18580: $? = 0
configure:18594: result: no
Package glesv2 was not found in the pkg-config search path.
Perhaps you should add the directory containing `glesv2.pc'
to the PKG_CONFIG_PATH environment variable
No package 'glesv2' found
 
configure:18624: error: cairo support requested but not found

>        sparc |                     libev-4.19 | NOK | http://autobuild.buildroot.net/results/55d6190b60a08c9bc4d659cf009df52388db676a/

Fixed by http://git.buildroot.net/buildroot/commit/?id=bb9502a7e01fc340145d8e91aea5466a7d2d0913

>          arm |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/17aac78e49d016b1044be4e600033b85a3420c5b/

Fixed by http://git.buildroot.net/buildroot/commit/?id=5e554d3c787648c0785079551dc9f64a701a7f63

>       mipsel |                libplayer-2.0.1 | NOK | http://autobuild.buildroot.net/results/fc0d3e8d6a819193edc414d5048419aad3fde8a7/

Static linking problem, gstreamer plugins forget to link with libm. But
well, who cares about building GStreamer statically anyway?

>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/f252d616c90829304f5c5c4d7a25012b40769c62/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/7f871263c2342e050034e359870cde72b6ddb986/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e92bcb6a3b671fe61453d5c616ef6e4e8e31a150/

I'm tempted to mark libselinux as not available on ARC for the moment.
Alexey?

>          arm |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/5eef099e82e7a65d9b459d88fcb82b468ccf8fed/

Bernd, can you confirm that doing a pure static build of mesa3d is not
supported? Or is it only in some cases?

>      powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/160539b688ac134784af885359515e5e8f1351a2/

Angelo, can you have a look?

>          arm |                 netatalk-3.1.7 | NOK | http://autobuild.buildroot.net/results/79e55e64885d64392407e830560175c556953a20/

Fixed by http://git.buildroot.net/buildroot/commit/?id=af84025bc84fe56f1328bb96bb0676c22fce7c5e

>        sparc |                     ofono-1.16 | NOK | http://autobuild.buildroot.net/results/c7fc69066013a4f523509dd2ffd3154558cc60e8/

SPARC atomic issue.

>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/0bed0779685d9ed83466a4d29a0281ca93043a2e/
>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/6df58ac5a4d224bde899840d37280b42e66f4396/

Worked around by http://git.buildroot.net/buildroot/commit/?id=d21932508e69d4ab849cba9958f953ae9342cb8c

>          arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/0231c9d6bda7862970bb49e2b54d4edaeffb1748/
>          arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/6be3c49623d308bcf9888e0e7e4f52dac199f37d/

Not sure what's going on.

>         i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/a698f81ff4667a94c75592d907a26bbc8aca73d4/
>         i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/d020af055f1192876758d32026fb6a88240c0d5d/

internal compiler error: in assign_by_spills, at lra-assigns.c:1281

This is a compiler bug, on a Crosstool-NG toolchain. I'll just add an
exception in the autobuilder script.

>        sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d1c30ce27ff8cc6b19c3130f46a4109ad04bd74b/

SPARC atomic issue.

>         mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/7fe96e575bc7390af0e397edf5b8722e70d978da/
>         mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/54f32e19796dbcb62fd19768d1121a1e7f40bc91/
>     mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/86bd540d16b3ca8819eec1094bf4925216fd1f35/
>         mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/09f8575202cc8791230e6ce4a501183b26cb2171/

Vicente, can you give some feedback on these? Otherwise I'll mark Qt5
as not available on MIPS for the upcoming release. Thanks!

>         i686 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/b7380afc69646c5df1c84a6d6fc0174c3be32ede/

The GStreamer issue, under investigation/discussion with Julien Corjon.

>          arm |    qt5quickcontrols-legal-info | NOK | http://autobuild.buildroot.net/results/2b0b4c170dfa0d95c10bf030e6f249b3305dd318/

Fixed by http://git.buildroot.net/buildroot/commit/?id=73db4ab6abb5b3f4cebb9cd8bae93319e3a96a61

>         i686 |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/3774f53e42b2cf8cd05a59beb7889234f17a6e0b/

undefined reference to `leveldb::NewMemEnv(leveldb::Env*)'

Peter said a while ago:

"""
The package apparently has an optional dependency on leveldb, but we
don't explicitly handle that and it looks like it forgets to link
against it:
"""

See http://lists.busybox.net/pipermail/buildroot/2015-May/128766.html.
Anyone to look into this?

>      powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/d98c9febc713404ee41ea494b8dbc183e25ce7bb/

error: declaration of 'now' shadows a global declaration

See https://github.com/systemd/systemd/issues/406 for the related
discussion. A suggestion is to pass
cc_cv_CFLAGS__Werror_implicit_function_declaration=no to the configure
script. Anyone to test this out and submit a patch?

>          arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/2b1aa474fc432f3f79b03c4577d68642bb7e0f9c/
>          arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/e16588f02f1f576e8769ddd7be997904fdfd5ba1/

BFD (GNU Binutils) 2.23.2 assertion fail elf32-arc.c:3074

Alexey, that's a toolchain issue.

>      powerpc |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/d6a7125c21b4f92b69bb9e30b05c4727eedb63ba/

checking for SSL_library_init in -lssl... no
configure: error: ** Unable to find OpenSSL libraries!
make: *** [/home/peko/autobuild/instance-1/output/build/tn5250-0.17.4/.stamp_configured] Error 1

static linking issue.

>      aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/5568935d610b58a9173efbaba29c6a644277e848/

internal compiler error: in simplify_const_unary_operation, at simplify-rtx.c:1539

Will, this is with the Linaro AArch64 compiler. Has this been fixed?

>         mips |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/21a1e4d8f01959c65b7feae2e0170e4a5afa84e7/
>          arm |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/f26018d5ad62bc7b61623dd173dc1e92e2c958a4/
>      aarch64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/2e12f1a91812f027d89fcceeb41d6c88ef7b9d32/
>         i686 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/b9a3df05b479025d690982518f23f0bcf6fb7303/

DRI/DRM related issues. Bernd submitted more patches, I'll have a look.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
