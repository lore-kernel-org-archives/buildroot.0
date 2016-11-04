From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Nov 2016 09:38:02 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-11-02
In-Reply-To: <20161104053622.GA16857@tungsten.ozlabs.ibm.com>
References: <20161103073820.767FB106BDD@stock.ovh.net>
 <20161104053622.GA16857@tungsten.ozlabs.ibm.com>
Message-ID: <20161104093802.722c0900@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[Adding Geoff in Cc. Geoff, there is a question for your below, thanks!]

On Fri, 4 Nov 2016 16:36:23 +1100, Sam Bobroff wrote:

> The docker-containerd errors are from the go linker, which I'm not
> familiar with. From this go issue:
> 
> https://github.com/golang/go/issues/13192
> 
> It might be that powerpc64 (BE) is just not supported yet. Should we
> just disable it for powerpc64?

The place where the architectures supported by Go is defined is
package/go/Config.in.host:

config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
        bool
        default y
        depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
                || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le \
                || BR2_mips64 || BR2_mips64el
        depends on !BR2_ARM_CPU_ARMV4
        # MIPS R6 support in Go has not yet been developed.
        depends on !BR2_MIPS_CPU_MIPS64R6

So, powerpc64 BE was explicitly included in this list. However, the
golang issue you're pointing at indeed seems to indicate that powerpc64
BE doesn't seem to be very well supported.

Geoff, you're the one who added powerpc64 in the list of supported
architectures in commit b6b718ca4bd1efa51674a824ff8d32a90a1d6584. Can
you comment a bit more on this, and the build issues we're facing on
powerpc64 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
