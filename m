From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 22:53:23 +0200
Subject: [Buildroot] [PATCH] gcc: ARC Fix conditional move contstraint.
In-Reply-To: <1472203712-27459-1-git-send-email-vzakhar@synopsys.com>
References: <1472203712-27459-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160826225323.1a57ae0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vlad, Alexey, Eugeniy,

On Fri, 26 Aug 2016 12:28:32 +0300, Vlad Zakharov wrote:
> The patch solves one of the ARC internal compiler issues.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1c4/1c4493c6a18b7a93a0368420c8f79032f9330891//
> http://autobuild.buildroot.net/results/510/51071b790866b0c7083de3a94ad2a427009096af//
> http://autobuild.buildroot.net/results/09e/09e037c628ca2a27d8eb832dd070f50ec7ebb72a//

FWIW, this last build issue is *not* fixed by this patch. This last
build failure is on mesa3d, with:

main/get.c: In function '_mesa_GetBooleani_v':
main/get.c:2320:1: error: insn does not satisfy its constraints:
 }
 ^
(insn 79 72 80 7 (set (reg/f:SI 147 virtual-stack-vars)
        (reg:SI 2 r2)) main/get.c:2315 3 {*movsi_insn}
     (nil))
main/get.c:2320:1: internal compiler error: in extract_constrain_insn, at recog.c:2190
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.

And the build result
http://autobuild.buildroot.net/results/5cc/5ccb47e2af780982d71d924ef30008f16573ad73//build-end.log
is the *exact* same failure, but at commit
https://git.buildroot.net/buildroot/commit/?id=2567f6f2f34a1ecfc25604bf8bf93b8bc065fc63,
which is *after* I committed and pushed your ARC fix (and the
configuration was using the internal toolchain backend, so the
toolchain was built from scratch).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
