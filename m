From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 16:39:37 +0200
Subject: [Buildroot] [PATCH 1/6 v3] support/download: do not warn about
 missing hash file for repositories
In-Reply-To: <129976edaa1c2da5422402ba25274706cc2d2d26.1428322317.git.yann.morin.1998@free.fr>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
 <129976edaa1c2da5422402ba25274706cc2d2d26.1428322317.git.yann.morin.1998@free.fr>
Message-ID: <55229AA9.4090201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 14:13, Yann E. MORIN wrote:
> When downloading from a repository, we explicitly pass no hash file,
> because we can't check hashes in that case.
> 
> However, we're still printing a message that there is a missign hash
> file.
> 
> Beside being a bit annoying (since we can't do anything about it), it
> may also be wrong, especially for packages for which we support multiple
> versions, with some being downloaded via a git clone and others as
> tarballs.
> 
> Just print no warning when the path to the hash file is empty.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2;
>   - fix typoes in commit log
> ---
>  support/download/check-hash | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/support/download/check-hash b/support/download/check-hash
> index 67c1780..d37f1cd 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -31,8 +31,12 @@ h_file="${1}"
>  file="${2}"
>  base="${3}"
>  
> +# Bail early if no hash to check
> +if [ -z "${h_file}" ]; then
> +    exit 0
> +fi
>  # Does the hash-file exist?
> -if [ -z "${h_file}" -o ! -f "${h_file}" ]; then
> +if [ ! -f "${h_file}" ]; then
>      printf "WARNING: no hash file for %s\n" "${base}" >&2
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
