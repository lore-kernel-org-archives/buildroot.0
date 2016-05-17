From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 May 2016 00:44:53 +0200
Subject: [Buildroot] uClibc debug symbols
In-Reply-To: <1a248ccb-de2d-ffc4-1f35-75e9ae217ef5@brickedbrain.com>
References: <ddfc826b-9bf7-38c8-a442-bea33bf05621@brickedbrain.com>
 <20160511233304.2c528c3b@gmx.net>
 <38268c60-77cb-a127-4d16-35ea58fc5766@brickedbrain.com>
 <20160512154148.66906dd2@free-electrons.com>
 <2dbe4eba-67f7-c8c5-1551-b8a31439b6c6@brickedbrain.com>
 <20160512170714.GV26720@waldemar-brodkorb.de>
 <82a50810-beef-8f52-aaac-2dfc9dc1fd17@brickedbrain.com>
 <68210d3d-9827-383f-6700-a35eb111e953@mind.be>
 <1a248ccb-de2d-ffc4-1f35-75e9ae217ef5@brickedbrain.com>
Message-ID: <256303ec-cb67-e5ca-5cad-94d2acefb74b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/16 15:32, Luca Ellero wrote:
> Hi Arnout,
>
> On 05/14/2016 22:41, Arnout Vandecappelle wrote:
>> On 05/13/16 10:34, Luca Ellero wrote:
>>> Hi Waldemar,
>>>
>>> On 12/05/2016 19:07, Waldemar Brodkorb wrote:
>>>> Hi,
>>>> Luca Ellero wrote,
>>>>
>>>>> Can you please suggest a way to check whether binaries have debugging
>>>>> symbols? So, maybe, we can send patches.
[snip]
>>  Non-debug binaries still contain the symbol table. The symbol table is
>> something that can only be stripped after linking, so it can't be
>> manipulated with a compiler option.
>>
>>  To detect -g, you can do
>>
>> readelf -S <program> | grep '^ *\[[0-9]*\] \.debug'
>>
>>
>
> Thanks for your reply.
> buildroot toolchain creates some debug sections even on non debug binaries.
>
> Here is the output of your suggested method on an example application (sorry for
> the bad formatting):
>
> $ arm-buildroot-linux-uclibcgnueabi-gcc myapp.c -o myapp
> $ arm-buildroot-linux-uclibcgnueabi-readelf -S myapp | grep '^ *\[[0-9]*\] \.debug'
>   [21] .debug_aranges    PROGBITS        00000000 000628 000070 00 0   0  8
>   [22] .debug_info       PROGBITS        00000000 000698 000184 00 0   0  1
>   [23] .debug_abbrev     PROGBITS        00000000 00081c 000038 00 0   0  1
>   [24] .debug_line       PROGBITS        00000000 000854 00011e 00 0   0  1
>   [25] .debug_ranges     PROGBITS        00000000 000978 000040 00 0   0  8
> $ arm-buildroot-linux-uclibcgnueabi-gcc -g myapp.c -o myapp
> $ arm-buildroot-linux-uclibcgnueabi-readelf -S myapp | grep '^ *\[[0-9]*\] \.debug'
>   [21] .debug_aranges    PROGBITS        00000000 000628 000090 00 0   0  8
>   [22] .debug_info       PROGBITS        00000000 0006b8 000213 00 0   0  1
>   [23] .debug_abbrev     PROGBITS        00000000 0008cb 00007c 00 0   0  1
>   [24] .debug_line       PROGBITS        00000000 000947 000156 00 0   0  1
>   [25] .debug_frame      PROGBITS        00000000 000aa0 00002c 00 0   0  4
>   [26] .debug_str        PROGBITS        00000000 000acc 0000d9 01  MS 0   0  1
>   [27] .debug_ranges     PROGBITS        00000000 000ba8 000040 00 0   0  8
>
> As you can see there are 5 debug section on non debug binary. The difference is
> that there are two section added (.debug_frame and .debug_str) compiling with -g.
>
> It is quite difficult to detect debug symbols with this method.
>
> Should we conclude that detecting debug symbols in a reliable way is practically
> impossible?

  Weird, I didn't see that. But I agree that this proves that there is no 
reliable way to detect presence/absence of debug symbols.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
