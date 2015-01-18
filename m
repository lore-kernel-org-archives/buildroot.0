From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Sun, 18 Jan 2015 13:45:11 +0100
Subject: [Buildroot] [PATCH] toolchain: Use the correct target name
In-Reply-To: <20150116092944.06e31910@free-electrons.com>
References: <54B843D7.1030602@dawncrow.de>
 <20150116092944.06e31910@free-electrons.com>
Message-ID: <54BBAAD7.3040207@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 16.01.2015 um 09:29 schrieb Thomas Petazzoni:
> Dear Andr? Hentschel,
> 
> On Thu, 15 Jan 2015 23:48:55 +0100, Andr? Hentschel wrote:
>> When using an external toolchain we need to use the toolchain prefix
>> for the staging directory and e.g. for configure.
>>
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>> ---
>> This fixes cross compiling Wine (not yet upstream because of that).
>>
>>  package/Makefile.in | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index 2055f00..0a00c7e 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -36,7 +36,11 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
>>  endif
>>
>>  # Compute GNU_TARGET_NAME
>> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>>  GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
>> +else
>> +GNU_TARGET_NAME = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
>> +endif
> 
> I am not sure we want to do this actually. There is nothing that forces
> the toolchain to have the same prefix as the host tuple. Except Wine
> and its original build system.

Hi Thomas,

This was based on the irc discussion (14.01.2015):
(20:49:23) kos_tom: Andre_H: well, I'm not happy with the BR2_TOOLCHAIN_BUILDROOT dependency
(20:49:40) kos_tom: Andre_H: we normally don't accept packages that would not build with external toolchains.
(20:55:05) Andre_H: kos_tom: we either need symbolic links for the external toolchain, so that the name fits the tupel, or we need to pass the external tupel. i guess the first strategy is more foolproof. what do you think about it?
(20:56:13) kos_tom: nope, we want the second strategy: a way to pass the prefix of the toolchain.

I guess you missed my suggestion (16.01.2015):
(19:55:51) Andre_H: kos_tom: hi, what about redoing my wine makefile and doing it as a generic package with special configure rules?
(22:19:17) kos_tom: Andre_H: which special configure rules would solve the problem?
(22:19:50) kos_tom: iamb: you can do whatever sort of target filesystem changes in a post-build script.
(23:07:31) Andre_H: kos_tom: e.g. passing BR2_TOOLCHAIN_EXTERNAL_PREFIX instead of GNU_TARGET_NAME if possible
