From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 May 2012 15:42:05 +0200
Subject: [Buildroot] Console login root needing a password
In-Reply-To: <4FA27B9B.3080108@peavey-eu.com>
References: <CAG6aBkVA-XPByuGaxUdKQAfGrMq_X_DhVdWOfA2Zh+mUt2jq-w@mail.gmail.com>
 <4FA2298E.5000807@visionsystems.de>
 <CAG6aBkWE0X1fm9LatHE9V+c_kvqvpkYkxZzE+xzEiVcgX6LGwA@mail.gmail.com>
 <4FA27B9B.3080108@peavey-eu.com>
Message-ID: <20120503154205.483441b5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 03 May 2012 13:35:39 +0100,
Graham Newton <gnewton@peavey-eu.com> a ?crit :

> I recently had this issue when I directly mounted the buildroot 
> generated filesystem via NFS.  After a frustrating day I discovered
> that the suid bit had be set on the busybox executable.  So when
> login was run busybox ran as an unknown user (not root) and so failed
> causing the login to fail.  The fix was to run chmod -s busybox on
> the NFS server. What was baffeling was that the issue went away if I
> copied the filesystem somewhere else.
> In the course of my investigations I found I could login if I tried 
> Yegor's solution but it did not give me root access.

Busybox is normally installed inside the target filesystem image with
the suid bit set. From package/busybox/busybox.mk:

define BUSYBOX_PERMISSIONS
/bin/busybox                     f 4755 0 0 - - - - -
/usr/share/udhcpc/default.script f 755  0 0 - - - - -
endef

Are you sure:

 * You extracted output/images/rootfs.tar as root, and didn't use
   output/target for your NFS export? If you did the latter, then of
   course all permissions would be wrong, because output/target is
   created by Buildroot, which doesn't run as root and therefore can't
   set any special permission.

 * You configured your NFS export with no_root_squash?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
