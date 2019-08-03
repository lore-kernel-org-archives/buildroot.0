From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat,  3 Aug 2019 02:22:12 -0300
Subject: [Buildroot] [PATCH 0/4] new builtin kernel with entropy for the
 test infra
Message-ID: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This small series adds a new builtin kernel image to the test infra.
It contains the VirtIORNG driver so the target will have enough entropy at
startup, a requirement for more and more packages being tested.

It also uses this new builtin kernel to speed-up some test cases (atop,
syslog-ng, python-crossbar, python-nacl) and fix others (python-txtorcon,
python-treq).

The binaries I used can be found here [1] and have this version string:
>Linux version 4.19.16 (br-user at runner-ed2dce3a-project-3755559-concurrent-0) (gcc version 4.9.4 (Buildroot 2017.08-git-01078-g95b1dae)) #1 Fri Aug 2 23:05:09 UTC 2019

One can see a complete run of "-runtime-tests" before [2] and after [3] this
series in the URLs below.

In order to provide a v1 of this series, I created a naming convention for the
artifacts and also for the string passed to emulator.py in parameter "kernel".
It was the first naming that came to mind, so of course it is open to
suggestions/improvements.

[1] https://gitlab.com/RicardoMartincoski/buildroot/commit/2ed44c7471cf5db246b592e24e9b2cfd69702f0f
[2] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/74501223
[3] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/74516103

Regards,
Ricardo
---
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Ricardo Martincoski (4):
  support/testing: add builtin armv5 kernel 4.19 with entropy
  support/testing: test syslog-ng with builtin kernel
  support/testing: test python-* with builtin kernel
  support/testing: test atop with builtin kernel

 .../conf/syslog-ng-kernel-fragment.config     |  3 --
 support/testing/infra/emulator.py             | 10 ++++++
 support/testing/tests/package/test_atop.py    | 35 ++++++++++---------
 support/testing/tests/package/test_python.py  |  2 +-
 .../tests/package/test_python_crossbar.py     |  2 --
 .../tests/package/test_python_pynacl.py       |  4 ---
 .../testing/tests/package/test_syslog_ng.py   | 20 +++--------
 7 files changed, 33 insertions(+), 43 deletions(-)
 delete mode 100644 support/testing/conf/syslog-ng-kernel-fragment.config

-- 
2.17.1
