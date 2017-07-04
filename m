From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 13:45:07 +0200
Subject: [Buildroot] Unable to compile current master
In-Reply-To: <8cf117e9-a3f6-7707-5f1d-41e22fb0ce09@newflow.co.uk>
References: <d7a64db4-2f26-6f27-98e1-6017ca8a95a5@newflow.co.uk>
 <14b6e3d2-0c80-ec16-8be1-abd52121b0be@mind.be>
 <8cf117e9-a3f6-7707-5f1d-41e22fb0ce09@newflow.co.uk>
Message-ID: <d47d0a79-dd22-c778-17bb-137b7eab106e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 12:37, Mark Jackson wrote:
> On 03/07/17 16:57, Arnout Vandecappelle wrote:
>>
>>
>> On 03-07-17 17:14, Mark Jackson wrote:
>>> I'm trying to bring an old 2012 buildroot project up-to-date, so to test my current setup I've branched the git master and tried:-
>>>
>>> $ git checkout origin/master -b master
>>> $ git reset --hard origin/master
>>> $ make clean
>>> $ make beaglebone_defconfig
>>> $ make
>>>
>>> But this fails when compiling gcc with the following:-
>>>
>>> ...
>>> /usr/bin/g++ -fno-PIE -c   -O2 -I/home/mpfj/buildroot/output/host/usr/include -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE   -fno-exceptions -fno-rtti -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. -I. -I../../gcc -I../../gcc/. -I../../gcc/../include -I../../gcc/../libcpp/include -I/home/mpfj/buildroot/output/host/usr/include -I/home/mpfj/buildroot/output/host/usr/include -I/home/mpfj/buildroot/output/host/usr/include  -I../../gcc/../libdecnumber -I../../gcc/../libdecnumber/dpd -I../libdecnumber -I../../gcc/../libbacktrace   -o insn-extract.o -MT insn-extract.o -MMD -MP -MF ./.deps/insn-extract.TPo insn-extract.c
>>> Makefile:2201: recipe for target 's-attrtab' failed
>>
>>   Apparently genattrtab failed but I can't find any output.
>>
>>   Can you continue the build with BR2_JLEVEL=1 ? That should make any error
>> message easier to locate.
>>
> 
> Okay ... with JLEVEL=1 (rather than 0 (auto)), it compiles !!
> 
> So it must be some strange parallel compilation bug ...

 Actually it's more likely that your system ran out of memory. GCC uses some
weird internal memory allocator that will fail invisibly in some situations
(i.e. without invoking OOM killer or anything obvious like that).

 Those generators were apparently running all in parallel in your build, so that
could indeed explain memory exhaustion.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
