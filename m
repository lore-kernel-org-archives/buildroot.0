From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 23:00:11 +0200
Subject: [Buildroot] [PATCH 03/34] reproducibility: generate
 SOURCE_DATE_EPOCH
In-Reply-To: <1462002570-14706-3-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-3-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <67fd2e37-e216-0d27-ba6d-893b0baf7f28@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/30/16 09:48, Gilles Chanteperdrix wrote:
> When reproducibility is wanted, generates a global SOURCE_DATE_EPOCH
> environment variable which contains either the date of buildroot last
> commit if running from a git repository, or the latest release date.
>
> This means that all packages embedding build dates will appear to
> have the same build date, so in case of new commit or release, all
> packages will appear to have been change, even though some of them
> may not have changed in fact.
> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 86b2ed2..c1d2961 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -223,6 +223,11 @@ ifeq ($(BR2_REPRODUCIBLE),y)
>  export TZ=UTC
>  export LANG=C
>  export LC_ALL=C
> +SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
> +SOURCE_DATE_CHANGES = $(shell head -n 1 $(TOPDIR)/CHANGES | \
> +	sed 's/^.*Released \(.*\)$$/\1/;s/\(st\|nd\|rd\|th\),//' | \
> +	LANG=C LC_ALL=C TZ=UTC xargs -i date -d \{\} +%s)
> +export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(SOURCE_DATE_CHANGES))

  I really don't like exporting a variable that is not well-known and that 
doesn't have a BR_ prefix. Where it is used by packages, it will anyway be in 
Buildroot-specific patches, so we can just as well add the BR_ prefix.

  But actually, we don't want to introduce buildroot-specific (and therefore 
unupstreamable) things in patches either. So there is not much point in 
exporting, except if it's used by scripts.


  Regards,
  Arnout

>  endif
>
>  # To put more focus on warnings, be less verbose as default
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
