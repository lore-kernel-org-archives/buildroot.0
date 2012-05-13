From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 May 2012 09:02:16 +0200
Subject: [Buildroot] [PATCH] gnutls: Fix search path for libgcrypt
In-Reply-To: <4FAEC2F4.1060802@mind.be>
References: <1336847275-21899-1-git-send-email-arnout@mind.be>
 <20120512210755.672039a4@skate> <4FAEC2F4.1060802@mind.be>
Message-ID: <20120513090216.215c50bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 12 May 2012 22:07:16 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > Last WE, I started investigating the problem, and found out that just
> > compiling gnutls wasn't enough to reproduce the problem. The problem
> > was starting to occur when libintl was built before libgcrypt. In this
> > case, libgcrypt.la had -lintl in its dependencies, and in turn,
> > libintl.la had -lc in its dependencies. Then, libtool expands this -lc
> > into the full path to libc.so.
>   After the patch, that doesn't seem to make a difference for me.
> I did the following after a successful build:
> make libgcrypt-dirclean gnutls-dirclean; make
> 
>   That succeeded.  Then I did
> rm -f {staging,target}/{usr/,}lib/*intl*
> rm -rf build/gettext*
> make libgpg-error-dirclean libgcrypt-dirclean gnutls-dirclean
> make gnutls; make
> 
>   That still succeeded.  (It looks like libgpg-error is missing a
> dependency on gettext/libintl, though.)  And finally, just to
> be sure:
> rm -f {staging,target}/{usr/,}lib/*intl*
> rm -rf build/gettext*
> make libgpg-error-dirclean libgcrypt-dirclean gnutls-dirclean
> make libintl; make
> 
>   Also succeeded. That pretty much covers the libintl dependency,
> right?

It should yes. I will test your patch and see if it improves the
situation.

>   A heavy-handed approach would be to generate the patched
> binutils for known-to-be-faulty external toolchains.
> 
>   A simple approach would be to use the patched binutils on the test
> machines :-)

None of these approaches are really easy to do, unfortunately :-(

>   BTW, how come this problem doesn't manifest itself more often?
> There are many packages with -lintl in their .la dependencies, so all
> of them should fail regularly, no?

That's a good question indeed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
