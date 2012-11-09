From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Nov 2012 13:13:12 +0100
Subject: [Buildroot] Autotest infrastructure (a bit of off-topic: git
	repo URL)
In-Reply-To: <20121109114750.6a4dc53a@skate> (Thomas Petazzoni's message of
 "Fri, 9 Nov 2012 11:47:50 +0100")
References: <509BC913.3080902@mind.be> <509BDBF2.1060700@digi.com>
 <509C224B.8000405@mind.be> <20121109114750.6a4dc53a@skate>
Message-ID: <87bof76kkn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> On a related topic (firmware upgrade), I have:
 Thomas> https://gitorious.org/embedded-linux-firmware-upgrade-tool/embedded-linux-firmware-upgrade-tool

 Thomas> It has a:

 Thomas>  * A host utility to prepare firmware images composed of multiple parts
 Thomas>    (usually a kernel image + root filesystem image, but there could be
 Thomas>    more)

 Thomas>  * A target utility that can run either on the command line or as a CGI
 Thomas>    script. This utility does the firmware upgrade itself by fiddling
 Thomas>    with the U-Boot environment.

 Thomas> The tool assumes that the flash has two partitions for each component
 Thomas> been upgraded (one active partition, one to upgrade).

 Thomas> The documentation at
 Thomas> https://gitorious.org/embedded-linux-firmware-upgrade-tool/embedded-linux-firmware-upgrade-tool/blobs/master/fwupgrade-doc.txt
 Thomas> has a few details.

This is getting pretty offtopic, but from a quick look at it, it seems
nice, but:

- hardcoded for nand (E.G. uses nandwrite)
- non-atomic (E.G. uboot environment is handled per-part, so you can end
  up with a halfway upgraded system if something goes wrong)
- fairly inflexible (hardcoded upgrade procedure, hw id handling, cgi)

I've solved it in the past by wrapping firmware upgrades in .deb files,
and used the depends on / conflicts stuff for hw id/version handling,
and the pre/post scripts to define the upgrade handling in the upgrade
itself. To ensure an atomic change between current and upgraded system I
key off the choice of kernel/rootfs from a single u-boot variable
(typically called boot=high|low) which is only changed at the very end.

Maybe we should do some more firmware upgrade talks at an upcoming
conference ;)

-- 
Bye, Peter Korsgaard
