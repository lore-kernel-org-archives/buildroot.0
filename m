From: Martin Bark <martin@barkynet.com>
Date: Sat, 14 Jul 2018 13:38:38 +0100
Subject: [Buildroot] [PATCH 1/1] <wireless-regdb>: Adds the option to
 copy "regulatory.db[.p7s]" to /lib/firmware
In-Reply-To: <20180713093254.7994-1-me@noctarius.com>
References: <20180713093254.7994-1-me@noctarius.com>
Message-ID: <CAFGQKxdVqfFizQBeAHHSmc4tW8FQkXZ+6qGZrD0o3njpNHYjZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On 13 July 2018 at 10:32, Christoph Engelbert <me@noctarius.com> wrote:
> Certain wireless drivers (like the Broadcom FullMac drivers" expect the regulatory.db and
> regulatory.db.p7s files to be available to be loadable from /lib/firmware. If not available
> the driver still loads but runs on a minimal subset of channels.
>
> This newly added option gives possibility to have those files copied to the necessary directory.

This is a good change but I think the commit message needs changing.
It's not really certain wireless drivers that is the issue, it's that
linux 4.15 added support to load regulatory.db directly without using
crda.  If the kernel can't load regulatory.db directly it will still
try and use crda.  So this change should allow you to stop using crda
for kernels after 4.15

Thanks

Martin

>
> Signed-off-by: Christoph Engelbert <me@noctarius.com>
> ---
>  package/wireless-regdb/wireless-regdb.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index e9283a00e2..829374edcf 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -15,6 +15,10 @@ define WIRELESS_REGDB_INSTALL_TARGET_CMDS
>                 $(TARGET_DIR)/usr/lib/crda/regulatory.bin
>         $(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
>                 $(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
> +       $(INSTALL) -m 644 -D -T $(@D)/regulatory.db \
> +               $(TARGET_DIR)/lib/firmware/regulatory.db
> +       $(INSTALL) -m 644 -D -T $(@D)/regulatory.db.p7s \
> +               $(TARGET_DIR)/lib/firmware/regulatory.db.p7s
>  endef
>
>  $(eval $(generic-package))
> --
> 2.17.1
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
