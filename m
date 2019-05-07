From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 May 2019 00:24:02 +0200
Subject: [Buildroot] [PATCH] support/check-kernel-headers: Fixup
 couldn't compile linux rc version
In-Reply-To: <1557222665-9498-1-git-send-email-guoren@kernel.org>
References: <1557222665-9498-1-git-send-email-guoren@kernel.org>
Message-ID: <cfa74b88-11af-ba38-3158-325d8fc2bc48@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Guo,

On 07/05/2019 11:51, guoren at kernel.org wrote:
> From: Guo Ren <ren_guo@c-sky.com>
> 
> Sometimes we want to try newest kernel rc version, but the
> check-kernel-headers will prevent it.

 It would indeed be good if we would be able to use newer kernel headers without
requiring an update of Buildroot.

> In package/linux-headers we
> use BR2_TOOLCHAIN_HEADERS_AT_LEAST for checking, I think AT_LEAST means
> "<" not "!=".

 However, I think we should not treat it as "at least" in general, but only for
the "newer" case. In other words, I think we should add
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_NEWER (and the equivalent in
toolchain-external) which selects BR2_TOOLCHAIN_HEADERS_NEWER, and make the
check > 5.0 (rather than == something) in that case.

 It's a bigger change though.

 Regards,
 Arnout

> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  support/scripts/check-kernel-headers.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
> index a8cca78..4787678 100755
> --- a/support/scripts/check-kernel-headers.sh
> +++ b/support/scripts/check-kernel-headers.sh
> @@ -23,7 +23,7 @@ int main(int argc __attribute__((unused)),
>           char** argv __attribute__((unused)))
>  {
>      if((LINUX_VERSION_CODE & ~0xFF)
> -        != KERNEL_VERSION(${HDR_M},${HDR_m},0))
> +        < KERNEL_VERSION(${HDR_M},${HDR_m},0))
>      {
>          printf("Incorrect selection of kernel headers: ");
>          printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
> 
