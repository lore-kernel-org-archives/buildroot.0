From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Sep 2010 19:40:24 +0200
Subject: [Buildroot] [PATCH 4/4] Add network scripting folders to
 fs/skeleton
In-Reply-To: <4C9C55C5.907@visionsystems.de>
References: <4C9C54A9.20803@visionsystems.de>
	<4C9C54FC.4040609@visionsystems.de>
	<4C9C553E.8040105@visionsystems.de>
	<4C9C558A.7050009@visionsystems.de> <4C9C55C5.907@visionsystems.de>
Message-ID: <20100928194024.2ccf72e8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Sep 2010 09:39:49 +0200
Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:

> Those folders by device_table.txt. If using the dynamic device creation method
> these folders will be missing.

"Those folders are currently created by device_table.txt"...

Ok on the principle, but if those directories are now part of the
skeleton, they should be removed from the device_table.txt file.

However, looking at device_table.txt, I also see that it does a few
things not related to device files :

/dev            d       755     0       0       -       -       -       -       -
/dev/pts        d       755     0       0       -       -       -       -       -
/dev/shm        d       755     0       0       -       -       -       -       -
/tmp            d       1777    0       0       -       -       -       -       -
/etc            d       755     0       0       -       -       -       -       -
/home/default   d       2755    1000    1000    -       -       -       -       -
#<name>                                 <type>  <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
/bin/busybox                            f       4755    0       0       -       -       -       -       -
/etc/shadow                             f       600     0       0       -       -       -       -       -
/etc/passwd                             f       644     0       0       -       -       -       -       -
/etc/network/if-up.d                    d       755     0       0       -       -       -       -       -
/etc/network/if-pre-up.d                d       755     0       0       -       -       -       -       -
/etc/network/if-down.d                  d       755     0       0       -       -       -       -       -
/etc/network/if-post-down.d             d       755     0       0       -       -       -       -       -
/usr/share/udhcpc/default.script        f       755     0       0	-       -       -       -       -

For each of those lines, what will replace the usage of the device
table ? For things like proper access rights
for /etc/shadow, /etc/passwd, setuid for Busybox binary, proper flags
for /tmp, maybe we have no other choices than using a device table.

In that case, we could use a split device table :

 * One used in all cases

 * One used only in the static device case. Buildroot would concatenate
   this one to the previous one before doing the root filesystem generation.

Thoughts ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
