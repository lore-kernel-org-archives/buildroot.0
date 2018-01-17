From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Jan 2018 22:44:17 +0000
Subject: [Buildroot] [Bug 10536] Finding non-relative paths in the ccache
In-Reply-To: <bug-10536-163@https.bugs.busybox.net/>
References: <bug-10536-163@https.bugs.busybox.net/>
Message-ID: <bug-10536-163-qrJg8hDa2M@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10536

--- Comment #4 from Arnout Vandecappelle <arnout@mind.be> ---
Does the build really fail in that second example? Since the first/ directory
is in the command-line arguments during the build and it doesn't match
BR2_CCACHE_DIR, ccache should just treat it as a cache miss. So indeed, ccache
doesn't work for host packages unless the output directory is the same.

We could actually easily export CCACHE_BASEDIR from make, so that it works also
for host packages. We could perhaps even remove it from the toolchain wrapper
then, though it's probably convenient that the same basedir is used when
building outside of Buildroot.

That said, this problem will still exist when a BR2_HOST_DIR is specified that
points outside of the output directory. In that case we'd need two different
'base directories', which is obviously not possible...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
