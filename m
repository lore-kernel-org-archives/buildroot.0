From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 30 Apr 2007 15:37:13 +0200
Subject: [Buildroot] BSP patch
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e801c76c0e$c9eec980$01c4af0a@Glamdring>
	<20070322132609.GA11410@aon.at>
	<01a101c76c8a$2450a4e0$01c4af0a@Glamdring>
	<20070322164017.GB3907@codepoet.org>
Message-ID: <016301c78b2c$b1b835d0$0402a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Thu Mar 22, 2007 at 02:53:12PM +0100, Ulf Samuelsson wrote:
>> 
>> >>The BSP patch also put some structure on where the result ends up.
>> >>Today everything is stored in the top directory, but if you
>> >>want to build multiple boards, then you are going to get a lot of clutter.
>> >
>> > We need to better differentiate between arch and cpu (generally, not in
>> > your board support patch).
>> >
>> > Applying your patch now locally. Let's see..
>> >
>> 
>> Thank You,
>> 
>> So far the patch does not create anything, only defines locations.
>> 
>> The beef is in the patches that follows
>> but I plan to submit the AVR32 toolset patches first.
>> 
>> The idea is to avoid keeping the toolset patches
>> inside the buildroot,and instead download the patches
>> before they are applied.
> 
> Mind sharing the the next patchset with us, so we can see where
> you are going with this?  I do like the general idea and I
> recognize the need to make changes such as you describe.  But I
> would like to have a chance to review the actual changes you plan
> to implement should this be applied...
> 
> -Erik

I did send you my preliminary buildroot quite some time ago,
and published a script which downloads and build buildroot 
one week ago.

This new script will build the following board:
* at91rm9200df,  at91sam9260dfc, at91sam9261ek, at91sam9263ek
(Fragments of avr32 support is there but not tested lately)

Except for the root file system (in ext2/jffs2) it also builds:

* linux-2.6.20.4    now defined in target/linux/Config.in; Makefile.in
* u-boot-1.2.0
* at91bootstrap-2.3
* datflashboot-1.05

everything "configurable" or board dependent builds in the 

target_build_$BR2_ARCH)/$(BR2_HOSTNAME)

(Linux/U-boot/Busybox/root/at91bootstrap/dataflashboot)

and results are published in

binaries/$(BR2_HOSTNAME)

Note that BR2_HOSTNAME is used instead of BR2_BOARD_NAME
since they refer to two different things.
You can build several versions of the same board so 
you can have several .config files with a common BR2_BOARD_NAME
but BR2_HOSTNAME differs.

What else is required to move on ?


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                ftp://at91dist:distrib at 81.80.104.162/
