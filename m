From: Whitney, Scott <scwhitn@amazon.com>
Date: Fri, 21 Feb 2020 17:17:44 +0000
Subject: [Buildroot] Overlay not using a merged /usr?
In-Reply-To: <87r1yqd31p.fsf@dell.be.48ers.dk>
References: <1582122316810.2357@amazon.com>,<87r1yqd31p.fsf@dell.be.48ers.dk>
Message-ID: <1582305463997.17600@amazon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That worked perfectly.  Thanks very much, Peter!

Scott Whitney

________________________________________
From: Peter Korsgaard <jacmet@gmail.com> on behalf of Peter Korsgaard <peter@korsgaard.com>
Sent: Wednesday, February 19, 2020 10:12 AM
To: Whitney, Scott
Cc: buildroot at busybox.net
Subject: Re: Overlay not using a merged /usr?

>>>>> "Whitney," == Whitney, Scott <scwhitn@amazon.com> writes:

 > Hello Buildroot community,
 > I am working with a TI AM6548 SoC, and need to add some firmware
 > (.elf) files so that they will end up in /lib/firmware/ti-pruss.
 > These files get loaded into some special cores within the SoC to
 > create additional Ethernet ports.


 > I am using a Buildroot overlay with BR2_EXTERNAL, and tried to add the files under rootfs-overlay/lib/firmware/ti-pruss, i.e.:


 > scwhitn at ud9a5a686d6f756:~/Projects/AR_Reflex3_Buildroot/overlay/board/control-carrier/rootfs-overlay$ ls lib/firmware/ti-pruss
 > am65x-pru0-prueth-fw.elf  am65x-rtu0-prueth-fw.elf
 > am65x-pru1-prueth-fw.elf  am65x-rtu1-prueth-fw.elf


 > However, when I run make, I get the following error, and I'm not sure how to resolve it:


 >>>> Sanity check in overlay /home/local/ANT/scwhitn/Projects/AR_Reflex3_Buildroot/overlay/board/control-carrier/rootfs-overlay
 > ERROR: The overlay in
 > /home/local/ANT/scwhitn/Projects/AR_Reflex3_Buildroot/overlay/board/control-carrier/rootfs-overlay
 > is not using a merged /usr for the following directories: /lib
 > Makefile:738: recipe for target 'target-finalize' failed
 > make: *** [target-finalize] Error 1


You are presumably using a merged /usr (BR2_ROOTFS_MERGED_USR), where
/lib should be a symlink to /usr/lib, so when you add a rootfs overlay
containing a /lib directory this is no longer valid and it complains.

Simply put your files in the overlay under /usr/lib/.. instead.


 > I'm using buildroot-2019.02.6.  This is _urgent_; it's the last
 > peripheral that we need to support before the project can be handed
 > over to out client as complete.

You may consider moving to 2019.02.9 for a number of (security) fixes
since the 2019.02.6 release, and also notice that the 2019.02.x will go
end of life in approximately 1 month, so consider updating to 2020.02
(once released at the end of the month).

--
Bye, Peter Korsgaard
