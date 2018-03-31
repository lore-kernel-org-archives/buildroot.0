From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 21:02:53 +0200
Subject: [Buildroot] [RFC] lua: always use host-lua for
 host-luainterpreter
In-Reply-To: <20171021205457.18687-1-peter@korsgaard.com>
References: <20171021205457.18687-1-peter@korsgaard.com>
Message-ID: <20180331210253.255c6034@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 22:54:57 +0200, Peter Korsgaard wrote:
> Similar to how we do for openssl.
> 
> host-luainterpreter is only used by the luarocks infrastructure, and there
> is afaik no specific reason why the host lua variant must match the target one.
> 
> Luajit only supports a limited number of architectures, so building it for
> the host limits the architectures Buildroot can be used on (E.G. powerpc64
> autobuilders).
> 
> To fix this, always use host-lua.  Slightly rework lua.mk to ensure
> host-lua-5.1 is used when luajit is selected, and drop the logic for using
> host-luajit.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

This patch was from October 2017, I pinged Fran?ois on January 2018,
and got no feedback. I did a final test with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LUAJIT=y
BR2_PACKAGE_COXPCALL=y
BR2_PACKAGE_LUA_DATAFILE=y
BR2_PACKAGE_LUAJSON=y
BR2_PACKAGE_RINGS=y
BR2_PACKAGE_PROSODY=y
# BR2_TARGET_ROOTFS_TAR is not set

Which exercises the two places where host-luainterpreter is used:

 - The prosody package
 - The luarocks package infrastructure

And the build was successful.

So I've applied this patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
