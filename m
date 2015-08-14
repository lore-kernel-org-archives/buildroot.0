From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 14 Aug 2015 11:54:09 -0400
Subject: [Buildroot] [PATCH 1/1] protobuf/protobuf-c: bump versions
In-Reply-To: <20150814154215.GD4017@free.fr>
References: <1439516481-3375-1-git-send-email-nimaim@gmail.com>
 <20150814121935.GA4017@free.fr>
 <CALoSW66YprLV_WKuWUrPgzT9hL2JzBh69ggg2dNE3rxEkXohXg@mail.gmail.com>
 <20150814123735.GB4017@free.fr>
 <CALoSW67wa+ZY8PswjOFauGeT3-DT0eqd8VnxfS70OUECR_DQeA@mail.gmail.com>
 <20150814154215.GD4017@free.fr>
Message-ID: <CALoSW65Z_+s+N0E7WSDbqNqzFTfaoDWaCPfA9uPyUh6Q-LyfRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Aug 14, 2015 11:42 AM, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> Nimai, All,
>
> On 2015-08-14 11:11 -0400, Nimai Mahajan spake thusly:
> > On Fri, Aug 14, 2015 at 8:37 AM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:
> [--SNIP--]
> > >
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config
> > >
http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-musl.config
> [--SNIP--]
> > Thanks for the suggestion! I didn't know autobuilder had prebuilt
> > external toolchains for anyone to use publicly;
>
> Yes, it is a little-known fact. Even I often forgets about it from time
> to time... :-/
>
> > protobuf-c v1.1.1 builds successfully with all toolchains ...
>
> Good. Please provide a separate patch just to bump protobuf-c, then.

Yep, will do.

>
> > protobuf    v2.6.1 builds successfully with everything except uClibc
> > static, where it fails with this:
> >
> > D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c
> > google/protobuf/stubs/atomicops_internals_x86_gcc.cc -o
> > google/protobuf/stubs/atomicops_internals_x86_gcc.o
> > google/protobuf/stubs/common.cc:48:2: error: #error "No suitable
> > threading library available."
> >  #error "No suitable threading library available."
> >   ^
> [--SNIP--]
> > Seems to be a threading library issue but toolchain has NPTL thread
> > support I believe so not sure why that is.
>
> In fact, it is not a threading issue. If you look closely at the
> config.log, you'll see that pthreads are properly detected, but that a
> further check about shared libs is broken, see:
>
>
http://autobuild.buildroot.org/results/3ef/3efb86c7e8ec2db5d953d634470cafae79bd34cf/protobuf-v2.5.0/config.log
>
> Most notably:
>
>     checking for the pthreads library -lpthreads... no
>     checking whether pthreads work without any flags... no
>     checking whether pthreads work with -Kthread... no
>     checking whether pthreads work with -kthread... no
>     checking for the pthreads library -llthread... no
>     checking whether pthreads work with -pthread... yes
>     checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
>     checking if more special flags are required for pthreads... no
>     checking whether to check for GCC pthread/shared inconsistencies...
yes
>     checking whether -pthread is sufficient with -shared... no
>     checking whether -lpthread fixes that... no
>     checking whether -lc_r fixes that... no
>     configure: WARNING: Impossible to determine how to use pthreads with
shared libraries
>     checking whether what we have so far is sufficient with -nostdlib...
no
>     checking whether -lpthread saves the day... no
>     configure: WARNING: Impossible to determine how to use pthreads with
shared libraries and -nostdlib
>
> So, it's those checks about "GCC pthread/shared inconsistencies" that
> are broken: it forcibly tries a shared link, even thoug h we are asking
> for static link.
>
> It all happens in an m4 macro, in protobuf-v2.5.0/m4/acx_pthread.m4,
> around lines 239..375.

Thanks for looking into it Yann. I see it now. So many broken autotools
packages! Add this one to the list.

>
> Fixing this macros is a huge "enterntainment" ;-]
>
> So I think it is musch easier to just mark the package as not being
> availble for static-only builds...

Agreed ... will do. I appreciate the help.

>
> Regards,
> Yann E. MORIN.
>
> --
>
.-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
     |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
 conspiracy.  |
>
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150814/38ef7781/attachment.html>
