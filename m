From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 5 Apr 2019 02:05:03 +0300
Subject: [Buildroot] [PATCH 1/1] infra/Makefile.in: Fix format_arg
 issues after bump gettext-tiny to c6dcdcd
In-Reply-To: <20190404224700.1346-1-vadim4j@gmail.com>
References: <20190404224700.1346-1-vadim4j@gmail.com>
Message-ID: <20190404230503.ohxfkac6extrghuv@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Fri, Apr 05, 2019 at 01:47:00AM +0300, Vadim Kochan wrote:
> After bump gettext-tiny to c6dcdcd there was change which enabled
> gettext's macroses by default in:
> 
>     https://github.com/sabotage-linux/gettext-tiny/commit/58187329ad9f00eb8c39379e7ee0b608dd14bab8
> 
> it leads libglib2 to fail with format_arg issues. So fix it by disabling
> these macroses and use rather external functions which requires linking.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
> I dont feel like this is a good solution actually. I need to clearly understand
> why just using gettext's macrosses does not work for libglib2. But anyway I am
> sending this patch to show the possible solution.
> 
>  package/Makefile.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index dc818a2c18..c719d39235 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -159,6 +159,9 @@ TARGET_HARDENED += -D_FORTIFY_SOURCE=2
>  endif
>  
>  TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> +TARGET_CPPFLAGS += -DLIBINTL_NO_MACROS=1
> +endif
>  TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>  TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> @@ -220,6 +223,9 @@ UNZIP := $(shell which unzip || type -p unzip) -q
>  APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
>  
>  HOST_CPPFLAGS  = -I$(HOST_DIR)/include
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> +HOST_CPPFLAGS += -DLIBINTL_NO_MACROS=1
> +endif
>  HOST_CFLAGS   ?= -O2
>  HOST_CFLAGS   += $(HOST_CPPFLAGS)
>  HOST_CXXFLAGS += $(HOST_CFLAGS)
> -- 
> 2.14.1
> 

So issue is caused by libglib2 here:

    libglib2-2.56.4/gio/gunixconnection.c +566

with the code:

---------------8<------------------------------
560           g_set_error (error,
561                        G_IO_ERROR,
562                        G_IO_ERROR_FAILED,
563                        ngettext("Expecting 1 control message, got %d",
564                                 "Expecting 1 control message, got %d",
565                                 nscm),
566                        nscm);
567           goto out;
--------------->8------------------------------

so g_set_error takes formatted string which gcc does not like, but in
case of disabled INTL macrosses in gettext-tiny the declared functions
are used with special gcc attibutes which does not cause the issue.

I think that may be package/Makefile.in is not good place for this but
better to add another patch which will disable these macrosses ?

Regards,
Vadim Kochan
