From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 20 Mar 2015 02:30:39 +0300
Subject: [Buildroot] [PATCH v1] postgresql: fix xtensa pthread linking
	flags
In-Reply-To: <trinity-59332ebf-eb06-4f81-92d0-32a69ebae436-1426807047264@3capp-gmx-bs38>
References: <trinity-59332ebf-eb06-4f81-92d0-32a69ebae436-1426807047264@3capp-gmx-bs38>
Message-ID: <CAMo8BfLmKCxzwfys4KUrDeA1X514XM=KDfNkcA8GCYWG2JAB4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 20, 2015 at 2:17 AM, Peter Seiderer <ps.report@gmx.net> wrote:
> Hello Max,
>
> On Fri, Mar 20, 2015 at 01:50:22AM +0300, Max Filippov wrote:
>> On Fri, Mar 20, 2015 at 12:42 AM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> > On Fri, Mar 20, 2015 at 12:29 AM, Peter Seiderer <ps.report@gmx.net> wrote:
>> >> Caused by pthread flags autodetection failure while configure (from config.log):
>> >> configure:12436: checking whether pthreads work with -pthread
>> >> configure:12521: host/usr/bin/xtensa-linux-gcc -o conftest -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals  -Os   -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE    conftest.c   -lssl -lcrypto -lz -lrt -lcrypt -ldl -lm  >&5
>> >> conftest.c: In function 'main':
>> >> conftest.c:140:27: warning: 'th' is used uninitialized in this function [-Wuninitialized]
>> >>  pthread_t th; pthread_join(th, 0);
>> >>                            ^
>> >> host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.so: warning: gethostbyname is obsolescent, use getnameinfo() instead.
>> >> configure:12521: $? = 0
>> >
>> > But the test has actually succeeded according to the exit code.
>> > Maybe we'd better fix configure?
>>
>> I see the issue comes from config/acx_pthread.m4:146
>>     # Check both linking and compiling, because they might tolerate
>> different options.
>>     if test "`(eval $ac_link 2>&1 1>&5)`" = "" && test "`(eval
>> $ac_compile 2>&1 1>&5)`" = ""; then
>>
>> where non-empty stdout + stderr output of the linker and compiler
>> fail the test. And the linker gives the following warning during that test:
>>
>>     libcrypto.so: warning: gethostbyname is obsolescent, use
>> getnameinfo() instead.' = ''
>>
>
> Thanks for taking a look at it, you are rigth with your problem description (I
> suspected the warning output too), any suggestions how to fix it?
> Or file a bugreport upstream?

The attached patch fixes it for me, but I'm curious why it was
done that way at all. Looking at postgres repository doesn't
reveal much...

-- 
Thanks.
-- Max
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-postgresql-fix-pthread-flags-detection.patch
Type: text/x-patch
Size: 2493 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150320/f3a76cd6/attachment.bin>
