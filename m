From: Dan Price <dp@dssd.com>
Date: Wed, 20 Mar 2013 01:48:57 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-03-19
In-Reply-To: <20130320073506.B07DA428501@lolut.humanoidz.org>
References: <20130320073506.B07DA428501@lolut.humanoidz.org>
Message-ID: <CAH+T41aiFXadTx4tjzwUZwTVbm=+oCVWQGUO7U_p=AvA2WqLxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 20, 2013 at 12:35 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Status         : NOK
> Failure reason : redis-2.6.11
> Architecture   : powerpc
> Submitted by   : Peter Korsgaard (gcc14)
> Submitted at   : 2013-03-19 01:43:20
> Git commit ID  :
> http://git.buildroot.net/buildroot/commit/?id=bae18e117b52c73cf2b84fc0e357d68d18fa39c6
> End of log     :
> http://autobuild.buildroot.net/results/8b9fa8df99f6f02e3689b6bd2161eded1b48b9ba/build-end.log
> Complete log   :
> http://autobuild.buildroot.net/results/8b9fa8df99f6f02e3689b6bd2161eded1b48b9ba/build.log.bz2
> Configuration  :
> http://autobuild.buildroot.net/results/8b9fa8df99f6f02e3689b6bd2161eded1b48b9ba/config
> Defconfig      :
> http://autobuild.buildroot.net/results/8b9fa8df99f6f02e3689b6bd2161eded1b48b9ba/defconfig
>
>
I would really like to fix this, but I am at a loss as to the root cause,
at least in my first pass at this.  The guard in the redis code is:

/* Test for backtrace() */
#if (defined(__APPLE__) || defined(__linux__) || defined(__sun)) &&
!defined(__UCLIBC__)
#define HAVE_BACKTRACE 1
#endif

So this should automatically turn this off when uclibc is used.  The only
thing I can think of is that the toolchain isn't defining __UCLIBC__?  Or
isn't actually a uclibc toolchain?  Or someone else is defining
HAVE_BACKTRACE?

I note from
http://git.buildroot.net/buildroot/plain/package/connman/connman-uclibc-backtrace.patchthat
the guard in redis could be improved to:  !(defined(__UCLIBC__) &&
!defined (__UCLIBC_HAS_BACKTRACE__)).  I'll try to advocate for that.

       -dp

-- 
Daniel Price -- dp at dssd.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130320/1144b121/attachment.html>
