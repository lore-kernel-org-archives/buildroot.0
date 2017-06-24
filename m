From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Jun 2017 00:08:52 +0200
Subject: [Buildroot] [PATCH v2] support/scripts/apply-patches.sh: do not
 apply patches with renames
In-Reply-To: <20170624195936.31528-1-thomas.petazzoni@free-electrons.com>
References: <20170624195936.31528-1-thomas.petazzoni@free-electrons.com>
Message-ID: <3af0eda9-7dea-229d-654b-1dff940c2da4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-06-17 21:59, Thomas Petazzoni wrote:
> Patches with renames apply properly with patch >= 2.7, but not with
> older patch versions. Since "git format-patch" by default generates
> patches with renames, Buildroot developers often don't realize that
> their patches will not apply properly on build machines that have
> patch < 2.7. In order to prevent such a situation from happening
> again, this commit adds some logic in apply-patches.sh to refuse
> applying patches that contain renames.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Perhaps add to the commit message why you don't just grep for '^rename':

Since the patch commit message may contain the words "rename from" or
"rename to" as well, the grep expression is made as accurate as possible,
checking both.

 Ideally the test should start from the first ^diff, but that makes things a lot
more complicated...

 An alternative would be to do

patch --dry-run -i ${path}/${patch} | grep "(renamed from"

but I can't guarantee that that works with all patch versions that understand
rename. This the current patch is OK.

 Regards,
 Arnout


> ---
> Changes since v1:
>  - Use "&&" for the "grep -q && grep -q" condition, as noticed by Yann
>    E. Morin.
> ---
>  support/scripts/apply-patches.sh | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 7ccb39d..0c24175 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -113,6 +113,11 @@ function apply_patch {
>          echo "  to be applied  : ${path}/${patch}"
>          exit 1
>      fi
> +    if grep -q "^rename from" ${path}/${patch} && \
> +       grep -q "^rename to" ${path}/${patch} ; then
> +	echo "Error: patch contains some renames, not supported by old patch versions"
> +	exit 1
> +    fi
>      echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
>      ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
>      if [ $? != 0 ] ; then
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
