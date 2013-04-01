From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  1 Apr 2013 23:23:34 +0000 (UTC)
Subject: [Buildroot] [Bug 4538] main() not exited normally then using
	pthreads
In-Reply-To: <bug-4538-163@https.bugs.busybox.net/>
References: <bug-4538-163@https.bugs.busybox.net/>
Message-ID: <20130401232335.011709B405@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4538

--- Comment #5 from Michael J. Wang <mjwang@broadcom.com> 2013-04-01 23:24:18 UTC ---
We see this problem as well on the MIPS architecture with uClibc 0.9.32 (old
stable pthreads).

I managed to trace it down a bit more and it seems like the
pthread_onexit_process function is called twice.  The first time it is called,
everything works as designed: main thread sends the REQ_PROCESS_EXIT message to
the manager thread, and the manager thread sends the RESTART signal (32) to the
main thread, and the main thread wakes up from its sigsuspend and collects the
manager.  But from my kernel tracing, I see that the main thread sends the same
REQ_PROCESS_EXIT to the manager thread again and blocks in sigsuspend.  This
time, there is no manager thread to send the restart signal, so the main thread
hangs in sigsuspend and cannot exit.

We do not see this behavior in uClibc 0.9.29, which was the previous version
that we were using.

The simple fix/workaround to this problem is to add the following line in
pthread_onexit_process after waitpid(__pthread_manager_thread.p_pid, NULL,
__WCLONE);

__pthread_manager_request = -1;

But that does not address the root issue of why the pthread_onexit_process
function is called twice.

Michael

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
