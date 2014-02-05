From: Justin Maggard <jmaggard10@gmail.com>
Date: Tue, 4 Feb 2014 16:21:01 -0800
Subject: [Buildroot] Broken pread() on ARM
In-Reply-To: <CAKgsxVRjJoJfk1UkXA4kMnt+TxtSfHgduyPjeF8gmrZTxFOvGw@mail.gmail.com>
References: <CAKgsxVRjJoJfk1UkXA4kMnt+TxtSfHgduyPjeF8gmrZTxFOvGw@mail.gmail.com>
Message-ID: <CAKgsxVSJAW73vXdkKQFLZOYp3qzZm9qwF5+p0NUtUUSnzsFZtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 4, 2014 at 2:26 PM, Justin Maggard <jmaggard10@gmail.com> wrote:
> I'm using buildroot on a 32-bit ARM platform, and I have run into
> pread issues after recently switching from buildroot-2013.05 to
> buildroot-2013.11.  In both cases I'm using a generated uClibc
> toolchain, and uClibc 0.9.33.2.  Comparing the strace outputs of both,
> the offset shows up differently.  As an extra data point, I tried the
> latest uClibc snapshot instead of 0.9.33.2, and it worked fine again.
>
> I see there are a number of extra uClibc patches that were added
> between 2013.05 and 2013.11.  Perhaps we have just the right
> combination of backports to make some platforms work, while breaking
> others?
>

Okay, it looks like some of the pread/pwrite changes that have made
their way into the uClibc 0.9.33 branch fail to consider some
architectures.  I have made a rather odd-looking change locally that
makes it work for me on my ARM platform, which uses _syscall6() for
pread() and pread64() if __UCLIBC_TRUNCATE64_HAS_4_ARGS__ is defined.
Would that be worth sending to the list, or would it be better to fix
it some other way?

-Justin
