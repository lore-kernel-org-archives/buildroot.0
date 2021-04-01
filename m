From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Thu, 1 Apr 2021 09:21:30 +0800
Subject: [Buildroot] building a kernel+ramdisk separate from rootfs for
 using dm_crypt filesystem
In-Reply-To: <CAJ+vNU3mdFXbCL95QQ-67xj8w3cLv6e7_BB6ou=YwPC3AqJSPA@mail.gmail.com>
References: <CAJ+vNU3mdFXbCL95QQ-67xj8w3cLv6e7_BB6ou=YwPC3AqJSPA@mail.gmail.com>
Message-ID: <238e19cf-64c8-3b79-16cb-ab335696f5cb@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tim,

On 2021/4/1 ??5:02, Tim Harvey wrote:
 > Greetings,
 >
 > I'm using buildroot to build a kernel and rootfs but now need to
 > implement dm_crypt for a secure filesystem.
 >
 > I'm not all that familiar with dm_crypt but it would appear that I
 > need to use an initramfs to open (unlock) the encrypted filesystem and
 > mount it.
 >
 > Do I need to build a separate buildroot config for the initramfs image
 > from the buildroot config that builds my traditional kernel and
 > rootfs? I was hoping to be able to build this all as a single project.

I am also doing similar work. I found two ways:

1. Treat initramfs as a package. Write your own init shell script.
 ?? a. Compile all dependent packages (mainly busybox) statically.
 ?? b. Compile all dependent packages non-statically. Use lddtree.sh to 
identify dependent libraries from TARGET_DIR.

2. Write a Makefile like this:
```
# your-image.mk
$(eval $(info $(pkgname)))

.PHONY: your-image

YOUR_IMAGE_DEPENDENCIES = package-a package-b

your-image: $(YOUR_IMAGE_DEPENDENCIES) target-finalize
 ??????? @$(call MESSAGE,"Generating filesystem image $@")
 ??????? do something here

TARGETS_ROOTFS += your-image
PACKAGES += $(YOUR_IMAGE_DEPENDENCIES)
```

My final choice is method 1-a. Because the initramfs I need is not that 
complicated.

Regards,
Yuanhao

 >
 > Perhaps there is a way of using dm_crypt without an initramfs that I'm
 > not aware of.
 >
 > Perhaps I don't even need dm_crypt and there are other simple ways to
 > secure my root filesystem? I am working with a system that is secure
 > up to and including the bootloader and am using U-Boot verified boot
 > to boot a signed kernel from a FIT image.
 >
 > Any suggestions?
 >
 > Best regards,
 >
 > Tim
