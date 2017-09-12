From: Bradford Barr <bradford@density.io>
Date: Tue, 12 Sep 2017 10:18:26 -0400
Subject: [Buildroot] [PATCH 1/1] msgpack: bump to version 2.1.5
In-Reply-To: <CAPpUvYg0OiL5tFaf9D3WBWJsxqeV5Pnx=F_Uk0o5TVeFZpcuHg@mail.gmail.com>
References: <20170907155108.3449-1-bradford@density.io>
 <20170909230921.0c270d7a@windsurf.lan>
 <CAPpUvYg0OiL5tFaf9D3WBWJsxqeV5Pnx=F_Uk0o5TVeFZpcuHg@mail.gmail.com>
Message-ID: <CAPpUvYjfcdND-6gv1GEjSyF8FQcuyqZXMreT5joo49UtfWTVyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Missed the reply all button. Sorry.

B

On Tue, Sep 12, 2017 at 10:16 AM, Bradford Barr <bradford@density.io> wrote:
> Hey there. Thanks for the feedback.
>
> On Sat, Sep 9, 2017 at 5:09 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Thu,  7 Sep 2017 11:51:08 -0400, Bradford Barr wrote:
>>> From: bradford barr <bradford@density.io>
>>>
>>> Signed-off-by: bradford barr <bradford@density.io>
>>
>> This needs a bigger commit log, because it's doing a lot more than a
>> version bump: the license is changing, and you introduce this "header
>> only" option.
>>
>>> diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
>>> index b8e8213..e0626b2 100644
>>> --- a/package/msgpack/Config.in
>>> +++ b/package/msgpack/Config.in
>>> @@ -13,3 +13,15 @@ config BR2_PACKAGE_MSGPACK
>>>  comment "msgpack needs a toolchain w/ C++"
>>>       depends on !BR2_INSTALL_LIBSTDCPP
>>>       depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>> +
>>> +if BR2_PACKAGE_MSGPACK
>>> +
>>> +config BR2_PACKAGE_MSGPACK_HEADER_ONLY
>>
>> Could you give a rational for adding this ?
>
> If all applications that used msgpack were written in C++ using the
> header file library you don't need to install the C libraries. They'll
> just sit there unused taking up space. I thought a flag that would
> optionally install the C libraries would be a good way to prevent
> installing unused libraries. If I'm off-base here let me know. I just
> thought this would be the right way to do things.
>
>>
>>> +     bool "header only"
>>> +     depends on BR2_INSTALL_LIBSTDCPP
>>
>> Not needed, the main option already depends on this.
>
> Got it. Will fix.
>
>>
>>> +     help
>>> +       MessagePack can be installed as a header only library.
>>
>> And why would you do it ?
>
> See above.
>
>>
>>> -$(eval $(autotools-package))
>>> +MSGPACK_INSTALL_STAGING = YES
>>> +
>>> +ifeq ($(BR2_PACKAGE_MSGPACK_HEADER_ONLY),y)
>>> +MSGPACK_INSTALL_TARGET = NO
>>> +else
>>> +MSGPACK_INSTALL_TARGET = YES
>>> +endif
>>
>> Passing MSGPACK_INSTALL_TARGET = NO is sufficient, since "YES" is the
>> default value.
>
> Makes sense, I'll fix that.
>
> Thanks again, I'll roll a new patch after I hear what to do with the
> header only option.
>
> B
>
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
