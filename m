From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 9 May 2017 11:10:57 -0400
Subject: [Buildroot] [PATCH 1/1] ptp4l: new package
In-Reply-To: <1494322944-22289-1-git-send-email-brain@jikos.cz>
References: <1494322944-22289-1-git-send-email-brain@jikos.cz>
Message-ID: <CANxTyt6ChbT+SjZuFJoeWnz4THM7tuLSFEfvRSBmunWfG=688Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr,

On Tue, May 9, 2017 at 5:42 AM, Petr Kulhavy <brain@jikos.cz> wrote:
<snip>
> +PTP4L_CFLAGS = $(TARGET_CFLAGS)
> +
> +
> +define PTP4L_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) CC=$(TARGET_CC) EXTRA_CFLAGS="$(PTP4L_CFLAGS)" -C $(@D) all
> +endef

Perhaps you should add EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" as well.
(In addition to eliminating PTP4L_CFLAGS and using
EXTRA_CFLAGS="$(TARGET_CFLAGS)" instead,)

FWIW: changing the name to linuxptp: +1

Danomi -


> +
> +define PTP4L_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) prefix=$(TARGET_DIR)/usr $(TARGET_CONFIGURE_OPTS) -C $(@D) install
> +endef
> +
> +define PTP4L_INSTALL_INIT_SYSV
> +       $(INSTALL) -m 755 -D $(@D)/package/ptp4l/S65ptp4l \
> +               $(TARGET_DIR)/etc/init.d/S65ptp4l
> +endef
> +
> +define PTP4L_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 $(PTP4L_PKGDIR)/ptp4l.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/ptp4l.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -sf ../../../../usr/lib/systemd/system/ptp4l.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptp4l.service
> +endef
> +
> +$(eval $(generic-package))
> +
> diff --git a/package/ptp4l/ptp4l.service b/package/ptp4l/ptp4l.service
> new file mode 100644
> index 0000000..ec6bbc5
> --- /dev/null
> +++ b/package/ptp4l/ptp4l.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Precision Time Protocol daemon
> +After=syslog.target network.target
> +
> +[Service]
> +ExecStart=/usr/sbin/ptp4l -A -i eth0
> +Restart=always
> +
> +[Install]
> +WantedBy=multi-user.target
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
