From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:58:00 +0200
Subject: [Buildroot] [PATCH] package/uclibc: fix preadv/pwritev offset
 argument type
In-Reply-To: <20190513184811.20461-1-jcmvbkbc@gmail.com>
References: <20190513184811.20461-1-jcmvbkbc@gmail.com>
Message-ID: <20190514185800.3b4e9ea9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Max,

Thanks for the patch and all the investigation around this issue!

On Mon, 13 May 2019 11:48:11 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> preadv/pwritev don't provide separate version for 64-bit wide off_t,
> and default to 32-bit wide off_t, which results in a mismatch between
> declaration and definition for user programs built with
> -D_FILE_OFFSET_BITS=64.
> 
> Backported from: 423e49023eeb ("preadv/pwritev: fix offset argument type")

This Backported tag is not really relevant inside the Buildroot commit
log: indeed it refers to an upstream uClibc-ng commit. So I have moved
this line...

> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...3-preadv-pwritev-fix-offset-argument-type.patch | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch
> 
> diff --git a/package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch b/package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch
> new file mode 100644
> index 000000000000..2a20aecc8d20
> --- /dev/null
> +++ b/package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch
> @@ -0,0 +1,70 @@
> +From 1077d5bebffacfd4b09896ed890fb45a5b3c6dc6 Mon Sep 17 00:00:00 2001
> +From: Max Filippov <jcmvbkbc@gmail.com>
> +Date: Fri, 10 May 2019 07:13:19 -0700
> +Subject: [PATCH] preadv/pwritev: fix offset argument type
> +
> +preadv/pwritev don't provide separate version for 64-bit wide off_t,
> +and default to 32-bit wide off_t, which results in a mismatch between
> +declaration and definition for user programs built with
> +-D_FILE_OFFSET_BITS=64.
> +Make offset argument of both functions __off64_t.
> +This fixes test misc/tst-preadvwritev on xtensa.
> +

... here.

> +Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

And applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
