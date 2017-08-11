From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Aug 2017 14:15:45 +0000
Subject: [Buildroot] [Bug 10201]
 buildroot-2017.08-rc1/toolchain/toolchain-wrapper.c:192]: (error) Memory
 leak:
In-Reply-To: <bug-10201-163@https.bugs.busybox.net/>
References: <bug-10201-163@https.bugs.busybox.net/>
Message-ID: <bug-10201-163-Dz1Sjif4hl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10201

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
Your static analyser is weird, because there are a few other things which
aren't freed either: relbasedir, absbasedir in different code paths.

However, we do this by choice. Freeing things before exiting is useless, since
the OS will implicitly free everything when the program exits. That's why e.g.
valgrind doesn't report these as real memory leaks (because they are still
reachable).

So no, this is not a memory leak.

For consistency, the free(args) at the end should be removed, but that's a
different issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
