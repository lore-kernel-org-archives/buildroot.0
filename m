From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 19:12:34 +0200
Subject: [Buildroot] [RFC PATCH v5 10/11] support/scripts:
 check-host-rpath now handles $ORIGIN as well
In-Reply-To: <1498811828-6893-11-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-11-git-send-email-wg@grandegger.com>
Message-ID: <2f2217a7-dd4b-6ad4-0e03-8942380db4b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 30-06-17 10:37, Wolfgang Grandegger wrote:
> "$ORIGIN/../../usr/lib" is also a valid RPATH for binaries in
> "$hostdir/usr/bin". After RPATH sanitation, all RPATH
> directories start with "$ORIGIN".
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

 This patch should come way earlier in the series, because things break if you
don't have this and the sanitization is done.

 In fact, it can be applied right away:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  support/scripts/check-host-rpath | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 6ce547c..020c123 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -58,7 +58,7 @@ check_elf_has_rpath() {
>          for dir in ${rpath//:/ }; do
>              # Remove duplicate and trailing '/' for proper match
>              dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
> -            [ "${dir}" = "${hostdir}/usr/lib" ] && return 0
> +            [ "${dir}" = "${hostdir}/usr/lib" -o "${dir}" = "\$ORIGIN/../../usr/lib" ] && return 0
>          done
>      done < <( readelf -d "${file}"                                              \
>                |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
