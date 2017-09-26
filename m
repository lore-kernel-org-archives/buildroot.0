From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:40:25 +0200
Subject: [Buildroot] [PATCH] support/check-rpath: recognise PIE
In-Reply-To: <20170924162244.29575-1-yann.morin.1998@free.fr>
References: <20170924162244.29575-1-yann.morin.1998@free.fr>
Message-ID: <cb2bb0ba-2b48-3258-e2a8-c993d45eb3eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-09-17 18:22, Yann E. MORIN wrote:
> We sanity-check the host executables that they have a correct RPATH
> pointing to the host libraries.
> 
> This is currently done by looking for all files in $(HOST_DIR) that
> match the 'ELF executable' pattern (a bit more complex, but that's
> idea).
> 
> However, when an executable is built with -fPIE of -fpie, it no longer
> appears to be an 'ELF executable', but it rather looks like an 'ELF
> sheard object' (like if it were an library.
> 
> So, we miss those files.
> 
> It turns out that the problem is a real one, because quite a few
> mainline distros, expecially those based on Debian for example, have
> already switched to generating PIE code by default, and thus we miss on
> a whole class of systems..
> 
> We fix that by simply looking if we can find an ELF interpreter in each
> file. If we there is one, this is an ELF executable; if not, it may be
> anything else: we don't care (not even about ELF libraries).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

 Applied to master, thanks.

 One remark: this will be slower than it was before. But since typically there
aren't so many files in host/{bin,sbin}, it's not a problem.

 Regards,
 Arnout


> ---
>  support/scripts/check-host-rpath | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 74a25ba99c..169628decb 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -18,6 +18,7 @@ main() {
>  
>      ret=0
>      while read file; do
> +        is_elf "${file}" || continue
>          elf_needs_rpath "${file}" "${hostdir}" || continue
>          check_elf_has_rpath "${file}" "${hostdir}" && continue
>          if [ ${ret} -eq 0 ]; then
> @@ -26,14 +27,18 @@ main() {
>              printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
>          fi
>          printf "***   %s\n" "${file}"
> -    done < <( find "${hostdir}"/{bin,sbin} -type f -exec file {} + 2>/dev/null \
> -              |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
> -                      -e 's//\1/'                                                  \
> -            )
> +    done < <( find "${hostdir}"/{bin,sbin} -type f 2>/dev/null )
>  
>      return ${ret}
>  }
>  
> +is_elf() {
> +    local f="${1}"
> +
> +    readelf -l "${f}" 2>/dev/null \
> +    |grep -E 'Requesting program interpreter:' >/dev/null 2>&1
> +}
> +
>  elf_needs_rpath() {
>      local file="${1}"
>      local hostdir="${2}"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
