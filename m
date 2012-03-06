From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 6 Mar 2012 21:46:50 +0100
Subject: [Buildroot] u-boot .img rootfs (H Hartley Sweeten)
In-Reply-To: <mailman.72910.1331054872.2942.buildroot@busybox.net>
References: <mailman.72910.1331054872.2942.buildroot@busybox.net>
Message-ID: <3394B36989C84FD28AA510ECFE375D51@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens buildroot-request at busybox.net
Verzonden: dinsdag 6 maart 2012 18:28
Aan: buildroot at busybox.net
Onderwerp: buildroot Digest, Vol 69, Issue 46

Send buildroot mailing list submissions to
	buildroot at busybox.net

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.busybox.net/mailman/listinfo/buildroot
or, via email, send a message with subject or body 'help' to
	buildroot-request at busybox.net

Hi

I use u-boot in 2 different ways :

I use fatload to load the kernel image from an usb-stick
The kernel then loads the rootfs from a second ext partition on the usb stick.

The other is way i use it is to load the kernel from tftp and then load rootfs over NFS

Then i prepare the flash mtd from linux and i untar a copy of the rootfs to the mtd,and copy the kernel to another mtd partition.

If thats done i setup u-boot to load kernel and rootfs from the flash.
I don't use u-boot to write the kernel and rootfs, it's all done from within the linux booted over NFS or from an usb stick.

Johan


You can reach the person managing the list at
	buildroot-owner at busybox.net

When replying, please edit your Subject line so it is more specific than "Re: Contents of buildroot digest..."


