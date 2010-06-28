From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Mon, 28 Jun 2010 09:16:09 +0200
Subject: [Buildroot] [PATCH] fix ldconfig at target-finalize
References: <013c7951a6ee3d95f4eb50842e16b771e4f42619.1276695686.git.baruch@tkos.co.il>
Message-ID: <BLU0-SMTP74DDC98C00DC73900EC521E7CA0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, June 16, 2010 3:43 PM, Baruch Siach wrote:
> Host ldconfig fails when the directory of the aux-cache file
> (/var/cache/ldconfig, by default) does not exist. Make sure this directory
> exists before calling ldconfig.
>

Also would be good to do a "touch $(TARGET_DIR)/etc/ld.so.conf" too, along 
with your mkdir.

Then you get rid of both errors...

/sbin/ldconfig: Can't open configuration file 
(...)/target-dir/etc/ld.so.conf: No such file or directory
/sbin/ldconfig: Can't open cache file /var/cache/ldconfig/aux-cache : No 
such file or directory

Do you need me to provide a patch file to do this?

Cheers
Andy


> Signed-off-by: Baruch Siach 
> <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
> Makefile |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 794a298..1415e30 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -402,6 +402,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
>  rm -rf $(TARGET_DIR)/usr/share/gtk-doc
> endif
>  find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || 
> true
> + mkdir -p $(TARGET_DIR)/var/cache/ldconfig
>  $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
>
>  mkdir -p $(TARGET_DIR)/etc
> -- 
> 1.7.1 
