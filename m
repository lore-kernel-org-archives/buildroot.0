From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 30 Sep 2013 15:40:23 +0000
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
In-Reply-To: <20130927195402.3320eeb0@skate>
References: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
 <87vc1n49b9.fsf@dell.be.48ers.dk>
 <F9C551623D2CBB4C9488801D14F864C639AD653F@ex-mb1.corp.adtran.com>
 <20130927100513.690cdd23@skate>
 <F9C551623D2CBB4C9488801D14F864C639AD6A6C@ex-mb1.corp.adtran.com>
 <F9C551623D2CBB4C9488801D14F864C639AD6B4A@ex-mb1.corp.adtran.com>
 <20130927195402.3320eeb0@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639AD913A@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Offline, no need to clutter the list. . .
 
(Well, it was off-line, but Thomas refused to answer this without
it being posted to the list, so, sorry for the clutter).

> I still don't quite understand your use case. If you don't use
> BR2_HOST_DIR=/opt/someplace/ and keep telling your users to use their
> original toolchain, they have to pass many options to the compiler and
> linker to point to the right library locations. They also don't have
> access to the right pkg-config that works in cross-compilation mode
> that Buildroot has built.

Never have I had a problem using the libraries that I build into the
toolchain using this same procedure.  I have been doing this patch for
3+ years (I think it is actually going on 5 years now, with a couple of
revisions to the patch along the way).  I plug the libraries straight
into the EXISTING toolchain's sysroot.  Viola!  I have my original
toolchain location with a set of libraries the toolchain automagically
finds based on the fact that all these libs are sitting right in the
same location as the other libs (that originally were built by
crosstool-ng).

> 
> I *really* believe you should have a deeper look at what it means to
> specify a custom BR2_HOST_DIR, I think it's really what you should be
> using.

You assume too much.  I did try it.  I didn't like that additional
crap that was put in the host directory.  I don't need flex, bison,
yacc, make, automake, autoconf, etc in my toolchain.  I just don't need
that.  That takes up too much space on our servers when it is far better
to use the patch I sent.

Perhaps you should attempt my patch once (using it in the prescribed
method) to see the difference yourself.  What I did was to build the
original toolchain using Crosstool-NG, tar that up, then use that
tarball as the starting point.  After this, I built two versions of
the toolchain.  The first I started by using the unmodified 2013.08.1
Buildroot code.  After it was completed, I moved the two toolchains
to another directory (for safe keepings) untarred the toolchain again
and did another build (starting from a clean Buildroot directory,
then applying my patch) and build again using the same configuration
but setting HOST_DIR back to $(BUILD_DIR)/host and setting the new
configuration option (using menuconfig -- I'm lazy)
BR2_TOOLCHAIN_COPY_LIBS_INTO_TOOLCHAIN to yes.

On the HOST_DIR side of the house, you end up with two directories
that contain most the same information, however, there are additional
binaries for the libs, header applications for <gcc family>, <binutils
family>, etc.  All in all, I ended up with (the combined two
directories) with about 283% the size of the original toolchain.

Using my method, I ended up with a directory with about 255% of
the original size.

/opt/toolchains# ls
myway/  orig/  powerpc-unknown-linux-gnuspe/  powerpc-unknown-linux-gnuspe-testing.tar  yourway/
/opt/toolchains# du -s yourway myway orig
1098948 yourway
991592  myway
387772  orig
/opt/toolchains# ls myway/ yourway/ orig/
myway/:
powerpc-unknown-linux-gnuspe-testing/

orig/:
powerpc-unknown-linux-gnuspe-testing/

yourway/:
buildroot-toolchain/  powerpc-unknown-linux-gnuspe-testing/

Now do you understand the difference between the two patches?

As far as a different use case, the only thing I can say is that I
build stuff into the original sysroot of the toolchain, such that the
toolchain KNOWS where the libs are, knows where the includes are, etc
without the aid of any additional support utilities.  Whether this
is beneficial to you or the rest of the world, I cannot say.  It is,
however, beneficial to me.

BTW, MAN!!! Ya'll really pound on me with every patch I push back
up, don't you!  If I wasn't so dedicated to furthering Linux I'd
probably abandon ship with this whole "push stuff back" idea.

Andy
