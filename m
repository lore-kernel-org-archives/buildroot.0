From: Gervais, Francois <FGervais@distech-controls.com>
Date: Fri, 21 Feb 2020 16:33:03 +0000
Subject: [Buildroot] [PATCH 1/1] package/rcw: allow not having custom
 rcwi files
In-Reply-To: <20200221144023.25481-1-fgervais@distech-controls.com>
References: <20200221144023.25481-1-fgervais@distech-controls.com>
Message-ID: <DM6PR01MB58499CB954F2053B6D17CFE7F3120@DM6PR01MB5849.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I must say, this patch will conflict with this pending one:

[v5,2/9] package/qoriq-rcw: move rcw into nxp and rename it
https://patchwork.ozlabs.org/patch/1234790/

If the patch from Changming Huang is close to being pulled-in, we might want to
delay the inclusion of mine and I'll update it based on Changming's work.

One way or the other is fine with me.


> -----Original Message-----
> From: Francois Gervais <fgervais@distech-controls.com>
> Sent: February 21, 2020 9:40 AM
> To: buildroot at buildroot.org
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>; Gervais, Francois <FGervais@distech-controls.com>
> Subject: [PATCH 1/1] package/rcw: allow not having custom rcwi files
> 
> A project could quite possibly have a custom rcw file that does not rely on any custom rcw include files (rcwi).
> 
> Allow the build to succeed if this is the case.
> 
> Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
> ---
>  package/rcw/rcw.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk index 36d2da61b5..c1fb63b91b 100644
> --- a/package/rcw/rcw.mk
> +++ b/package/rcw/rcw.mk
> @@ -25,7 +25,9 @@ endif
> 
>  define HOST_RCW_ADD_CUSTOM_RCW_FILES
>  	mkdir -p $(@D)/custom_board/rcw
> -	cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board
> +	if [ -n "$(filter-out %.rcw,$(RCW_FILES))" ]; then \
> +		cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board; \
> +	fi
>  	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw  endef  HOST_RCW_POST_PATCH_HOOKS +=
> HOST_RCW_ADD_CUSTOM_RCW_FILES
> --
> 2.20.1
