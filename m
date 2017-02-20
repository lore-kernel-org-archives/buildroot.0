From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Feb 2017 08:35:29 +0100
Subject: [Buildroot] luaposix not working with luajit/lua5.1
Message-ID: <257db515-cfda-4122-55e9-b7783b28dfcf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Francois,

 Three years ago you submitted a patch that was supposed to fix luaposix by
adding the bitop module. However, with this defconfig:

BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2017.02-rc1-2-g133c5ac.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LUA=y
BR2_PACKAGE_LUA_5_1=y
BR2_PACKAGE_LUAPOSIX=y

 I get:
# chroot output/target /usr/bin/lua -e 'require "posix"'
[sudo] password for arnout:
/usr/bin/lua: /usr/share/lua/5.1/posix/init.lua:17: module 'bit32' not found:
        no field package.preload['bit32']
        no file './bit32.lua'
        no file '/usr/share/luajit-2.0.4/bit32.lua'
        no file '/usr/local/share/lua/5.1/bit32.lua'
        no file '/usr/local/share/lua/5.1/bit32/init.lua'
        no file '/usr/share/lua/5.1/bit32.lua'
        no file '/usr/share/lua/5.1/bit32/init.lua'
        no file './bit32.so'
        no file '/usr/local/lib/lua/5.1/bit32.so'
        no file '/usr/lib/lua/5.1/bit32.so'
        no file '/usr/local/lib/lua/5.1/loadall.so'
stack traceback:
        [C]: in function 'require'
        /usr/share/lua/5.1/posix/init.lua:17: in main chunk
        [C]: in function 'require'
        (command line):1: in main chunk
        [C]: at 0x00402068

 Am I missing something?


 I've worked around this by using the bit32 module instead of the bitop module.
I can submit this patch but I first wanted to check if I just did something wrong.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
