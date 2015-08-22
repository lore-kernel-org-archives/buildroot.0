From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Aug 2015 00:47:32 +0200
Subject: [Buildroot] [PATCH] support/downlaod: fix the Hg backend for
	tags
In-Reply-To: <1439933704-7451-1-git-send-email-yann.morin.1998@free.fr>
References: <1439933704-7451-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55D8FC04.8040600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Putting our Mercurial expert in Cc]

On 08/18/2015 11:35 PM, Yann E. MORIN wrote:
> When the version of a package is a Mercurial tag, the download fails,
> with:
>     abort: unknown revision 'X.Y.Z'!
> 
> This is because, in Mercurial, tags are commits like the others, and
> when we clone, we actively request a tag. But then, the server
> "dereferences" that tag and sends us the revision pointed to by that
> tag. Of course, since the tag is a commit after the revision we got,
> we do not have the revision adding the tag.
> 
> So, we just have to download the full repository to be sure we have
> the tags in our local clone.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/download/hg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/hg b/support/download/hg
> index d6654a1..ac1e9b9 100755
> --- a/support/download/hg
> +++ b/support/download/hg
> @@ -25,7 +25,7 @@ repo="${2}"
>  cset="${3}"
>  basename="${4}"
>  
> -${HG} clone ${verbose} --noupdate --rev "${cset}" "${repo}" "${basename}"
> +${HG} clone ${verbose} --noupdate "${repo}" "${basename}"
>  
>  ${HG} archive ${verbose} --repository "${basename}" --type tgz \
>                --prefix "${basename}" --rev "${cset}" \

 Wouldn't it be better to stick to the original way of cloning, and instead
specify the equivalent of HEAD as --rev here? I think that would even be the
default, no?

 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
