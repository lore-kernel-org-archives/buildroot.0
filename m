From: =?UTF-8?B?QmVybmhhcmQgR8O2ZGVs?= <bernhard.goedel@gmx.at>
Date: Tue, 23 Dec 2008 16:08:20 +0100
Subject: [Buildroot] avr32: no selection for Binutils version
In-Reply-To: <87vdtb5g53.fsf@macbook.be.48ers.dk>
References: <4950BD88.2060503@gmx.at> <87vdtb5g53.fsf@macbook.be.48ers.dk>
Message-ID: <4950FEE4.8090900@gmx.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard G?del <bernhard.goedel@gmx.at> writes:
>  Bernhard> I used 'make menuconfig' to enter the configuration for my
>  Bernhard> target but I've encountered a problem here. After selecting
>  Bernhard> 'AVR32' as target architecture, I cannot select any
>  Bernhard> Binutils Version from the 'Toolchain' submenu.

I found the file where it is specified which binutils versions are 
available for a certain architecture.

It is in /buildroot/toolchain/binutils/config.in

In the older version (allowing to select 2.17) there is:

	config BR2_BINUTILS_VERSION_2_17
		depends on BR2_avr32 || !BR2_nios2 && BR2_DEPRECATED
		depends on BR2_EXT_BINUTILS_VERSION_2_17
		bool "binutils 2.17"

where as in the most recent snapshot it is:

	config BR2_BINUTILS_VERSION_2_17
		depends on BR2_avr32 || !BR2_nios2
		depends on BR2_DEPRECATED && !BR2_avr32
		depends on BR2_EXT_BINUTILS_VERSION_2_17
		bool "binutils 2.17"

The later configuration makes it impossible to select 2.17 as a binutils 
version for avr32. As there is no other binutils version that is allowed 
to be selected for avr32, it is simply impossible to select a binutils 
version at all.
I've replaced this section of the file by the older one and now I can 
select 2.17 also on the most recent snapshot.

Unfortunately, the problems described in "[Buildroot] avr32: lbipthread 
problem" remain the same also for the most recent snapshot. I'm stuck in 
the make process at the generation of libgomp.

Bernhard
