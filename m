From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 22 Nov 2020 00:25:22 +0100
Subject: [Buildroot] [PATCH v4 3/5] package/libnvidia-container: new
 package
In-Reply-To: <CA+h8R2oXi6Bf4LnP=H5jcm7j3QodnffCDAWgnU8UU1gykmdu0w@mail.gmail.com>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-3-christian@paral.in>
 <5f5c5a57-72c4-d7c9-5395-9042b49a5441@gmail.com>
 <CA+h8R2oXi6Bf4LnP=H5jcm7j3QodnffCDAWgnU8UU1gykmdu0w@mail.gmail.com>
Message-ID: <a07239dd-839a-7f77-baa7-f6d2cee52473@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Le 21/11/2020 ? 21:54, Christian Stewart a ?crit?:
> Hi Romain,
> 
> On Sat, Nov 21, 2020 at 2:55 AM Romain Naour <romain.naour@gmail.com> wrote:
> 
>> This is really a huge patch...
> 
> Because it includes a couple of headers from nvidia-modprobe. It's
> necessary for the build to work. I wouldn't add the patch otherwise.
> 
> If you would like to take the time to find some alternative...

I don't have the time to search an test any alternative solution.

> 
>>> +Subject: [PATCH] Remove dependency handling from Makefile
>>> +
>>> +Buildroot will handle this for the makefile.
>>> +
>>> +Signed-off-by: Christian Stewart <christian@paral.in>
>>> +---
>>
>> Same
> 
> ??

Another big patch impossible to review.

I'm not sure if maintainers will accept it as is.

> 
>>> @@ -0,0 +1,18 @@
>>> +config BR2_PACKAGE_LIBNVIDIA_CONTAINER
>>> +     bool "libnvidia-container"
>>> +     depends on BR2_SHARED_LIBS
>>
>> BR2_SHARED_STATIC_LIBS maybe
> 
> ??

I meant, maybe you only need to use:
depends on !BR2_STATIC_LIBS

> 
>>> +     depends on BR2_TOOLCHAIN_HAS_THREADS # tirpc
>>
>> Already selected by glibc toolchain.
> 
> OK noted & removed.
> 
>>> +
>>> +LIBNVIDIA_CONTAINER_MAKE_OPTS = \
>>> +     CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
>>> +     OBJCPY="$(TARGET_OBJCOPY)" \
>>> +     RPCGEN="$(HOST_DIR)/bin/rpcgen" \
>>> +     WITH_LIBELF=yes \
>>> +     WITH_TIRPC=no
>>
>> Why adding libtirpc in the dependencies and using WITH_TIRPC=no ?
> 
> Because, without it, we get this build error:
> 
> libnvidia-container-1.2.0/src/driver.c:23:10: fatal error:
> driver_rpc.h: No such file or directory
>    23 | #include "driver_rpc.h"

So you can remove libtirpc from dependency ?

Best regards,
Romain


> 
> Best,
> Christian
> 
