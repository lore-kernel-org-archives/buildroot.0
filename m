From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 21:45:35 +0100
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2016.09-rc1
In-Reply-To: <1479146197-41383-1-git-send-email-vzakhar@synopsys.com>
References: <1479146197-41383-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161114214535.02025d6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 20:56:37 +0300, Vlad Zakharov wrote:
> As described at:
> 4520524ba055706236db9f00dd79f1b2e2e87fde
> this commit continues a series of updates of ARC tools.
> This time we're updating tools to arc-2016.09-rc1.
> 
> This update contains a lot of important fixes, e.g. it fixes:
> http://autobuild.buildroot.net/results/4c7/4c77f33c842b37bf28cb931edf1b290e1bf4d93c//
> http://autobuild.buildroot.net/results/902/902729a0b98675ad803939e3ecdcf230065a6012//
> and other failures.
> 
> Other important change is that we also update gdb. Now we are
> using gdb 7.12.
> 
> This version of gdb requires C++ toolchain support so we add
> corresponding dependency to gdb Config.in file.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Thanks. Even though it's a bump of a major component, it's fixing some
annoying build issues, and I guess a "rc" release is better than the
"engineering builds" we were using so far, so I've applied to master.
However, I had two things to fix before applying, see below.


> +	# Since ARC gdb moved to 7.12 toolchain requires C++ support to build gdb.
> +	depends on !BR2_arc || BR2_TOOLCHAIN_BUILDROOT_CXX

BR2_TOOLCHAIN_BUILDROOT_CXX is not correct here. This symbol only makes
sense in the context of the internal toolchain backend. But the target
gdb package makes perfect sense even when an external toolchain is
used.

To add a dependency on C++ support, you must use the
BR2_INSTALL_LIBSTDCPP symbol. This one is valid regardless of whether
you're using the internal toolchain backend or the external toolchain
backend.

Also, you forgot to add a comment about this C++ dependency, so I've
added it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
