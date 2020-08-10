From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Aug 2020 21:24:58 +0000
Subject: [Buildroot] [Bug 13146] raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
In-Reply-To: <bug-13146-163@https.bugs.busybox.net/>
References: <bug-13146-163@https.bugs.busybox.net/>
Message-ID: <bug-13146-163-Bb6AJUM5t8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Does not happen here (openSUSE Tumbleweed, ext4 filesystem), which filesystem
do you use?

The fiemap feature was introduces lately in genimage (see [1]), and there is a
fallback in case the fiemap ioctl fails (see [2]):

        /* If failure is due to no filesystem support, return a single extent
*/
        if (ret == -EOPNOTSUPP)
                return whole_file_exent(size, extents, extent_count);

You can try to extend this check for ENOTTY (25) like the following:

        if (ret == -EOPNOTSUPP || ret == -ENOTTY)

or more correct (as 'ret = -errno;' some lines above):

        if (ret == EOPNOTSUPP || ret == ENOTTY)

and/or fallback to an earlier version of genimage in buildroot
by reverting the latest version bump commit [3]...

[1]
https://github.com/pengutronix/genimage/commit/1b98d6fadfca76cc0202a2df3debc67a8fe0ee1a
[2] https://github.com/pengutronix/genimage/blob/master/util.c#L390
[3]
https://git.buildroot.net/buildroot/commit/?id=677b0d9f574e2860cd22cb36022e5c059b4e6af5

-- 
You are receiving this mail because:
You are on the CC list for the bug.
