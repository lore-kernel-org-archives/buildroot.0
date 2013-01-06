From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jan 2013 12:06:37 +0100
Subject: [Buildroot] [PATCH] Fix installation of crosstool-ng libraries
	to target
In-Reply-To: <1357449105-14780-1-git-send-email-bos@je-eigen-domein.nl>
References: <1357449105-14780-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <201301061206.37057.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On Sunday 06 January 2013 Floris Bos wrote:
> When using the crosstool-ng toolchain option, the libc libraries were not installed to target.
> Buildroot calls the show-tuple function to determine the directory to copy from, and it seems
> that outputs the result to stderr instead of stdout
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> index 6f81e30..553c9ee 100644
> --- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> +++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> @@ -66,7 +66,7 @@ endif
>  # Actual copy
>  $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
>  	$(Q)mkdir -p $(TARGET_DIR)/lib
> -	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple) )";                     \
> +	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple 2>&1) )";                \

Indeed, that's going to stderr. That's a but in crostool-NG, it should go
to stdout. Will fix in ct-ng.

In the meantime:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
