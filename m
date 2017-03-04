From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 14:12:51 +0100
Subject: [Buildroot] Analysis of build results for 2017-03-03
In-Reply-To: <20170304072851.23E42206FA@mail.free-electrons.com>
References: <20170304072851.23E42206FA@mail.free-electrons.com>
Message-ID: <20170304141251.45ff73f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 08:28:51 +0100 (CET), Thomas Petazzoni wrote:

>          arm |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/ca48bb6291ca16e410edb83b5cdeb24847b6eaee

Still the issue with the odroid-mali OpenGL provider. I am going to
send a patch marking this package as broken, since this has remained
unfixed for a long time.

>     mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/7d0bf82a6741c7e688cc88f43137dfdb65a2aa62

This one is kind of interesting:

>>>   Collecting legal info
cp: cannot stat '/home/rclinux/rc-buildroot-test/scripts/instance-1/dl/linux-firmware-6d3bc8886517d171068fd1263176b8b5c51df204.tar.gz': No such file or directory

The linux-firmware has successfully been built, but it seems like the
tarball was removed from the $(DL_DIR) after the package was built. But
since the package is already sourced/extracted/built according to the
stamp file, it doesn't try to redownload it for legal-info.

Or am I mis-interpreting what could have happened?

>       x86_64 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/91d349c7fa72ef30f4ba09617ba80edf7a851b5c

uClibc issue, I already reported it upstream, a first time 3 months
ago, see
http://lttng-dev.lttng.narkive.com/Nh4hOgGt/lttng-tools-2-9-0-build-failures,
and a second time a week ago:
https://lists.lttng.org/pipermail/lttng-dev/2017-February/026921.html.

>          arm |                      php-7.1.1 | NOK | http://autobuild.buildroot.net/results/72df0b41eb4717c56e933cc6eb46ff8ffb851a05

/home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(regex.os): In function `re_match':
regex.c:(.text+0xafa0): multiple definition of `re_match'

Conflicting symbols between PHP and the C library. Gustavo, could you
have a look?

> microblazeel |                     putty-0.68 | NOK | http://autobuild.buildroot.net/results/ec169c9f6d8888857dee211d54044b121a27a003

./../unix/uxucs.c: In function 'mb_to_wc':
./../unix/uxucs.c:29:2: error: unknown type name 'mbstate_t'
  mbstate_t state;

I'd say that wchar support is needed for putty. Waldemar, do you confirm?

>          arm |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/f3632e98bc7c0cbb207615e0d32ef5d66cf81571
>       xtensa |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/adf7cf094c643a86133a8a02c441edd0841a5227
>     mips64el |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/82a0c9cf7e61582df6ee0b0678eeb1b924497f97
>          arm |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/2cb9284ad896ddc74abbdb123d67f4155c66d431
>          arm |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/5c0d8bec09c06ff2bc9d5209dfc838d5664191af
>     mips64el |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/cd8f4a5710a8d99cf4771074c9e88c725f94ad6e
>         i686 |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/211d815a47d80ac934ad1e0c4ad308fda2570423
>       xtensa |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/89635af528a23a9ecd1f964e082da1a46a5ff4f4
>          sh4 |     python-cherrypy-legal-info | NOK | http://autobuild.buildroot.net/results/9f400b435965f2f8ef140b43a9bb5a7c84e9834b

I've reverted python-cherrypy bump.

> microblazeel |         python-enum-legal-info | NOK | http://autobuild.buildroot.net/results/7fec1c7cde710f523263e74b1849f1f4488b7d26

Fixed by https://git.buildroot.org/buildroot/commit/?id=d4235a8372ccaa54bc8322361a41003837d005a4.

>     mips64el |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/2fc2e27275ae6232ea5b2d4412bc43d111a69506
>          sh4 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/7245185515d85e6939852bf3e2aca9992603bbc2
>          sh4 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/e68df3b0a12b582747ad25d3280ce989a99c0963
>          arm |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/0e9c2c0c75ddd25c422ea3cc7f941ad2c55841c3
>          arm |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/7e0703b3d8918f1419a0c0a9e22b3acbe52703e6
>         sh4a |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/9c14da2ea58c40039bcc8ad5bc95efaa60df8841
>          arm |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/58f4415a0165f30e2d7a642018af75aad7209c0c
>       mipsel |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/7b9894d966ea8ac61586d950d3a189ca298664b2
>       x86_64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/47ed8ced1beb63345b2d0f1876d7957800f88bbc
>    powerpc64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/b35297d28ec44d660ecad38d71b9f20a6137d04b
>      aarch64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/ebf8628796f697187e74a0e2d8e77858e96c482b
>      aarch64 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/29ca13a653b2c0cbe449d0b5d795558ce5e4df82
>     mips64el |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/30be98aa8f65b491bdde95e70910c42a77839351
>         i686 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/f564d825d9a84eff8183378dfbd22c7be6e2337a
>          arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/f8c84b2fc0d28e4bc1d2dca4f39b9fea95b5cf76
>          arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/dd9b087a0e907cbc36f0b870beba375c5fe5b17f
>         i586 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/5cc55472682bcb48f732267dd2d9073ce338c294
>     mips64el |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/a9c3c0e34ed8e6cb46a6a160d6cf39a114dddcff
>       mipsel |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/e3d1aad87848cf39d1499f5ceb2323d58f265309
>          arm |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/9a29b8a48884370d18d295b309aff6b28b93c297
>  powerpc64le |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/ec1acc73dd748fe5e15327209c134e01497e1490
>     mips64el |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/5388b1d2c22a1ee2284498ea6416c157173f4b56

All fixed by reverting the python-pyasn and python-pytrie version bumps.

>          arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/69c66f1876f0d8dba1bd71ee109df371577d8dda

Fran?ois is currently looking into this. Seems to be missing
functionality in uClibc. Let's see what Waldemar says.

>         or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e83db114b0285862322831f1f4eb5226ab3ecad8

Waldemar, this is an OpenRISC toolchain issue it seems, could you have
a look?

>         m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/d162663489cef4360272af54119ccaf5855d31a2

configure: error:  You need to have libssl installed to compile sngrep

>         or1k | x264-97eaef2ab82a46d13ea5e0... | NOK | http://autobuild.buildroot.net/results/b458c2dff0ecde61248f058092c6eeaa75039cfb

Invalid configuration `or1k-buildroot-linux-uclibc': machine `or1k-buildroot' not recognized
Unknown system , edit the configure

Weird, because we have lots of other weird architectures, and they
don't seem to cause a problem with x264.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
