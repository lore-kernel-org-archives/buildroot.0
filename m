From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 May 2016 22:41:30 +0200
Subject: [Buildroot] uClibc debug symbols
In-Reply-To: <82a50810-beef-8f52-aaac-2dfc9dc1fd17@brickedbrain.com>
References: <ddfc826b-9bf7-38c8-a442-bea33bf05621@brickedbrain.com>
 <20160511233304.2c528c3b@gmx.net>
 <38268c60-77cb-a127-4d16-35ea58fc5766@brickedbrain.com>
 <20160512154148.66906dd2@free-electrons.com>
 <2dbe4eba-67f7-c8c5-1551-b8a31439b6c6@brickedbrain.com>
 <20160512170714.GV26720@waldemar-brodkorb.de>
 <82a50810-beef-8f52-aaac-2dfc9dc1fd17@brickedbrain.com>
Message-ID: <68210d3d-9827-383f-6700-a35eb111e953@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/13/16 10:34, Luca Ellero wrote:
> Hi Waldemar,
>
> On 12/05/2016 19:07, Waldemar Brodkorb wrote:
>> Hi,
>> Luca Ellero wrote,
>>
>>> Can you please suggest a way to check whether binaries have debugging
>>> symbols? So, maybe, we can send patches.
>>>
>>> I've tried:
>>> objdump -h ... | grep debug
>>> but it doesn't seem to always behave reliably.
>>>
>>> Thank you
>>
>> Just 'file' should do the job,
>
> file doesn't seem to indicate debug symbols (at least on my system).
> Compiling with or without -g has exactly the same output.
>
> $ arm-buildroot-linux-uclibcgnueabi-gcc -o myapp myapp.c
> $ file myapp
> myapp: ELF 32-bit LSB  executable, ARM, EABI5 version 1 (SYSV), dynamically
> linked (uses shared libs), not stripped
> $ arm-buildroot-linux-uclibcgnueabi-gcc -g -o myapp myapp.c
> $ file myapp
> myapp: ELF 32-bit LSB  executable, ARM, EABI5 version 1 (SYSV), dynamically
> linked (uses shared libs), not stripped

  Non-debug binaries still contain the symbol table. The symbol table is 
something that can only be stripped after linking, so it can't be manipulated 
with a compiler option.

  To detect -g, you can do

readelf -S <program> | grep '^ *\[[0-9]*\] \.debug'


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
