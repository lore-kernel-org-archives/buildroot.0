From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Jan 2017 09:30:55 +0100
Subject: [Buildroot] [PATCH] boot-wrapper-aarch64: Allow users to
 specify an initrd/initramfs file.
In-Reply-To: <0863737f-d337-2a87-1928-5c96d97e7281@mentor.com>
References: <1475880304-21773-1-git-send-email-hollis_blanchard@mentor.com>
 <1475880304-21773-2-git-send-email-hollis_blanchard@mentor.com>
 <20161025235728.796804cc@free-electrons.com>
 <34543eb7-53cc-957b-31af-88a8319e3208@mentor.com>
 <6451f7b7-abcb-e3ad-eb21-973265a89321@mind.be>
 <0863737f-d337-2a87-1928-5c96d97e7281@mentor.com>
Message-ID: <06354bcc-8f67-d260-3758-b0f9a21ef5fa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-01-17 23:45, Hollis Blanchard wrote:
> On 01/12/2017 02:30 PM, Arnout Vandecappelle wrote:
>> On 12-01-17 00:55, Hollis Blanchard wrote:
>>> On 10/25/2016 02:57 PM, Thomas Petazzoni wrote:
>>>>>    boot/boot-wrapper-aarch64/Config.in               |    8 ++++++++
>>>>>    boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk |    4 ++++
>>>>>    2 files changed, 12 insertions(+), 0 deletions(-)
>>>> [...]
>>>>
>>>> It should be something like:
>>>>
>>>> ifeq ($(BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK),y)
>>>> BOOT_WRAPPER_AARCH64_CONF_OPTS += --with-initrd=$(BINARIES_DIR)/rootfs.cpio
>>>> BOOT_WRAPPER_AARCH64_DEPENDENCIES += rootfs-cpio
>>>> endif
>>> I'm preparing a resend on this, but I'm having trouble with the dependency:
>>>
>>> $ rm /scratch1/hblancha/build/buildroot/images/rootfs.cpio
>>> $ make O=/scratch1/hblancha/build/buildroot boot-wrapper-aarch64-dirclean all
>>> [...]
>>> /scratch1/hblancha/build/buildroot/host/usr/bin/aarch64-buildroot-linux-gnu-ld:
>>> cannot find /scratch1/hblancha/build/buildroot/images/rootfs.cpio
>>>
>>> I can see that rootfs-* is defined and used in fs/, but, well, ... it doesn't
>>> seem to be working in this boot/ Makefile. Any advice?
>>   Difficult to say without seeing the patch. Does it work correctly if you call
>> 'make rootfs-cpio boot-wrapper-arch64'?
> 
> Same error. Earlier I see this:
> make: Circular
> /scratch1/hblancha/build/buildroot/build/boot-wrapper-aarch64-4266507a84f8c06452109d38e0350d4759740694/.stamp_configured
> <- rootfs-cpio dependency dropped.

 Ah, of course: rootfs-cpio depends on PACKAGES, and boot-wrapper-aarch64 is in
PACKAGES. Same issue as with initramfs, and which is the reason why initramfs
doesn't use the normal DEPENDENCIES approach.

 A fundamental solution would probably involve a change in the infra to support
leaving out a package from PACKAGES (but then there has to be another way of
making sure it *does* get built).

 But for now, all I can think of is to do it similar to how we do it for linux:
create a filesystem target for it, and then add some special custom rule to
boot-wrapper-aarch64 to (re)build it with the cpio archive.

> 
> Full patch is here:
> 
> Author: Hollis Blanchard <hollis_blanchard@mentor.com>
> Date:   Mon Sep 26 15:48:12 2016 -0700
> 
>     boot-wrapper-aarch64: Allow users to specify an initrd/initramfs file.
>         Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

 BTW you have a missing blank line between the summary and the Sob.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
