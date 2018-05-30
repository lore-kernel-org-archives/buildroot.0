From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 May 2018 18:56:53 +0200
Subject: [Buildroot] [PATCHv2] package/dash: don't build in paralle
In-Reply-To: <20180529174237.16902-1-yann.morin.1998@free.fr>
References: <20180529174237.16902-1-yann.morin.1998@free.fr>
Message-ID: <d14836cd-20e4-ba04-0290-49394dc2783c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-05-18 19:42, Yann E. MORIN wrote:
> dash has races in its Makefile, but upstream is not too keen in fixing
> those, and just suggests that dash not be built in parallel:
> 
>     https://www.mail-archive.com/dash at vger.kernel.org/msg01675.html

 Herbert's comment was:

    Until there is a good solution to rules with multiple targets,
    perhaps we should just disable parallel building in dash.

 Fortunately, there is a good solution: pattern rules. From the info page:

    Pattern rules may have more than one target.  Unlike normal rules,
    this does not act as many different rules with the same prerequisites
    and recipe.  If a pattern rule has multiple targets, 'make' knows that
    the rule's recipe is responsible for making all of the targets.  The
    recipe is executed only once to make all the targets.


 So a pattern rule like:

%token.h %token_vars.h: %mktokens
	$(SHELL) $^

should do the trick.

 I think this is a GNU make extension, however. I don't know if that's
acceptable for upstream. I can imagine that they want to support bsdmake.

 Regards,
 Arnout


> 
> Fixes:
>     http://autobuild.buildroot.org/results/793/7934c815a3009af688c2f1183e67dfe542c9a009/
>     http://autobuild.buildroot.org/results/fc4/fc4e4ab47455ac47dd4a3a60083cec2848e74dbb/
>     http://autobuild.buildroot.org/results/6bf/6bfdd44ea5d55a6ca3ef92254eab18c7c0416b7b/
>     [...]
> 
> Reported-by: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>
> 
> ---
> Changes v1 -> v2:
>   - disable parallel build instead of trying to fix it, since upstream
>     suggest so.
> ---
>  package/dash/dash.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index 9a26ebb642..80f0ea8cf3 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -9,6 +9,9 @@ DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
>  DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
>  DASH_LICENSE_FILES = COPYING
>  
> +# dash does not build in parallel
> +DASH_MAKE = $(MAKE1)
> +
>  ifeq ($(BR2_PACKAGE_LIBEDIT),y)
>  DASH_DEPENDENCIES += libedit host-pkgconf
>  DASH_CONF_OPTS += --with-libedit
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
