From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Mar 2017 09:07:51 +0100
Subject: [Buildroot] [PATCH v3 1/5] support/testing: core testing
	infrastructure
In-Reply-To: <58d33ac6e1494_71523fd706b87604408fc@ultri3.mail>
References: <1490042214-6762-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <58d33ac6e1494_71523fd706b87604408fc@ultri3.mail>
Message-ID: <20170323090751.68c281d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 00:02:30 -0300, Ricardo Martincoski wrote:

> 1) If I increase the value of processes in unittest.cfg to unleash the power of
> nose2, emulator fails sporadically because telnet port is fixed.

Yes, this is a known problem, and there's a TODO about this in
emulator.py:

# TODO: Most of the telnet stuff need to be replaced by stdio/pexpect to discuss
# with the qemu machine.

> 2) If I do this (not restricted to these testcases) ...
> 
> for i in $(seq 100); do \
> support/testing/run-tests -d dl1 -o output -k tests.package || break ; done
> 
> ... while performing other resource-consuming tasks on my PC, such as starting
> an unrelated build that uses all the cores, I eventually get this:
> 
> ERROR: test_run (tests.package.test_dropbear.TestDropbear)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/tmp/testing-v3/support/testing/tests/package/test_dropbear.py", line 22, in test_run
>     self.emulator.login("testpwd")
>   File "/tmp/testing-v3/support/testing/infra/emulator.py", line 101, in login
>     self.__read_until("buildroot login:", 10)
>   File "/tmp/testing-v3/support/testing/infra/emulator.py", line 89, in __read_until
>     data = self.__tn.read_until(waitstr, timeout)
>   File "/usr/lib/python2.7/telnetlib.py", line 294, in read_until
>     return self._read_until_with_poll(match, timeout)
>   File "/usr/lib/python2.7/telnetlib.py", line 329, in _read_until_with_poll
>     self.fill_rawq()
>   File "/usr/lib/python2.7/telnetlib.py", line 576, in fill_rawq
>     buf = self.sock.recv(50)
> error: [Errno 104] Connection reset by peer

Hum, do you know why this one happens? I definitely understand that
will a qemu is running, another qemu cannot bind its telnet server on
the same TCP port, but I don't see why it would cause a "Connection
reset by peer".

Or is the logic of the test bogus, and if it doesn't manage to start
qemu, the test still continues, and it in fact connects to an already
running qemu instance from a different test, which then gets killed in
the middle ?

> Something like this patch could fix those:

It would probably be nicer to interact through stdio and pexpect, but
in the mean time, this does the job. I'll integrate that into my
series. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
