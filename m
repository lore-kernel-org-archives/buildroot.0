From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 01:58:17 +0200
Subject: [Buildroot] [PATCH v7 6/9] core: install relocation script and
 location at the end of the build
In-Reply-To: <1499273594-12106-7-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-7-git-send-email-wg@grandegger.com>
Message-ID: <f55fe1f5-7f21-24af-e242-f31e1f444070@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 18:53, Wolfgang Grandegger wrote:
> The script "relocate-sdk.sh" is installed into the top directory of
> the SDK (HOST_DIR) and the SDK location path is stored in the file
> "HOST_DIR/share/buildroot/sdk-location"-
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However, while testing this I noticed a problem in relocate-sdk.sh: it uses a
bashism on line 43: < <(...) but the shebang is /bin/sh. I think the best
solution is to convert it into a normal pipe, since there is no real reason
there to use the < <(...) construct.

 Regards,
 Arnout

> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 2a265e0..32f85e8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -559,6 +559,8 @@ world: target-post-image host-finalize
>  host-finalize:
>  	@$(call MESSAGE,"Rendering the SDK relocatable")
>  	$(TOPDIR)/support/scripts/fix-rpath host
> +	install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)
> +	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
>  
>  # When creating HOST_DIR, also symlink usr -> .
>  $(HOST_DIR):
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
