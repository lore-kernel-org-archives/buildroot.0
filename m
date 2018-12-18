From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Dec 2018 01:39:40 +0000
Subject: [Buildroot] [Bug 11001] loopback interface not configure properly
 with ifupdown-scripts + standalone ifupdown + systemd
In-Reply-To: <bug-11001-163@https.bugs.busybox.net/>
References: <bug-11001-163@https.bugs.busybox.net/>
Message-ID: <bug-11001-163-dYQLEBS9Ej@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11001

--- Comment #1 from Trent Piepho <tpiepho@gmail.com> ---
There is another issue that we discovered with the way buildroot's
network.service works with systemd.

Systemd will bring the lo interface up itself early in the boot.  Later, when
network.service runs, it will remove the address from the lo interface, as part
of the ExecStart command in network.service to do exactly that.  At this point
lo no longer has an address.  Then network.service runs ifup -a and properly
configures lo.

There a window, after the address is removed from lo and before ifup runs,
where lo is not configured correctly.  Anything that expects lo to be
configured will fail to start correctly if it happens to hit this window when
it tries to, e.g., bind a socket to an address on the lo interface.

Since the systemd init design is that lo is already up, there are services that
do this and will randomly fail.  It's not necessary to be After network.target
in order to use loopback.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
