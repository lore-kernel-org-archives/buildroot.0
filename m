From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jun 2019 10:05:23 +0200
Subject: [Buildroot] [PATCH] package/pkg-utils.mk: add dl_dir to
 show-info output
In-Reply-To: <20190619202823.GH2216@scaer>
References: <20190619201732.24027-1-arnout@mind.be>
 <20190619202823.GH2216@scaer>
Message-ID: <20190622080523.GC13664@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-06-19 22:28 +0200, Yann E. MORIN spake thusly:
> On 2019-06-19 22:17 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> > Therefore, this patch adds dl_dir to the downloads list of a package. It
> > can be used with the following jq script to get a newline-separated list
> > of all downloaded files:
[--SNIP--]
> Instead, what about emitting the full path to said blob:
> 
>     diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>     index b7280e930f..80ad349dac 100644
>     --- a/package/pkg-utils.mk
>     +++ b/package/pkg-utils.mk
>     @@ -104,7 +104,8 @@ define _json-info-pkg-details
>      						$(call DOWNLOAD_URIS,$(dl),$(1))
>      					)
>      				)
>     -			]
>     +			],
>     +			"path": "$($(1)_DL_DIR)/$(notdir $(dl))"
>      		},
>      	)
>      ],
> 
> Or just dump the dl_dir only once:
> 
>     diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>     index b7280e930f..bd918e5faa 100644
>     --- a/package/pkg-utils.mk
>     +++ b/package/pkg-utils.mk
>     @@ -94,6 +94,7 @@ endef
>      define _json-info-pkg-details
>      	"version": "$($(1)_DL_VERSION)",
>      	"licenses": "$($(1)_LICENSE)",
>     +	"dl_dir": "$($(1)_DL_DIR)",
>      	"downloads": [
>      	$(foreach dl,$(sort $($	(1)_ALL_DOWNLOADS)),
>      		{

Actually, there is just one thing I don't like about $($(1)_DL_DIR), is
that it contains a local information: it starts with BR2_DL_DIR, which
is user- and site-specific.

Instead, I'd argue we should just print $($(1)_DL_SUBDIR).

That way, the generated json blurb can even be distributed, and there is
no local information that leaks. Note: even the user name (as present in
$(BR2_DL_DIR)) can be a liability in some cases (true story).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
