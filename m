From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 31 Oct 2016 17:42:34 -0700
Subject: [Buildroot] [PATCH] package/xen: fix build failure on x86 after
 bump to 47
In-Reply-To: <CAKmqyKN-vfzzqwzA6OM3pXco7fE93W0rCGdtRyP0ktmMy=r_bw@mail.gmail.com>
References: <CAKmqyKPsF-MiNFtj3jRaU4cS0usMs0hYitxvj+FKDAQTUDgnaw@mail.gmail.com>
 <1477752207-16549-1-git-send-email-yann.morin.1998@free.fr>
 <20161029182714.GA3490@free.fr>
 <CAKmqyKN-vfzzqwzA6OM3pXco7fE93W0rCGdtRyP0ktmMy=r_bw@mail.gmail.com>
Message-ID: <CAKmqyKNeBjXG+taGpVKBm0cJYE9+V-B+LNTpnk7vZOAtsMFgbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 31, 2016 at 3:06 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Sat, Oct 29, 2016 at 11:27 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Alistair, All,
>>
>> On 2016-10-29 16:43 +0200, Yann E. MORIN spake thusly:
>>> Since the bump to 4.7, Xen fails to build because of a double definition
>>> of __OBJECT_FILE__. This is due to (who would have guessed) the weirdness
>>> of their buildsystem.
>>>
>>> Fix that with a dirty hack: undefine the macro before defining it.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Alistair Francis <alistair.francis@xilinx.com>
>>>
>>> ---
>>> Note: totally untested.
>>
>> Now build-tested, the double-definition issue is fixed, and the build
>> succeeds with this defconfig:
>>
>>     BR2_aarch64=y
>>     BR2_TOOLCHAIN_EXTERNAL=y
>>     BR2_PACKAGE_XEN=y
>>     BR2_PACKAGE_XEN_HYPERVISOR=y
>>     BR2_PACKAGE_XEN_TOOLS=y
>>
>> Not booted, I don't know Xen enough to test...
>
> The patch looks good to me!
>
> I just did a build test as well and it works, running a boot test now.

Tested on ARMv7 (little endian) boot.

Tested-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>
> Thanks,
>
> Alistair
>
>>
>> Regards,
>> Yann E. MORIN.
>>
>>> ---
>>>  ...mk-fix-build-with-CFLAGS-from-environment.patch | 36 ++++++++++++++++++++++
>>>  1 file changed, 36 insertions(+)
>>>  create mode 100644 package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
>>>
>>> diff --git a/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch b/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
>>> new file mode 100644
>>> index 0000000..0d4e581
>>> --- /dev/null
>>> +++ b/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
>>> @@ -0,0 +1,36 @@
>>> +From 2a310549aaeaba05f640ade43488bb893101ce4a Mon Sep 17 00:00:00 2001
>>> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> +Date: Sat, 29 Oct 2016 16:35:26 +0200
>>> +Subject: [PATCH] xen/Rules.mk: fix build with CFLAGS from environment
>>> +
>>> +When CFLAGS are passed from the environment, the first-level make
>>> +invocation will append -D__OBJECT_FILE__ to it, then call a second
>>> +make invocation, that will have those new CFLAGS in its environment,
>>> +but will also append -D__OBJECT_FILE__ to those.
>>> +
>>> +Then, the compiler fails because __OBEJECT_FILE__ is defined twice.
>>> +
>>> +Just undefine it before defining it again, as a *workaround* to this
>>> +issue.
>>> +
>>> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> +---
>>> + xen/Rules.mk | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/xen/Rules.mk b/xen/Rules.mk
>>> +index a9fda71..09ccbfa 100644
>>> +--- a/xen/Rules.mk
>>> ++++ b/xen/Rules.mk
>>> +@@ -49,7 +49,7 @@ ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
>>> + CFLAGS += -nostdinc -fno-builtin -fno-common
>>> + CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
>>> + CFLAGS += -pipe -g -D__XEN__ -include $(BASEDIR)/include/xen/config.h
>>> +-CFLAGS += '-D__OBJECT_FILE__="$@"'
>>> ++CFLAGS += -U__OBJECT_FILE__ '-D__OBJECT_FILE__="$@"'
>>> +
>>> + ifneq ($(clang),y)
>>> + # Clang doesn't understand this command line argument, and doesn't appear to
>>> +--
>>> +2.7.4
>>> +
>>> --
>>> 2.7.4
>>>
>>
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
