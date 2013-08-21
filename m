From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 21:24:19 +0200
Subject: [Buildroot] [PATCH v2 2/3] package: fix generic extract target
 for top-level parallel make
In-Reply-To: <1374138746-23279-3-git-send-email-fabio.porcedda@gmail.com>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <1374138746-23279-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <521513E3.8080401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/07/13 11:12, Fabio Porcedda wrote:
> To be able to use top-level parallel make we must don't depend in a rule
> on the order of evaluation of the prerequisites, so instead of reling on
> the left to right ordering of evaluation of the prerequisites add
> an explicit rule to describe the dependencies.
>
> Add a rule to specify that the $(2)_TARGET_EXTRACT target depends
> on $(2)_TARGET_SOURCE target.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>   package/pkg-generic.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 668f011..f29ea99 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -391,8 +391,8 @@ $(1)-configure:		$(1)-patch $(1)-depends \
>
>   $(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
>
> -$(1)-extract:		$(1)-source \
> -			$$($(2)_TARGET_EXTRACT)
> +$$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
> +$(1)-extract:			$$($(2)_TARGET_EXTRACT)
>
>   $(1)-depends:		$$($(2)_DEPENDENCIES)
>
>

  On second observation, I don't really like this change, because it 
makes the extract and patch parts asymmetrical with the others. I would 
prefer one patch that changes it for all the targets. But then, the 
behaviour does change, because rebuilding one package will also trigger a 
rebuild of the packages that depend on it. Which may be a good thing, of 
course...

  Also, I think it would be nicer / clearer to put these dependencies in 
the %-rules at the top of the file, rather than specifying them per package.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
