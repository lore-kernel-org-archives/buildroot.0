From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Jun 2019 22:28:23 +0200
Subject: [Buildroot] [PATCH] package/pkg-utils.mk: add dl_dir to
 show-info output
In-Reply-To: <20190619201732.24027-1-arnout@mind.be>
References: <20190619201732.24027-1-arnout@mind.be>
Message-ID: <20190619202823.GH2216@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-06-19 22:17 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> It can be useful for scripts to be able to access a package's source
> file after download. That used to be easy, just DL_DIR/PKG_SOURCE.
> However, with the subdirectories in DL_DIR which can be overridden with
> PKG_DL_SUBDIR, that is no longer easy.
> 
> Therefore, this patch adds dl_dir to the downloads list of a package. It
> can be used with the following jq script to get a newline-separated list
> of all downloaded files:

Aha! The first extension to show-info! :-)

> make show-info | jq -r '.[].downloads[]? | (.dl_dir + "/" + .source)'
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/pkg-utils.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index b7280e930f..4de0bc042c 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -104,7 +104,8 @@ define _json-info-pkg-details
>  						$(call DOWNLOAD_URIS,$(dl),$(1))
>  					)
>  				)
> -			]
> +			],
> +			"dl_dir": "$($(1)_DL_DIR)"

This means that the dl_dir key is repeated as-is for all the blobs
download by a package.

Instead, what about emitting the full path to said blob:

    diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
    index b7280e930f..80ad349dac 100644
    --- a/package/pkg-utils.mk
    +++ b/package/pkg-utils.mk
    @@ -104,7 +104,8 @@ define _json-info-pkg-details
     						$(call DOWNLOAD_URIS,$(dl),$(1))
     					)
     				)
    -			]
    +			],
    +			"path": "$($(1)_DL_DIR)/$(notdir $(dl))"
     		},
     	)
     ],

Or just dump the dl_dir only once:

    diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
    index b7280e930f..bd918e5faa 100644
    --- a/package/pkg-utils.mk
    +++ b/package/pkg-utils.mk
    @@ -94,6 +94,7 @@ endef
     define _json-info-pkg-details
     	"version": "$($(1)_DL_VERSION)",
     	"licenses": "$($(1)_LICENSE)",
    +	"dl_dir": "$($(1)_DL_DIR)",
     	"downloads": [
     	$(foreach dl,$(sort $($	(1)_ALL_DOWNLOADS)),
     		{

Regards,
Yann E. MORIN.

>  		},
>  	)
>  	],
> -- 
> 2.21.0
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
