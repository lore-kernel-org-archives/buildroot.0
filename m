From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 09:40:00 +0100
Subject: [Buildroot] [PATCH] package/tpm2-tss: wip: bump to version 2.3.3
In-Reply-To: <20200220214530.20200-1-peter@korsgaard.com>
References: <20200220214530.20200-1-peter@korsgaard.com>
Message-ID: <20200223084000.GI8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

Title fixed.

On 2020-02-20 22:45 +0100, Peter Korsgaard spake thusly:
> Bugfix release, fixing a number of issues:
[--SNIP--]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[--SNIP--]
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index 08090204ff..470020857a 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
[--SNIP--]
> @@ -17,4 +17,13 @@ TPM2_TSS_AUTORECONF = YES
>  # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
>  TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
>  
> +# The 2.3.3 tarball accidently contains a Makefile-fuzz-generated.am
> +# with content from a fuzz testing run rather than an empty file,
> +# confusing autoreconf with
> +# 0001-configure-Only-use-CXX-when-fuzzing.patch
> +define TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
> +	truncate -s 0 $(@D)/Makefile-fuzz-generated.am

Use of truncate is rather heavy-handed here...
    printf '' >$(@D)/Makefile-fuzz-generated.am

But I just applied to master as-is, thanks.

Regards,
Yann E. MORIN.

> +endef
> +TPM2_TSS_POST_PATCH_HOOKS += TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
> +
>  $(eval $(autotools-package))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
