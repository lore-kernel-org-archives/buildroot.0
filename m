From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Apr 2013 23:23:28 +0200
Subject: [Buildroot] [PATCH v2 6/7] arch: Introduce blackfin-specific
 Makefile
In-Reply-To: <CAJxxZ0MafRS7uggYwNVFRc6pHFNXwufsOtvq9=oxS8qJOZAcig@mail.gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-6-git-send-email-sonic.adi@gmail.com>
 <20130407234129.60c6ac9d@skate>
 <CAJxxZ0MafRS7uggYwNVFRc6pHFNXwufsOtvq9=oxS8qJOZAcig@mail.gmail.com>
Message-ID: <20130408232328.0baf2b9e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Mon, 8 Apr 2013 15:19:18 +0800, Sonic Zhang wrote:
> > I am still not happy with this, because it simply doesn't work unless
> > you have the Blackfin toolchain installed globally on your system,
> > which simply isn't the case for normal users.
> >
> > So I believe we should extend the external toolchain logic to be able
> > to use three variants of the Blackfin toolchain:
> >
> >         * Only FDPIC
> >         * Only FLAT
> >         * Both FLAT and FDPIC
> >
> > And then, this logic should be moved in the external toolchain logic,
> > where we already do the process of copying libraries from the toolchain
> > to the target, and from the toolchain to the staging directory.
> 
> Since FPDIC libraries are installed by default if BINFMT_FDPIC is
> selected, how about making INSTALL_FDPIC_LIB option depend on
> BINFMT_FLAT only? So do the INSTALL_FLAT_LIB option.

Yes, this makes sense.

> And no "Both FLAT and FDPIC" is needed in this case.

In fact, I looked again at our support for Blackfin external
toolchains, and I was wrong: we always install *both* the FDPIC and
Flat shared libraries. So in fact, you don't need to handle the
variants of the external toolchain.

Just move your logic into the external toolchain logic that copies
libraries, and that should be fine. I believe it belongs to the
external toolchain logic, because it is highly specific to Analog
Devices toolchains. If we ever support Blackfin in the internal
backend, it will always either be FDPIC *or* FLAT, but not both at the
same time.

> >  * the logic to determine which .so files to copy should use the
> >    $(LIB_EXTERNAL_LIBS) and $(USR_LIB_EXTERNAL_LIBS) that we already
> >    use in ext-tool.mk.
> 
> This only applies to the FDPIC libraries. The FLAT libraries use a
> different name policy.

Yes, sure, but I was referring to the FDPIC libraries in this part
(sorry if it wasn't clear).

> >  * I don't quite understand the logic you're using for the shared flat
> >    library copying. You use -print-file-name=libc, but then you copy it
> >    under the name 'lib1.so'. I think a comment above this part would be
> >    useful.
> 
> The flat libraries are found and linked according to the index in it
> name "libN.so". Index 1 is reserved for the standard C library.
> Customer libraries can use 4 and above. That's why the libc is renamed
> to lib1.so in target rootfs.

Oh, ok, interesting. Could you just copy/paste this explanation as a
comment above the relevant part of the code?

Thanks a lot Sonic for your very quick feedback in this discussion, I
think we're making great progress!

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
