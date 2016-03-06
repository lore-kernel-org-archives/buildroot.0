From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Mar 2016 20:37:37 +0100
Subject: [Buildroot] [PATCH] purge-locales: Handle empty locale
 directories better
In-Reply-To: <1457056294.25961.111.camel@rtred1test09.kymeta.local>
References: <1457056294.25961.111.camel@rtred1test09.kymeta.local>
Message-ID: <56DC8701.4000008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/16 02:50, Trent Piepho wrote:
> If a locale directory is empty, shell code like "for langdir in
> $$dir/*;" will loop once with langdir set to "path/to/dir/*", rather
> than not looping at all, which would obviously be the desired
> behavior.
> 
> Then "grep -qx $${langdir##*/}" ungoes two shell expansions (how?)
> that transform the expression from "${langdir##*/}" to "*" to "list
> of all files in buildroot root dir".  Which is most certainly not what
> this command was supposed to do.
> 
> If one of those files happens to be an 8GB flash image, grep consumes
> all available memory and crashes trying to search it.

 Good catch!

> 
> Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index f2822a2..0df5a35 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -581,7 +581,8 @@ define PURGE_LOCALES
>  	do \
>  		for langdir in $$dir/*; \
>  		do \
> -			grep -qx $${langdir##*/} $(LOCALE_WHITELIST) || rm -rf $$langdir; \
> +			[ -e "$${langdir}" ] || continue; \

 I would prefer a more explicit if, the continue is a bit more difficult to grok.

 Regards,
 Arnout

> +			grep -qx "$${langdir##*/}" $(LOCALE_WHITELIST) || rm -rf $$langdir; \
>  		done; \
>  	done
>  	if [ -d $(TARGET_DIR)/usr/share/X11/locale ]; \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
