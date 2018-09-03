From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Sep 2018 22:47:56 +0000
Subject: [Buildroot] [Bug 11261] ccache using wrong cached objects
In-Reply-To: <bug-11261-163@https.bugs.busybox.net/>
References: <bug-11261-163@https.bugs.busybox.net/>
Message-ID: <bug-11261-163-3kwe0ORqT8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11261

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
Unfortunately, I was not able to reproduce the issue. We wiped the ccache and
that solved the problem. I thought that I knew the cause (and thus would be
able to reproduce), but apparently I didn't...

The issue was detected while David investigated the libfdt.h issue that was
ultimately fixed by replacing -I$(HOST_DIR)/include with -isystem
$(HOST_DIR)/include. Before that, he had developed a patch for the kernel that
would fix it by changing the libfdt.h in the kernel to match the one in dtc
itself. On one build machine, that patch worked perfectly fine; on another one,
it apparently had no effect - until the ccache was removed.

In retrospect, it may be possible that this was caused by ccache installed on
the host (so not our own ccache). But even with that added in the mix I
couldn't reproduce.

I also thought at the time that I understood what was going wrong (I thought it
was due to CCACHE_BASEDIR), but I've investigated that option further and it
was a dead end.

So, with nothing more to go on, I'm closing this as WORKSFORME. Pity, because
unreliable ccache is really painful.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
