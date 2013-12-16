From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Dec 2013 10:29:55 +0200
Subject: [Buildroot] [PATCH] oprofile: fix install for avr32
In-Reply-To: <1387182318-21445-1-git-send-email-spdawson@gmail.com>
References: <1387182318-21445-1-git-send-email-spdawson@gmail.com>
Message-ID: <20131216082955.GG3807@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Mon, Dec 16, 2013 at 08:25:18AM +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> There is no perf_events support in the kernel for avr32. The oprofile
> package makefile hard codes the list of binaries to install. Unfortunately,
> this hard-coded list contains pe_profiling/operf, which is only built when
> perf_events support is available.
> 
> Fixes autobuild failures such as the following.
> 
>   http://autobuild.buildroot.net/results/492/492659bc252395a62e62e6005ed0e86e582dcada/
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/oprofile/oprofile.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
> index 186e30c..ee94d19 100644
> --- a/package/oprofile/oprofile.mk
> +++ b/package/oprofile/oprofile.mk
> @@ -16,7 +16,14 @@ OPROFILE_CONF_OPT = \
>  OPROFILE_AUTORECONF = YES
>  OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
>  OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
> -OPROFILE_BINARIES += utils/op-check-perfevents pe_profiling/operf libabi/opimport
> +OPROFILE_BINARIES += utils/op-check-perfevents libabi/opimport
> +
> +# No perf_events support in kernel for avr32
> +ifneq ($(BR2_avr32),y)
> +OPROFILE_BINARIES += pe_profiling/operf
> +endif
> +
> +OPROFILE_MAKE = $(MAKE1)

Is this change intended? Have you encountered problems with parallel build?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
