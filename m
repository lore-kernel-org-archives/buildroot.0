From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 14:33:57 +0200
Subject: [Buildroot] [PATCH v2] package/upmpdcli: add patch to fix error
 not detecting jsoncpp
In-Reply-To: <20160925141152.13952-1-joerg.krause@embedded.rocks>
References: <20160925141152.13952-1-joerg.krause@embedded.rocks>
Message-ID: <20161009143357.56643d6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Sep 2016 16:11:52 +0200, J?rg Krause wrote:
> Fixes:
> http://autobuild.buildroot.net/results/205463c9ea8651911972c2835e28ded1912c811a
> http://autobuild.buildroot.net/results/5e9279ee60c11a3dacacf6d78f87f8d1b92968f5
> http://autobuild.buildroot.net/results/97043f8defd5a59ae39b4c7f095a10d15c7fe632
> http://autobuild.buildroot.net/results/e775126d5939093289b1a833dd6323ac293322ed
> .. and many more.
> 
> libmpdclient, libmicrohttpd and jsoncpp provide a .pc file. Use
> pkg-config for detecting the libraries and for providing the necessary
> details for compiling and linking.
> 
> The current build system of upmpdcli does not use PKG_CHECK_MODULES, but
> AC_LINK_IFELSE to detect jsoncpp. After bumping jsoncpp version from
> 1.7.2 to 1.7.5 the detection fails, because the test program does not
> compile anymore:
> 
> """
> In file included from
> /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/autolink.h:9:0,
>                  from
> /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/json.h:9,
>                  from test.c:1:
> /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:155:9:
> error: 'int64_t' does not name a type
>  typedef int64_t Int64;
>          ^
> /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:156:9:
> error: 'uint64_t' does not name a type
>  typedef uint64_t UInt64;
>          ^
> /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:158:9:
> error: 'Int64' does not name a type
>  typedef Int64 LargestInt;
>          ^
> /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:159:9:
> error: 'UInt64' does not name a type
>  typedef UInt64 LargestUInt;
>          ^
> In file included from
> /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/json.h:10:0,
>                  from test.c:1:
> /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/value.h:184:11:
> error: 'UInt64' in namespace 'Json' does not name a type
>    typedef Json::UInt64 UInt64;
> 
> [..]
> """
> 
> Instead of fixing the test program use PKG_CHECK_MODULES to check for
> jsoncpp. While we're on it, add it for libmpdclient and libmicrohttpd,
> too.
> 
> Upstream-status: https://github.com/medoc92/upmpdcli/pull/52
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2:
>  - fix typo in patch
> ---
>  ...ig-for-jsoncpp-libmpdclient-libmicrohttpd.patch | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 package/upmpdcli/0004-Use-pkg-config-for-jsoncpp-libmpdclient-libmicrohttpd.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
