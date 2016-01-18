From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 21:39:09 +0100
Subject: [Buildroot] [PATCH v2] libffi: fix the build for MIPS
 soft-float with recent compilers
In-Reply-To: <1453135700-2404-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1453135700-2404-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160118213909.615d016a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Mon, 18 Jan 2016 16:48:20 +0000, Vicente Olivert Riera wrote:
> Recent MIPS compilers have an stricter agreement between the compiler
> and the assembler on the ABI. The compiler now passes -msoft-float to
> the assembler where it previously did not.
> 
> libffi uses MIPS hard-float instructions so when we try to build it for
> soft-float using a recent compiler it fails because of the explained
> above. This package should be fixed in order to add support for
> soft-float.
> 
> In the meantime we can add a little hack in order to be able to build it
> for soft-float. Basically we add ".set hardfloat" so the assembler will
> not disable the hard-float instructions. The build will of course
> include some hard-float bits which shouldn't exist in a soft-float
> build, and that may cause runtime problems. But that's what we already
> had before and we had lived with it.
> 
> We choose to apply this temporary fix because it only affects MIPS
> soft-float builds. Otherwise we would need to disable libffi and
> recursively all the packages depending on it (python, libglib2...) for
> MIPS soft-float, which would be a bit overkill.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/6b0607b7cb0ac5525c2e47e819301f38bd2d6b30/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - Add autobuild URL

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 (building with our Sourcery MIPS configuration fails without the
 patch, works with this patch applied.)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
