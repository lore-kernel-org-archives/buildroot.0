From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 25 Feb 2018 15:57:27 +0000
Subject: [Buildroot] [Bug 10806] Allow nfs-utils to use ipv6
In-Reply-To: <bug-10806-163@https.bugs.busybox.net/>
References: <bug-10806-163@https.bugs.busybox.net/>
Message-ID: <bug-10806-163-CQDrNER8lh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10806

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
We decided a few years ago to no longer make ipv6 support in packages optional,
i.e. always assume it is there. Note that even if the kernel is built without
IPv6 support, it is possible to run executables in it that are built with IPv6
support - but obviously no IPv6 connection will ever be made.

So you can just unconditionally enable IPv6 support in nfs-utils. Except,
apparently, nfs-utils requires libtirpc for IPv6 support, as witnessed by this
commit:

commit e23be36ab3a110787917db59618d9f5280457938
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Wed Apr 25 22:29:34 2012

    nfs-utils: fix build with ipv6 after 2a10c9 (pass --enable-ipv6 to
autotargets configure)

    IPv6 support needs the TIRPC library, which we don't have in Buildroot, so
    forcibly disable IPv6 support.


Now, that's a commit from 6 years ago, so the situation may have changed.
Therefore, please try if it is possible to build and run nfs-utils *without*
libtirpc and *with* --enable-ipv6. If that works, just enable ipv6
unconditionally. If it doesn't work, add the --enable/disable-ipv6 to the
existing libtirpc condition in nfs-utils.mk. In that case, please also make a
note in the commit message that native RPC is being deprecated so libtirpc (and
therefore IPv6) will be enabled unconditionally in the future.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
