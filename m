From: Tim Judd <tjudd2k@yahoo.com>
Date: Tue, 29 Nov 2011 04:36:57 -0800 (PST)
Subject: [Buildroot] kernel-headers toolchain
In-Reply-To: <87ty5ns54t.fsf@macbook.be.48ers.dk>
References: <1322539787.53021.YahooMailNeo@web161203.mail.bf1.yahoo.com>
 <87ty5ns54t.fsf@macbook.be.48ers.dk>
Message-ID: <1322570217.86473.YahooMailNeo@web161202.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the replies.

If I have to keep the OEM kernel, wouldn't it be better to remove the function/rename the function in uclibc/glibc instead?? since the older kernel had that function defined?

My thought process is that if I rebuild my userland with a kernel-headers lacking getline() but remains in uclibc/glibc - but the running environment will have kernel-headers define it and now also the uclibc, then we have the same function name in both environments?

Thanks for the feedback on this question too.

?




________________________________
 From: Peter Korsgaard <jacmet@uclibc.org>
To: Tim Judd <tjudd2k@yahoo.com> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Tuesday, November 29, 2011 1:29 AM
Subject: Re: kernel-headers toolchain
 
>>>>> "Tim" == Tim Judd <tjudd2k@yahoo.com> writes:

Hi,

Tim> I'm rebuilding the userland part of a firmware image, and need to
Tim> keep the OEM kernel intact.? OEM kernel is 2.6.19 and my dead
Tim> simple question is which environment do the
Tim> toolchain/kernel-headers get compiled against?? host OS or against
Tim> the uclibc?? I ask because I keep getting various redefinition
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
Tim> 1.? which build environment do I need to downgrade/find archived copies of

We haven't had explicit 2.6.19 support since some time in 2007 (when we
didn't do regular releases), but it could possibly work with a current
version of buildroot and selecting 2.6.19 with the 'manually specified
version' option.

Some packages might need features that weren't available in 2.6.19
though, so they may fail.

Tim> 2.? -OR- is it safe to use toolchain/kernel-headers with a more recent kernel
Tim> (2.6.3x) against a running 2.6.19 kernel?

For most things the kernel interface is backwards compatible, but you
sometimes have packages which detect a new (and better) interface is
available based on the kernel headers and will try to use this new
feature without a fallback to the old interface. uClibc does this for
some of the syscalls, so you can end up with odd errors.

-- 
Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111129/8e540a31/attachment.html>
