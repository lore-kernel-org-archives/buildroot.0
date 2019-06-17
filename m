From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 17 Jun 2019 22:24:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/iputils: move binaries to the
 location also used by Busybox
In-Reply-To: <20190616200919.4378-1-thomas.petazzoni@bootlin.com>
References: <20190616200919.4378-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190617202402.GA8498@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> iputils installs several programs that are also implemented as applets
> in Busybox. Two of these (arping and tftpd) are installed by iputils
> in /bin, while Busybox installs them in /usr/sbin, causing both to be
     ^
I guess you mean /usr/bin

> present if both iputils and busybox are enabled.

> This commit moves the binaries installed by iputils to /usr/sbin, so
> that only these are installed (Busybox will be installed later thanks
> to its optional dependency on iputils, but it will not override the
> tools installed by iputils).
Thanks for reporting and fixing this bug.
Although I'm not keen on changing binary default location,
this is simple straightforward solution. Alternative would be to disable busybox
config CONFIG_ARPING (with support/kconfig/merge_config.sh), but that'd be too
complicated. Thus ack

Acked-by: Petr Vorel <petr.vorel@gmail.com>

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/iputils/iputils.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 8be54b4788..fbf586729b 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -52,6 +52,16 @@ endif
>  # XSL Stylesheets for DocBook 5 not packaged for buildroot
>  IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false

> +# move iputils binaries to the same location as where Busybox installs
> +# the corresponding applets, so that we have a single version of the
> +# tools (from iputils)
> +define IPUTILS_MOVE_BINARIES
> +	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
> +	mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping
> +	mv $(TARGET_DIR)/usr/bin/tftpd $(TARGET_DIR)/usr/sbin/tftpd

Just small research about iputils install directories.
busybox keeps mixed dirs /usr/{s,}bin and /{s,}bin (locations which were before
usrmerge concept), ping is indeed in /bin [1].
Debian chose also mixing /usr/{s,}bin and /{s,}bin [2]

But I'm concern about /{usr/,}/bin vs. /{usr/,}/sbin.
iputils before starting to use  meson didn't have any default location.
There was iputils.spec file [3] (now deleted), which suggested some locations,
but was marked as for testing purposes only. It had different paths than busybox
and Debian use. I guess I have to accept that there was no consensus and
therefore are differences in paths across both upstreams and distros.

Kind regards,
Petr

[1] https://git.busybox.net/busybox/tree/networking/ping.c#n52
[2] https://salsa.debian.org/debian/iputils/blob/master/debian/rules
[3] https://github.com/iputils/iputils/blob/bffc0e957b98d626ab4cea218c89251201425442/iputils.spec#L45
