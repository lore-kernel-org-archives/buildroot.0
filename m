From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 25 Jan 2007 10:04:34 +0100
Subject: [Buildroot] Target support for Atmel ARM/AVR32
In-Reply-To: <02b801c74014$8ceb1a50$01c4af0a@atmel.com>
References: <014901c73faa$8e9c8100$01c4af0a@atmel.com>
	<20070124233707.GG28221@aon.at>
	<02b801c74014$8ceb1a50$01c4af0a@atmel.com>
Message-ID: <20070125090434.GB15747@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 25, 2007 at 12:58:57AM +0100, Ulf Samuelsson wrote:
>Bernhard Fischer wrote:
>>On Wed, Jan 24, 2007 at 12:06:31PM +0100, Ulf Samuelsson wrote:
>>>I am hoping to add Target support for a number of Atmel Development
>>>board, but before I do that, I would like to discuss how this is
>>>done.
>>>
>>>Would like to separate building the root file system from other
>>>utilities, since the "build_<arch>" directory is overcrowded.
>>>
>>>Currently I am using a "target_build_<arch>" directory.
>>>In this directory, I create a subdirectory for each target_board.
>>>
>>>I.E:
>>>buildroot/target_build_arm
>>>       at91rm9200dk
>>>       at91rm9200df
>>>       at91rm9200ek
>>>       at91sam9260ek
>>>       at91sam9261ek
>>>       at91sam9262ek
>>>or
>>>buildroot/target_build_avr32
>>>       atstk1002
>>>
>>>In the target_build_<arch>/<target_board> directory
>>>I download patches for Linux/U-Boot before I apply them
>>>and then build
>>>* Bootstrap
>>>* U-Boot
>>>* Linux
>>>* Other Utitlties
>>>in that directory.
>>>
>>>The results are renamed to show <target_board> and date.
>>>
>>>Would like to move "buildroot/build_<arch>/root" to
>>>"buildroot/target_build_<arch>/<target_board>/root" as well,
>>>but have not yet gotten this to work.
>>>(This will allow me to have different contents for different boards)
>>>
>>>At the end, the result is moved to
>>>"buildroot/binaries/<target_board>"
>>>so that I have easy way to create a delivery by just compressing
>>>that directory into a tarball.
>>>
>>>Does this seem to be a reasonable approach?
[snip]
>My goal is to have people download the buildroot source,
>then copy a .config file to the topdir and type "make".
>Then everything should work without surprises.
>
>"Grand-Ma" should be able to do it!
>
>Many people that will uses this will be complete new to Linux and
>the thing below looks dangerous if you want to avoid support phone calls.
>
>The question is really, will a patch be rejected if it is built up as above?

If the TODO that is mentioned in r17516 would be fixed, would that help
that problem in any way? I, personally, don't use the concept of a board
in the context of buildroot. Put that aside, what about this layout:
-) toolchain_<arch>_<subarch>_<cpu>
-) same for build_
-) board_<device> as default COPY_TO

where
	$device is target/device/*
	$arch would be generic arch e.g. i386, arm
	$subarch is the real -march=
	$cpu is the real -mtune=

Opinions?

PS: r17516 was, for your convenience:
http://uclibc.org/cgi-bin/viewcvs.cgi?rev=17516&view=rev
