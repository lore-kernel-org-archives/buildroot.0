From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 2 Oct 2013 22:11:21 +0000
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
In-Reply-To: <20131002232722.6b4ced7b@skate>
References: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
 <87vc1n49b9.fsf@dell.be.48ers.dk>
 <F9C551623D2CBB4C9488801D14F864C639AD653F@ex-mb1.corp.adtran.com>
 <20130927100513.690cdd23@skate>
 <F9C551623D2CBB4C9488801D14F864C639AD6A6C@ex-mb1.corp.adtran.com>
 <F9C551623D2CBB4C9488801D14F864C639AD6B4A@ex-mb1.corp.adtran.com>
 <20130927195402.3320eeb0@skate>
 <F9C551623D2CBB4C9488801D14F864C639AD913A@ex-mb1.corp.adtran.com>
 <20131002232722.6b4ced7b@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639ADB6BA@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Never have I had a problem using the libraries that I build into the
> > toolchain using this same procedure.
> 
> That's because it works in your particular case, but it doesn't work in
> the general case. For example, with your solution, try to build an
> application which uses 'pkg-config' to discover libraries. It will
> fail, because you don't have $(HOST_DIR)/usr/bin/pkg-config, which
> Buildroot has specially compiled to make sure it points to the
> cross-compiled libraries and headers.

Most of the time pkg-config is not needed as the code being built is
proprietary and the companies that are using these don't have knowledge
of how/when to use these utilities.

> > Perhaps you should attempt my patch once (using it in the prescribed
> > method) to see the difference yourself.  What I did was to build the
> > original toolchain using Crosstool-NG, tar that up, then use that
> > tarball as the starting point.  After this, I built two versions of
> > the toolchain.  The first I started by using the unmodified 2013.08.1
> > Buildroot code.  After it was completed, I moved the two toolchains
> > to another directory (for safe keepings) untarred the toolchain again
> > and did another build (starting from a clean Buildroot directory,
> > then applying my patch) and build again using the same configuration
> > but setting HOST_DIR back to $(BUILD_DIR)/host and setting the new
> > configuration option (using menuconfig -- I'm lazy)
> > BR2_TOOLCHAIN_COPY_LIBS_INTO_TOOLCHAIN to yes.
> 
> I'm not sure to follow your procedure works. But clearly, a Buildroot
> option that copies back the libraries into the external toolchain is
> not acceptable: the external toolchain is not meant to be changed by
> Buildroot. If you really want to do that, you can just take
> output/host/usr/<tuple>/sysroot and use that to replace the original
> toolchain sysroot.

Hmmm, I'm not sure that would be exactly what I was going for, but
I'd have to try it (and I don't really care at this point).  Other than
the size differences below, the nice to have is that the toolchain is
contained in one directory.  Whereas I could push the original toolchain
a level deep then locate the Buildroot host dir next to it in that dir,
this, I fear, would be confusing to those who consume the toolchains.  I
would expect the question of "which one am I supposed to use" to come
back to me.  Though, one could fix this by (as I do anyway) by providing
a Makefile in the toolchain directory which will generate an environment
shell script to "configure" the toolchain for a given shell.

But, anywho, it doesn't matter.

> > /opt/toolchains# du -s yourway myway orig
> > 1098948 yourway
> > 991592  myway
> > 387772  orig
> 
> So you've saved 107 MB over 1 GB, that's about 10%. I don't see how it
> matches the 283% and 255% numbers you've given above.

1098948/387772 = 2.8340055... * 100% = 283%
991592/387772 = 2.557152....  * 100% = 255% (I guess this should have
been 256% with the rounding -- I truncated, my bad).

> > Now do you understand the difference between the two patches?
> 
> Which "two" patches ? You've submitted only one.

The patch submitted about a year or two ago that moved around the
HOST_DIR stuff vs the one I submitted last week.

> However, you have to understand that touching to the core mechanisms of
> Buildroot takes more time than getting package changes merged. This is
> because we're paying close attention to keep Buildroot simple, and
> avoid having multiple mechanisms to do the same thing, or mechanisms
> that serve too specific use cases that we think shouldn't be handled by
> Buildroot.
> 
> I personally believe that the existing Buildroot users like it because
> it is quite simple to understand and easy to use. If we start to accept
> all sorts of mechanisms without a good and sensible use case, a good
> coherency with the other existing mechanisms, then we will loose this
> simplicity, which is the core advantage of Buildroot.

One cannot argue with the principles presented here.  The application of
such principles are where I have differing views.

As far as this patch goes, if all within the Buildroot community are
vehemently against such a patch, so be it.  I will not blow against
the wind.

::enter drama queen mode::
Defeated,
::exit drama queen mode::
Andy
