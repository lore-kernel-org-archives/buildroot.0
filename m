From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 24 Jun 2011 18:27:22 +0200
Subject: [Buildroot] cyrus-imapd: static binaries are huge + choose binaries
	to install
In-Reply-To: <4E04828A.6030908@lucaceresoli.net>
References: <4E04828A.6030908@lucaceresoli.net>
Message-ID: <4E04BAEA.1040608@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the last two issues that I'm facing with cyrus-imapd are not strictly 
related to buildroot, nor to cross-compilation, but rather to using 
cyrus-imapd in an embedded system.

I'm discussing them together in this e-mail as they are closely related.

The cyrus-imapd build system apparently does not currently allow to 
build shared executables. This results in needlessly large files.
In a basic build for x86 (./configure && make), most of the executables 
in imap/ have a size between 2.2 and 2.5 MB, and the sum is 62.8 MB.

This may not be a problem on a classic mail server, but storage space 
can be a precious resource on embedded systems.
Clearly, using  shared libraries would reduce the overall space required.

It looks like I'm not the first to think about this. In
   http://bugzilla.cyrusimap.org/show_bug.cgi?id=3095
a patch was proposed and rejected. Unfortunately I could not apply it, 
possibly because it's based on an old code base (2008).

Would it be feasible to add shared build support in the cyrus-imapd 
build system?


For the same motivation (saving precious storage space), it would be 
extremely useful to disable the compilation and installation of selected 
executables.

The standard distribution installed as many as 30 executables in 
/usr/cyrus/bin/, which cross-compiled for ARM and stripped take 32 MB. 
Those that I really need take <7 MB and I wish I could get rid of them 
by passing --disable-pop3proxyd or similar to ./configure.

AFAIK this is not currently possible in cyrus-imapd. Is this correct?
Do the Cyrus developers have anything similar in mind for the future of 
cyrus-imapd? Is this feasible?

Thanks,
Luca
