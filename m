From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:39:02 +0100
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi/post-build.sh: avoid
 HDMI login when getty disabled
In-Reply-To: <20191001125028.5094-1-mailist@logilin.fr>
References: <20191001125028.5094-1-mailist@logilin.fr>
Message-ID: <20191027123902.32c7b0e3@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christophe,

On Tue,  1 Oct 2019 14:50:28 +0200
Christophe Blaess <mailist@logilin.fr> wrote:

> -# Add a console on tty1
>  if [ -e ${TARGET_DIR}/etc/inittab ]; then
> -    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
> -	sed -i '/GENERIC_SERIAL/a\
> +	# Remove tty1 line
> +	sed -i '/^tty1::/d' ${TARGET_DIR}/etc/inittab
> +	# Add a tty1 line if GENERIC_SERIAL is present (and not commented)
> +	sed -i '/^[^#].*GENERIC_SERIAL/a\
>  tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
>  fi

We're fine with the idea, but we would like the implementation to rely
on the BR2 option. So something like this:

# Add a console on tty1
if grep -Eq "^BR2_TARGET_GENERIC_GETTY=y$" ${BR2_CONFIG} && [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

Probably the shell syntax is bogus, but you get the point: we want to
rely on BR2_TARGET_GENERIC_GETTY=y to decide whether or not to add a
getty on tty1.

Could you rework your patch in that direction ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
