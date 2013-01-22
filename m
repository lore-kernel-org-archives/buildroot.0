From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 22 Jan 2013 20:17:55 +0200
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <20130122180554.6c540102@skate>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
 <20130122180554.6c540102@skate>
Message-ID: <50FED7D3.3060600@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

22.1.2013 19:05, Thomas Petazzoni kirjoitti:
> Dear Gustavo Zacarias,
>
> On Mon, 21 Jan 2013 19:55:43 -0300, Gustavo Zacarias wrote:
>
>> +config BR2_TARGET_ROOTFS_CPIO_LZO
>> +	bool "lzo"
>> +	help
>> +	  Do compress the cpio filesystem with lzo.
>> +
>> +config BR2_TARGET_ROOTFS_CPIO_XZ
>> +	bool "xz"
>> +	help
>> +	  Do compress the cpio filesystem with xz.
> I don't remember exactly, but isn't the kernel build process itself
> capable of compressing the initramfs already? I remember we had some
> discussion about this a while ago, but I don't remember the outcome of
> these. Arnout was leading this discussion, IIRC.

If it's embedded initramfs then yes, kernel can handle it all itself
just nicely.
without needing to compress inside initramfs.
(images kernel.png and kernel2.png)

But if outside cpio-archive (aka initramfs) then no. It has to be done
by hand.
And like I said to Gustavo it's bad to do double compression.


Here's are the different combinations:

1 ) compressed initramfs  inside  compressed kernel = bad (waste of time
decompressing twice, and also waste of package file header size overhead)
2 ) compressed initramfs inside uncompressed kernel = better (no time
waste but still space waste)
3 ) uncompressed initramfs inside compressed kernel = best solution for
embedded initramfs (no time waste & time space waste)

4 ) uncompressed outside initramfs and uncompressed kernel (waste of
space and even according to some benchmarks, waste of time)
5 ) compressed outside initramfs and compressed kernel (no wasted time
and no wasted space)

So option 3 is best for embedded initramfs and option 5 for otherwise
for those who want more flexibility with their enivronment.
For example I could have this:

   
-------------------------------------------------------------------------------------------------------------------------------------------------
   |  embedded, uncompressed initramfs insize xz-compressed kernel, with
just busybox and minimal stuff |
  
--------------------------------------------------------------------------------------------------------------------------------------------------
                                                              |
  
---------------------------------------------------------------------------------------------------------------------------------
   | compressed outside initramfs with ncurses & directfb application,
like links web-browser    |
  
---------------------------------------------------------------------------------------------------------------------------------
                                                              |
 
----------------------------------------------------------------------------------------------------------------------------------
  | still another compressed initramfs with Xorg, firefox and all the
heavy stuff                             |
 
----------------------------------------------------------------------------------------------------------------------------------

All stackable one top over another (at least grub legacy allows giving
several initramfs).

And in Grub conf I could have boot entries like:
- Minimal system (just busybox and it's apps)
- Light system (ncurses, directfb and other non-Xorg "graphical" apps)
- Full system  (full Xorg stuff and apps)

Without outside initramfs option I would have to stick kernel (and it's
modules) to each of those initramfs files which would be a waste of space.
Now I have only one kernel (with or without initramfs) and 2 outside
initramfs which I can mix and match like lego blocks.

Stefan














> Best regards,
>
> Thomas

-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel.png
Type: image/png
Size: 24654 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130122/3fb45fea/attachment-0002.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel2.png
Type: image/png
Size: 24921 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130122/3fb45fea/attachment-0003.png>
