From: Bradford Barr <bradford@density.io>
Date: Thu, 12 Oct 2017 17:14:38 -0400
Subject: [Buildroot] [PATCH v2 1/2] tbb: new package
In-Reply-To: <CAPpUvYgu8OqDXqHXr8H_gG3pu2q12fCw94Y9jpcuh+ciVMKE9Q@mail.gmail.com>
References: <20170928235043.31891-1-bradford@density.io>
 <20170928235043.31891-2-bradford@density.io>
 <20171012224526.132fc274@windsurf.home>
 <CAPpUvYgu8OqDXqHXr8H_gG3pu2q12fCw94Y9jpcuh+ciVMKE9Q@mail.gmail.com>
Message-ID: <CAPpUvYh=yVNROxvTo6rJKJuzzmpeckZ1zrxy=QaHyY8v6i8dzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 12, 2017 at 5:12 PM, Bradford Barr <bradford@density.io> wrote:
> Thanks for your comments.
>
> On Thu, Oct 12, 2017 at 4:45 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Thu, 28 Sep 2017 19:50:42 -0400, Bradford Barr wrote:
>>
>>> diff --git a/package/tbb/0001-cross-compile.patch b/package/tbb/0001-cross-compile.patch
>>> new file mode 100644
>>> index 0000000..7c57603
>>> --- /dev/null
>>> +++ b/package/tbb/0001-cross-compile.patch
>>> @@ -0,0 +1,41 @@
>>> +Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>
>> This patch should be Git formatted and have a proper commit title and
>> description.
>>
>
> As I lifted that patch from Yocto I thought it would be alright. I'll reformat
> and change the commit title and message.
>
>>
>>> diff --git a/package/tbb/Config.in b/package/tbb/Config.in
>>> new file mode 100644
>>> index 0000000..eda1f09
>>> --- /dev/null
>>> +++ b/package/tbb/Config.in
>>> @@ -0,0 +1,16 @@
>>> +config BR2_PACKAGE_TBB
>>> +     bool "tbb"
>>> +     depends on !BR2_STATIC_LIBS
>>> +     depends on BR2_INSTALL_LIBSTDCPP
>>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>>> +     depends on BR2_TOOLCHAIN_USES_GLIBC
>>> +     help
>>> +       Intel(R) Threading Building Blocks (Intel(R) TBB) lets you
>>> +       easily write parallel C++ programs that take full advantage
>>> +       of multicore performance, that are portable, composable and
>>> +       have future-proof scalability.
>>> +
>>> +       https://www.threadingbuildingblocks.org/
>>> +
>>> +comment "tbb needs a toolchain w/ threads"
>>> +     depends on !BR2_TOOLCHAIN_HAS_THREADS
>>
>> This comment is not in sync with the dependencies of the package: C++,
>> dynamic library, glibc.
>>
>
> Would it be better if I added all the depends from above as part of
> this comment?
> Or should I just remove the comment altogether?
>
>>
>>> +TBB_SO_VERSION = 2
>>> +TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
>>> +
>>> +ifeq ($(BR2_ENABLE_DEBUG),y)
>>> +TBB_BIN_PATH = $(@D)/build/linux_*_debug
>>> +else
>>> +TBB_BIN_PATH = $(@D)/build/linux_*_release
>>> +endif
>>
>> What is the difference between the debug and release builds? In
>> general, we don't want to special case BR2_ENABLE_DEBUG in packages, as
>> we only want this to enable building with debugging symbols, and
>> nothing else. We used to handle BR2_ENABLE_DEBUG in lots of packages
>> and got rid of that a while ago, so I don't want to get back to this.
>
> Makes sense.
>
>>
>>> +define TBB_INSTALL_LIBS
>>> +     $(foreach lib,$(TBB_LIBS),
>>> +             $(if $(BR2_ENABLE_DEBUG),
>>> +                     $(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib)_debug.so.$(TBB_SO_VERSION) \
>>> +                             $(1)/usr/lib/$(lib)_debug.so.$(TBB_SO_VERSION) ;
>>> +                     ln -sf $(lib)_debug.so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib)_debug.so
>>
>> And this looks particularly painful here because the library doesn't
>> even have the same name on the filesystem depending on whether you're
>> doing a debug or a normal build. Clearly not good.
>>
>>> +             ,
>>> +                     $(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$(TBB_SO_VERSION) \
>>> +                             $(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
>>> +                     ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
>>> +             )
>>> +     )
>>> +endef
>>
>> So unless you need it, I'd say drop the support for BR2_ENABLE_DEBUG
>> altogether.
>
> I kept the BR2_ENABLE_DEBUG support because when opencv3 is build with
> BR2_ENABLE_DEBUG
> it looks for libtbb_debug.so, and not libtbb.so; I'm not sure that's a
> good enough reason to keep it.
>
> I could patch opencv3 to look for libtbb.so even when it's compiling
> with debug. Thoughts?

Bah, I misremembered why I did this. I'll remove the BR2_ENABLE_DEBUG
stuff and resubmit.

>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
