From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:13:57 +0100
Subject: [Buildroot] [PATCH v2] trousers: Pass "-mno-compact-casesi"
 when building for ARCv1
In-Reply-To: <1479811345-23400-1-git-send-email-vzakhar@synopsys.com>
References: <1479811345-23400-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161125221357.0ab65b14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 13:42:25 +0300, Vlad Zakharov wrote:
> Compact casesi patterns don't have a reload version. This causes build
> failures of "trousers" package for ARC.
> 
> Current patch disables compact casesi patterns for ARCv1 (750D and 770D)
> via passing "-mno-compact-casesi" option when compiling "trousers".
> 
> This change is a temporary workaround and the feature is going to be
> fixed in the next ARC toolchain release version.
> 
> Fixes:
> http://autobuild.buildroot.org/results/d2c/d2c16d8ba022b070c4dbeba5e7ea41f14d706691//
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

We still have a build failure of the trousers package on ARC, see:

  http://autobuild.buildroot.net/results/1e7/1e730465c79f50143b0ca2366a3c07ea5e8648b1/build-end.log

The failure is:

(jump_insn 34 262 35 5 (parallel [
            (set (pc)
                (unspec:SI [
                        (reg:SI 14 r14 [165])
                    ] UNSPEC_ARC_CASESI))
            (use (label_ref 35))
            (clobber (scratch:SI))
        ]) tspi_context.c:145 130 {casesi_compact_jump}
     (expr_list:REG_DEAD (reg:SI 14 r14 [165])
        (nil))
 -> 35)
tspi_context.c:325:1: internal compiler error: in find_reloads, at reload.c:3830
Please submit a full bug report,
with preprocessed source if appropriate.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
