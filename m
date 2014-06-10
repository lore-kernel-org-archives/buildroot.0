From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 22:33:58 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
 "target-finalize" rule
In-Reply-To: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
References: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140610223358.69a70e6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue, 10 Jun 2014 10:52:47 +0200, Fabio Porcedda wrote:

>  target-finalize: $(TARGETS)
>  	@$(call MESSAGE,"Finalizing target directory")
> +	$(TARGET_FINALIZE_GENERIC_SECURETTY)
> +	$(TARGET_FINALIZE_GENERIC_HOSTNAME)
> +	$(TARGET_FINALIZE_GENERIC_ISSUE)
> +	$(TARGET_FINALIZE_ROOT_PASSWD)
> +	$(TARGET_FINALIZE_GENERIC_GETTY)
> +	$(TARGET_FINALIZE_GENERIC_REMOUNT_RW)

I agree with the principle, but I'd like to have a better
implementation, which is really long overdue to stop cluttering
target-finalize with more and more crap. Could we implement
target-finalize as just:

target-finalize: $(TARGETS)
	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$(call $(hook),end,$(1),$($(PKG)_NAME))$(sep))

And then:

> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> +define TARGET_FINALIZE_GENERIC_SECURETTY
>  	grep -q '^$(TARGET_GENERIC_GETTY_PORT)$$' $(TARGET_DIR)/etc/securetty || \
>  		echo '$(TARGET_GENERIC_GETTY_PORT)' >> $(TARGET_DIR)/etc/securetty
> +endef

TARGET_FINALIZE_HOOKS += TARGET_FINALIZE_GENERIC_SECURETTY

Then we can also use this to move the Python, Perl and other
package-specific target-finalize logic down to the specific packages.
Of course, I'm not asking you to do all of this work. But at least,
post a patch introducing the TARGET_FINALIZE_HOOKS, and use it for
those targets you were converting in your original patch.

We should go towards *removing* stuff from the main Makefile, not
adding more :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
