From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Sep 2017 21:58:01 +0200
Subject: [Buildroot] [PATCH 1/1] msgpack: bump to version 2.1.5
In-Reply-To: <CAPpUvYjfcdND-6gv1GEjSyF8FQcuyqZXMreT5joo49UtfWTVyA@mail.gmail.com>
References: <20170907155108.3449-1-bradford@density.io>
 <20170909230921.0c270d7a@windsurf.lan>
 <CAPpUvYg0OiL5tFaf9D3WBWJsxqeV5Pnx=F_Uk0o5TVeFZpcuHg@mail.gmail.com>
 <CAPpUvYjfcdND-6gv1GEjSyF8FQcuyqZXMreT5joo49UtfWTVyA@mail.gmail.com>
Message-ID: <b054faed-4d18-e459-1faa-b725202c761b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-09-17 16:18, Bradford Barr wrote:
> On Tue, Sep 12, 2017 at 10:16 AM, Bradford Barr <bradford@density.io> wrote:
>> Hey there. Thanks for the feedback.
>>
>> On Sat, Sep 9, 2017 at 5:09 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Hello,
>>>
>>> On Thu,  7 Sep 2017 11:51:08 -0400, Bradford Barr wrote:
>>>> From: bradford barr <bradford@density.io>
>>>>
>>>> Signed-off-by: bradford barr <bradford@density.io>
>>> This needs a bigger commit log, because it's doing a lot more than a
>>> version bump: the license is changing, and you introduce this "header
>>> only" option.
>>>
>>>> diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
>>>> index b8e8213..e0626b2 100644
>>>> --- a/package/msgpack/Config.in
>>>> +++ b/package/msgpack/Config.in
>>>> @@ -13,3 +13,15 @@ config BR2_PACKAGE_MSGPACK
>>>>  comment "msgpack needs a toolchain w/ C++"
>>>>       depends on !BR2_INSTALL_LIBSTDCPP
>>>>       depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>>> +
>>>> +if BR2_PACKAGE_MSGPACK
>>>> +
>>>> +config BR2_PACKAGE_MSGPACK_HEADER_ONLY
>>> Could you give a rational for adding this ?
>> If all applications that used msgpack were written in C++ using the

 Since msgpack is a C++ library, this is always the case, no?

>> header file library you don't need to install the C libraries. They'll
>> just sit there unused taking up space. I thought a flag that would
>> optionally install the C libraries would be a good way to prevent
>> installing unused libraries. If I'm off-base here let me know. I just
>> thought this would be the right way to do things.

 Makes sense. It should be a separate patch from the version bump, though, so we
can apply it independently - chances are that this new option would need a few
iterations...

 A _HEADER_ONLY option has one big problem: it makes it impossible for packages
that need the library to select msgpack. Indeed, they would need to select
msgpack and not header_only, which is not possible. And adding a depends on
header_only gives a circular dependency.

 So the right approach would be to have an option INSTALL_LIB. You should then
check the existing packages that can use msgpack (only python-msgpack I think)
whether or not they need the library installed.


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