Today's Topics:

   1. Re: u-boot .img rootfs (H Hartley Sweeten)
   2. missing reference to libm for MicroPerl (Joshua Jackson)
   3. Re: u-boot .img rootfs (Thomas Petazzoni)
   4. Re: [support.osuosl.org #20368] Re: Buildroot	2012.02-rc3
      released (Steve Calfee)
   5. [PATCH] Make libmicrohttpd version configurable
      (rolandu at gmail.com)
   6. Re: [PATCH] Make libmicrohttpd version configurable
      (Thomas Petazzoni)
   7. Re: buildroot-reg (Thomas Petazzoni)


----------------------------------------------------------------------

Message: 1
Date: Tue, 6 Mar 2012 10:48:10 -0600
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	"buildroot at busybox.net" <buildroot@busybox.net>
Subject: Re: [Buildroot] u-boot .img rootfs
Message-ID:
	<ADE657CA350FB648AAC2C43247A983F001F41FF55761@AUSP01VMBX24.collaborationhost.net>
	
Content-Type: text/plain; charset="utf-8"

On Tuesday, March 06, 2012 3:48 AM, Thomas Petazzoni wrote:
> Le Mon, 5 Mar 2012 20:00:57 -0600, H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :
>
>> I have been using Buildroot to create a rootfs.ext2.gz that works 
>> great with RedBoot.
>> 
>> I have a new board that uses U-Boot as the bootloader and it wants 
>> some kind of .img file for the rootfs.  Can this be created using 
>> Buildroot? Do I need to do something after the rootfs.ext2.gz is 
>> created to make the .img file?
>
> Do you have more details, because .img is very generic. Do you have a 
> pointer to your specific U-Boot configuration? Can you just show why 
> you think U-Boot needs such as file?

This is the first U-Boot system I have worked with so I don't have a lot of details.

I know that that this works:

SIM.ONE> tftp c0200000 uImage
TFTP from server 192.168.0.84; our IP address is 192.168.0.79 Filename 'uImage'.
Load address: 0xc0200000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ###################################################
done
Bytes transferred = 1923792 (1d5ad0 hex) SIM.ONE> iminfo

## Checking Image at c0200000 ...
   Image Name:   Linux-3.2.5
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1923728 Bytes =  1.8 MB
   Load Address: c0008000
   Entry Point:  c0008000
   Verifying Checksum ... OK

But, when I try the ramdisk.gz file (rootfs.ext2.gz) I get this:

SIM.ONE> tftp c8000000 ramdisk.gz
TFTP from server 192.168.0.84; our IP address is 192.168.0.79 Filename 'ramdisk.gz'.
Load address: 0xc8000000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #####################################################
done
Bytes transferred = 2266236 (22947c hex) SIM.ONE> iminfo

## Checking Image at c8000000 ...
   Bad Magic Number

The only things I have found about the U-Boot image file mentions using 'mkimage' to create the file using a command like these
examples:

mkimage -T ramdisk -C gzip -n 'Test Ramdisk Image' -d ramdisk.img.gz uRamdisk mkimage -A sh -O linux -T ramdisk -a 0x8C800000 -n
"ST40 Linux ramdisk" -d initrd.img /export/ramdisk.ub

My guess the uRamdisk file is the same format as the uImage file used for the kernel. But, I'm not sure what the format of the
ramdisk.img.gz or initrd.img files are.

I do see there is a uboot-mkimage package available in Debian. It says this about it:

---

This package contains the mkimage utility, which encapsulates a compressed "uImage"
Linux kerel image with header information, CRC32 checksum, etc, for use with the U-Boot bootloader.
 
mkimage can also be used to create ramdisk images for use with U-Boot, either separated from the Linux kernel image, or combined
into one file. mkimage encapsulates the images with a 64 byte header containing information about target architecture, operating
system, image type, compression method, entry points, time stamp, CRC32 checksums, etc.

---

Regards,
Hartley


------------------------------

Message: 2
Date: Tue, 6 Mar 2012 11:46:06 -0500
From: Joshua Jackson <jjackson@vortech.net>
To: buildroot at busybox.net
Subject: [Buildroot] missing reference to libm for MicroPerl
Message-ID:
	<CADxd2g8k8X=xNBWdE=dSbCUnkupecS1LdDZwiVYKiYTry1Uo4A@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1

I am currently running into an issue with the compilation of MicroPerl fails with a missing libm reference. I found the following
patch that was date from a couple years ago:

This fixes builds on my system, but I'm not sure what else it might break.

Is there another fix / setting I might be missing to prevent the need for this patch?

I am using a CentOS 6 x86_64 host and am compiling for a i586 x86_32 target.

Thanks,
Josh

Patch against 2012.2 follows:


diff -uNr a/package/microperl/microperl.mk b/package/microperl/microperl.mk
--- a/package/microperl/microperl.mk    2012-02-29 17:19:47.000000000 -0500
+++ b/package/microperl/microperl.mk    2012-03-01 17:16:01.000000000 -0500
@@ -40,6 +40,7 @@
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/Makefile
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/Makefile
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/makefile
+       $(SED) 's/^libs =/libs = -lm/g' $(MICROPERL_DIR)/makefile
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/makefile
        touch $@


------------------------------

Message: 3
Date: Tue, 6 Mar 2012 17:59:40 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
Cc: "buildroot at busybox.net" <buildroot@busybox.net>
Subject: Re: [Buildroot] u-boot .img rootfs
Message-ID: <20120306175940.19e6f808@skate>
Content-Type: text/plain; charset=UTF-8

Le Tue, 6 Mar 2012 10:48:10 -0600,
H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :

> The only things I have found about the U-Boot image file mentions 
> using 'mkimage' to create the file using a command like these
> examples:
> 
> mkimage -T ramdisk -C gzip -n 'Test Ramdisk Image' -d ramdisk.img.gz 
> uRamdisk mkimage -A sh -O linux -T ramdisk -a 0x8C800000 -n "ST40 
> Linux ramdisk" -d initrd.img /export/ramdisk.ub
> 
> My guess the uRamdisk file is the same format as the uImage file used 
> for the kernel. But, I'm not sure what the format of the 
> ramdisk.img.gz or initrd.img files are.

Yes, you have to pass the ext2.gz file through mkimage before giving it to U-Boot, in order to generate a ramdisk image that U-Boot
can understand and load into memory.

However, this way of doing ramdisks is more or less deprecated, initramfs have been the norm since quite some years now.

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com


------------------------------

Message: 4
Date: Tue, 06 Mar 2012 09:16:25 -0800
From: Steve Calfee <stevecalfee@gmail.com>
To: support at osuosl.org
Cc: buildroot at busybox.net, jacmet at sunsite.dk
Subject: Re: [Buildroot] [support.osuosl.org #20368] Re: Buildroot
	2012.02-rc3 released
Message-ID: <4F564669.1050009@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed

On 03/05/2012 02:55 PM, Rudy Grigar via RT wrote:
> On Sun Mar 04 17:04:47 2012, jacmet at sunsite.dk wrote:
>>>>>>> "Steve" == Steve Calfee<stevecalfee@gmail.com>  writes:
>> Hi,
>>
>> Some buildroot users (Steve is one of them) are still experiencing DNS
>> related issues after the uclibc.org DNS move (*.buildroot.net are CNAMEs
>> to buildroot.uclibc.org). The fixes of last week unfortunately didn't
>> seem to solved the problem, could you take a look again?
>>
>> Thanks.
>>
>>   Steve>  Hi all,
>>   Steve>  Something is seriously messed up with DNS. After the osuosl guys
>>   Steve>  "fixed" it, I can no longer access  wget
>>   Steve>  'http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3' at
>>   Steve>  work, which was working, briefly before that.
>>
>>   Steve>  So now I cannot access git.buildroot.net from 3 separate isps. All
>>   Steve>  three local networks are NATed, two have a wireless router as the
>>   Steve>  gateway. I don't think this is a rare configuration. I have not had
>>   Steve>  this problem accessing any http server or of several git servers.
>>
>>   Steve>  It would really be nice to git fetch the latest release!
>>
>>   Steve>  Regards, Steve
>>
>
> I have noticed on certain clients that cname->cname records caused weird results.  I moved
> buildroot.uclibc.org to an A record to prevent the cname->cname:
>
> git.buildroot.net is an alias for buildroot.uclibc.org.
> buildroot.uclibc.org has address 140.211.167.224
>
> Let me know if this fixes the dns issues (note: the ttl is 24 hours).
>
> Thanks,
> Rudy
For everyone's info, I waited 24 hours and can now successfully connect 
to the link above and git fetch again! So whatever osuosl did this time 
seems to work. I have tried on two isp networks, both att uverse and a 
work isp successfully.

Regards, Steve


------------------------------

Message: 5
Date: Tue,  6 Mar 2012 19:18:48 +0200
From: rolandu@gmail.com
To: buildroot at uclibc.org
Subject: [Buildroot] [PATCH] Make libmicrohttpd version configurable
Message-ID: <1331054328-6564-1-git-send-email-rolandu@gmail.com>

From: Roland Uuesoo <roland@martem.eu>

Signed-off-by: Roland Uuesoo <roland@martem.eu>
---
 package/libmicrohttpd/Config.in        |    7 +++++++
 package/libmicrohttpd/libmicrohttpd.mk |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index cfedc8f..96cd408 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -6,6 +6,13 @@ config BR2_PACKAGE_LIBMICROHTTPD
 
 	  http://www.gnu.org/software/libmicrohttpd/
 
+config BR2_PACKAGE_LIBMICROHTTPD_VERSION
+	string "libmicrohttpd version"
+	depends on BR2_PACKAGE_LIBMICROHTTPD
+	default 0.4.6
+	help
+	  Specify libmicrohttpd version
+
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
        bool "https support"
        depends on BR2_PACKAGE_LIBMICROHTTPD
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index ff2b55d..739d779 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -3,7 +3,7 @@
 # libmicrohttpd
 #
 #############################################################
-LIBMICROHTTPD_VERSION = 0.4.6
+LIBMICROHTTPD_VERSION = $(BR2_PACKAGE_LIBMICROHTTPD_VERSION)
 LIBMICROHTTPD_SOURCE = libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_INSTALL_STAGING = YES
-- 
1.7.5.4



------------------------------

Message: 6
Date: Tue, 6 Mar 2012 18:20:46 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH] Make libmicrohttpd version
	configurable
Message-ID: <20120306182046.56f21098@skate>
Content-Type: text/plain; charset=UTF-8

Le Tue,  6 Mar 2012 19:18:48 +0200,
rolandu at gmail.com a ?crit :

> From: Roland Uuesoo <roland@martem.eu>

Except for some particular packages such as U-Boot or the kernel, which
are highly hardware-dependent, we generally don't like having multiple
version support for userspace libraries/applications.

Could you give us details as to why this would be needed specifically
for libmicrohttpd?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com


------------------------------

Message: 7
Date: Tue, 6 Mar 2012 18:27:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: saketha rama <ramasaketha@gmail.com>
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] buildroot-reg
Message-ID: <20120306182736.5f41bcc9@skate>
Content-Type: text/plain; charset=UTF-8

