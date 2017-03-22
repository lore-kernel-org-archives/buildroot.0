From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Mar 2017 09:24:56 +0100
Subject: [Buildroot] [PATCH] support/script/check-bin-arch: ignore
	/usr/share
In-Reply-To: <1490128516-31437-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 21 Mar 2017 21:35:16 +0100")
References: <1490128516-31437-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87inn1k9bb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > /usr/share normally should not contain binaries executable for the
 > target platform. However, it might contain ELF binaries for other
 > platforms, such as firmware files installed by Qemu or
 > pru-software-support.

 > Instead of special-casing each package, let's simply ignore /usr/share.

 > Fixes:

 >   http://autobuild.buildroot.net/results/6f3fea9f6adaef1573fbb0dd6903b5d99e470610/
 >   (pru-software-support)

 >   http://autobuild.buildroot.net/results/fe8892bc22a03299fc41e30bfea5e42166838f88/
 >   (qemu)

Hmm, this doesn't seem to work?

http://autobuild.buildroot.net/results/4e2/4e27559827f3ed75a12f13bd595998bf661b2aaf/build-end.log
http://autobuild.buildroot.net/results/99e/99e4ed21116c721faf9f1d0349f312b357d333ee/build-end.log

I wonder if we shouldn't turn the tests around, E.G. instead of
searching for elf files with a machine different from target, search for
a files with machine == host.

If we do this then we need to disable the test when host == target (but
the current tests aren't really helpful either for such setups).

This can naturally still fail if somebody adds a package (E.G. in
br2-external) that installs a i386/x86-64 binary. Presumably this could
happen if you want to include a PC application to inside the firmware
(E.G. downloadable through the web interface and used for controlling
the firmware or similar), but it doesn't get caught up in all these
build issues about various other firmware files or slightly different
machine strings (sparc / sparcv9, arcompat / arcv2)..

-- 
Bye, Peter Korsgaard
