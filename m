From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 15:25:43 +0200
Subject: [Buildroot] TestFileCapabilities is broken
Message-ID: <20181014152543.2cf6c0b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The TestFileCapabilities test of our test suite is failing, with:

======================================================================
FAIL: test_run (tests.core.test_file_capabilities.TestFileCapabilities)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/support/testing/tests/core/test_file_capabilities.py", line 44, in test_run
    self.assertIn("cap_kill", output[0])
AssertionError: 'cap_kill' not found in '/usr/sbin/getcap'

I did a local build, and I can reproduce the issue. What we do is we
run "getcap -v /usr/sbin/getcap" on the target, and it returns just:

# getcap -v /usr/sbin/getcap 
/usr/sbin/getcap

And not any of the extended attributes that getcap is supposed to have.
I had a quick look, and makedevs gets run with a correct device table
when generating the common tarball. I don't know when extended
attributes are lost.

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
