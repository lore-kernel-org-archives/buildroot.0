From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 23:01:55 +0200
Subject: [Buildroot] [PATCH 0/4] Fix march/mcpu conflict on ARM
Message-ID: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of four patches whose initial aim is to fix the numerous
reports of -mcpu/-march flag conflicts encountered by various users.

The issue is that in arch/Config.in.arm, we specify both a
BR2_GCC_TARGET_CPU value and a BR2_GCC_TARGET_ARCH value for each CPU
core we support. However, not all gcc versions agree on which -march
flag is appropriate for a given -mcpu flag, and then reports annoying
warnings at each file being compiled.

Also, gcc clearly states that passing -mcpu is enough:

  -mcpu=name

  This specifies the name of the target ARM processor. GCC uses this
  name to derive the name of the target ARM architecture (as if
  specified by -march) and the ARM processor type for which to tune
  for performance (as if specified by -mtune).

So there's actually no point in specifying both -mcpu and -march, so
this set of patches removes BR2_GCC_TARGET_ARCH to solve the issue.

Yann, I believe we could revert
2c1dc32647eb308126b0ae80a91988059d39aa7b ("toolchain/external: fix
wrapper by not passing conflicting flags") after merging this patch
series. Do you agree?

Thanks,

Thomas

Thomas Petazzoni (4):
  arch: remove BR2_arm920 reference
  arch: remove BR2_arm10t
  arch: do not distinguish revisions of ARM1136JF-S
  arch: remove BR2_GCC_TARGET_ARCH definitions on ARM

 arch/Config.in.arm | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

-- 
2.0.0
