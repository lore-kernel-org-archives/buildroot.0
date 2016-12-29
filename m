From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Dec 2016 17:04:42 +0100
Subject: [Buildroot] [PATCH v2] rtl8723bs: new package
In-Reply-To: <20161229154452.5815-1-ezequiel@vanguardiasur.com.ar>
References: <20161229154452.5815-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <20161229170442.0c100de5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Dec 2016 12:44:52 -0300, Ezequiel Garcia wrote:

> +define RTL8723BS_INSTALL_FIRMWARE
> +	mkdir -p $(TARGET_DIR)/lib/firmware/rtlwifi

Shouldn't be needed since you use $(INSTALL) -D which creates the
destination directory.

> +	$(foreach bin, $(RTL8723BS_BINS), $(INSTALL) -D -m 644 $(@D)/$(bin) \
> +				$(TARGET_DIR)/lib/firmware/rtlwifi/$(bin)$(sep))

Rather than $(sep) I've recently started using a different construct,
which I find nicer (but we don't use it consistently across Buildroot) :

	$(foreach bin,$(RTL8723BS_BINS),\
		$(INSTALL) -D -m 644 $(@D)/$(bin) $(TARGET_DIR)/lib/firmware/rtlwifi$(bin)
	)


The fact that the closing parenthesis is on a new line replaces the
$(sep).

But I admit it's really a matter of taste.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
