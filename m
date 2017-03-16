From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 16 Mar 2017 11:20:26 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-03-15
In-Reply-To: <20170316074826.j4oczgsrxp57vmdy@tarshish>
References: <20170316072914.90D0F207E3@mail.free-electrons.com>
 <20170316074826.j4oczgsrxp57vmdy@tarshish>
Message-ID: <CAMo8BfJLJ6VQhdfJUhNoMTmWom3MrEyygVQy8-d+xJqhPM=Wfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 16, 2017 at 12:48 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Thomas, all,
>
> On Thu, Mar 16, 2017 at 08:29:14AM +0100, Thomas Petazzoni wrote:
>>       xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/439d6dacfaa7f9244bd15ca04990c12a25ff4777
>
>   HOSTLD  tools/mkenvimage
>   HOSTLD  tools/fdtgrep
> cc1: error: unrecognized command line option "-mlongcalls"
> cc1: error: unrecognized command line option "-mauto-litpools"
> error: command '/usr/bin/gcc' failed with exit status 1
>
> Host toolchain used instead of target. Can't reproduce it here.

It does not reproduce unless host package swig is installed. Then it looks
like it's supposed to build for the host, but somehow python uses the
value of CFLAGS environment variable. Given that host cflags are passed
to the python script through the command line I'd propose the following fix:

diff --git a/tools/Makefile b/tools/Makefile
index 1c840d7..c224e8a 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -120,7 +120,7 @@ _libfdt.so-sharedobjs += $(LIBFDT_OBJS)
 libfdt:

 tools/_libfdt.so: $(patsubst %.o,%.c,$(LIBFDT_OBJS)) tools/libfdt_wrap.c
-       LDFLAGS="$(HOSTLDFLAGS)" python $(srctree)/lib/libfdt/setup.py \
+       LDFLAGS="$(HOSTLDFLAGS)" CFLAGS="" python
$(srctree)/lib/libfdt/setup.py \
                "$(_hostc_flags)" $^
        mv _libfdt.so $@


-- 
Thanks.
-- Max
