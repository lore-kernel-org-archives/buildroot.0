From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 04 Jun 2020 18:35:49 +0300
Subject: [Buildroot] [PATCH] package/linux-tools: introduce spi linux
 tools
In-Reply-To: <a974d76c-ae7f-e0fc-4946-67dc66531383@microchip.com>
References: <20200513150324.330435-1-eugen.hristev@microchip.com>
 <87tv0j6etz.fsf@tarshish>
 <c577cbdf-b84a-4af8-8d55-f2759e13c137@microchip.com>
 <87r1vn6840.fsf@tarshish> <20200513195840.GZ12536@scaer>
 <a974d76c-ae7f-e0fc-4946-67dc66531383@microchip.com>
Message-ID: <87v9k66dyi.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eugen,

On Thu, Jun 04 2020, Eugen.Hristev at microchip.com wrote:
> On 13.05.2020 22:58, Yann E. MORIN wrote:
>> On 2020-05-13 20:46 +0300, Baruch Siach spake thusly:
>>> Hi Eugen,
>>>
>>> On Wed, May 13 2020, Eugen.Hristev at microchip.com wrote:
>>>> On 13.05.2020 18:21, Baruch Siach wrote:
>>>>> On Wed, May 13 2020, Eugen Hristev wrote:
>>>>>> Add new linux tools package : spi. This is present in the Linux Kernel since
>>>>>> 4.5.
>>>>>> It now includes spidev_test and spidev_fdx tools.
>>>>> We have a package for spidev_test already. Consider adding spidev_fdx to
>>>>> that package instead.
>>>> While I understand your point, you should also consider that all linux
>>>> tools have a specific way to build in buildroot, and this I think should
>>>> be consistent.
>>> Agreed.
>>>> And spi tools would be not just spidev_test and might include future
>>>> applications, which may or may not have their place in the same spot as
>>>> spidev_test .
>>> In that case I think you should remove the spidev_test package.
>> 
>> Yes, I like it that we can drop spidev_test.
>> 
>> But do it multi-step:
>> 
>>    - intropduce spidev as a linux-tool
>>    - drop the standalone spidev_test
>> 
>> Do not forget to add legacy handling for it, though; see Config.in.legacy.
>
> Hi Yann and Baruch,
>
> Coming back to this, I noticed that the spidev_test package in buildroot 
> is different than the spidev_test from kernel tools.
>
>  From spidev_test package:
>
> Usage: spidev_test [-DsbdlHOLC3]
>    -D --device   device to use (default /dev/spidev1.1)
>    -s --speed    max speed (Hz)
>    -d --delay    delay (usec)
>    -b --bpw      bits per word
>    -i --input    input data from a file (e.g. "test.bin")
>    -o --output   output data to a file (e.g. "results.bin")
>    -l --loop     loopback
>    -H --cpha     clock phase
>    -O --cpol     clock polarity
>    -L --lsb      least significant bit first
>    -C --cs-high  chip select active high
>    -3 --3wire    SI/SO signals shared
>    -v --verbose  Verbose (show tx buffer)
>    -p            Send data (e.g. "1234\xde\xad")
>    -N --no-cs    no chip select
>    -R --ready    slave pulls low to pause
>    -2 --dual     dual transfer
>    -4 --quad     quad transfer
>
>  From kernel tools:
>
> https://elixir.bootlin.com/linux/v5.7/source/tools/spi/spidev_test.c#L198
>
> Looks it's a different program, or I am missing something ?
>
> In that case, I would think we cannot supersede the existing spidev_test 
> package with the kernel tools.
>
> I would think both should be in the distribution, but how to 
> differentiate them ?

The file you link to is a newer version. You can find the version that
buildroot uses here:

  https://elixir.bootlin.com/linux/v4.10/source/tools/spi/spidev_test.c

Note SPIDEV_TEST_VERSION.

In my opinion, we can update to the latest version like any other
upstream package.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
