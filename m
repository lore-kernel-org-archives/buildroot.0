From: Steve deRosier <derosier@gmail.com>
Date: Mon, 31 Aug 2015 09:48:04 -0700
Subject: [Buildroot] [1/1] linux: avoid multiple dtb append on uImages
In-Reply-To: <20150830083029.GC17874@tarshish>
References: <1440823702-13736-1-git-send-email-derosier@gmail.com>
 <20150830083029.GC17874@tarshish>
Message-ID: <CALupW3Dh1tCwJUOU5VAo3Qw4qVHRvM4KP9rxeBKsTQY6VUJ=WA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Sun, Aug 30, 2015 at 1:30 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Steve,
>
> See http://patchwork.ozlabs.org/patch/394002/ (our oldest patchwork entry) for
> a different, arguably simpler, approach.
>
> baruch
>

Hi Baruch,

Thanks for bringing that thread to my attention.  I couldn't quite
tell if you appreciated the simpler approach of deleting the zImage
(thus requiring the kernel to rebuild it) or prefered the more complex
approach; either way, since that approach hasn't been merged in the
year since it was sent, Thomas cleary didn't prefer it.

In reading that thread, I'm concerned about two things:

1. A fix (arguably good or bad) was proposed for a clear bug. And it
was basically chosen to not fix the bug in favor of a somewhat dubious
goal (my opinion) of increasing the feature set to "generalize this
appended DTB mechanism to make it possible to generate several
appended images".  Seems to me that it would've been appropriate to
fix the bug first, then expand the feature set.
2. The amount of time taken to fix said bug.

I encountered this bug for the first time over two years ago. At the
time I was simply told that was a bug in the kernel build system (!):
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/63814

So I just continued what I was doing: made a trivial change in a
driver source file, rebuilt and was able to get stuff working.  I've
since encountered this problem every couple of months.  It wasn't
until this week I just had enough and poked around and found the
double-append root-cause. Hence the patch.  Oddly enough I figured if
there wasn't a patch in master, and I hadn't noticed any buzz about
it, it was still an unsolved issue.

So I'm happy to help move this forward, including collaborating with
Guido on this as being affected by this bug has been a significant
pain for me over the last couple of years.

I'd like a specific pointer on how to move forward or even if I should
scrap the current approach entirely. I won't be able to rewrite or
restructure the entire linux.mk portion of the buildsystem, but I'm
happy to fix the bug.

One obvious thing I can change is the naming I chose to correspond
with Thomas's suggestion to Guido.  But I'm thinking this won't be
sufficient. For one, I don't really like my fall-over to the old
behavior in the non uImage case, but I didn't see a great way forward
there (not wanting to disturb the rest of the engine). But I was
sufficiently happy that it fixed the issue in at least one case, but
did no further harm to other cases so I decided to submit the patch.

So, @Thomas and @Guido, how can we get this moving forward?  Can
either of you (or anyone else) suggest some specific ways of moving
forward?


>> Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
>> ---
>>  linux/linux.mk |   17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 48f9c74..d4252e3 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -245,14 +245,23 @@ endif
>>  endif
>>
>>  ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
>> -# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
>> +# If we append and create the uImage, we want to be sure not to multiple-append on
>> +# rebuilds, so use a temporary intermediate "zImage-dtb" and then append, but if we
>> +# don't use the APPENDED_UIMAGE option, we need to be sure it stays named as zImage.
>> +IMAGE_PLUS_DTB = zImage
>> +ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
>> +     IMAGE_PLUS_DTB = zImage-dtb
>>  define LINUX_APPEND_DTB
>> +     cp $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(IMAGE_PLUS_DTB);
>> +endef
>> +endif
>> +# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
>> +LINUX_APPEND_DTB += \
>>       if [ -e $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb ]; then \
>>               cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb; \
>>       else \
>>               cat $(KERNEL_ARCH_PATH)/boot/dts/$(KERNEL_DTS_NAME).dtb; \
>> -     fi >> $(KERNEL_ARCH_PATH)/boot/zImage
>> -endef
>> +     fi >> $(KERNEL_ARCH_PATH)/boot/$(IMAGE_PLUS_DTB)
>>  ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
>>  # We need to generate a new u-boot image that takes into
>>  # account the extra-size added by the device tree at the end
>> @@ -263,7 +272,7 @@ LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
>>       sed -n -e 's/Image Name:[ ]*\(.*\)/-n \1/p' -e 's/Load Address:/-a/p' -e 's/Entry Point:/-e/p'`; \
>>       $(MKIMAGE) -A $(MKIMAGE_ARCH) -O linux \
>>       -T kernel -C none $${MKIMAGE_ARGS} \
>> -     -d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
>> +     -d $(KERNEL_ARCH_PATH)/boot/$(IMAGE_PLUS_DTB) $(LINUX_IMAGE_PATH);
>>  endif
>>  endif


Thanks,
- Steve
