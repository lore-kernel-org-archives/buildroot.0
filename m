From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Sep 2018 01:47:25 +0000
Subject: [Buildroot] [Bug 11366] [2018.08] SysV IPC not available for
 fakeroot on WSL
In-Reply-To: <bug-11366-163@https.bugs.busybox.net/>
References: <bug-11366-163@https.bugs.busybox.net/>
Message-ID: <bug-11366-163-paDpVaPaE1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11366

--- Comment #3 from J.F. <jfdoyon@gmail.com> ---
findings so far:

OK, so WSL does have some SysV IPC, but no message Q's, which is the feature
needed by fakeroot/faked by default.

The cleanest way to test this appears to be to use the ipcmk utility provided
by the host util-linux package ... only if the user selects the host util
package in his config however.  If ipcmk -Q returns 1, use TCP.

Also, the fakeroot package builds sysv OR tcp. In order to support both, you
run 2 builds, presumably configured as two packages. Ideally, you would build
only one, based on the availability opf message Qs, if at all possible.

So one option is to force the host-util-linux package with most programs (force
the relevant BR2 option on, or mor eprecisely, remove the option and always
have it on), and then re-package 2 fakeroots and then use ipcmk at run time to
select the right fakeroot.

Another might be to simply give users the ability to select "TCP Fakeroot" in
their config via a BR2 variable. Since this is an edge case, it seems it might
be simpler to just do it that way, not unlike the way the host OpenSSL and
libelf requirements exist for the kernel.

Since this dependency is on a kernel system call, there's no clean way to
simply patch the existing fakeroot package and configure script ONLY, as Thomas
suggested. Maybe I could patch the configure script to use ipcmk however ... ?
I know *nothing* about how to work with autoconf however :P Because normally
you would build this tool as part of a distro on a separate host, dynamic
detection of IPC Message Q's would be of limited value "upstream" to the
fakeroot developers anyways ...

I think i would tend towards providing a user selectable config for "TCP
fakeroot" as a my favourite solution.

Thoughts?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
