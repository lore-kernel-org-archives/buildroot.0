From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 10 Jun 2016 15:55:30 +0200
Subject: [Buildroot] pjsip parallel build failures
Message-ID: <575AC6D2.4000101@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear pjsip developers,

I have experienced some failures building pjsip, possibly related tp
parallel builds.

The Buildroot embedded Linux build system [0] includes a recipe for PJ
project [1], currently at version 2.4.5. The build failures I
experienced happened on the Buildroot autobuilder machines [2] [3], that
continuously run Buildroot builds based on random configurations.

Between March 17 and May 12 there have been 13 build failures, most
ending with the error message:

  <...>ld: cannot find -lpjsua

Here are the logs for some of such failures: [4] [5] [6] [7]. Click on
the build-end.log link to view the build log.

This error is happening irregularly. I tried to reproduce several of the
mentioned configurations on my machine but I was never able to
experience the failure.

The error message suspiciously looks like a parallel build issue, i.e.
happening when calling 'make -j<N>' to speed up the build on multicore
machines. So on May 12 I submitted a patch to disable parallel build
[8]. It's about 1 month since the patch was applied and there have been
no more pjsip build failures.

That said, I strongly suspect the pjsip makefiles have some bug that
prevents parallel build from working. Is it possible?

I compared the code of pjsip 2.4.5 with the latest release, 2.5.1, and
it doesn't seem like there is a fix for this issue.

Can this problem be fixed somehow, or can you suggest another solution?

BTW, do you ever use parallel build during development, continuous
integration or anything else?

[0] https://buildroot.org/
[1] https://git.buildroot.net/buildroot/tree/package/libpjsip
[2]
http://nightly.buildroot.org/manual.html#_analyzing_and_fixing_autobuild_failures
[3] http://autobuild.buildroot.org/
[4]
http://autobuild.buildroot.org/results/d6b/d6bff569bc9238cdf07970e11b5535d570be59bf
[5]
http://autobuild.buildroot.org/results/f72/f721d5390bc61274c224bfe3a675ee194172ac91
[6]
http://autobuild.buildroot.org/results/b45/b45262971a7d7ce0604d124734223abca190c11e
[7]
http://autobuild.buildroot.org/results/75e/75ee45b746ab8b80eb84297e2e4babbace1b5608
[8] http://lists.busybox.net/pipermail/buildroot/2016-May/160995.html


Thanks,
-- 
Luca
