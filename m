From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 20 Mar 2015 01:50:22 +0300
Subject: [Buildroot] [PATCH v1] postgresql: fix xtensa pthread linking
	flags
In-Reply-To: <CAMo8BfJAA22Z-pHfKRPh6Xuqst4WekCvDPEGhcsocT8YEmBnVA@mail.gmail.com>
References: <1426800588-28574-1-git-send-email-ps.report@gmx.net>
 <CAMo8BfJAA22Z-pHfKRPh6Xuqst4WekCvDPEGhcsocT8YEmBnVA@mail.gmail.com>
Message-ID: <CAMo8BfL8zO6eCvJpJAVSzZsqR-0riL_88L2aU_2yd63YkyWPyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 20, 2015 at 12:42 AM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Fri, Mar 20, 2015 at 12:29 AM, Peter Seiderer <ps.report@gmx.net> wrote:
>> Caused by pthread flags autodetection failure while configure (from config.log):
>> configure:12436: checking whether pthreads work with -pthread
>> configure:12521: host/usr/bin/xtensa-linux-gcc -o conftest -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals  -Os   -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE    conftest.c   -lssl -lcrypto -lz -lrt -lcrypt -ldl -lm  >&5
>> conftest.c: In function 'main':
>> conftest.c:140:27: warning: 'th' is used uninitialized in this function [-Wuninitialized]
>>  pthread_t th; pthread_join(th, 0);
>>                            ^
>> host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.so: warning: gethostbyname is obsolescent, use getnameinfo() instead.
>> configure:12521: $? = 0
>
> But the test has actually succeeded according to the exit code.
> Maybe we'd better fix configure?

I see the issue comes from config/acx_pthread.m4:146
    # Check both linking and compiling, because they might tolerate
different options.
    if test "`(eval $ac_link 2>&1 1>&5)`" = "" && test "`(eval
$ac_compile 2>&1 1>&5)`" = ""; then

where non-empty stdout + stderr output of the linker and compiler
fail the test. And the linker gives the following warning during that test:

    libcrypto.so: warning: gethostbyname is obsolescent, use
getnameinfo() instead.' = ''

-- 
Thanks.
-- Max
