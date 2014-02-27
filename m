From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Feb 2014 12:32:52 +0000 (UTC)
Subject: [Buildroot] [Bug 6938] mkuser script generates wrong password for
 new user in target/etc/shadow
In-Reply-To: <bug-6938-163@https.bugs.busybox.net/>
References: <bug-6938-163@https.bugs.busybox.net/>
Message-ID: <20140227123252.96CA29BB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6938

--- Comment #2 from Pavel Kucera <poli@centrum.cz> 2014-02-27 12:32:52 UTC ---
OK, I'll describe it in more verbose way, but the few line diff I've posted
before does the trick.

1) What is the problem with generated password
Original mkusers generates next line in target/etc/shadow
nguser:nguser:::::::

Modified generates this line which works good
nguser:$1$Fmk.0Eps$q/41A9m1kv7ECQcV6QJCl0:::::::

2) How am I using script
I'm using script by calling 'make' in buildroot_2013.11 directory.
I added custom package with this line in its makefile (newg.mk)
NEWG_USERS = nguser -1 nguser -1 nguser /home/nguser /bin/sh video,dialout Ng
user

3) Which password method
md5

4)
NA

I've found, that in mkusers there is a function encode_password, which is never
called and there is call of encode_passwd which isn't present, so it's just a
typo. And later in mkusers there is a switch with case '*)' which doesn't call
encode password and provide password to be placed in target/etc/shadow in plain
text, as well as the problem reported in paragraph 1)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
