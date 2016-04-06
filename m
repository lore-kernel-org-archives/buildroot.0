From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Apr 2016 00:09:52 +0200
Subject: [Buildroot] [PATCH 1/1] tzdata: Reorder zone list to avoid
 missing links
In-Reply-To: <1459939293-4711-1-git-send-email-mma@objectxp.com>
References: <1459939293-4711-1-git-send-email-mma@objectxp.com>
Message-ID: <57058930.6020609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/16 12:41, Michel Marti wrote:
> The 'backward' zone references entries from other zones (e.g. Pacific/*)
> that have not yet been compiled, leading to missing links. To fix this,
> take-over the zone list sort order from upstream 'tzdata' and also ensure
> that make fails if zic terminates with a non-zero exit code.
>
> Signed-off-by: Michel Marti <mma@objectxp.com>
> ---
>   package/tzdata/tzdata.mk | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index 1b3efb4..40ddc4b 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -13,8 +13,8 @@ HOST_TZDATA_DEPENDENCIES = host-zic
>   TZDATA_LICENSE = Public domain
>
>   TZDATA_DEFAULT_ZONELIST = \
> -	africa antarctica asia australasia backward etcetera \
> -	europe factory northamerica pacificnew southamerica
> +	africa antarctica asia australasia europe northamerica \
> +	southamerica pacificnew etcetera backward systemv factory

  Could you add a comment to clarify that the order is important? Otherwise we 
risks that someone tries to sort it alphabetically again a few years down the 
line. Your commit message explains is pretty well.

  With that you can add my
  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>
>   ifeq ($(call qstrip,$(BR2_TARGET_TZ_ZONELIST)),default)
>   TZDATA_ZONELIST = $(TZDATA_DEFAULT_ZONELIST)
> @@ -49,8 +49,8 @@ endef
>   define HOST_TZDATA_BUILD_CMDS
>   	(cd $(@D); \

  A simpler way to achieve the same is to add
		set -e; \
but that's a matter of taste so if you keep it as is that's fine by me.


  Regards,
  Arnout

>   		for zone in $(TZDATA_ZONELIST); do \
> -			$(ZIC) -d _output/posix -y yearistype.sh $$zone; \
> -			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone; \
> +			$(ZIC) -d _output/posix -y yearistype.sh $$zone || exit 1; \
> +			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone || exit 1; \
>   		done; \
>   	)
>   endef
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
