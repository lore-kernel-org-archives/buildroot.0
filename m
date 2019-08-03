From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Aug 2019 16:14:06 +0200
Subject: [Buildroot] [PATCH v3] package/pkg-utils.mk: add dl_dir to
 show-info output
In-Reply-To: <20190803140433.27967-1-arnout@mind.be>
References: <20190803140433.27967-1-arnout@mind.be>
Message-ID: <20190803141406.GF28984@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-08-03 16:04 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> It can be useful for scripts to be able to access a package's source
> file after download. That used to be easy, just DL_DIR/PKG_SOURCE.
> However, with the subdirectories in DL_DIR which can be overridden with
> PKG_DL_SUBDIR, that is no longer easy.
> 
> Therefore, this patch adds dl_dir to the package information. It prints
> just PKG_DL_SUBDIR, to avoid dumping absolute paths to the buildroot
> directory in the show-info output.
> 
> It can be used with the following jq script to get a newline-separated
> list of all downloaded files:
> 
> make show-info | jq -r '.[] | ("dl/" + .dl_dir + "/" + .downloads[]?.source)'
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks for the jq script! :-)

Regards,
Yann E. MORIN.

> ---
> v2 -> v3:
>  - Remove accidental change
> 
> v1 -> v2:
>  - Use DL_SUBDIR (i.e. relative path) instead of DL_DIR (i.e. absolute
>    path). (Yann)
>  - Move the definition one level higher, because it is anyway the same
>    for all sources. (Yann)
>  - Update jq script in commit message to handle the above.
> ---
>  package/pkg-utils.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index b7280e930f..ef93345595 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -94,6 +94,7 @@ endef
>  define _json-info-pkg-details
>  	"version": "$($(1)_DL_VERSION)",
>  	"licenses": "$($(1)_LICENSE)",
> +	"dl_dir": "$($(1)_DL_SUBDIR)",
>  	"downloads": [
>  	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
>  		{
> -- 
> 2.21.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
