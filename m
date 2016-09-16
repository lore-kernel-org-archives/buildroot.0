From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 19:05:17 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160916190517.01d3dd5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Sep 2016 00:35:17 +0200, Yann E. MORIN wrote:

> +# Force olddefconfig again on -reconfigure
> +$(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
> +
> +$(1)-clean-kconfig-for-reconfigure:
> +	rm -f $$($(2)_DIR)/.stamp_kconfig_fixup_done

I was about to apply this, but in fact, I'm not sure I agree.

<foo>-reconfigure is supposed to re-do the configuration step entirely.
For example, with an autotools package, if I change the value of
<pkg>_CONF_OPTS and then do make <foo>-reconfigure, the configuration
is done again, with the new <pkg>_CONF_OPTS.

Here, what you're doing is that you're only re-doing the "fixup" of
the .config, but you're not re-loading the configuration from the
original defconfig or full config file. This means that if the user
changes the defconfig and does "make linux-reconfigure", it won't
reload the defconfig.

Unless my analysis is wrong, I think the patch should be changed to
re-do the configuration step entirely.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
