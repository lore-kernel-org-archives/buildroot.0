From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 08:33:00 +0200
Subject: [Buildroot] Notice: significant changes for static linking
 configurations
In-Reply-To: <20140730235026.771f855f@free-electrons.com>
References: <20140730235026.771f855f@free-electrons.com>
Message-ID: <20140731083300.5efdcf7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Wed, 30 Jul 2014 23:50:26 +0200, Thomas Petazzoni wrote:

> We'll see in the next few days what is the result of those changes in
> the autobuilders. If it turns out to be too nasty, we might revert
> back. But the static linking issue with libstdc++ has been around for
> too long, it's time to get something done.

So, the first major issue that is currently visible in the autobuilders
is related to packages using libtool 1.5 ltmain.sh. It turns out that
by chance and thanks to fuzziness our existing patch for libtool 1.5
was applying fine on a wide range of libtool 1.5.x ltmain.sh scripts,
even though those scripts are quite different depending on the specific
version you're using.

The issue is that for the -all-static / -static change, it's not
possible to do a patch that will apply on all 1.5.x libtool versions.
Options are:

 1) Further refine the libtool version check, and instead of just
    checking for major versions (1.5, 2.2, 2.4), check for the minor
    version as well, so that we can provide different patches for each
    specific libtool version. Notice that it *may* be necessary down
    the road, because with Hadrien we have seen cases of recent
    packages using a specific libtool 2.4.x version on which our
    libtool 2.4 patch was not applying.

 2) Mark AUTORECONF = YES the problematic packages (i.e the ones using
    libtool 1.5) so that their ltmain.sh gets regenerated with libtool
    2.4 and our patch applies. That's the solution we discussed
    yesterday evening with Gustavo, and for which I applied a patch
    this morning. We will see how far this brings us, and whether or
    not we need to get back to (1) for a more long-term solution.

Ideas, suggestions, comments are welcome.

Note that I know we're breaking stuff badly, and we're making
autobuilders all red, but this libstdc++ static linking stuff has been
around for a long time, and we need to fix it at some point. And
without the help of the autobuilders to tell us what breaks, it's
really hard to make progress.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
