From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Nov 2011 09:29:54 +0100
Subject: [Buildroot] kernel-headers toolchain
In-Reply-To: <1322539787.53021.YahooMailNeo@web161203.mail.bf1.yahoo.com> (Tim
 Judd's message of "Mon, 28 Nov 2011 20:09:47 -0800 (PST)")
References: <1322539787.53021.YahooMailNeo@web161203.mail.bf1.yahoo.com>
Message-ID: <87ty5ns54t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tim" == Tim Judd <tjudd2k@yahoo.com> writes:

Hi,

 Tim> I'm rebuilding the userland part of a firmware image, and need to
 Tim> keep the OEM kernel intact.  OEM kernel is 2.6.19 and my dead
 Tim> simple question is which environment do the
 Tim> toolchain/kernel-headers get compiled against?  host OS or against
 Tim> the uclibc?  I ask because I keep getting various redefinition
 Tim> errors (among others) and I can't make heads or tails if I need to
 Tim> downgrade uclibc, host stdlibc, or gcc.

 Tim> example:
 Tim> (linux-2.6.19 defines getline())
 Tim> /usr/lib/stdio.h getline() redefined

Yes, that's a known issue with old kernels and new(ish) versions of
glibc. The reason why this looks in /usr/include/stdio.h is that this
function is used by the unifdef tool in the kernel sources which is used
to export kernel headers.

It's quite easy to fix with a patch like this (just rename the function):

http://git.buildroot.net/buildroot/commit/?id=8360f0c89bbadb798ed43

 Tim> I would like to know:
 Tim> 1.  which build environment do I need to downgrade/find archived copies of

We haven't had explicit 2.6.19 support since some time in 2007 (when we
didn't do regular releases), but it could possibly work with a current
version of buildroot and selecting 2.6.19 with the 'manually specified
version' option.

Some packages might need features that weren't available in 2.6.19
though, so they may fail.

 Tim> 2.  -OR- is it safe to use toolchain/kernel-headers with a more recent kernel
 Tim> (2.6.3x) against a running 2.6.19 kernel?

For most things the kernel interface is backwards compatible, but you
sometimes have packages which detect a new (and better) interface is
available based on the kernel headers and will try to use this new
feature without a fallback to the old interface. uClibc does this for
some of the syscalls, so you can end up with odd errors.

-- 
Bye, Peter Korsgaard
