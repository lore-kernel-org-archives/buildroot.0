From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Oct 2013 23:27:22 +0200
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639AD913A@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
 <87vc1n49b9.fsf@dell.be.48ers.dk>
 <F9C551623D2CBB4C9488801D14F864C639AD653F@ex-mb1.corp.adtran.com>
 <20130927100513.690cdd23@skate>
 <F9C551623D2CBB4C9488801D14F864C639AD6A6C@ex-mb1.corp.adtran.com>
 <F9C551623D2CBB4C9488801D14F864C639AD6B4A@ex-mb1.corp.adtran.com>
 <20130927195402.3320eeb0@skate>
 <F9C551623D2CBB4C9488801D14F864C639AD913A@ex-mb1.corp.adtran.com>
Message-ID: <20131002232722.6b4ced7b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andy,

On Mon, 30 Sep 2013 15:40:23 +0000, ANDY KENNEDY wrote:
> Offline, no need to clutter the list. . .
>  
> (Well, it was off-line, but Thomas refused to answer this without
> it being posted to the list, so, sorry for the clutter).

Yes, I don't see much point in having private discussions about
Buildroot design decisions. The opinion of the entire community is
important.

> > I still don't quite understand your use case. If you don't use
> > BR2_HOST_DIR=/opt/someplace/ and keep telling your users to use their
> > original toolchain, they have to pass many options to the compiler and
> > linker to point to the right library locations. They also don't have
> > access to the right pkg-config that works in cross-compilation mode
> > that Buildroot has built.
> 
> Never have I had a problem using the libraries that I build into the
> toolchain using this same procedure.

That's because it works in your particular case, but it doesn't work in
the general case. For example, with your solution, try to build an
application which uses 'pkg-config' to discover libraries. It will
fail, because you don't have $(HOST_DIR)/usr/bin/pkg-config, which
Buildroot has specially compiled to make sure it points to the
cross-compiled libraries and headers.

>  I have been doing this patch for
> 3+ years (I think it is actually going on 5 years now, with a couple of
> revisions to the patch along the way).  I plug the libraries straight
> into the EXISTING toolchain's sysroot.  Viola!  I have my original
> toolchain location with a set of libraries the toolchain automagically
> finds based on the fact that all these libs are sitting right in the
> same location as the other libs (that originally were built by
> crosstool-ng).

Again, that all works when you consider a toolchain as being just the
cross-compiler (and its related linker, assembler, etc.) and the
headers/libraries.

Most build systems, including Buildroot, consider that what we should
provide to application developers is actually a SDK: it's not only a
toolchain, but also a set of tools compiled for the host that are
useful during the cross-compilation process of various components.
pkg-config was mentioned above, but even having a version of autoconf,
automake and libtool that is the same for all developers is a really
nice feature. I've worked for customers that were using Buildroot, and
it was definitely a clear feature that Buildroot provides its own
version of automake, autoconf, libtool, pkg-config and other host
tools, since it ensures all the application developers rely on the same
version of those tools.

> > I *really* believe you should have a deeper look at what it means to
> > specify a custom BR2_HOST_DIR, I think it's really what you should be
> > using.
> 
> You assume too much.  I did try it.  I didn't like that additional
> crap that was put in the host directory.  I don't need flex, bison,
> yacc, make, automake, autoconf, etc in my toolchain.  I just don't need
> that.  That takes up too much space on our servers when it is far better
> to use the patch I sent.

See the above explanation.

> Perhaps you should attempt my patch once (using it in the prescribed
> method) to see the difference yourself.  What I did was to build the
> original toolchain using Crosstool-NG, tar that up, then use that
> tarball as the starting point.  After this, I built two versions of
> the toolchain.  The first I started by using the unmodified 2013.08.1
> Buildroot code.  After it was completed, I moved the two toolchains
> to another directory (for safe keepings) untarred the toolchain again
> and did another build (starting from a clean Buildroot directory,
> then applying my patch) and build again using the same configuration
> but setting HOST_DIR back to $(BUILD_DIR)/host and setting the new
> configuration option (using menuconfig -- I'm lazy)
> BR2_TOOLCHAIN_COPY_LIBS_INTO_TOOLCHAIN to yes.

I'm not sure to follow your procedure works. But clearly, a Buildroot
option that copies back the libraries into the external toolchain is
not acceptable: the external toolchain is not meant to be changed by
Buildroot. If you really want to do that, you can just take
output/host/usr/<tuple>/sysroot and use that to replace the original
toolchain sysroot.

> On the HOST_DIR side of the house, you end up with two directories
> that contain most the same information, however, there are additional
> binaries for the libs, header applications for <gcc family>, <binutils
> family>, etc.  All in all, I ended up with (the combined two
> directories) with about 283% the size of the original toolchain.
> 
> Using my method, I ended up with a directory with about 255% of
> the original size.
> 
> /opt/toolchains# ls
> myway/  orig/  powerpc-unknown-linux-gnuspe/  powerpc-unknown-linux-gnuspe-testing.tar  yourway/
> /opt/toolchains# du -s yourway myway orig
> 1098948 yourway
> 991592  myway

So you've saved 107 MB over 1 GB, that's about 10%. I don't see how it
matches the 283% and 255% numbers you've given above.

> 387772  orig
> /opt/toolchains# ls myway/ yourway/ orig/
> myway/:
> powerpc-unknown-linux-gnuspe-testing/
> 
> orig/:
> powerpc-unknown-linux-gnuspe-testing/
> 
> yourway/:
> buildroot-toolchain/  powerpc-unknown-linux-gnuspe-testing/
> 
> Now do you understand the difference between the two patches?

Which "two" patches ? You've submitted only one.

> As far as a different use case, the only thing I can say is that I
> build stuff into the original sysroot of the toolchain, such that the
> toolchain KNOWS where the libs are, knows where the includes are, etc
> without the aid of any additional support utilities.  Whether this
> is beneficial to you or the rest of the world, I cannot say.  It is,
> however, beneficial to me.
> 
> BTW, MAN!!! Ya'll really pound on me with every patch I push back
> up, don't you!  If I wasn't so dedicated to furthering Linux I'd
> probably abandon ship with this whole "push stuff back" idea.

I'm sorry if you feel this way. I believe the Buildroot community
accepts a huge number of patches from various contributors. See for
example the numbers I've shown at
http://free-electrons.com/blog/buildroot-community-activity/: the
number of contributors is increasing significantly. I'm reviewing the
patches from many other contributors, and their patches are being
merged.

However, you have to understand that touching to the core mechanisms of
Buildroot takes more time than getting package changes merged. This is
because we're paying close attention to keep Buildroot simple, and
avoid having multiple mechanisms to do the same thing, or mechanisms
that serve too specific use cases that we think shouldn't be handled by
Buildroot.

I personally believe that the existing Buildroot users like it because
it is quite simple to understand and easy to use. If we start to accept
all sorts of mechanisms without a good and sensible use case, a good
coherency with the other existing mechanisms, then we will loose this
simplicity, which is the core advantage of Buildroot.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
