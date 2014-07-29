From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 29 Jul 2014 16:53:54 +0000
Subject: [Buildroot] [PATCH] gcc: explicitly use CFLAGS_FOR_TARGET
 instead of --enable-target-optspace
In-Reply-To: <20140728231227.298a3882@free-electrons.com>
References: <1405351786-4445-1-git-send-email-abrodkin@synopsys.com>
 <20140728231227.298a3882@free-electrons.com>
Message-ID: <1406652833.17998.24.camel@abrodkin-8560l>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-07-28 at 23:12 +0200, Thomas Petazzoni wrote:
> I found the commit log quite difficult to understand actually. It
> lacked a bit of context like:
> 
> """
> The gcc.mk file is passing --enable-target-optspace to gcc configure
> script, to ask for space-optimized (-Os) target libraries. However,
> passing this option has the effect of overriding any custom
> CFLAGS_FOR_TARGET or CXXFLAGS_FOR_TARGET values that may be passed.
> """
> 
> And then go on with your explanation. Also, apparently, using "======="
> in the middle of a commit log confuses patchwork a bit:
> http://patchwork.ozlabs.org/patch/369672/.

Thanks for this comment. Makes perfect sense.

> The original --enable-target-optspace is passed at *all* gcc steps, but
> now you're passing CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET only at
> the gcc intermediate step. This looks weird.

Well I was under impression that target binaries are only built on
"gcc-intermediate" stage, that's why I moved changes there exclusively.

I noticed that "libgcc" (in all its incarnations: libgcc_s.so, libgcc.a,
libgcc_eh.a etc) was built on "intermediate" stage and considered that
there's no sense to build it once again on "final" stage.

I checked now and do see that on "gcc-final" stage libgcc and friends
was built as well. I'm wondering why?

Anyway it looks like we need to pass "custom" flags at least on
"gcc-intermediate" and "gcc-final" stages and in this case it makes
sense to leave everything in "gcc.mk" (even though "gcc-initial" doesn't
build anything for target).

> Also, since we can actually customize this option, what about using the
> ones from Buildroot, i.e something such as:
> 
> 	HOST_GCC_CONF_ENV += CFLAGS_FOR_TARGET="$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)"
> 	HOST_GCC_CONF_ENV += CXXFLAGS_FOR_TARGET="$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)"

My intention was to keep output results as they are now but add an
ability to modify flags if it is actually required. That way I might be
sure this change doesn't brake things for people. "libgcc" is a thing
that everybody builds and than uses on their target so if I break it
people will go for me.

Your proposal looks very sane for me and if you believe we may try this
move I'll happily implement it.

Actually I was pretty surprised myself when I found that
BR2_TARGET_OPTIMIZATION has no impact on libgcc built for target. And
maybe it's time to fix it.

> Maybe we could even just use $(TARGET_CFLAGS) and $(TARGET_CXXFLAGS),
> though I'm a bit less sure about all the possible consequences.

As for me I'd vote for TARGET_CFLAGS/CXXFLAGS because then we have
exactly the same options for all target binaries.

Would be good to get some more feedback to make a good choice.

Regards,
Alexey
