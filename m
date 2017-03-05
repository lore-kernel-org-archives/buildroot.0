From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 Mar 2017 15:34:52 +0000
Subject: [Buildroot] [Bug 9531] NPM fails to build embedded modules
In-Reply-To: <bug-9531-163@https.bugs.busybox.net/>
References: <bug-9531-163@https.bugs.busybox.net/>
Message-ID: <bug-9531-163-Z4u4yNblFP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

--- Comment #13 from Martin <martin@barkynet.com> ---
I tested this and setting BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="ghost at 0.11.3"
builds fine when building as a non-root user.

What is happening here is npm is dropping it's root privileges before running
node-pre-gyp which is why you see "node-pre-gyp: Permission denied" because it
can't access the files under /root.  --unsafe-perm stops this behaviour which
is why it then works.

I agree with Peter, building as root should be avoided.  I would recommend you
modify your Dockerfile to build as a non-root user.

The one change which might be worth making is a recommendation against building
as root in the manual and/or the Makefile.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
