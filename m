From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 14 Dec 2015 05:37:42 +0000
Subject: [Buildroot] [Bug 8516] mkcubiecard.sh uses outdated sfdisk switch -D
In-Reply-To: <bug-8516-163@https.bugs.busybox.net/>
References: <bug-8516-163@https.bugs.busybox.net/>
Message-ID: <bug-8516-163-Tx4321OLsV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8516

--- Comment #1 from Tudor <tudor@tudorholton.com> ---
According to the linux-sunxi wiki at
http://linux-sunxi.org/Bootable_SD_card#Partitioning , the correct process is:

sfdisk -R ${card}
cat <<EOT | sfdisk --in-order -L -uM ${card}
1,16,c
,,L
EOT


This makes more sense, since we're explicitly specifying units.  I've tested
the above and it works correctly.

Alternatively, for a fully ext boot partition:

sfdisk -R ${card}
cat <<EOT | sfdisk -L --in-order -uM ${card}
1,,L
EOT

...and then copy uImage and script.bin to /boot on the ext partition...but
that's considered experimental.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
