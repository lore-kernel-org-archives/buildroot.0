From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 2 Apr 2021 12:29:39 -0700
Subject: [Buildroot] building a kernel+ramdisk separate from rootfs for
 using dm_crypt filesystem
In-Reply-To: <238e19cf-64c8-3b79-16cb-ab335696f5cb@aliyun.com>
References: <CAJ+vNU3mdFXbCL95QQ-67xj8w3cLv6e7_BB6ou=YwPC3AqJSPA@mail.gmail.com>
 <238e19cf-64c8-3b79-16cb-ab335696f5cb@aliyun.com>
Message-ID: <CAJ+vNU02cwH31wce---_+mipmQcstmAgi05QacsGkr_fzyBKDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 31, 2021 at 6:21 PM Tian Yuanhao <tianyuanhao@aliyun.com> wrote:
>
> Hi Tim,
>
> On 2021/4/1 ??5:02, Tim Harvey wrote:
>  > Greetings,
>  >
>  > I'm using buildroot to build a kernel and rootfs but now need to
>  > implement dm_crypt for a secure filesystem.
>  >
>  > I'm not all that familiar with dm_crypt but it would appear that I
>  > need to use an initramfs to open (unlock) the encrypted filesystem and
>  > mount it.
>  >
>  > Do I need to build a separate buildroot config for the initramfs image
>  > from the buildroot config that builds my traditional kernel and
>  > rootfs? I was hoping to be able to build this all as a single project.
>
> I am also doing similar work. I found two ways:
>
> 1. Treat initramfs as a package. Write your own init shell script.
>     a. Compile all dependent packages (mainly busybox) statically.
>     b. Compile all dependent packages non-statically. Use lddtree.sh to
> identify dependent libraries from TARGET_DIR.
>
> 2. Write a Makefile like this:
> ```
> # your-image.mk
> $(eval $(info $(pkgname)))
>
> .PHONY: your-image
>
> YOUR_IMAGE_DEPENDENCIES = package-a package-b
>
> your-image: $(YOUR_IMAGE_DEPENDENCIES) target-finalize
>          @$(call MESSAGE,"Generating filesystem image $@")
>          do something here
>
> TARGETS_ROOTFS += your-image
> PACKAGES += $(YOUR_IMAGE_DEPENDENCIES)
> ```
>
> My final choice is method 1-a. Because the initramfs I need is not that
> complicated.
>

Yuanhao,

Thanks for the feedback! I did find that creating an initramfs was
pretty easy and so started doing it with a script. Thanks for the
pointer to lddtree - that helped me figure out how to deal with
copying the right files.

Tim
