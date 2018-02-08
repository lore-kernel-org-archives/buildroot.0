From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 01:22:20 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/gdb: rework dependency for
 C++11
In-Reply-To: <20180207173440.GA2250@scaer>
References: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
 <20180205211015.26819-2-thomas.petazzoni@bootlin.com>
 <20180207095828.GA2464@scaer> <20180207133602.36f7646a@windsurf>
 <20180207173440.GA2250@scaer>
Message-ID: <129e81ee-1a4e-10bd-16c2-996bedba6875@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-02-18 18:34, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-02-07 13:36 +0100, Thomas Petazzoni spake thusly:
>> On Wed, 7 Feb 2018 10:58:28 +0100, Yann E. MORIN wrote:
> [--SNIP--]
>>>> +config BR2_PACKAGE_GDB_NEEDS_CXX11
>>>> +	bool
>>>> +	default y
>>>> +	depends on !BR2_GDB_VERSION_7_10
>>>> +	depends on !BR2_GDB_VERSION_7_11
>>>> +	depends on !BR2_GDB_VERSION_7_12  
>>> I would have expected that the various versions would select this,
>>> i.e. something like:
>>>
>>>     config BR2_PACKAGE_GDB_NEEDS_CXX11
>>>         bool
>>>
>>>
>>>     config BR2_GDB_VERSION_7_10
>>>         bool "7.10"
>>>
>>>     config BR2_GDB_VERSION_8_0
>>>         bool "8.0"
>>>         select BR2_PACKAGE_GDB_NEEDS_CXX11
>>
>> But this doesn't work; The BR2_GDB_VERSION_8_0 symbol is only enabled
>> if we build a host variant of gdb. If we build just the target
>> variant, then no version is selected at all, and therefore this symbol
>> would not be selected.
> 
> Gah, I missed that...
> 
>> So in fact, even my code is slightly wrong: it becomes correct once the
>> default version of gdb is 8.0, but it is wrong when the default version
>> is still 7.12 (which is the case at the time my patch is introduced).
>>
>> Indeed, when my patch is introduced, 7.12 is the default gdb version,
>> used if you build only the target gdb. When you build just the target
>> gdb version, BR2_GDB_VERSION_7_12 is not enabled, and therefore
>> BR2_PACKAGE_GDB_NEEDS_CXX11=y even if it's not true.
>>
>> So I should adjust that. I could use the BR2_GDB_VERSION string
>> option, which exists regardless of whether host gdb is enabled or not.
>> Or I could rely on BR2_PACKAGE_HOST_GDB somehow.
>>
>> Meh. This is crappy :)
> 
> OK, I think I have an idea about all this mess... But since I can have
> pretty weird ideas, I make no promise that it will materialise into
> something usefull...

 Given this mess, let's ask the question: why do we need version selection to
begin with? For GCC I can still see it (it breaks things), for binutils maybe,
but gdb? Has been pretty stable lately, no?

 That said, the C++11 support is obviously problematic. Since we anyway have the
versioned gdb infrastructure in place now, I would remove the user-visible
choice, but make an automatic choice based on the availability of C++11.

 It still is a little tricky to express, since we want to use 7.12 when
(BR2_PACKAGE_GDB && !(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && BR2_INSTALL_LIBSTDCPP)
|| (BR2_PACKAGE_HOST_GDB && !BR2_HOST_GCC_AT_LEAST_4_8). Or we would have to
allow varying the gdb version on host and target (which by the way *should* be
OK, but may not be...).

 So I messed around with gdb a bit, I noticed a couple of things.

- gdbserver really needs C++11; some of the shared files in the common directory
are C++ files.

- host-gdb does not build gdbserver. So all the dependencies we have in host-gdb
on the target's toolchain are phony. Or perhaps they are there just in case
target gdb is selected as well, but then it's not expressed very well...

- With the above in mind, the depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
in host-gdb is definitely phony. Perhaps it should be in target gdb?


 Bottom line, I think could be simplified a lot here by removing the version choice.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
