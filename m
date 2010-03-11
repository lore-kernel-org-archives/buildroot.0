From: Craig Lawton-Devine <craig.lawtondevine@googlemail.com>
Date: Thu, 11 Mar 2010 16:55:24 +0000
Subject: [Buildroot] seg fault in pthread_exit only when dynamically
	built
In-Reply-To: <d51100e91003080312n6eac2148s435213aede83fa4a@mail.gmail.com>
References: <d51100e91003080312n6eac2148s435213aede83fa4a@mail.gmail.com>
Message-ID: <d51100e91003110855t2fe35808jaedba8c5bc16a9fb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I thought I'd provide a bit of an update.
I'm no nearer to finding the problem, but here's some more info.

I enabled pthread debug support, and debugging symbols in the
libraries and ran the app again, this provided quite a bit of debug
info.

What seems to happen is that the parent thread will periodically poll
for events relating to it's children.
When pthread_exit is called I can see something like:
29327 : __pthread_manager: before poll
Thread 56 completed
29383 : __pthread_do_exit: self=0xb85ffe20, pid=29383
29383 : __pthread_do_exit: joining = (nil), pid=0
29327 : __pthread_manager: after poll
29327 : pthread_reap_children:

However at the time of the crash execution seems to stop in
pthread_reap_children.
Looking at the source for pthread_reap_children, exit is called if any
child thread received a signal.
According to the core file the app exited with signal SEGFAULT, so it
seems correct that the app has stoped execution in
pthread_reap_children.

Without knowing the cause of the signal I seem to be stuck again though.

Craig
