From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 14:54:13 +0200
Subject: [Buildroot] [PATCH] ci20_defconfig: disable madd instructions
 to avoid FPU bug
In-Reply-To: <20161018122421.64118-1-Vincent.Riera@imgtec.com>
References: <20161018122421.64118-1-Vincent.Riera@imgtec.com>
Message-ID: <20161018145413.37ae0751@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 13:24:21 +0100, Vicente Olivert Riera wrote:
> MIPS Creator CI20 has an Ingenic JZ4780 SoC which features an XBurst
> CPU. The FPU on that CPU has a bug that can generate incorrect results
> in certain cases. The problem shows up when you have several of these
> instructions in sequence with dependant operands.
> 
> Using the -mno-fused-madd option prevents gcc from emitting these
> instructions.
> 
> More details here:
>  - https://groups.google.com/forum/#!topic/mips-creator-ci20/spDB2jjbizM
>  - https://android.googlesource.com/platform/build/+/90ce45347064210585a3a1f59a0514c22c753c8a
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  configs/ci20_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
> index 0455170..1894554 100644
> --- a/configs/ci20_defconfig
> +++ b/configs/ci20_defconfig
> @@ -8,6 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
>  
>  # system
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
> +# Avoid FPU bug
> +BR2_TARGET_OPTIMIZATION="-mno-fused-madd"

Unfortunately, this means that other people using the same MIPS CPU,
but not using your defconfig will fall into this issue.

For the Intel X1000, which also had a bug, we've added a separate
entry in arch/Config.in.x86. Should we be doing the same here for this
MIPS CPU ?

Note: this is *really* a question. I am not sure we want to make such a
change to the MIPS CPU selection.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
