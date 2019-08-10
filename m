From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Aug 2019 15:52:16 +0200
Subject: [Buildroot] Various runtime test failures on Gitlab CI
In-Reply-To: <20190810151945.5ed664ea@windsurf.home>
References: <20190810151945.5ed664ea@windsurf.home>
Message-ID: <20190810135216.GI21314@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-08-10 15:19 +0200, Thomas Petazzoni spake thusly:
> The last Gitlab CI pipeline on master
> (https://gitlab.com/buildroot.org/buildroot/pipelines/75533041/failures)
> shows a number of failures in our runtime tests.
[--SNIP--]
>  - For tests.init.test_systemd.TestInitSystemSystemdRwFull, we're
>    getting:
> 
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/support/testing/tests/init/test_systemd.py", line 157, in test_run
>     self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
>   File "/builds/buildroot.org/buildroot/support/testing/tests/init/base.py", line 38, in start_emulator
>     self.emulator.login()
>   File "/builds/buildroot.org/buildroot/support/testing/infra/emulator.py", line 92, in login
>     raise SystemError("System does not boot")
> SystemError: System does not boot

This one works OK here:

    $ ./support/testing/run-tests -o $(pwd)/runtests -k
    tests.init.test_systemd.TestInitSystemSystemdRwFull
    15:25:25 TestInitSystemSystemdRwFull              Starting
    15:25:26 TestInitSystemSystemdRwFull              Building
    15:37:55 TestInitSystemSystemdRwFull              Building done
    15:38:34 TestInitSystemSystemdRwFull              Cleaning up
    .
    ----------------------------------------------------------------------
    Ran 1 test in 788.838s

    OK

Excerpt of the run log:

    10009000.uart: ttyAMA0 at MMIO 0x10009000 (irq = 38, base_baud = 0) is a PL011 rev1
    console [ttyAMA0] enabled
    [...]
    [   ***] (2 of 2) A start job is running for /dev/ttyAMA0 (16s / 1min 31s)
    [...]
    [  OK  ] Found device /dev/ttyAMA0.
    [  OK  ] Started Serial Getty on ttyAMA0.

while the one on gitlab fails to find the serial:

    10009000.uart: ttyAMA0 at MMIO 0x10009000 (irq = 38, base_baud = 0) is a PL011 rev1
    console [ttyAMA0] enabled
    [...]
    [    **] (1 of 2) A start job is running for /dev/ttyAMA0 (1min 28s / 1min 30s)
    [...]
    [ TIME ] Timed out waiting for device /dev/ttyAMA0.
    [DEPEND] Dependency failed for Serial Getty on ttyAMA0.

So, it looks like on my machine, it took abouts 16s for the ttyAMA0
systemd slice to be up (wft? 16s?), while on the gitlab-ci it was not
found...

I'll investigate what makes it appear so late...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
