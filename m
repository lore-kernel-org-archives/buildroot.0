From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 01:43:40 +0200
Subject: [Buildroot] [PATCH 4/8 v4] support/download: add possibility to
 not fail on missing hash
In-Reply-To: <1f4a021bb2826f296ae7b2876f8ae8ab57cde349.1428512075.git.yann.morin.1998@free.fr>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
 <1f4a021bb2826f296ae7b2876f8ae8ab57cde349.1428512075.git.yann.morin.1998@free.fr>
Message-ID: <552C54AC.9050905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 18:57, Yann E. MORIN wrote:
> In very constrained cases, it might be needed to not fail if a hash is
> missing. This is notably the case for custom external toolchains to be
> downloaded, because we do have a .hash file for external toolchains,
> but we oviously can not have hashes for all existing cutom toolchains
         obviously                                     custom

> (he, "custom"!).

 So what is it going to be cutom or custom? :-)

> 
> So, add a way to avoid failing in that case.
> 
> Form the Makefile, we export the list of files for which not to check
  From

> the hash. Then, from the check-hash script, if no check was done, and
> the file we were trying to match in in this exclusion list, we just exit
                                   is

> without error.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

but more fixes below...

> 
> ---
> Changes v3 -> v4:
>   - drop the magic value, use a list of excluded files  (Arnout)
> 
> Changes v1 -> v2:
>   - fix typoes in commit log
> ---
>  package/pkg-download.mk     | 3 +++
>  support/download/check-hash | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index e274712..5b7c861 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -60,6 +60,9 @@ domainseparator = $(if $(1),$(1),/)
>  # github(user,package,version): returns site of GitHub repository
>  github = https://github.com/$(1)/$(2)/archive/$(3)
>  
> +# Expressely do not check hashes for those files
     Expressly

> +export BR_NO_CHECK_HASH_FOR
> +
>  ################################################################################
>  # The DOWNLOAD_* helpers are in charge of getting a working copy
>  # of the source repository for their corresponding SCM,
> diff --git a/support/download/check-hash b/support/download/check-hash
> index d37f1cd..ca81f00 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -99,6 +99,11 @@ while read t h f; do
>  done <"${h_file}"
>  
>  if [ ${nb_checks} -eq 0 ]; then
> +    for f in ${BR_NO_CHECK_HASH_FOR}; do
> +        if [ "${f}" = "${base}" ]; then
> +            exit 0
> +        fi
> +    done

 I can't stop myself from micro-optimising :-)

if [ ${nb_checks} -eq 0 ]; then
	case " ${BR_NO_CHECK_HASH_FOR} " in
	"* ${base} *")
		exit 0
		;;
	esac
	printf "ERROR: No hash found for %s\n" "${base}" >&2
	exit 0
fi

But maybe that's not really more readable...

 Regards,
 Arnout

>      printf "ERROR: No hash found for %s\n" "${base}" >&2
>      exit 0
>  fi
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
