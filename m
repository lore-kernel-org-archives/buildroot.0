From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 18:13:30 +0100
Subject: [Buildroot] [PATCH] bifferboard: new board
In-Reply-To: <4F660977.4040806@yahoo.co.uk>
References: <201203031529.36487.arnout@mind.be>
 <201203181450.44385.arnout@mind.be> <4F660977.4040806@yahoo.co.uk>
Message-ID: <201203181813.30601.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 18 March 2012 17:12:39 bifferos wrote:
> On 03/18/2012 01:50 PM, Arnout Vandecappelle wrote:
> > On Monday 12 March 2012 02:23:35 bifferos wrote:
> >> Write protecting the kernel text: 1048k
> >> Write protecting the kernel read-only data: 164k
> >> init[1]: segfault at 0 ip   (null) sp bf95bf40 error 4 in
> >> busybox[8048000+7c000]
> >   Since this segmentation fault is in init, it will be tough to debug.
> > Judging from the address, it in fact happens even before init is
> > started.  Is it possible that there isn't enough RAM to run busybox?
> >
> 
> I have a hard time believing there is not enough RAM  I have copied the 
> generated busybox onto the working system and run it there, and it 
> executes OK, so the same system can execute two instances of the busybox 
> binary (from two different places on rootfs), and they both run OK.

 It was just a guess based on the fact that it segfaults before it starts.


> I learnt something new the other day - an initramfs compiled into the 
> kernel can be compressed, however the kernel compression works ontop of 
> that.  So if you specify CONFIG_INITRAMFS_SOURCE it is pointless to 
> specify initramfs compression other than 'None'

 Hm, good point, we should probably change our initramfs setup to disable
compression if the kernel image itself is compressed.

[snip]

> Now I'm wondering if there is something that has been activated in 
> busybox, some feature, which requires kernel support, and (since my 
> kernel is minimal) perhaps it doesn't have it, and perhaps init doesn't 
> handle the lack of that support gracefully and crashes.  Nothing comes 
> to mind though.

 Since init segfaults before any instruction is executed, it seems 
unlikely.  The binary formats seem OK as well.  You could try to
enable CONFIG_BINFMT_AOUT.

 Hang on, I realize something.  CONFIG_BINFMT_MISC wasn't enabled in
the config I sent, so /init can't be executed (/init is a shell script
that mounts devtmpfs).  Can you enable BINFMT_MISC and try again?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
