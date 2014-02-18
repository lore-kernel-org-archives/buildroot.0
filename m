From: Martin Bark <martin@barkynet.com>
Date: Tue, 18 Feb 2014 18:30:59 +0000
Subject: [Buildroot] [PATCH v7 4/4] xbmc: new package
In-Reply-To: <CAGduivyFw4z+UxWWj36kgZgvDDg6CnQ12zKH6QGtpZrLMBiaow@mail.gmail.com>
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392680233-24585-5-git-send-email-maxime.hadjinlian@gmail.com>
 <20140218173828.5947589d@skate>
 <CAGduivyFw4z+UxWWj36kgZgvDDg6CnQ12zKH6QGtpZrLMBiaow@mail.gmail.com>
Message-ID: <5303A6E3.8010209@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, Thomas,

On 18/02/14 17:02, Maxime Hadjinlian wrote:
> Hi Thomas, all
> On Tue, Feb 18, 2014 at 5:38 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Maxime Hadjinlian,
>>
>> On Tue, 18 Feb 2014 00:37:13 +0100, Maxime Hadjinlian wrote:
>>
>>> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
>>> new file mode 100644
>>> index 0000000..23650ed
>>> --- /dev/null
>>> +++ b/package/xbmc/Config.in
>>> @@ -0,0 +1,165 @@
>>> +comment "xbmc requires an OpenGL-capable backend"
>>> +     depends on !(BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
>>
>> I would make the comment more specific:
>>
>> comment "xbmc requires an OpenGL ES and EGL backend"
>>
>>> +# External toolchain are required because of a missing bitdefs.h
>>> +comment "xbmc needs an (e)glibc external toolchain w/ C++, wchar"
>>> +     depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR) || BR2_TOOLCHAIN_BUILDROOT
>>
>> This dependency does not make much sense to me. Your comment mentions
>> "external toolchain", but it is not reflected by the dependencies.
>> Moreover, we now have glibc/eglibc support in the internal backend, so
>> I don't really see how there could be a difference between internal and
>> external here. Additionally, if the C library is glibc or eglibc, then
>> you are guaranteed to have wchar support. So if what you need is
>> eglibc/glibc, then please do:
>>
>> comment "xbmc needs an (e)glibc toolchain w/ C++"
>>          depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
>>
> The problem I had with internal toolchain, {X}libc was that, the
> bitdefs.h is missing, and XBMC needs it.
> I'll look at it another time as maybe my tests were not thorough enough.
>

locally i tried this change and the following defconfig

BR2_arm=y
BR2_arm1176jzf_s=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_RPI_USERLAND=y

and it all built ok.  I also tried with eglibc and it build ok too.

Thanks
