From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Oct 2019 13:45:00 +0200
Subject: [Buildroot] [PATCH 1/1] uacme: fix c99 detection on
 microblazeel, powerpc
In-Reply-To: <20191004095315.g6arwc7yy46c4o6u@einstein.dilieto.eu>
References: <20191004095315.g6arwc7yy46c4o6u@einstein.dilieto.eu>
Message-ID: <20191004134500.520a3437@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicola,

On Fri, 4 Oct 2019 11:53:15 +0200
Nicola Di Lieto <nicola.dilieto@gmail.com> wrote:

> Fixes:
> 
> microblazeel http://autobuild.buildroot.net/results/bc715a2f53f72630ae13e3d226e6a029915c4ee4
> powerpc      http://autobuild.buildroot.net/results/07d5e454ffd11527d70268681fe15e9de77379e4
> 
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
> ---
>  package/uacme/uacme.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
> index 999cc36..c920a90 100644
> --- a/package/uacme/uacme.mk
> +++ b/package/uacme/uacme.mk
> @@ -13,6 +13,10 @@ UACME_LICENSE = GPL-3.0+
>  UACME_LICENSE_FILES = COPYING
>  UACME_DEPENDENCIES = libcurl
>  
> +ifneq (,$(filter $(ARCH),microblazeel powerpc))
> +UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> +endif

This is not correct: as I told you privately, this issue is not at all
related to Microblaze or PowerPC architectures, but it's related to the
toolchain lacking wide-char support, and the AC_PROG_CC_C99 macro
testing C99 support using wide-char, even if in the end the package
doesn't need wchar support. You can try yourself: build an ARM
configuration without wide-char support, and you should get the same
problem.

So, the commit title should be:

	package/uacme: fix c99 detection on !wchar toolchains

and the code should be just:

UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'

i.e, unconditional.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
