From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 01 Mar 2017 22:45:00 -0300
Subject: [Buildroot] [PATCH 0/5] Runtime testing infrastructure
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <58b7791cc5bc9_1c3714b27dc91758@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 07, 2017 at 09:35 AM, Thomas Petazzoni wrote:

> At last, here is a first version of a small runtime testing
> infrastructure for Buildroot. The first patch introduces the
> infrastructure itself, the other 4 patches just add a few patches.

Thank you very much for this series.

In overall, the infra works very well.

I tested it and I will reply to each patch.
Here is a summary of what I found:
1) emulator supports only arm, making test_iso9660 testcases to fail;
2) testcases using i386 emulated system can fail occasionally due to a message
   from the kernel;
3) the testcases *Internal from test_iso9660 expect the rootfs to be read-only,
   I am not sure this is correct or not, but it makes the tests fail and it is
   different from your previous iteration (before the stylistic rework);
4) output dir needs to be an absolute path;
5) there are some emulator.login("root") that I think should be .login()
   because BR2_TARGET_GENERIC_ROOT_PASSWD it not set, except for dropbear;
6) using "-q" with commands to the emulated system is unnecessary and make
   debug harder when a testcase fails;
7) the code is not compatible to python 3
   - print without parenthesis
   - exception handling using comma
   - importing urllib2 (split in libraries in python3)
   - probably will need .encode() and .decode() when using telnetlib because of
     the bytes vs. string introduced in python 3

This is what I think about this list:
(1) and (2) should be fixed;
(3) should be checked and fixed if it is not correct;
(4), (5) and (6) can wait;
(7) should *not* be fixed now, but in a followup patch (it can be postponed
    until 2020, when python 2 probably will retire);

>     ./support/testing/run-tests -d ~/dl/ -o ../outputs/ tests.fs.test_ubi.TestUbi

Using relative path for output dir seems to cause problems with few testcases,
as tests.core.test_post_scripts.TestPostScripts .

Regards,
Ricardo
