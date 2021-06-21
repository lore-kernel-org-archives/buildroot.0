From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 22:51:20 +0200
Subject: [Buildroot] [PATCH 03/15] package/pkg-generic.mk: Remove Info
 documents dir entry
In-Reply-To: <20210621141130.48654-4-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-4-herve.codina@bootlin.com>
Message-ID: <20210621225120.536cd758@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 16:11:18 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Some packages (autotools for instance) install documentation
> files using install-info. This program adds an entry in
> the Info directory file (share/info/dir) and this causes
> TARGET_DIR and/or HOST_DIR overwrite.
> 
> In order to avoid this overwrite this patch removes the Info
> directory file right after any installation.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  package/pkg-generic.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index bb9ff4150a..2499c94746 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -280,6 +280,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
>  	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
>  	+$($(PKG)_INSTALL_CMDS)
>  	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
> +	$(Q) rm -f $(HOST_DIR)/share/info/dir

No space between $(Q) and rm. This should perhaps use $(RM) in fact.

However, I'm not a huge fan of having this right in the middle of the
infrastructure. It feels like a small detail that gets handled in the
middle of super generic infrastructure code.

The issue is that I don't really have a good alternative proposal :-/

Instead of removing that file, ignore it in the overwrite detection,
perhaps?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
