From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 10 Jul 2015 19:20:15 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: enable openvmtools
 kernel modules
In-Reply-To: <54E882FC.9000009@openwide.fr>
References: <1424388046-30299-1-git-send-email-romain.naour@openwide.fr>
 <20150220092207.1ee858a9@free-electrons.com> <54E882FC.9000009@openwide.fr>
Message-ID: <559FFECF.8060905@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Karoly, All

Le 21/02/2015 14:07, Romain Naour a ?crit :
> Hi Thomas, Karoly, All
> 
> Le 20/02/2015 09:22, Thomas Petazzoni a ?crit :
>> Dear Romain Naour,
>>
>> On Fri, 20 Feb 2015 00:20:46 +0100, Romain Naour wrote:
>>
>>> diff --git a/package/openvmtools/0008-configure-don-t-append-build-directory-to-LINUXINCLU.patch b/package/openvmtools/0008-configure-don-t-append-build-directory-to-LINUXINCLU.patch
>>> new file mode 100644
>>> index 0000000..5d18d9f
>>> --- /dev/null
>>> +++ b/package/openvmtools/0008-configure-don-t-append-build-directory-to-LINUXINCLU.patch
>>> @@ -0,0 +1,31 @@
>>> +From 796296f35c6992b4c685b7926a2aff9cd3bcac81 Mon Sep 17 00:00:00 2001
>>> +From: Romain Naour <romain.naour@openwide.fr>
>>> +Date: Mon, 16 Feb 2015 11:30:23 +0100
>>> +Subject: [PATCH 8/8] configure: don't append build directory to LINUXINCLUDE.
>>> +
>>> +This break the build when LINUXDIR point to the kernel linux sources
>>> +(ie not from /lib/module/uname -r/build/include)
>>> +
>>> +Use directly --with-linuxdir=$(LINUX_DIR)/build if necessary.
>>> +
>>> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>> +---
>>> + configure.ac |    2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 549736f..6c97785 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -148,7 +148,7 @@ if test "$with_kernel_modules" = "yes"; then
>>> +          if test ! -d "$LINUXDIR/kernel/"; then
>>> +              AC_MSG_ERROR([$LINUXDIR/kernel does not exist])
>>> +          fi
>>> +-         LINUXINCLUDE="$LINUXDIR/build/include"
>>> ++         LINUXINCLUDE="$LINUXDIR/include"
>>
>> I believe this patch may not be needed. The idea of the original code
>> is that $LINUXDIR should be set to /lib/modules/<kernelversion>/. In a
>> normal system, this directory contains a "build" symbolic link, which
>> points back to the kernel source directory, or the kernel headers
>> directory.
>>
>> thomas at skate:/lib/modules/3.16.0-31-generic$ ls -l
>> total 4052
>> lrwxrwxrwx  1 root root     40 f?vr. 10 17:36 build -> /usr/src/linux-headers-3.16.0-31-generic
>> [...]
>>
> 
> Thanks for the review,
> 
> The --with-linuxdir option is confusing because one can understand (like me)
> that we can use directly the kernel source directory.
> 
>>
>>> + if test "$os" = "linux"; then
>>> +-   MODULES_DIR="$LINUXDIR/kernel/"
>>> ++   # MODULES_DIR is used to install vmware modules to the target
>>> ++   # Use DESTDIR to define the target rootfs when installing
>>> ++   MODULES_DIR="/lib/modules/$KERNEL_RELEASE/kernel/"
>>
>> Same here: LINUXDIR is expected to point
>> at /lib/modules/<kernelversion>/, and the "kernel" subdirectory in here
>> is where kernel modules are installed. So if you point LINUXDIR
>> to /lib/modules/<kernelversion>/, this patch should not be needed.
>>
>> Now, there is one trick: in the current Buildroot, the kernel modules
>> are only installed to $(TARGET_DIR), and when installed, the 'build'
>> symbolic link is removed, because it points to a non-nonsensical
>> location since the kernel sources (or kernel headers) are not installed
>> in $(TARGET_DIR).
>>
>> So either we need to keep your patches (but they have no chance of
>> being upstreamed), or we install kernel modules to $(STAGING_DIR). I'm
>> not sure if we want to do that just for the sake of openvmtools, though.
>>
>> So in the end, maybe what you did is the best approach.
> 
> The open-vm-tools kernel module build system is not very cross-compilation
> friendly and as Karoly said in his reply [1], most of the kernel modules has
> been upstreamed.
> 
> Not sure upstream will work on this in near future.
> But those modules are still needed for "older" kernel.
> 
> I need to check when the vmware modules have been merged.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-February/119751.html

I'm not motivated anymore to add this option since openvmtools package was
updated and these kernel modules are likely to break with latest stable Linux
kernel...

I tried to fixes some build failures for 3.2.68 and 3.4.x but it require some
invasive fixes...

So let this option disabled and recommend users to use a recent kernel with
upstreamed vmware modules.

I've marked this patch as rejected in patchwork.

Thanks Karoly for the review.

Best regards,
Romain Naour

> 
> Best regards,
> Romain
> 
>>
>>> +config BR2_PACKAGE_OPENVMTOOLS_KERNEL_MODULES
>>> +	bool "Openvmtools Linux Kernel Modules"
>>> +	depends on BR2_LINUX_KERNEL
>>> +	help
>>> +	  Build openvmtools's Linux kernel modules.
>>> +
>>> +comment "Openvmtools's Linux kernel modules needs a Linux kernel to be built"
>>
>> needs -> need
>>
>> Thomas
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
