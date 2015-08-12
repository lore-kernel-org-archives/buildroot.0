From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Wed, 12 Aug 2015 09:27:18 -0700
Subject: [Buildroot] [PATCH] linux: handle read-only dts files
In-Reply-To: <55CB7019.5080703@mail.bg>
References: <1439338309-19690-1-git-send-email-hollis_blanchard@mentor.com>
 <55CB5F23.7000708@mail.bg> <55CB6E20.5040206@mentor.com>
 <55CB7019.5080703@mail.bg>
Message-ID: <55CB73E6.7080003@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/12/2015 09:11 AM, Nikolay Dimitrov wrote:
> Hi Hollis,
>
> On 08/12/2015 07:02 PM, Hollis Blanchard wrote:
>> The DTS exists at $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) because that's
>> where it lives. It's copied to $(KERNEL_ARCH_PATH)/boot/dts/ so that the
>> kernel build process can build a DTB out of it (which is later copied to
>> build/images/).
>>
>> Or did I misunderstand the question?

(Just to be clear: $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) is under version 
control, while $(KERNEL_ARCH_PATH), the build directory, is not.)

> Sorry, I could've been probably more clear. My question was whether the
> DTS needs to exist also at the destination ($(KERNEL_ARCH_PATH)/boot
> /dts/) before the copying happens.

It does not need to exist there. It's only there because of a previous 
cp in a previous build.

> If it doesn't exist at the destination, the VCS wouldn't have checked
> it out as r/o file, and the issue wouldn't happen in the first place
> (e.g. the copy operation will succeed). Also, when we have 2 files with
> the same name and content, this tends to create confusion with
> developers (aka which file was the primary one).

The file needs to exist at the destination at least temporarily, for the 
DTS->DTB translation. You could say "we should remove it afterwards", 
but a) that could be technically difficult in the face of ^C and kill 
-9, and b) you could say the same about zImage, vmlinux, etc... so we'd 
really be talking about a full "make clean", which seems like overkill.

Are you suggesting "rm -f; cp" instead of "cp -f"? As far as I know the 
two are functionally equivalent, so the former seems like slightly more 
overhead to get the same effect as the latter.

cp -f seems a simple solution: try harder to copy the file. :-)

Hollis Blanchard
Mentor Graphics Emulation Division
