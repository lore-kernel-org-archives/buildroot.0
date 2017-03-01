From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 1 Mar 2017 11:21:34 +0200
Subject: [Buildroot] [PATCH next] usb_modeswitch_data: install packed
	database
In-Reply-To: <fbab82af999db5392fe2ae2f671531ff91f801b9.1488260265.git.baruch@tkos.co.il>
References: <fbab82af999db5392fe2ae2f671531ff91f801b9.1488260265.git.baruch@tkos.co.il>
Message-ID: <20170301092134.kmrpdhrq5e3vf3q2@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Tue, Feb 28, 2017 at 07:37:45AM +0200, Baruch Siach wrote:
> The packed databased is significantly smaller than the unpacked. The unpacked
> database is made of hundreds of small files. So the benefit is larger
> filesystems that allocate a minimum of block per file. Database packing adds
> some overhead to every invocation of usb_modeswitch. This added overhead
> should not be noticeable in practice since usb_modeswitch normally runs only
> once per USB device insert event.

This turns out to be not such a great idea, since our Busybox tar build does 
not support the 'z' command line option. The tcl script embedded in  
usb_modeswitch_dispatcher relies on this option to extract device information 
entries from the packed database.

baruch

> 
> Before:
> 
>   du -h output/target/usr/share/usb_modeswitch/
>   1.9M	output/target/usr/share/usb_modeswitch/
> 
> After:
> 
>   du -h output/target/usr/share/usb_modeswitch/
>   20K	output/target/usr/share/usb_modeswitch/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/usb_modeswitch_data/usb_modeswitch_data.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
> index 6d75b3198310..8373b6e2ca20 100644
> --- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
> +++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
> @@ -14,7 +14,7 @@ USB_MODESWITCH_DATA_LICENSE_FILES = COPYING
>  # Nothing to build, it is a pure data package
>  
>  define USB_MODESWITCH_DATA_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-packed
>  endef
>  
>  $(eval $(generic-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
