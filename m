From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 22:46:48 +0200
Subject: [Buildroot] [PATCH] vsftpd: Add systemd services
In-Reply-To: <1443977143-21369-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443977143-21369-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151010224648.4a36a327@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  4 Oct 2015 18:45:43 +0200, Maxime Hadjinlian wrote:
> The systemd services were taken from Arch Linux's repository:
> https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/vsftpd

Can this support be submitted upstream?

> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

I've tested this, and it doesn't seem to work here:


         Starting Serial Getty on ttyAMA0...
         Starting Login Service...
systemd[1]: vsftpd at multi-user.service: Failed to run 'start' task: Invalid argument
[FAILED] Failed to start vsftpd per-connection server.
See 'systemctl status vsftpd at multi-user.service' for details.
systemd[1]: vsftpd at multi-user.service: Unit entered failed state.
systemd[1]: vsftpd at multi-user.service: Failed with result 'resources'.
         Starting vsftpd per-connection server...
[  OK  ] Started D-Bus System Message Bus.
         Starting D-Bus System Message Bus...
[  OK  ] Started vsftpd daemon (legacy implicit SSL).
         Starting vsftpd daemon (legacy implicit SSL)...
[FAILED] Failed to start vsftpd per-connection server (legacy implicit SSL).
See 'systemctl status vsftpd-ssl at multi-user.service' for details.
         Starting vsftpd per-connection server (legacy implicit SSL)...


> +define VSFTPD_INSTALL_INIT_SYSTEMD
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
> +
> +	for f in vsftpd.service vsftpd.socket vsftpd at .service \
> +		vsftpd-ssl.service vsftpd-ssl.socket vsftpd-ssl at .service; do \
> +		$(INSTALL) -D -m 644 package/vsftpd/$$f \
> +			$(TARGET_DIR)/usr/lib/systemd/system/$$f; \
> +		wanted_by="multi-user.target.wants"; \
> +		if [ $${f##*.} = "socket" ]; then \
> +			wanted_by="sockets.target.wants"; \
> +		fi; \
> +		ln -sf ../../../../usr/lib/systemd/system/$$f \
> +			$(TARGET_DIR)/etc/systemd/system/$$wanted_by/$$f; \
> +	done

You could also write this in pure make, though I don't know if it's
really more readable:

	$(foreach f,$(wildcard package/vsftpd/*.service),\
		$(INSTALL) -D -m 644 $(f) $(TARGET_DIR)/usr/lib/systemd/system/$(notdir $(f)) && \
		ln -sf ../../../../usr/lib/systemd/system/$(notdir $(f)) \
			$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(notdir $(f))$(sep))
	$(foreach f,$(wildcard package/vsftpd/*.socket),\
		$(INSTALL) -D -m 644 $(f) $(TARGET_DIR)/usr/lib/systemd/system/$(notdir $(f)) && \
		ln -sf ../../../../usr/lib/systemd/system/$(notdir $(f)) \
			$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/$(notdir $(f))$(sep))

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
