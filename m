From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 23:50:58 +0000
Subject: [Buildroot] [Bug 9531] NPM fails to build embedded modules
In-Reply-To: <bug-9531-163@https.bugs.busybox.net/>
References: <bug-9531-163@https.bugs.busybox.net/>
Message-ID: <bug-9531-163-WQbN0hopjc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

--- Comment #4 from bilge at scriptfusion.com ---
Further investigation reveals the culprit is the `-g` switch in the line,
`$(NPM) install -g $(NODEJS_MODULES_LIST)` in package/nodejs/nodejs.mk.

Removing the `-g` switch allows the module and all its dependencies, including
sqlite3, to build successfully. However, since they are now built in a
different location, they are not included in the rootfs which defeats the
purpose of building them!

My knowledge of Buildroot is too poor to know why an access denied violation
occurs with `-g` or how to include the modules in the rootfs when the `-g`
option is omitted, however I know the 2014.08 release of Buildroot did not rely
on `-g` and this is the last known release version I could get this module
working on.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
