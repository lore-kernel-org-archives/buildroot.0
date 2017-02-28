From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Feb 2017 19:18:04 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-smDgSxlGNC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #8 from paulstewartis at gmail.com <paulstewartis@gmail.com> ---
(In reply to Thomas Petazzoni from comment #5)

Hello is Paul__ from the irc channel.

The issue is not resolved for me with 2017.02-rc3.  It is still reporting the
errors.  Because the problem occurs with the first line, my workaround is to
add a dummy user before the real users.  My user table looks like this:

dummy -1 users -1 * - - - Dummy user for mkusers script bug
paul 1000 users 100 =mypassword /home/paul /bin/sh ssh-user
git 1001 users 100 =gitpassword /home/git /usr/bin/git-shell ssh-user

If you remove the first line, it will not create the paul user.  The passwd
file will include the standard users followed by my git user and sshd (because
the openssh package is included in my buildroot .config).

This is what it looks like if you omit the dummy line above:

root:x:0:0:root:/root:/bin/sh
daemon:x:1:1:daemon:/usr/sbin:/bin/false
bin:x:2:2:bin:/bin:/bin/false
sys:x:3:3:sys:/dev:/bin/false
sync:x:4:100:sync:/bin:/bin/sync
mail:x:8:8:mail:/var/spool/mail:/bin/false
www-data:x:33:33:www-data:/var/www:/bin/false
operator:x:37:37:Operator:/var:/bin/false
nobody:x:65534:65534:nobody:/home:/bin/false
git:x:1001:100::/home/git:/usr/bin/git-shell
sshd:x:1000:1000:SSH drop priv user:/:/bin/false

-- 
You are receiving this mail because:
You are on the CC list for the bug.
