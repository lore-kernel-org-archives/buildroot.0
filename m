From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 22:38:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/vdr: new package
In-Reply-To: <1470469319-11791-1-git-send-email-bernd.kuhls@t-online.de>
References: <1470469319-11791-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20161025223848.33f4cb37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Aug 2016 09:41:58 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks, I've applied after doing a few minor tweaks, see below.

> diff --git a/package/vdr/0001-getloadavg.patch b/package/vdr/0001-getloadavg.patch
> new file mode 100644
> index 0000000..3937c83
> --- /dev/null
> +++ b/package/vdr/0001-getloadavg.patch
> @@ -0,0 +1,55 @@
> +Fix compilation with uClibc
> +
> +Ported from
> +https://github.com/stschake/buildroot-grasshopper/blob/master/package/torsmo/torsmo-0.18-uclibc-getloadavg.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Could you submit this patch upstream?

Also, notice that you could have re-used the getloadavg()
implementation from musl, which is much much shorter, and does not rely
on the /proc filesystem.

> diff --git a/package/vdr/0002-libjpeg.patch b/package/vdr/0002-libjpeg.patch
> new file mode 100644
> index 0000000..dbd1f12
> --- /dev/null
> +++ b/package/vdr/0002-libjpeg.patch
> @@ -0,0 +1,40 @@
> +Fix compilation with libjpeg
> +
> +Patch inspired by upstream board:
> +http://www.vdr-portal.de/board16-video-disk-recorder/board4-vdr-installation/p1189959-vdr-2-05-mit-libjpeg-9a-kommt-nicht-aus/#post1189959
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Could you also submit upstream?

> +ifeq ($(BR2_NEEDS_GETTEXT),y)
> +VDR_DEPENDENCIES += gettext
> +VDR_LDFLAGS = -lintl

I've changed this = to a += since we're inside a condition. It will
avoid potential mistakes in the future if someone adds another
VDR_LDFLAGS += line above.

> +define VDR_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(VDR_MAKE_ENV) \
> +		vdr vdr.pc
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(VDR_MAKE_ENV) \
> +		include-dir

It wasn't clear why you're making a second call to $(MAKE) here for the
include-dir target, so I've merged it with the previous one. I did a
rebuild, and it worked fine.

Also, I committed a follow-up patch to add you as the contact for this
package in the DEVELOPERS file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
