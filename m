From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Mar 2015 16:25:30 +0100
Subject: [Buildroot] [PATCH] system: add option for standalone telnetd
	on target
In-Reply-To: <1426147462.2639.11.camel@synopsys.com> (Alexey Brodkin's message
 of "Thu, 12 Mar 2015 08:04:33 +0000")
References: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
 <877funmrkw.fsf@dell.be.48ers.dk>
 <1426092262.2375.11.camel@synopsys.com>
 <87pp8flblh.fsf@dell.be.48ers.dk>
 <1426147462.2639.11.camel@synopsys.com>
Message-ID: <87wq2mi6fp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

Hi,

 > Well probably it was in days of WinXP when Telnet was pre-installed.
 > Still as you may see from the article - there's a way to install
 > "native" Telnet client from Windows update/software sources.

Yes, but it doesn't seem significantly easier than google + pytty + "I
feel lucky".


 >> Don't they ask the same about the serial login password?

 > That's exactly the point for serial port as well as for Telnet we may
 > not use password for root - which is a default case in Buildroot.

With ssh you could use a ssh key instead.


 >> 
 >> > Indeed your proposal may work if my motivation is not convincing enough.
 >> 
 >> I can still be convinced, but my initial thought is that it isn't
 >> really a common enough use case / we should promote ssh instead.

 > I tried your proposal with Dropbear but frankly with not much luck.
 > What I did:
 >  [1] Enabled "dropbear": BR2_PACKAGE_DROPBEAR=y
 >  [2] Set root password: BR2_TARGET_GENERIC_ROOT_PASSWD="xxx"

 > What's nice Dropbear auto-starts on boot. But...

 > Now on attempt to ssh to the target I see:
 ---> 8---
 >  $ ssh root at 192.168.218.2
 >  root at 192.168.218.2's password: 
 >  PTY allocation request failed on channel 0
 >  shell request failed on channel 0
 ---> 8---


Odd, I'm using it every day. Anything of interest in syslog? Perhaps you
are missing a kernel config. Do you have CONFIG_UNIX98_PTYS=y?

 > Another inconvenience I discovered with SSH - every time I boot my
 > target it gets new fingerprint and then on attempt to ssh to the target
 > I see:

Yeah, that's part of the extra security of ssh. Either drop the cached
key or add pregenerated keys in your rootfs.

 > I may assume this is because I have filesystem built-in kernel (vmlinux)
 > so between boots filesystem doesn't preserve any information - but in
 > case of simulators we usually don't have any other options.

You could always add a static set of keys in your rootfs overlay. Not
really ideal from a security POV, but still better than telnet.

-- 
Bye, Peter Korsgaard 