Hello,

For community support to Buildroot, I'd prefer if you asked the
Buildroot mailing list instead. Since your e-mail does not contain any
confidential information specific to your project, I took the freedom
of directly copying the Buildroot list for this reply. Please keep the
list in Cc for this discussion.

Le Tue, 6 Mar 2012 22:49:06 +0530,
saketha rama <ramasaketha@gmail.com> a ?crit :

>       I just found your PPT titled  "Using buildroot for real
> projects" .

Good. Just a detail: this document is not a PPT. PPT is a proprietary
file format that works only with the Microsoft Powerpoint proprietary
software, which I don't use. The document "Using Buildroot for real
projects" that you have found is a PDF generated with LaTeX.

> I have a great difficulty creating my customised rootfs
> for beaglebone embedded system using buildroot. It is said in your
> ppt that the buildroot/fs/skeleton will decide the rootfs structure,
> but after I change the skeleton also nothing is changed in my rootfs.

The skeleton is copied into the target directory (which will become the
contents of your root filesystem) at the *beginning* of the Buildroot
build process. Therefore, if you make changes to the skeleton, you must
do a "make clean; make" invocation to force Buildroot to restart the
build from scratch.

Of course, since this is practical at all, I do not recommend using the
skeleton mechanism to customize the root filesystem contents. I rather
recommend:

 *) Creating Buildroot packages if what you need to add to the root
 filesystem are additional libraries or applications ;

 *) Use the post-build script mechanism to add configuration files or
 scripts to the root filesystem. Since this post-build script is
 executed at the end of *every* build, it doesn't carry the same
 problem as the "customize skeleton" solution.

See slides 23 and 24 of the presentation "Using Buildroot for real
projects".

Do not hesitate to get back to us if you need more details about those
mechanisms,

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com


------------------------------

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

End of buildroot Digest, Vol 69, Issue 46
*****************************************
