From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Sep 2019 23:49:20 -0300
Subject: [Buildroot] [PATCH] package/syslog-ng: bump version to 3.22.1
References: <CAJ4jsadMUQFSBu5qDYSYCT5sNJA_SrS9LUVE6qPRz_py4fH+Gg@mail.gmail.com>
Message-ID: <5d7ef830b2dea_2a453fc52817f46c666c@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Few more tests from my side, but no conclusion yet.

On Mon, Sep 09, 2019 at 10:46 AM, Carlos Santos wrote:

> On Mon, Sep 9, 2019 at 8:47 AM Chris Packham <judge.packham@gmail.com> wrote:
>>
>>
>>
>> On Mon, 9 Sep 2019 23:40 Carlos Santos, <unixmania@gmail.com> wrote:
>>>
>>> > > Hi Ricardo,
>>> > >
>>> > > I ran a test on a QEMU build with udev and noticed that syslog-g hangs
>>> > > on start-up. Using strace I found that it blocks on a getrandom()
>>> > > call, which seems to be make sense since the start-up order is
>>> > >
>>> > >     /etc/init.d/S01syslog-ng
>>> > >     /etc/init.d/S10udev
>>> > >     /etc/init.d/S20urandom

Thank you for your tests.

>>> >
>>> > I didn't have any particular reason for S01 other than that's what
>>> > rsyslog does. Moving it after urandom would be fine.

I tested renaming S01syslog-ng to S22syslog-ng but the issue still occurs.
[1] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290335678

I also run strace with the original script name [2] and after rename [3].
[2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290350949
[3] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290351179
The timeout the tests infra waits for the login prompt in those jobs is 10
minutes, then it prints '==> System does not boot' to the log file and fails.

In both cases the messages hang in a similar way:
[pid    48] 00:01:50 <... futex resumed>) = 0
[pid    48] 00:01:50 epoll_wait(3, [{EPOLLIN, {u32=160804, u64=1058090963334180}}], 9, -1) = 1
[pid    48] 00:02:29 read(19, "\1\0\0\0\0\0\0\0", 8) = 8
[pid    48] 00:02:29 clock_gettime(CLOCK_MONOTONIC, {tv_sec=149, tv_nsec=122924000}) = 0
[pid    48] 00:02:29 close(5)           = 0
[pid    48] 00:02:29 epoll_wait(3, 
Strace never prints the other parameters for the last epoll_wait call.

>>>
>>> S01 is the right place, since udevd uses syslog and starting syslog-ng
>>> later would prevent error messages from being saved in
>>> /var/logmessages.
>>>
>>> The correct solution is to configure the kernel with the random
>>> hardware support embedded, not as a module (e.g. HW_RANDOM=y ,
>>> CONFIG_VIRTIO_PCI=y  and HW_RANDOM_VIRTIO=y in
>>> board/qemu/arm-versatile/linux.config).

It should be already the case. Of course, maybe I missed something.
First the drivers were added [4] and the test run on gitlab-ci.
From one run, the binary kernel was saved and is now used by tests that select
the builtin kernel for armv5 [5], '-device virtio-rng-pci' is also passed to
qemu when this kernel image is used.
And finally the syslog-ng test was updated to use the builtin binary kernel [6].
[4] https://github.com/buildroot/buildroot/commit/450863097f588fe85d23e83cff14a75f1740d8fa
[5] https://github.com/buildroot/buildroot/commit/7acb32dabb80cc9f0dfc48f14e9bc86b3ef5df74
[6] https://github.com/buildroot/buildroot/commit/56e38a705e62a429576635b0a26cc4d3b3e88023

>>
>>
>> Still seems odd that this dependency exhists. Maybe there is an option to disable it.
> 
> The dependency is unavoidable. RHEL 8, for instance, which is a
> distribution with a well defined set of target environments has
> CONFIG_HW_RANDOM_VIRTIO=y in the kernel config file. On the other hand
> the linux.config files provided by Buildroot are generic and can not
> match all possible configurations.

Indeed, but I used a defconfig fragment to add them for this runtime test.


I also tested changing the version of syslog-ng:
2.19.1 OK
2.20.1 OK
2.21.1 FAIL
2.23.1 FAIL
So the next bump will not fix the runtime test.

I looked the diff between syslog-ng-3.19.1 and syslog-ng-3.20.1 but I was unable
to find some obvious problem or change in behavior.


In the lack of better ideas I also tested using another libc:
| class TestSyslogNg(infra.basetest.BRTest):
|-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
|+    config = \
|         """
|+        BR2_arm=y
|+        BR2_TOOLCHAIN_EXTERNAL=y
The same runtime issue occurs.


Regards,
Ricardo
