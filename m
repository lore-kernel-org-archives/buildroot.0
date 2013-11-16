From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Nov 2013 10:42:23 +0100
Subject: [Buildroot] [PATCH 1/3] e2fsprogs: nommu: Add patch to use
 vfork in nommu arch.
In-Reply-To: <5286C388.2000004@mind.be>
References: <1384504293-2067-1-git-send-email-Sonic.adi@gmail.com>
 <1384504293-2067-2-git-send-email-Sonic.adi@gmail.com>
 <5286C388.2000004@mind.be>
Message-ID: <20131116104223.1fc1af9f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sonic,

On Sat, 16 Nov 2013 01:59:52 +0100, Arnout Vandecappelle wrote:

>   Again, it doesn't look like these fork replacements will work...

I'd like to maybe give more details about this. What we are concerned
about is that the noMMU patches you are doing seem to simply be patches
that replace every invocation of fork() by vfork(), just for the sake
of making things build. But they should not only build, but also work :)

However, vfork() clearly doesn't have the same implications and
constraints as fork(), so each replacement of fork() by vfork() need a
careful study and analysis, with a proper justification as to why it is
actually possible. Ideally, such patches should go upstream, and
therefore really be working patches.

So I think what would be good is probably to require something like a
comment on top of each fork -> vfork replacement that justifies why it
is possible, like:

	/*
	 * This is what happens, and which allows us to simply replace
	 * fork() by vfork(). Some more details here...
	 */
#ifdef HAVE_FORK
	p = fork();
#else
	p = vfork();
#endif

Or, even better: instead of sending patches to Buildroot, simply send
them upstream. So upstream can study them, give feedback on fork() vs.
vfork() usage. Once a patch is upstream, it can get accepted
immediately into Buildroot, since we know upstream has accepted it, and
it will be part of the next upstream release.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
