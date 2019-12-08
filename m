From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:53:00 +0100
Subject: [Buildroot] [PATCH] busybox: Don't overwrite existing inittab
In-Reply-To: <20191206123154.26102-1-paul@crapouillou.net>
References: <20191206123154.26102-1-paul@crapouillou.net>
Message-ID: <20191208165300.5eafd3d8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 13:31:54 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> If a inittab file was already provided in the skeleton, don't overwrite
> it with the one that comes with the busybox package.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/busybox/busybox.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 301e72bdd2..e5d2f1bd0c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -277,7 +277,9 @@ endif
>  
>  ifeq ($(BR2_INIT_BUSYBOX),y)
>  define BUSYBOX_INSTALL_INITTAB
> -	$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab
> +	if test ! -r $(TARGET_DIR)/etc/inittab; then \

We more commonly use test -e and not test -r for this kind of tests, so
I've changed to use test -e, and applied to master. Thanks!

Note that we normally recommend to override such files using a rootfs
overlay instead of a skeleton, as a rootfs overlay always wins over
whatever Buildroot packages might do.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
