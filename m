From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:52:24 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/x265: bump version to
 2.1"
In-Reply-To: <20161106161924.9791-1-bernd.kuhls@t-online.de>
References: <20161106161924.9791-1-bernd.kuhls@t-online.de>
Message-ID: <20161106225224.5283ba8e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 17:19:24 +0100, Bernd Kuhls wrote:
> This reverts commit 1ba7b6a4f12977aec994c4f38d5be38cfdb27846.
> 
> Adding -DCROSS_COMPILE_ARM=ON to _CONF_OPTS will not fix the build:
> 
> /home/buildroot/br2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/gnu/stubs.h:7:29:
>   fatal error: gnu/stubs-soft.h: No such file or directory
> 
> because cross-compiling x265 is only supported for soft-float abi:
> https://bitbucket.org/multicoreware/x265/src/583fc74fc0a29f330187dbd78151c30a3e03d5a7/source/CMakeLists.txt?at=default#CMakeLists.txt-211
> 
> Fixes
> http://autobuild.buildroot.net/results/6ec/6ec75cc176e05bfc6287dc54fa1a53e0ffc0521d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied to master as a temporary measure. But the real fix is to
report the problem upstream, and to tell them to stop hard-cording silly
CFLAGS in their CMakeLists.txt. The only one that potentially makes
sense is -mfpu=neon when NEON support is enabled. All the other ones
should be removed.

Could you work on this with upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
