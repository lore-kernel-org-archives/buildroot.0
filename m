From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 Sep 2017 16:55:43 +0000
Subject: [Buildroot] [Bug 10301] systemd/getty unused options
In-Reply-To: <bug-10301-163@https.bugs.busybox.net/>
References: <bug-10301-163@https.bugs.busybox.net/>
Message-ID: <bug-10301-163-s04tp6nb2d@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10301

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |ASSIGNED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Michael, All,

> In menuconfig I can set
> BR2_TARGET_GENERIC_GETTY_TERM
> BR2_TARGET_GENERIC_GETTY_OPTIONS
> but it is only used for busybox and sysvinit.
> So I guess this should be implemented or disabled when systemd is used.

Yes, true.

> Is there any technical reason why this is not implemented?

As far as I understand, systemd will automatically decide the value of
$TERM depending on the type of tty it is spawning on, see:
   
https://github.com/systemd/systemd/commit/ccf22d4a104e6ed2666d6c5b4031981a84787790#diff-6af423bac2f70681895dc996361e6022

Also, we use the getty services orvided by Systemd as-is; we do not
provide our own, so we rely on systemd's behaviour here.

Now, maybe you could try to add an "Environement=TERM=blabla" directive
in /lib/systemd/system/getty at .service and see if that works.

If that works, we can see to come up with a way to do it.

Similarly for the getty options...

In the meantime, the by-far simplest solutiokn is to hide the options
from the menuconfig when usign systemd! ;-)

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
