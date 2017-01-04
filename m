From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Wed, 4 Jan 2017 00:09:34 -0200
Subject: [Buildroot] [PATCH 1/2] efl: fix target package dependency on
	util-linux (libmount).
In-Reply-To: <3b511a0a-99aa-23d3-0649-08c725fa9eea@gmail.com>
References: <20170103212932.9254-1-barbieri@profusion.mobi>
 <20170103212932.9254-2-barbieri@profusion.mobi>
 <3b511a0a-99aa-23d3-0649-08c725fa9eea@gmail.com>
Message-ID: <CAPdpN3CmdooHnHHHvmMguW6dBqsN+CksS6r2OUWCmRWPBvkZyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 3, 2017 at 8:37 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Hi Gustavo,
>
> Le 03/01/2017 ? 22:29, Gustavo Sverzut Barbieri a ?crit :
>> use the correct variable (BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT) and do
>> not impose dependency on util-linux if not needed.
>>
>> Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
>> ---
>>  package/efl/Config.in | 6 +++---
>>  package/efl/efl.mk    | 4 ++--
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/efl/Config.in b/package/efl/Config.in
>> index c51fc564d..542c354a8 100644
>> --- a/package/efl/Config.in
>> +++ b/package/efl/Config.in
>> @@ -17,9 +17,6 @@ config BR2_PACKAGE_EFL
>>       # https://phab.enlightenment.org/T2728
>>       select BR2_PACKAGE_LUAJIT # Lua support broken
>>       select BR2_PACKAGE_LZ4
>> -     select BR2_PACKAGE_UTIL_LINUX
>> -     # libblkid is part of required tools, see EFL's README.
>> -     select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>
> IIRC, There is a build issue behind this, but it was with an older efl version
> (1.13 or 1.14). So I have to check this.

I did the cumbersome "make clean" then "make all" and it worked. So I
assume this is safe now, but as you see these are enabled if
BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT is enabled, and that's the
default.


> BTW do you want to be added to DEVELOPERS file and receive any build issues from
> Buildroot autobuilders related to efl packages ?
>
> https://buildroot.org/downloads/manual/manual.html#DEVELOPERS

sounds good. Following that guideline I should add myself to that
file, likely in this patch. Okay?


>>       select BR2_PACKAGE_ZLIB
>>       help
>>         Enlightenment Foundation Libraries
>> @@ -101,7 +98,10 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
>>
>>  config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
>>       bool "Enable libmount support (recommended)"
>
> Maybe we should rename this option to BR2_PACKAGE_EFL_UTIL_LINUX and use
> "Enable util-linux (limbount + libblkid) support (recommended)"

Not sure... to tell you the truth I think libblkid is a "nice to
have", not must have... our code doesn't refer to anything in
libblkid, but if you want mount to auto detect the
partition/filesystem, then blkid is needed to scan the block device
and infer that AFAIU.

However if that's what people want I can do for sure, super simple.




-- 
Gustavo Sverzut Barbieri
http://profusion.mobi embedded systems
--------------------------------------
MSN, GTalk, FaceTime: barbieri at gmail.com
Skype: gsbarbieri
Mobile: +55 (16) 99354-9890
