From: Oleg Sadov <sadov@linux-ink.ru>
Date: Tue, 22 Mar 2011 20:26:56 +0300
Subject: [Buildroot] problems compiling crosstools-ng
In-Reply-To: <201103221710.32592.yann.morin.1998@anciens.enib.fr>
References: <cd12ab38cf1fa34fa4c10dfaf6eec135@basementcode.com>
	<201103221710.32592.yann.morin.1998@anciens.enib.fr>
Message-ID: <1300814816.3848.93.camel@sadov-t.linux-ink.vo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

22/03/2011 17:10 +0100, Yann E. MORIN wrote:
> On Tuesday 22 March 2011 15:24:39 chris at basementcode.com wrote:
> >  buildroot-2011.02:
> >  during the configure stage of binutils the configure script spawns the 
> >  following process over and over until swap is filled and the system 
> >  crashes:
> >  makeinfo --force --force --force --force --force --force --force 
> >  --force --force --force --force  ......
> 
> Yes, I know about this issue. You're not the first one to report it, but I
> was not able to reproduce it, not to understand how it can happen (although
> I have a small idea, but I'm not sure)
> 
> I'm doing some changes right now, that should fix the issue if all goes well.

I've got the same problem on my RHEL-based system. Seems like the root
of problem in search path for commands setted up by Croostool-NG
environment -- local script 'makeinfo' placed in path before the real
'makeinfo'. This script trying to execute 'makeinfo --force' command
and, voil? -- we got the infinite recursion!

Quck & dirty solution -- place the real path of makeinfo utility
(usually /usr/bin/makeinfo) in crosstool-NG.sh. Just put attached to
this mail patch in directory:

toolchain/toolchain-crosstool-ng

and rerun make -- hopefully your problem will be solved.

> Regards,
> Yann E. MORIN.

SY
--Oleg
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 002-crosstool-NG.sh.patch
Type: text/x-patch
Size: 935 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110322/ca6a9c70/attachment.bin>
