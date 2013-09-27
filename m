From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 27 Sep 2013 15:41:36 +0000
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639AD6A6C@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
 <87vc1n49b9.fsf@dell.be.48ers.dk>
 <F9C551623D2CBB4C9488801D14F864C639AD653F@ex-mb1.corp.adtran.com>
 <20130927100513.690cdd23@skate>
 <F9C551623D2CBB4C9488801D14F864C639AD6A6C@ex-mb1.corp.adtran.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639AD6B4A@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > I still don't understand. What you're explaining is exactly what
> > Buildroot is doing today. When you use an external toolchain, Buildroot
> > copies the toolchain sysroot (which contains just the C library) in
> > output/staging and then progressively "improves" this sysroot by adding
> > all the libraries that have been cross-compiled for your target.
> >
> > If what you need is then the ability to deliver this toolchain to
> > application developers who will not be using Buildroot, but need a
> > toolchain with all the libraries, then the proper way to do this is, as
> > Peter suggested, to do BR2_HOST_DIR=/opt/some-location/, then do your
> > Buildroot build, tarball /opt/some-location/ and deliver that as the
> > toolchain to be used by your application developers.
> 
> Thomas/Peter/all:
> 
> The following blurb (from the help menu) doesn't really say what
> you said above:
> 
> Directory to store all the binary files that are built for the host.
> This includes the cross compilation toolchain when building the
> internal buildroot toolchain.
> 
> What the above says to me is that aclocal, automake, bison, flex,
> etc will end up in my toolchain.  I don't really want this.
> 
> Now, if using an external toolchain changes this statement to what
> you said "then progressively "improves" this sysroot by adding
> all the libraries that have been cross-compiled for your target."
> without making a bunch of additional build tools in there (which
> won't really be needed in the follow-on builds by developers not
> using Buildroot), then we probably need to specify this.  Otherwise,
> my patch ONLY updates the sysroot and does not dump a bunch of
> library compile time junk into the toolchain (never to be used
> again).
> 

Okay, I see the difference between my patch and what HOST_DIR does.
When using HOST_DIR, the normal location of output/host is redirected
to /opt/somedir then the toolchain, all existing libs, all buildroot
built libs get dumped into that location.

In my patch, I have made this assumption:  The user already has
a toolchain in /opt/somedir/mytoolchain and desires to keep that
location.  After looking at what the code does, I don't really think
that I can specify the SAME location for HOST_DIR as it would attempt
to copy files onto itself (which would then, presumably, error out).
In the case of using the SYSROOT as the staging directory, ONLY the
libraries get copied back to the toolchain's sysroot (and the really
nice thing about this is that the user never has to tell me where to
put the stuff, I asked the toolchain for the sysroot dir).

So, as I stated before, I'll keep dragging this patch around if you
don't want to include it into Buildroot, but I believe this may be
something that others would like to use.  But, I've been wrong
MANY times before ;).

Andy
