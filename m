From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Nov 2017 00:23:00 +0100
Subject: [Buildroot] [PATCH v1] Fix makefile include order by using
 sort/wildcard.
In-Reply-To: <20171121191330.5621-1-ps.report@gmx.net>
References: <20171121191330.5621-1-ps.report@gmx.net>
Message-ID: <a3441ea0-b5da-d5ab-ff93-af09b1dd151d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-11-17 20:13, Peter Seiderer wrote:
> Use ordered 'include $(sort $(wildcard ...))' instead of unordered
> direct 'include */*.mk'.
> 
> Fixes [1] reported by Petr Vorel:
> 
>   make: *** No rule to make target 'toolchain-external-custom', needed by '.../build/toolchain-external/.stamp_configured'.  Stop.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-November/206969.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 There was one more include that wasn't sorted:

-include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(dir)/docs/*/*.mk)

I've fixed that one as well, I've extended the commit log a little, and applied
to master, thanks.

 Regards,
 Arnout

> ---
>  Makefile                                           | 6 +++---
>  package/gstreamer/gstreamer.mk                     | 2 +-
>  package/gstreamer1/gstreamer1.mk                   | 2 +-
>  toolchain/toolchain-external/toolchain-external.mk | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 55409b99af..9d9737332d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -483,13 +483,13 @@ include system/system.mk
>  include package/Makefile.in
>  # arch/arch.mk.* must be after package/Makefile.in because it may need to
>  # complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
> --include $(wildcard arch/arch.mk.*)
> +-include $(sort $(wildcard arch/arch.mk.*))
>  include support/dependencies/dependencies.mk
>  
>  PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
>  
> -include toolchain/*.mk
> -include toolchain/*/*.mk
> +include $(sort $(wildcard toolchain/*.mk))
> +include $(sort $(wildcard toolchain/*/*.mk))
>  
>  # Include the package override file if one has been provided in the
>  # configuration.
> diff --git a/package/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer.mk
> index bc886c78a2..22240bceea 100644
> --- a/package/gstreamer/gstreamer.mk
> +++ b/package/gstreamer/gstreamer.mk
> @@ -1 +1 @@
> -include package/gstreamer/*/*.mk
> +include $(sort $(wildcard package/gstreamer/*/*.mk))
> diff --git a/package/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1.mk
> index 5b748e33fb..8530ff027a 100644
> --- a/package/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1.mk
> @@ -1 +1 @@
> -include package/gstreamer1/*/*.mk
> +include $(sort $(wildcard package/gstreamer1/*/*.mk))
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 48de1e71f2..dd07884c7e 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -25,4 +25,4 @@ $(error No prefix selected for external toolchain package $(BR2_PACKAGE_PROVIDES
>  endif
>  endif
>  
> -include toolchain/toolchain-external/*/*.mk
> +include $(sort $(wildcard toolchain/toolchain-external/*/*.mk))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
