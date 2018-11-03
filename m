From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:20:20 +0100
Subject: [Buildroot] [PATCH 4/4] scripts/check-bin-arch: fix failure
 with bpf
In-Reply-To: <20181103122758.10578-4-fontaine.fabrice@gmail.com>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
 <20181103122758.10578-4-fontaine.fabrice@gmail.com>
Message-ID: <20181103142020.0d7e9005@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Nov 2018 13:27:58 +0100, Fabrice Fontaine wrote:
> Do not return an error if architecture is "Linux BPF" (in-kernel
> bytecode machine)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c18fb7f1ac81496db9c3a4e91ea028a26ca600b0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  support/scripts/check-bin-arch | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> index 7f97696735..a0de7a6ac4 100755
> --- a/support/scripts/check-bin-arch
> +++ b/support/scripts/check-bin-arch
> @@ -74,6 +74,11 @@ while read f; do
>  		continue
>  	fi
>  
> +	# If architecture is Linux BPF (in-kernel bytecode machine), continue
> +	if test "${arch}" = "Linux BPF" ; then
> +		continue
> +	fi

In the build failure
http://autobuild.buildroot.org/results/c18fb7f1ac81496db9c3a4e91ea028a26ca600b0/build-end.log
that you point, the architecture is reported as "None", not as "Linux
BPF". Am I misunderstanding something here ?

As a first step, could we explicitly disable building BPF protocols,
before we merge the necessary LLVM/V4L logic to build these properly ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
