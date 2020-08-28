From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 10:51:35 +0200
Subject: [Buildroot] [PATCH v3 3/8] package/pkg-utils: show-info: report
 the list of the CVEs ignored
In-Reply-To: <20200724154356.2607639-4-gregory.clement@bootlin.com>
References: <20200724154356.2607639-1-gregory.clement@bootlin.com>
 <20200724154356.2607639-4-gregory.clement@bootlin.com>
Message-ID: <20200828105135.569dc44a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Jul 2020 17:43:51 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Add the list of the CVEs to ignore for each package because they
> already have a fix for it.
> 
> This information will be useful for a cve-checker.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Hello, I have applied to next, after tweaking a bit the code.

> ---
>  package/pkg-utils.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index d88a14ab0f..21b415cbf3 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -117,7 +117,10 @@ define _json-info-pkg
>  		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
>  	],
>  	"reverse_dependencies": [
> -		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
> +		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES))),

Adding the final comma on this line was not needed.

> +	],
> +	"ignore_cves": [
> +		$(call make-comma-list,$(sort $($(1)_IGNORE_CVES)))
>  	]

I changed to only emit the ignore_cves property if there are ignored
CVEs, like this:

+	$(if $($(1)_IGNORE_CVES),
+		$(comma) "ignore_cves": [
+			$(call make-comma-list,$(sort $($(1)_IGNORE_CVES)))
+		]
+	)

Do not hesitate to check if it still works for you. It does for me :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
