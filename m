From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Tue, 25 Aug 2020 22:46:02 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-08-23
In-Reply-To: <5f43739e.1c69fb81.d68ae.c851SMTPIN_ADDED_MISSING@mx.google.com>
References: <5f43739e.1c69fb81.d68ae.c851SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CA+1k=2Z4spkyAiZcVz4WWOm0fVi2ENCeJao-poC1QPTv-EzuFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 24, 2020 at 2:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Autobuilder failures
> ====================
>
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
>
> Results for the 'next' branch
> -----------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>   riscv64    |        capnproto-0.8.0         | http://autobuild.buildroot.net/results/4016581368b5016ad11f9be355ec96590cd5b093
>
>
> --
> http://autobuild.buildroot.net

It appears that the build errors are an issue where the code is calling:
getcontext(ucontext_t *)

The man page for getcontext says it should be:
getcontext(ucontext_t *)

But the riscv64 musl toolchain is defining getcontext:
getcontext(struct __ucontext *)
which after a define for __ucontext becomes:
getcontext(struct ucontext *)

The toolchain defines both "struct ucontext" (in ucontext.h) and
"struct ucontext_t" (in signal.h) that are very similar, but not
exactly the same.

I'm not sure exactly on what the best way to fix this would be.
Delving into toolchain and header differences isn't really my strong
suit, so I figured I'd ask the mailing list for feedback/advice.

Thanks.
-Joel
