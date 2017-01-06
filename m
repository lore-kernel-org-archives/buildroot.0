From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Fri, 6 Jan 2017 10:42:24 -0200
Subject: [Buildroot] [PATCH 1/2] efl: fix target package dependency on
	util-linux (libmount).
In-Reply-To: <f3f89ca1-087c-239c-5e01-c47cab50e3b3@gmail.com>
References: <20170103212932.9254-1-barbieri@profusion.mobi>
 <20170103212932.9254-2-barbieri@profusion.mobi>
 <3b511a0a-99aa-23d3-0649-08c725fa9eea@gmail.com>
 <CAPdpN3CmdooHnHHHvmMguW6dBqsN+CksS6r2OUWCmRWPBvkZyg@mail.gmail.com>
 <f3f89ca1-087c-239c-5e01-c47cab50e3b3@gmail.com>
Message-ID: <CAPdpN3D1eteey=yhSA7YSkLL3eK6nSoXtNBcUUcDAA3MMC7Ttw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 5, 2017 at 9:20 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Le 04/01/2017 ? 03:09, Gustavo Sverzut Barbieri a ?crit :
>> On Tue, Jan 3, 2017 at 8:37 PM, Romain Naour <romain.naour@gmail.com> wrote:

[...]

>>> BTW do you want to be added to DEVELOPERS file and receive any build issues from
>>> Buildroot autobuilders related to efl packages ?
>>>
>>> https://buildroot.org/downloads/manual/manual.html#DEVELOPERS
>>
>> sounds good. Following that guideline I should add myself to that
>> file, likely in this patch. Okay?
>
> Well, It seems that the recommended way to do it is to send a separate patch.
> The reason is: if someone need to backport a patch adding a feature or a new
> package, we want to avoid a conflict in DEVELOPERS file while cherry-picking the
> commit.
>
> Thomas, can you confirm ?

ok, will wait for Thomas to send as a separate patch or not.


>>>>       select BR2_PACKAGE_ZLIB
>>>>       help
>>>>         Enlightenment Foundation Libraries
>>>> @@ -101,7 +98,10 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
>>>>
>>>>  config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
>>>>       bool "Enable libmount support (recommended)"
>>>
>>> Maybe we should rename this option to BR2_PACKAGE_EFL_UTIL_LINUX and use
>>> "Enable util-linux (limbount + libblkid) support (recommended)"
>>
>> Not sure... to tell you the truth I think libblkid is a "nice to
>> have", not must have... our code doesn't refer to anything in
>> libblkid, but if you want mount to auto detect the
>> partition/filesystem, then blkid is needed to scan the block device
>> and infer that AFAIU.
>>
>> However if that's what people want I can do for sure, super simple.
>
> I followed the README comment here and because BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> is not selected by default when util-linux package is selected.
> Also libblkid.so is not so big (~300Ko), I'm not sure we really need a new
> option BR2_PACKAGE_EFL_UTIL_LINUX_LIBLKID
>
> config BR2_PACKAGE_EFL_UTIL_LINUX_LIBLKID
>     bool "Enable libblkid support (recommended)"
>     depends on BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
>
> Ok, let's do it as you suggest

As I said, the liblkid is not a dependency per se... is more to make
libmount useful, overall. This isn't specific to EFL.

Looking at package/util-linux/Config.in to write this reply I saw it's
already the case:

config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
        bool "libmount"
        depends on BR2_USE_MMU # fork()
        select BR2_PACKAGE_UTIL_LINUX_LIBBLKID


:-)

-- 
Gustavo Sverzut Barbieri
http://profusion.mobi embedded systems
--------------------------------------
MSN, GTalk, FaceTime: barbieri at gmail.com
Skype: gsbarbieri
Mobile: +55 (16) 99354-9890
