From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Jan 2021 11:01:48 +0100
Subject: [Buildroot] [PATCH] package/refpolicy: Add option to disable
 "dontaudit" rules
In-Reply-To: <20210127095627.789080-1-maxime.chevallier@bootlin.com>
References: <20210127095627.789080-1-maxime.chevallier@bootlin.com>
Message-ID: <20210127110148.1e7ef518@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 Jan 2021 10:56:27 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Some rules in the refpolicy are declared with "dontaudit", effectively
> suppressing any AVC violation log, while still denying the actions.
> 
> This is useful in some cases, where denied actions are to be expected
> but won't prevent the system from operating.
> 
> However in some other cases, the suppressed logs are important to
> troubleshoot some issues.
> 
> Disabling the "dontaudit" rules can be done either from the running
> system by rebuilding the policy with "semodules -DB", or when initialy
> building the policy by using the "enableaudit" make target.
> 
> This commit allows building the refpolicy with the "enableaudit" target
> prior to installing it, thanks to a dedicated config option.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks for the patch!

>  define REFPOLICY_INSTALL_TARGET_CMDS
> -	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
> +		$(REFPOLICY_EXTRA_MAKE_INSTALL_TARGETS) install

The INSTALL_TARGET_CMDS should normally only *install* the policy. The
policy is built in BUILD_CMDS. In commit
fb2968707bc66afb2c246d92e15f295475f23868, Antoine did some effort to
make sure that the policy gets built in BUILD_CMDS, and not in the
install, so it would be good to keep this behavior.

That being said, I'm not clear between what the "policy" make target
does (invoked in BUILD_CMDS) and what the "enableaudit" make target
does.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
