From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 May 2010 22:58:40 +0000 (UTC)
Subject: [Buildroot] [Bug 1771] Fakeroot and the
 target/generic/device_table.txt create bad device nodes.
In-Reply-To: <bug-1771-163@https.bugs.busybox.net/>
References: <bug-1771-163@https.bugs.busybox.net/>
Message-ID: <20100525225840.626751C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1771

--- Comment #2 from Andy Kennedy <akennedy@drs-tem.com>  ---
(In reply to comment #1)

I attempted to e-mail this, but it looks like it didn't go through. . . so if
this is a dup, please forgive.

> --- Comment #1 from Thomas Petazzoni 
> <thomas.petazzoni@free-electrons.com>  ---
> I just made a test with the default 
> target/generic/device_table.txt and the
> result for hd* is good :

Sorry, I thought I had articulated correctly.  To restate:  this problem ONLY
occurs with the building of a jffs2 filesystem.  When I 'make tarroot' I get a
device tree with correctly populated device nodes.  Only when I 'make
jffs2root' do I get funky minor numbers.

> In the device list you pasted, the minor numbers are 
> incorrect. hda should be
> 3:0, hda1 should be 3:1, hda2 3:2, hdb should be 3:64, hdb1 
> 3:65, hdb2 3:66.
> hdc is 22:0, hdc1 is 22:1, etc. See Documentation/devices.txt 
> in the Linux
> kernel source tree for the official reference.
> 

Yes, this was the reason for the bug report.  These devices are being made
incorrectly.

More information, however, is that if I make the nodes myself in the <path to
target>/dev directory, modify buildroot/target/generic/device_table.txt to
EXCLUDE hd{a-c} and sd{a-c} then I get the devices correctly in the filesystem.
 Which makes me wonder if fakeroot is the red herring and the real culprit is
actually makedevs.

Hopefully I have cleared something up for you.

Andy

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
