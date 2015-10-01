From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Oct 2015 23:44:00 +0200
Subject: [Buildroot] [PATCH 9/9] core: finalise target in its own
 location
In-Reply-To: <a594ac3858ea713de72610ad49566be4e20c176f.1443650034.git.yann.morin.1998@free.fr>
References: <cover.1443650034.git.yann.morin.1998@free.fr>
 <a594ac3858ea713de72610ad49566be4e20c176f.1443650034.git.yann.morin.1998@free.fr>
Message-ID: <20151001234400.0d18c041@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Sep 2015 23:54:52 +0200, Yann E. MORIN wrote:
> Currently, after all packages have been installed into target/ , we run
> a sanitising pass called 'target-finalize' on that directory, to:
>   - apply overlays
>   - remove unnecessary files (man, .h, .a ...)
>   - strip files
> as well as a few other miscellanous cleanups.
> 
> This means that target/ no longer contains only package-installed files,
> and that target-finalize might not be idempotent (i.e. sucessive runs of
> target-finalize may yield different results in target/ ). We're trying
> pretty hard that all the internal target-finalize hooks are idempotent,
> whether they are from the core (e.g. installing glibc locales) or
> provided by packages (e.g. cleaning up perl files).
> 
> However, that might not be the case for packages from br2-external for
> example, or under complex situations where a combination of packages
> does not yield an idempotent sequence (quoting Wikipedia: "a combination
> of idempotent methods or subroutines is not necessrily idempotent"; see:
> https://en.wikipedia.org/wiki/Idempotence#Examples ).
> 
> Address this issue by copying target/ to a "landing" area where the
> finalising takes place.
> 
> This keeps the user-visible target/ directory to contain only what
> packages have installed, helps keeping target-finalize be idempotent by
> allowing packages to provide simpler target-finalize hooks.
> 
> For simplicity for packages, we have to allow them to use $(TARGET_DIR)
> everywhere, be it in target install commands or target finalize
> commands, without requiring them to know whether to use $(TARGET_DIR)
> or $(FINAL_TARGET_DIR). $(TARGET_DIR) always points to the directory in
> which to act.
> 
> So, for target-finalize, we override TARGET_DIR to point to the landing
> area. But since packages are dependencies of target-finalize, they
> would also inherit from this override. So, we over-override TARGET_DIR
> for packages, to point to the usual and currently used $(O)/target/
> directory.
> 
> Finally, filesystem images are generated from that landing area, of
> course. Similarly, we need to override TARGET_DIR for them.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

To be honest, my initial reaction is: why? What is the benefit? It's
additional complexity (not so much in the code), but in the user
visible output directories.

Having idem-potent post-build scripts seems like a good goal to
achieve. Your only arguments are:

 - "this might not be the case for br2-external", but it doesn't
   explain why

 - "under complex situations where a combination of packages does not
   yield an idempotent sequence", which doesn't come with a real-life
   example of such a situation.

So with the current explanation/motivation, I'm inclined to say no to
this change. I'd be happy to revise my opinion if there are some clearer
benefits to balance the drawbacks of the additional complexity.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
