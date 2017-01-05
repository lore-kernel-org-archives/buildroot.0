From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 6 Jan 2017 00:20:55 +0100
Subject: [Buildroot] [PATCH 1/2] efl: fix target package dependency on
 util-linux (libmount).
In-Reply-To: <CAPdpN3CmdooHnHHHvmMguW6dBqsN+CksS6r2OUWCmRWPBvkZyg@mail.gmail.com>
References: <20170103212932.9254-1-barbieri@profusion.mobi>
 <20170103212932.9254-2-barbieri@profusion.mobi>
 <3b511a0a-99aa-23d3-0649-08c725fa9eea@gmail.com>
 <CAPdpN3CmdooHnHHHvmMguW6dBqsN+CksS6r2OUWCmRWPBvkZyg@mail.gmail.com>
Message-ID: <f3f89ca1-087c-239c-5e01-c47cab50e3b3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 04/01/2017 ? 03:09, Gustavo Sverzut Barbieri a ?crit :
> On Tue, Jan 3, 2017 at 8:37 PM, Romain Naour <romain.naour@gmail.com> wrote:
>> Hi Gustavo,
>>
>> Le 03/01/2017 ? 22:29, Gustavo Sverzut Barbieri a ?crit :
>>> use the correct variable (BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT) and do
>>> not impose dependency on util-linux if not needed.
>>>
>>> Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
>>> ---
>>>  package/efl/Config.in | 6 +++---
>>>  package/efl/efl.mk    | 4 ++--
>>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/package/efl/Config.in b/package/efl/Config.in
>>> index c51fc564d..542c354a8 100644
>>> --- a/package/efl/Config.in
>>> +++ b/package/efl/Config.in
>>> @@ -17,9 +17,6 @@ config BR2_PACKAGE_EFL
>>>       # https://phab.enlightenment.org/T2728
>>>       select BR2_PACKAGE_LUAJIT # Lua support broken
>>>       select BR2_PACKAGE_LZ4
>>> -     select BR2_PACKAGE_UTIL_LINUX
>>> -     # libblkid is part of required tools, see EFL's README.
>>> -     select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>>
>> IIRC, There is a build issue behind this, but it was with an older efl version
>> (1.13 or 1.14). So I have to check this.
> 
> I did the cumbersome "make clean" then "make all" and it worked. So I
> assume this is safe now, but as you see these are enabled if
> BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT is enabled, and that's the
> default.

I did a build test today without util-linux package and it build fine with the
current efl version (1.18.4)

> 
> 
>> BTW do you want to be added to DEVELOPERS file and receive any build issues from
>> Buildroot autobuilders related to efl packages ?
>>
>> https://buildroot.org/downloads/manual/manual.html#DEVELOPERS
> 
> sounds good. Following that guideline I should add myself to that
> file, likely in this patch. Okay?

Well, It seems that the recommended way to do it is to send a separate patch.
The reason is: if someone need to backport a patch adding a feature or a new
package, we want to avoid a conflict in DEVELOPERS file while cherry-picking the
commit.

Thomas, can you confirm ?

> 
> 
>>>       select BR2_PACKAGE_ZLIB
>>>       help
>>>         Enlightenment Foundation Libraries
>>> @@ -101,7 +98,10 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
>>>
>>>  config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
>>>       bool "Enable libmount support (recommended)"
>>
>> Maybe we should rename this option to BR2_PACKAGE_EFL_UTIL_LINUX and use
>> "Enable util-linux (limbount + libblkid) support (recommended)"
> 
> Not sure... to tell you the truth I think libblkid is a "nice to
> have", not must have... our code doesn't refer to anything in
> libblkid, but if you want mount to auto detect the
> partition/filesystem, then blkid is needed to scan the block device
> and infer that AFAIU.
> 
> However if that's what people want I can do for sure, super simple.

I followed the README comment here and because BR2_PACKAGE_UTIL_LINUX_LIBBLKID
is not selected by default when util-linux package is selected.
Also libblkid.so is not so big (~300Ko), I'm not sure we really need a new
option BR2_PACKAGE_EFL_UTIL_LINUX_LIBLKID

config BR2_PACKAGE_EFL_UTIL_LINUX_LIBLKID
    bool "Enable libblkid support (recommended)"
    depends on BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT

Ok, let's do it as you suggest
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Build tested]
Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> 
> 
> 
