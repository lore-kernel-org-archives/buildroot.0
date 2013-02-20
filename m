From: Gregory Perry <Gregory.Perry@govirtual.tv>
Date: Wed, 20 Feb 2013 01:24:07 +0000
Subject: [Buildroot] Advice on buildroot implementation
In-Reply-To: <5124085A.1080903@mind.be>
References: <718DFA7882181D45B8BD18F31C46D55427A6A8E3@MBX204.domain.local>,
 <5124085A.1080903@mind.be>
Message-ID: <718DFA7882181D45B8BD18F31C46D55427A6A997@MBX204.domain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Arnout!
________________________________________
From: Arnout Vandecappelle [arnout at mind.be]
Sent: Tuesday, February 19, 2013 6:18 PM
To: Gregory Perry
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Advice on buildroot implementation

On 20/02/13 00:03, Gregory Perry wrote:
> Hello again,
>
> Does anyone have some advice on using buildroot to create a LiveCD filesystem?
>
> Here are the requirements:
>
> 1) Universal boot support on any x86 hardware platform;
> 2) Read only (UnionFS or OverlayFS); and
> 2) NFS root capabilities after kernel/initrd launch (if the ISO is PXE-boostrapped)

  On x86, I find the easiest approach to use a cpio initramfs, with a
syslinux boot loader. But if universal boot is required, it means you
have to stuff all the modules bloat in the cpio image...

  For basic boot you don't need unionfs. The NFS root you can have by
combining the cpio initramfs with a unionfs overlay (assuming the
initramfs contains all the modules and firmware). I posted a script
recently [1] to mount a unionfs-root early in init. Don't forget to
select the unionfs-fuse package.


  Regards,
  Arnout

[1] http://lists.busybox.net/pipermail/buildroot/2013-January/066146.html


> The problems I am seeing with this approach so far (at least from the NFS
> root perspective) is that things like /lib/firmware are not accessible during the
> boot process which hangs the boot process.
>
> Has anyone successfully created a buildroot install that can be used over a
> read only NFS mount?  How did you get around issues like eth0 firmware not
> being accessible during the initial boot?
>
> Thanks in advance
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


--
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
