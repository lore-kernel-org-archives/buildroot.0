From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 12:20:57 +0200
Subject: [Buildroot] [PATCH 1/4] support/download/cvs: add support to
 use a date instead of a tag
In-Reply-To: <1430091621-4698-2-git-send-email-fabio.porcedda@gmail.com>
References: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
 <1430091621-4698-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <5544A509.6040501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/04/15 01:40, Fabio Porcedda wrote:
> This is useful when a tag is not avaiable.

 Actually, we currently only support a date. The cvs co -r option has the
following syntax: -r tag[:date] - so we currently always interpret the version
as a date, since we put a : in front of it.

 The :date extension is only valid when the tag is not a tag but a branch. If
the tag is empty, it refers to the trunk.

 AFAICS, the -D option is completely equivalent to -r :date .

 I applied just the third patch of this series and could build expect successfully.


 That said, I think the current behaviour is ridiculous, so perhaps the : should
be removed from the -r handling. The : can be added explicitly in the version
number - but then the directory name of expect will be
expect-_2014-05-02 which is also a bit weird...

> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/download/cvs | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/support/download/cvs b/support/download/cvs
> index 2c3a666..9cf9304 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -26,7 +26,16 @@ rev="${3}"
>  rawname="${4}"
>  basename="${5}"
>  
> +if [[ ${rev} =~ ^[0-9] ]]; then
> +    # Date, because a tag cannot begin with a number
> +    select="-D ${rev}"
> +else
> +    # Tag
> +    select=-"r :${rev}"

 Note that this won't work, since the space will be interpreted as a tag name.
It should be

	select="-r :\"${rev}\""

and remove the quotes from where ${select} is used.


 Regards,
 Arnout

> +fi
> +
> +export TZ=UCT
>  ${CVS} ${verbose} -z3 -d":pserver:anonymous@${repo}" \
> -       co -d "${basename}" -r ":${rev}" -P "${rawname}"
> +       co -d "${basename}" "${select}" -P "${rawname}"
>  
>  tar czf "${output}" "${basename}"
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
