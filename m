From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 3 Dec 2015 18:24:36 +0100
Subject: [Buildroot] [PATCH 17/51] core/legal-info: generate a hash of
 all saved files
In-Reply-To: <c5429b51639c27b6770d01282dc7beee72fd581d.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <c5429b51639c27b6770d01282dc7beee72fd581d.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <56607AD4.9010801@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Yann E. MORIN wrote:
> Having a hash of the saved files can be interesting for the recipient to
> verify the integrity of the files.
>
> We remove the warning file earlier, to exclude it from the hash list.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   Makefile | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 5e62275..947f941 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -662,8 +662,13 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
>   		cat support/legal-info/README.warnings-header \
>   			$(LEGAL_WARNINGS) >>$(LEGAL_REPORT); \
>   		cat $(LEGAL_WARNINGS); fi
> -	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
>   	@rm -f $(LEGAL_WARNINGS)
> +	@find $(LEGAL_INFO_DIR) -type f -exec sha256sum {} + \
> +	 |sed -r -e 's:  $(LEGAL_INFO_DIR)/+:  :' \
> +	 |sort -k2 \
> +	 >$(BUILD_DIR)/legal-info.sha256

Not sure I like the first sed invocation... It's written in a way that
heavily depends on how sha256 formats its output, and it's not very
much readable by the average Buildroot user (*). It will most likely
never cause any problems, it's mostly a style issue.

How about:

	@( cd $(LEGAL_INFO_DIR) &&
	   find . -type f -exec sha256sum {} + | sort -k2 ) \
	 >$(BUILD_DIR)/legal-info.sha256

It's untested, but I know you can write shell magic that works!

(*) No, Yann, you are _not_ an average user. ;)

-- 
Luca
