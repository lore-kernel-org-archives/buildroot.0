From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 22:41:31 +0200
Subject: [Buildroot] [PATCH] package/pigpio: add sysv and systemd init
 scripts
In-Reply-To: <20200907093429.11808-1-grzegorz@blach.pl>
References: <20200907093429.11808-1-grzegorz@blach.pl>
Message-ID: <20200907224131.246e3598@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 Sep 2020 11:34:26 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

I've applied, thanks, with one change.

> +define PIGPIO_INSTALL_INIT_SYSTEMD
> +        $(INSTALL) -D -m 644 package/pigpio/pigpio.service \
> +                $(TARGET_DIR)/usr/lib/systemd/system/pigpio.service
> +        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +        ln -fs ../../../../usr/lib/systemd/system/pigpio.service \
> +                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/pigpio.service

The mkdir and ln are no longer needed, the systemd package is now
running:

        $(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all

at the end of the build, which creates all those symlinks. So I dropped
this mkdir/ln when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
