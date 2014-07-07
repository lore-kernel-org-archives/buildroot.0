From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jul 2014 07:54:56 +0200
Subject: [Buildroot] [PATCH 1/5] support/download: fix the bzr helper
In-Reply-To: <7397ced020b7a64534c6a240304998d2bf11c961.1404681878.git.yann.morin.1998@free.fr>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <7397ced020b7a64534c6a240304998d2bf11c961.1404681878.git.yann.morin.1998@free.fr>
Message-ID: <53BA3630.9040305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/07/14 23:27, Yann E. MORIN wrote:
> bzr uses the name of the extension of the output file to known what
> output format to use: tar, tgz, tar.bz2... If no extension is
> recognised, bzr will output to a directory.
> 
> Since we use 'mktemp .XXXXXX' to generate temporary files, it obviously
> never ends with a recognised extension. Thus, bzr expects the output to
> be a directory, and fails since it is a file.

 I think it would be much simpler and more natural to use

tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX.tar.gz" )"
tmp_output="$( mktemp "${output}.XXXXXX.tar.gz" )"

> 
> Fix that by forcing the output format.

 But of course, forcing it explicitly never hurts.

 So even with my earlier comment, this one gets my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/download/bzr | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/bzr b/support/download/bzr
> index 3f52ee9..19d837d 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -26,7 +26,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
>  # - finally, we atomically rename to the final file
>  
>  ret=1
> -if ${BZR} export "${tmp_dl}" "${repo}" -r "${rev}"; then
> +if ${BZR} export --format=tgz "${tmp_dl}" "${repo}" -r "${rev}"; then
>      if mv "${tmp_dl}" "${tmp_output}"; then
>          mv "${tmp_output}" "${output}"
>          ret=0
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
