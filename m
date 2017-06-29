From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 28 Jun 2017 23:45:40 -0300
Subject: [Buildroot] [PATCH 0/9] support/testing: run tests in parallel
Message-ID: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series unleashes the power of nose2 to run testcases simultaneously.

Patches 1 to 5 gradually change the emulator from using subprocess + telnetlib
+ 'qemu -serial telnet' to use pexpect + 'qemu -serial stdio'. They allow to
run testcases in parallel without random failures caused by two emulators trying
to use the same telnet port (1234).

Patch 6 fixes 2 remaining code style issues in the same file.

Patch 7 adds option -j to run-tests to configure the BR2_JLEVEL used when
building stuff for the testcases. This parameter defaults to Buildroot default 0
that means to use cpu_count + 1. It can be used i.e. to run the tests in
background with 1 core while using the other cores from the host computer for
other work.

Patch 8 adds option -t to run-tests to configure the number of testcases to run
in parallel (default=1). When -j is not used, -t calculates it to split the
available cores between the simultaneous testcases. But the user can override
this auto calculated value.

Patch 9 makes one last change to emulator to allow many instances to run in
parallel.

Actually patches 1 to 6 and also patch 9 could all be squashed in a (not so big)
patch "Improve emulator using pexpect+stdio" but in separate patches I hope the
review and testing become easier. Anyway, I can squash them easily and resend.

This series was tested using Ubuntu 16.04.2 in a computer with 4 cores and
following package versions:
Python 2.7.12
nose2 0.6.4-1
QEMU emulator version 2.5.0

Regards,
Ricardo


Ricardo Martincoski (9):
  support/testing: use pexpect in emulator
  support/testing: use qemu stdio in emulator
  support/testing: let pexpect write stdout to log
  support/testing: use pexpect.sendline directly
  support/testing: use pexpect.expect directly
  support/testing: fix code style in emulator
  support/testing: allow to set BR2_JLEVEL
  support/testing: run testcases in parallel
  support/testing: large timeout for login prompt

 support/testing/conf/unittest.cfg |  1 -
 support/testing/infra/basetest.py |  6 +++-
 support/testing/infra/emulator.py | 71 ++++++++++++++-------------------------
 support/testing/run-tests         | 28 +++++++++++++++
 4 files changed, 59 insertions(+), 47 deletions(-)

-- 
2.11.0
