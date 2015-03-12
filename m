From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 12 Mar 2015 08:04:33 +0000
Subject: [Buildroot] [PATCH] system: add option for standalone telnetd
	on target
In-Reply-To: <87pp8flblh.fsf@dell.be.48ers.dk>
References: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
 <877funmrkw.fsf@dell.be.48ers.dk> <1426092262.2375.11.camel@synopsys.com>
 <87pp8flblh.fsf@dell.be.48ers.dk>
Message-ID: <1426147462.2639.11.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, 2015-03-11 at 17:53 +0100, Peter Korsgaard wrote:
> >>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> 
> Hi,
> 
> >> Any specific reason why you don't just configure a root password and
>  >> enable dropbear instead?
> 
>  > Well I though of telnet as an essential replacement of serial console
>  > especially for development boards.
> 
> These days I would say ssh is much more common.
> 
>  > So my main intention was to get the most convenient tool for wide range
>  > of developers. 
> 
>  > For example in Windows if I'm not mistaken Telnet client is available
>  > right from MS, while SSH client is always 3rd-party program like Putty. 
> 
> If I'm not mistaken Windows no longer comes with telnet out of the box.
> 
> E.G. first Google hit:
> 
> http://social.technet.microsoft.com/wiki/contents/articles/910.windows-7-enabling-telnet-client.aspx

Well probably it was in days of WinXP when Telnet was pre-installed.
Still as you may see from the article - there's a way to install
"native" Telnet client from Windows update/software sources.

>  > Also ability to not set password is convenient here - because people
>  > will ask "what's the password" otherwise. Still in case of devboards we
>  > have limited access to the network for foreigners so we may not care
>  > much about paranoid safety.
> 
> Don't they ask the same about the serial login password?

That's exactly the point for serial port as well as for Telnet we may
not use password for root - which is a default case in Buildroot.

> 
>  > Indeed your proposal may work if my motivation is not convincing enough.
> 
> I can still be convinced, but my initial thought is that it isn't
> really a common enough use case / we should promote ssh instead.

I tried your proposal with Dropbear but frankly with not much luck.
What I did:
 [1] Enabled "dropbear": BR2_PACKAGE_DROPBEAR=y
 [2] Set root password: BR2_TARGET_GENERIC_ROOT_PASSWD="xxx"

What's nice Dropbear auto-starts on boot. But...

Now on attempt to ssh to the target I see:
 --->8---
 $ ssh root at 192.168.218.2
 root at 192.168.218.2's password: 
 PTY allocation request failed on channel 0
 shell request failed on channel 0
 --->8---

Even though I see devpts is correctly mounted to /dev/pts and /dev/ptmx
exists.

So probably I'm missing something.

Another inconvenience I discovered with SSH - every time I boot my
target it gets new fingerprint and then on attempt to ssh to the target
I see:
 --->8---
 $ ssh root at 192.168.218.2
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
 Someone could be eavesdropping on you right now (man-in-the-middle
attack)!
 It is also possible that a host key has just been changed.
 The fingerprint for the ECDSA key sent by the remote host is
 82:b8:c2:cf:88:d6:19:77:60:23:ff:9b:cc:3e:3d:2c.
 Please contact your system administrator.
 Add correct host key in /home/abrodkin/.ssh/known_hosts to get rid of
this message.
 Offending ECDSA key in /home/abrodkin/.ssh/known_hosts:49
 ECDSA host key for 192.168.218.2 has changed and you have requested
strict checking.
 Host key verification failed.
 --->8---

I may assume this is because I have filesystem built-in kernel (vmlinux)
so between boots filesystem doesn't preserve any information - but in
case of simulators we usually don't have any other options.

-Alexey
