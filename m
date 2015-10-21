From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 21 Oct 2015 20:41:54 +1300
Subject: [Buildroot] [PATCH] syslog-ng: Specify location of libesmtp
In-Reply-To: <877fmhl4ie.fsf@dell.be.48ers.dk>
References: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
 <20151020205728.6f2d2332@gmx.net> <877fmhl4ie.fsf@dell.be.48ers.dk>
Message-ID: <CAFOYHZBj3PtYrr_U6Tq6nAG9X0w5AXYis5b-rDpbvjQSCMby6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 21, 2015 at 8:32 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
> Hi,
>
>  >> SYSLOG_NG_CONF_OPTS += --disable-smtp
>  >> endif
>
>  > The buildroot package libestmp provides a libesmtp-config script, but
>  > it is installed into
>
>  >      host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/libesmtp-config
>
>  > where it is not found by the syslog-ng configure script...
>
> Yes, $(STAGING_DIR)/usr/bin, similar to the other *-config scripts.
>
>  > Would a more portable solution be to add this search path (or fix the install
>  > location of libestmp-config) for the syslog-ng configure call (libesmtp-config
>  > --libs gives '-pthread -L[...]/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib
>  > -lesmtp -lssl -lcrypto -ldl')?
>
> $(STAGING_DIR)/usr/bin contains binaries for the target (and *-config
> scripts), so it shouldn't be added to the path, but another approach is
> indeed to fix the configure script to look elsewhere for the script,
> similar to how a bunch of packages allow the path to sdl-config to be
> overridden through the SDL_CONFIG environment variable.

The way the test is implemented in configure.ac libestmp-config is
invoked directly so it would need to be on the path. Or I could look
at an upstream patch to change this to something that can be
overridden. I'd almost prefer if libesmtp had pkg-config support which
integrates better with autotools and buildroot has existing support
for.
