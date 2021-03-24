From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Mar 2021 11:35:40 +0000
Subject: [Buildroot] [Bug 13671] openSSH server closes connection before
 authentication is finished
In-Reply-To: <bug-13671-163@https.bugs.busybox.net/>
References: <bug-13671-163@https.bugs.busybox.net/>
Message-ID: <bug-13671-163-vdKhb6KtRg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

--- Comment #7 from Geert Lens <g.lens@livetech-systems.com> ---
When I use the Arm ARM 2020.11 toolchain (GCC 10.2, GDB 10.1, glibc 2.31,
Binutils 2.35.1) to build 2021.02, the OpenSSH is being killed when trying to
login.
I made a strace using that setup and got this:

[pid 14957] write(2, "debug3: mm_request_send entering"..., 52 <unfinished ...>
[pid 15027] write(7, "\0\0\0/\0\0\0\6\0\0\0'input_userauth_reque"..., 51
<unfinished ...>
[pid 14957] <... write resumed>)        = 52
[pid 15027] <... write resumed>)        = 51
[pid 14957] poll([{fd=5, events=POLLIN}, {fd=6, events=POLLIN}], 2, -1
<unfinished ...>
[pid 15027] write(7, "\0\0\08\0\0\0\7\0\0\0000user_specific_delay:"..., 60
<unfinished ...>
[pid 14957] <... poll resumed>)         = 2 ([{fd=5, revents=POLLIN}, {fd=6,
revents=POLLIN}])
[pid 15027] <... write resumed>)        = 60
[pid 14957] read(6,  <unfinished ...>
[pid 15027] clock_gettime(CLOCK_BOOTTIME,  <unfinished ...>
[pid 14957] <... read resumed>"\0\0\0/", 4) = 4
[pid 15027] <... clock_gettime resumed>{tv_sec=3303, tv_nsec=218403125}) = 0
[pid 14957] read(6,  <unfinished ...>
[pid 15027] write(7, "\0\0\0[\0\0\0\7\0\0\0Sensure_minimum_time_"..., 95
<unfinished ...>
[pid 14957] <... read resumed>"\0\0\0\6\0\0\0'input_userauth_request: "..., 47)
= 47
[pid 15027] <... write resumed>)        = 95
[pid 14957] write(2, "debug2: input_userauth_request: "..., 59 <unfinished ...>
[pid 15027] clock_nanosleep_time64(CLOCK_REALTIME, 0, {tv_sec=0,
tv_nsec=24392751410935043},  <unfinished ...>
[pid 14957] <... write resumed>)        = 59
[pid 15027] <... clock_nanosleep_time64 resumed> <unfinished ...>) = ?
[pid 14957] poll([{fd=5, events=POLLIN}, {fd=6, events=POLLIN}], 2, -1
<unfinished ...>
[pid 15027] +++ killed by SIGSYS +++
<... poll resumed>)                     = 2 ([{fd=5, revents=POLLIN}, {fd=6,
revents=POLLIN}])
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_KILLED, si_pid=15027, si_uid=1001,
si_status=SIGSYS, si_utime=8, si_stime=4} ---

It looks similar to what you could reproduce, the only difference is that the
call to clock_nanosleep_time64() is aborted with SIGSYS.

When I use the Arm ARM 2019.2 toolchain (GCC 9.2.1, GDB 8.3.0, glibc 2.30,
Binutils 2.33.1) to build 2021.02, OpenSSH is not being killed and I am able to
login in.
Do you have any idea what could cause this?

Furthermore, I am using the Linux kernel v4.14.78 in my project.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
