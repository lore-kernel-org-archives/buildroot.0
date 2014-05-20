From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 20 May 2014 13:57:44 +0200
Subject: [Buildroot] Fwd: Fwd: how to assign cpp and c++ in buildroot?
In-Reply-To: <CAMm5YqqZjnWaNQ+S5a+huY+tOfHgqv51St9HhQZ=69i-4u9PQw@mail.gmail.com>
References: <52E9D80E-B9AD-417A-BC0F-66A69C39FC21@gmail.com>
 <5F503FD3-3FBC-4ADB-9D17-BA0CB5606B6D@gmail.com>
 <20140520000920.20ae6b5b@free-electrons.com>
 <0727D305-97AD-471C-BA2D-D6A251B4FA90@gmail.com>
 <CAMm5YqqFDD0a_hA0fGdiLDuHLoaCVVgf2L_-wzQikpF4cm7FJw@mail.gmail.com>
 <CAAXf6LUF7eXsQvJRLoO0oHcefs9PGnUOVXGCNNhZ2YKV_SkGVA@mail.gmail.com>
 <20140520113955.475370b3@free-electrons.com>
 <CAMm5YqoPu1QDkzdpoFfZfNCj0V+VeVkYcUPW=xzzqLB-eYAAuQ@mail.gmail.com>
 <CAMm5YqqZjnWaNQ+S5a+huY+tOfHgqv51St9HhQZ=69i-4u9PQw@mail.gmail.com>
Message-ID: <CAAXf6LUC7Vki85_4iVr-AhijdjpXxHQoYOVSgUAdJcta4-jb6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cem,

(please don't top-post, put your reply below the mail you are answering)

On Tue, May 20, 2014 at 1:31 PM, cem akpolat <akpolatcem@gmail.com> wrote:
>
>
>
>
> Dear Thomas,
>
>
> I added two packages to buildroot, however, the compilation issue doesn't
> stem from them. Nevertheless, I have removed them and did make distclean and
> then compile it again.
> the compilation result is below. I didn't touch package/Makefile.in. The
> problem is that I am seeing it everywhere (on other PCs). I will send you
> another make result on my other pc.
>

Can you send the output of following commands, executed from the same
shell in which you run 'make' in buildroot?

env | grep -i cpp
echo $TARGET_CPP
grep -rn TARGET_CPP package/Makefile.in

and could you add the following line to package/Makefile.in, just
above TARGET_CONFIGURE_OPTS (line 236 approximately), start the build
the same way as you do normally, and then post the output of that
@@@@@ line too?

 $(warning @@@@@@@ TARGET_CPP value='$(TARGET_CPP)' origin='$(origin
TARGET_CPP)')

In my case, env returns nothing, the echo returns nothing, the grep returns
$ grep -rn TARGET_CPP package/Makefile.in
136:TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
139:TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI)
$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
177:TARGET_CPP      = $(TARGET_CROSS)cpp
243:            CPP="$(TARGET_CPP)" \
265:            CPPFLAGS="$(TARGET_CPPFLAGS)" \

and the build with extra line:

package/Makefile.in:234: @@@@@@@ TARGET_CPP
value='/home/tdescham/repo/contrib/buildroot-misc/output/host/usr/bin/i686-pc-linux-gnu-cpp'
origin='file'


This output should help us in understanding your issue better.

Thanks,
Thomas
