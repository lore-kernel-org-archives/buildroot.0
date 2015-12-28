From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 21:35:20 +0100
Subject: [Buildroot] [PATCH] package/qt: disable Qt GUI module for CS
 NiosII toolchain
In-Reply-To: <568178DC.3080504@gmail.com>
References: <1450911817-12589-1-git-send-email-romain.naour@gmail.com>
 <20151224083849.381556a9@free-electrons.com>
 <CANLo3JgDh9HBs82x_QoK-ZDTuhP=XTkYKvSMfj34tXRnaQgVyQ@mail.gmail.com>
 <20151224091911.5380637c@free-electrons.com>
 <CANLo3Jih8-QwatDhqeqYcy1G2_2ank2am2LbKWmERpVS1DNtqA@mail.gmail.com>
 <20151224111225.24c62183@free-electrons.com>
 <568178DC.3080504@gmail.com>
Message-ID: <20151228213520.51fcf5ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Dec 2015 19:01:00 +0100, Romain Naour wrote:

> > Well, since the problem also affects nios2 internal toolchains, I
> > believe the dependencies should be !BR2_nios2, of course unless you
> > find an existing binutils patch to fix the problem. But if you don't,
> > then we will have to exclude nios2 entirely.
> 
> I greped in the Binutils git tree but I didn't see anything easy to backport to
> fixes the issue. I tried to build a nios2 toolchain with gcc 5.2.3 and the
> latest commit of the upcoming Binutils 2.26 release, and Qt GUI build fine.

Ah! This is interesting! I tested with binutils 2.25 and the gtkmm3 use
case, and it was still failing, so I reported the bug upstream at
https://sourceware.org/bugzilla/show_bug.cgi?id=19405.

> I think we'll need to rebuild a new nios2 toolchain (with gcc 5.2.3 and binutils
> 2.26) to fix most of the build issues related to ld assertion fail or Assembler
> messages (libcap-ng).

Interesting! I quickly tried to backport a few patches from binutils
git on top of 2.25, but I still get the assertion fail when building
gtkmm3.

> Also Qt GUI is not the only one affected by this issue (gtkmm3):
> http://autobuild.buildroot.net/results/3e2/3e2ad2de03b5e9f181332d06dcf860e51fcd47f8/build-end.log

Indeed.

> > To be honest, the likeliness of having people using Qt GUI on nios2 is
> > very small, if not zero. So we shouldn't care too much about this IMO.
> 
> Ok, let exclude Qt GUI on nios2 but other packages may have the same issue.

I suggest to simply exclude all those packages on BR2_nios2, with maybe
a comment "broken on existing external/internal toolchains, revisit
when they are upgraded". In any case, such "big" packages are highly
unlikely to ever be used on nios2.

Can you resend a patch adding a !BR2_nios2 dependency everywhere?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
