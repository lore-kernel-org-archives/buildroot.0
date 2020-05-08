From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 8 May 2020 15:40:25 +0300
Subject: [Buildroot] [PATCH] package/gcc9: Fix parallel build problem
 (xgcc not found)
In-Reply-To: <20200507215817.48d744be@windsurf.home>
References: <b60c5da0-cf8e-3f5b-d271-659345733aff@inbox.ru>
 <20200507215817.48d744be@windsurf.home>
Message-ID: <1d1703f1-65b3-a17a-c6aa-2d7be1647af3@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




07.05.2020 22:58, Thomas Petazzoni wrote:
 > On Thu, 7 May 2020 02:04:44 +0300
 > Maxim Kochetkov <fido_max@inbox.ru> wrote:
 >
 >> Some times gcc 9.2.0, 9.3.0 failed to build with a message: "xgcc: No
 >> such file or directory"
 >>
 >> When it fails, it's trying to execute selftests.
 >>
 >> So to fix this problem we can disable selftests.
 >>
 >> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
 >
 > Do you have more details about this failure? Does it happen in our
 > autobuilders? In which context?

Similar issue described here: 
https://github.com/cirosantilli/linux-kernel-module-cheat/issues/108

I don't know about your autobuilder.
In my config I use CCACHE for build (try 3.6, 3.7.9 with the same 
result). May be it affect some timings/delay in build sequence.

It fails for gcc-final (9.2 and 9.3):
/builds/kochetkov.m/buildroot/output/build/host-gcc-final-9.3.0/build/./gcc/xgcc 
-B/builds/kochetkov.m/buildroot/output/build/host-gcc-final-9.3.0/build/./gcc/ 
-xc -nostdinc /dev/null -S -o /dev/null 
-fself-test=../../gcc/testsuite/selftests
/bin/bash: 
/builds/kochetkov.m/buildroot/output/build/host-gcc-final-9.3.0/build/./gcc/xgcc: 
No such file or directory

gcc build systems is trying to test compiled executables (xgcc xg++ ....)

If I try to 'make' it again (without clean) - it passes.
If I use 'make clean' then 'make' (without cleaning ccache files) - it 
passes.

So this is parallel/dependency problem in gcc makefiles. I think make 
execute 'selftests' and 'xgcc' targets in parallel.

 >> diff --git a/package/gcc/9.3.0/0001-disable-selftest.patch
 >> b/package/gcc/9.3.0/0001-disable-selftest.patch
 >> new file mode 100644
 >> index 0000000000..d7150b0fb1
 >> --- /dev/null
 >> +++ b/package/gcc/9.3.0/0001-disable-selftest.patch
 >
 > We need all patches to have a description and a Signed-off-by line.
 > Also, they should ideally be upstreamable, which is not the case here.
 >
I will try.

 > Could you work on an improved version of this patch, with some more
 > extensive description, and hopefully a solution that can be accepted by
 > upstream gcc ?

I have no idea how to fix it in upstream gcc. I guess in buildroot is 
enough just to disable selftests for successful build.

 >
 > Best regards,
 >
 > Thomas
 >
