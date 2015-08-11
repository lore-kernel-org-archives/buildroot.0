From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2015 22:43:00 +0000 (UTC)
Subject: [Buildroot] [Bug 8276] package/dropbear: symlink resolution
	incorrect
In-Reply-To: <bug-8276-163@https.bugs.busybox.net/>
References: <bug-8276-163@https.bugs.busybox.net/>
Message-ID: <20150811224300.99C757FDC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8276

--- Comment #3 from nospam+busybox at jtang.org 2015-08-11 22:43:00 UTC ---
I investigated this further, and it may be a difference between Busybox/uClibc
and coreutils/glibc. If the target of the symlink does not exist, in coreutils
"readlink -f" will display as much as possible. In Busybox, "readlink -f" will
result in an error, specifically ENOENT.

Test case:

ln -s /tmp/no_such_file /tmp/some_symlink


On my Debian desktop:

 $ readlink /tmp/some_symlink 
 /tmp/no_such_file
 $ readlink -f /tmp/some_symlink 
 /tmp/no_such_file


On my Raspberry Pi:

 # readlink /tmp/some_symlink
 /tmp/no_such_file
 # readlink -f /tmp/some_symlink 
 # touch /tmp/no_such_file
 # readlink -f /tmp/some_symlink 
 /tmp/no_such_file

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
