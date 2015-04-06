From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 22:47:38 +0200
Subject: [Buildroot] [PATCH 4/6 v3] support/download: add possibility to
 not fail on missing hash
In-Reply-To: <8bc29f96aa3e21fac98977c11cdbc08b6ba321dd.1428322317.git.yann.morin.1998@free.fr>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
 <8bc29f96aa3e21fac98977c11cdbc08b6ba321dd.1428322317.git.yann.morin.1998@free.fr>
Message-ID: <5522F0EA.8070305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 14:13, Yann E. MORIN wrote:
> In very constrained cases, it might be needed to not fail if a hash is
> missing. This is notably the case for custom external toolchains to be
> downloaded, because we do have a .hash file for external toolchains,
> but we oviously can not have hashes for all existing cutom toolchains
> (he, "custom"!).
> 
> So, add a way to avoid failing in that case.
> 
> We use a magic value depending on the file to be downloaded, instead of
> yes/no, to avoid any accidental use. We also do not document it, because
> we do not want users to use it, and even more, to rely on it, since we
> still have hopes to get rid of that in the future.

 I don't think that complexity is really warranted. Something like
BR_MISSING_HASH=OK should be enough.

 I do agree with not documenting it, however.

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> ---
> Changes v1 -> v2:
>   - fix typoes in commit log
> ---
>  package/pkg-download.mk     | 4 ++++
>  support/download/check-hash | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index e274712..1e080e5 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -60,6 +60,10 @@ domainseparator = $(if $(1),$(1),/)
>  # github(user,package,version): returns site of GitHub repository
>  github = https://github.com/$(1)/$(2)/archive/$(3)
>  
> +# Compute magic value to ignore a missing hash
> +# $1: filename, without path components
> +ignore-missing-hash-magic = $(shell sha1sum <<<"$(1)" |cut -d ' ' -f 1)
> +
>  ################################################################################
>  # The DOWNLOAD_* helpers are in charge of getting a working copy
>  # of the source repository for their corresponding SCM,
> diff --git a/support/download/check-hash b/support/download/check-hash
> index d37f1cd..a091c61 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -99,6 +99,10 @@ while read t h f; do
>  done <"${h_file}"
>  
>  if [ ${nb_checks} -eq 0 ]; then
> +    if [ "${BR_MISSING_HASH_OK}" = "$(sha1sum <<<"${base}" |cut -d ' ' -f 1)" ]; then
> +        printf "WARNING: ignored missing hash for %s\n" "${base}" >&2

 There shouldn't be a warning in this case either, right? Neither end users nor
buildroot developers can do anything about it, so what would be the point...

 I'd also make the branching more explicit:

if [ ${nb_checks} -eq 0 ]; then
    if [ "${BR_MISSING_HASH}" = "OK" ]; then
        exit 0
    else
        printf "ERROR: No hash found for %s\n" "${base}" >&2
        exit 0
    fi
fi


 Regards,
 Arnout

> +        exit 0
> +    fi
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
