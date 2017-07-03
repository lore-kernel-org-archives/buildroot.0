From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 00:02:59 +0200
Subject: [Buildroot] [RFC PATCH v5 08/11] core: install relocation
 script and location at the end of the build
In-Reply-To: <1498811828-6893-9-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-9-git-send-email-wg@grandegger.com>
Message-ID: <8019070e-3b5a-d65a-f04b-b087d4b0ee17@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-17 10:37, Wolfgang Grandegger wrote:
> The script "relocate-sdk.sh" is installed into the top directory of
> the SDK (HOST_DIR) and the SDK location path is stored in the file
> "HOST_DIR/usr/share/buildroot/sdk-location"-
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index f5ea6a8..a5dfdfd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -553,6 +553,9 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  
>  .PHONY: world
>  world: target-post-image
> +	@$(call MESSAGE,"Rendering the SDK relocatable")

 In addition to all the comments that went before: this doesn't actually render
the SDK relocatable. So perhaps simple "Finalizing SDK" is better.

 Regards,
 Arnout

> +	install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR) && \
> +	echo $(HOST_DIR) > $(HOST_DIR)/usr/share/buildroot/sdk-location
>  
>  # Populating the staging with the base directories is handled by the skeleton package
>  $(STAGING_DIR):
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
