From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Jan 2019 15:21:18 +0100
Subject: [Buildroot] [PATCH v2,1/1] gnuchess: needs -fPIC
In-Reply-To: <20190113141329.4d526438@windsurf.home>
References: <20190112175505.14348-1-fontaine.fabrice@gmail.com>
 <20190113141329.4d526438@windsurf.home>
Message-ID: <391d5d2d-90ca-1224-ce6f-cab3b440cbc7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/01/2019 14:13, Thomas Petazzoni wrote:
> Hello Fabrice,
> 
> On Sat, 12 Jan 2019 18:55:05 +0100, Fabrice Fontaine wrote:
>> When building with -O2 (or -O3) on ARM cortex-M cpus, link fails on:
>>
>> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/arm-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -Wl,-elf2flt -static  -Wl,-elf2flt -static   -Wl,-elf2flt -static -o gnuchess main.o components.o  frontend/libfrontend.a adapter/libadapter.a engine/libengine.a -lreadline -lncurses
>> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
>> ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
>> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
>> ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
>> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
>> ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
>> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
>>
>> To fix this, pas -fPIC unconditionnally
>>
>> Fixes:
>>  - http://autobuild.buildroot.org/results/7918757b255ed41609609d2083c2d8904ff3136e
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> I'm sorry but this doesn't make sense to me. -fPIC is for Position
> Independent Code, which is needed when building shared libraries. Here
> we are building with -static on Cortex-M which doesn't even have
> support for shared libraries. So building with -fPIC doesn't make sense
> I believe. It seems to be more a workaround than a real fix.
> 
> Perhaps this should be discussed with upstream binutils, or at least a
> proper investigation be done about those relocation types ?

 Or we could argue that gnuchess on Cortex-M probably isn't that essential, and
just put an architecture dependency...

 Regards,
 Arnout
