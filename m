From: Ulf Samuelsson <ulfs@dof.se>
Date: Thu, 25 Jan 2007 16:28:08 +0100
Subject: [Buildroot] Target support for Atmel ARM/AVR32
References: <20070125090434.GB15747@aon.at><00bd01c7407f$a8c4c300$01c4af0a@atmel.com>
	<20070125134707.GA17985@aon.at>
Message-ID: <010a01c74098$d3387e10$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Thu, Jan 25, 2007 at 01:42:20PM +0100, Ulf Samuelsson wrote:
>> Bernhard Fischer wrote:
>
>>> If the TODO that is mentioned in r17516 would be fixed, would that
>>> help that problem in any way? I, personally, don't use the concept
>>> of a board in the context of buildroot. Put that aside, what about
>>> this layout:
>>> -) toolchain_<arch>_<subarch>_<cpu>
>>> -) same for build_
>>> -) board_<device> as default COPY_TO
>>>
>>> where
>>> $device is target/device/*
>>> $arch would be generic arch e.g. i386, arm
>>> $subarch is the real -march=
>>> $cpu is the real -mtune=
>>>
>>> Opinions?
>>
>> That is a different problem.
>> I can either build an ARM based buildroot or an AVR32 based
>> buildroot. They will build in: build_arm and build_avr32, same for
>> toolchain.
>>
>> My problem is that I want to build for
>> AT91RM9200DK    -ARM920T
>> AT91RM9200DF     -ARM920T
>> AT91RM9200EK     -ARM920T
>> AT91SAM9260EK  -ARM926EJS
>> AT91SAM9261EK  -ARM926EJS
>> AT91SAM9263EK  -ARM926EJS
>> AT91SAM9XEEK   -ARM926EJS
>> using a common toolchain
>> (The toolchain is generic arm, even though I use different CPU cores)
>> and maybe a common root file system (today it is).
>>
>> This means that
>> * 7 different Linux versions,
>> * 7 different U-boot
>> * 7 different bootstraps.
>> Possibly, the root file system should be populated differently.
>>
>> When I have built a board, I want to have all binaries stored
>> in one place which can be easily compressed into a tarball.
>>
>> Your suggestion is more for building different toolchains for
>> different boards
>> but this is not the case.
>
> My suggestion is to build two toolchains (assuming that ARM920T !=
> ARM926EJS, if it is the same, then it's only one toolchain) and use
> that to populate the board_{AT91*} dirs
>>

There will be only a single toolchain which will be generic-arm.
This will be ok for novices, and if they start to care, then
it is easily changed in the .config file.

In order to avoid cluttering the top directory, I have
put in an extra directory level so instead of your suggestion:

>>> -) toolchain_<arch>_<subarch>_<cpu>
>>> -) same for build_
>>> -) board_<device> as default COPY_TO
>>>

board_<device>
becomes
board/<device>

although I call it

target_build_<arch>/<boardname>

Also I put all binaries in a single directory

binaries/<boardname>

This means that you get two extra directories in the top level
compared to seven extra directories at the top level.

It is also easy to create a tarball of all the binaries
when they are all located in a single place.

Today, the binaries are created in the top directory,
so you have to spend more time to select which files should
go into the binaries tarball.

Having the binaries spread out in different board_<device>
directories is also costing more in matinenace than
a single "binaries" directory.


Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
