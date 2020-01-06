From: Vincent Fazio <vfazio@xes-inc.com>
Date: Mon, 6 Jan 2020 12:20:04 -0600
Subject: [Buildroot] [PATCH 1/1] check-kernel-headers: allow safe
 version mismatches
In-Reply-To: <20191205202554.18273-1-vfazio@xes-inc.com>
References: <20191205202554.18273-1-vfazio@xes-inc.com>
Message-ID: <b45e78f5-fc2c-094d-114e-fda933ff9782@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spoke with Yann on IRC about this

On 12/5/19 2:25 PM, Vincent Fazio wrote:
> Previously, if toolchain headers were versioned ahead of the latest
> selectable Buildroot toolchain header version, packages could not be
> built because of an explicit equality check. This forced the user to
> either advance the Buildroot repository or to rebuild their toolchain
> with a selectable, but older, version of headers.
>
> Now, we allow a toolchain's headers to outpace the latest selectable
> Buildroot toolchain header version. The header version dependencies in
> package configurations use "at least" version semantics, so newer
> toolchains still meet the requirement.
>
> Suggested-by: Aaron Sierra <asierra@xes-inc.com>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>   support/scripts/check-kernel-headers.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
> index 9d23c00feb..093df46510 100755
> --- a/support/scripts/check-kernel-headers.sh
> +++ b/support/scripts/check-kernel-headers.sh
> @@ -33,7 +33,7 @@ int main(int argc __attribute__((unused)),
>            char** argv __attribute__((unused)))
>   {
>       if((LINUX_VERSION_CODE & ~0xFF)
> -        != KERNEL_VERSION(${HDR_M},${HDR_m},0))
> +        < KERNEL_VERSION(${HDR_M},${HDR_m},0))
This check is OK _only_ if the header version selected is the latest 
version allowed by BR, so an additional Kconfig string value needs to be 
set, likely in toolchain/Config.in
>       {
>           printf("Incorrect selection of kernel headers: ");
>           printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},

support/scripts/check-kernel-headers.sh
 ??? needs to accept a 4th parameter for the latest BR version
 ??? needs to do the BR_HEADERS_LATEST == BR2_TOOLCHAIN_HEADERS_AT_LEAST 
&& (LINUX_VERSION_CODE && >= BR_HEADERS_LATEST) comparison in the 
generated C code

toolchain/helpers.mk
 ??? check_kernel_headers_version needs a 4th argument
 ??? pass the 4th argument to check-kernel-headers.sh

toolchain/toolchain-external/pkg-toolchain-external.mk
 ??? needs to pass the 4th argument to check_kernel_headers_version

package/linux-headers/linux-headers.mk
 ??? probably needs to pass the 4th argument to check_kernel_headers_version


-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
