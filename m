From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 13:14:38 +0200
Subject: [Buildroot] [PATCH v6 01/10] support/scripts: check-host-rpath
 now handles $ORIGIN/../lib
In-Reply-To: <1499185359-8293-2-git-send-email-wg@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <1499185359-8293-2-git-send-email-wg@grandegger.com>
Message-ID: <20170705131438.45b0a817@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 18:22:30 +0200, Wolfgang Grandegger wrote:
> The new RPath sanitization uses now the relative path
> "$ORIGIN/../lib" for binaries in "/usr/bin".
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  support/scripts/check-host-rpath | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 020c123..e79560b 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -58,7 +58,7 @@ check_elf_has_rpath() {
>          for dir in ${rpath//:/ }; do
>              # Remove duplicate and trailing '/' for proper match
>              dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
> -            [ "${dir}" = "${hostdir}/usr/lib" -o "${dir}" = "\$ORIGIN/../../usr/lib" ] && return 0
> +            [ "${dir}" = "${hostdir}/usr/lib" -o "${dir}" = "\$ORIGIN/../lib" ] && return 0

I guess this needs to be revisited with the removal of $(HOST_DIR)/usr:
now everything is under $(HOST_DIR) directly.

Could you rebase your series on the latest master, in which I just
merged earlier today Arnout patches removing $(HOST_DIR)/usr ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
