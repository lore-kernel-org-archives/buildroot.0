From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 May 2018 21:29:53 +0000
Subject: [Buildroot] [Bug 11036] C compiler cannot create executables
In-Reply-To: <bug-11036-163@https.bugs.busybox.net/>
References: <bug-11036-163@https.bugs.busybox.net/>
Message-ID: <bug-11036-163-UsjVhxLTb3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11036

--- Comment #4 from Arnout Vandecappelle <arnout@mind.be> ---
I suspect the problem must be in the external. The key is that config.log
contains:

CFLAGS='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os 
-c -Wall -O2 -c -Wall -O2'

The -Os is from TARGET_OPTIMIZATION, then there is an empty TARGET_DEBUGGING,
but the "-c -Wall -O2 -c -Wall -O2" is what causes the problem. Indeed, because
of the -c, a conftest.o is generated while configure checks for a.out and
conftest.exe etc.

So Bert, please check why TARGET_CFLAGS is modified (and if this is indeed the
issue).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
