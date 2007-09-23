From: Adam Hawes <adam@infocab.com.au>
Date: Mon, 24 Sep 2007 08:29:04 +0930
Subject: [Buildroot] Buildroot and perforce.
In-Reply-To: <406A31B117F2734987636D6CCC93EE3CB05B69@ehost011-3.exch011.intermedia.net>
References: <406A31B117F2734987636D6CCC93EE3CB05B69@ehost011-3.exch011.intermedia.net>
Message-ID: <1190588344.4299.12.camel@cyclops.infocab.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> > > this is not important). I don't want to put buildroot itself since
> it
> 
> > > doesn't have all necessary files - they get downloaded from
> network
> 
> > > during configuration process - and I cannot risk that approach -
> what if
> 
> > > some package changed or is not there?

I keep a tarball of the buildroot revisions that I want in my SVN
repository.  I also keep the dl/ directory that buildroot downloads in
the svn separately from the tarball.  It's a messy approach but at the
end of the day it works OK for me and allows me to easily redistribute
the source to the OSS components by just pointing at my SVN and saying
"grab revision 12345".  You just have to remember to check the dl/
directory for new files as you change or upgrade Buildroot (I use svn
status for that).

My directory tree in svn looks something like:

+ /
|
+---+ /buildroot_dl
|   |--- /buildroot_dl/*
|
+---+ /buildroot_tar
|   |--- /buildroot_tar/buildroot_19797.tar.bz2
|
+---- /Makefile

My makefile handles creating a temporary build directory, untarring
the .bz2 file into the build directory, linking $BUILD_DIR/buildroot/dl
to /buildroot_dl, tweaking a few things (default skeleton, Qtopia
config, Linux config, etc) and then building everything.  We're using a
smallish CF on an X86 target so my Makefile even builds down to a full
CF image that contains a /boot partition, kernel, initramfs and grub.

Again, it's not neat but it gives me heaps of control of the stuff
outside of Buildroot's jurisdiction without having to patch the vanilla
buildroot to do it all.  It even lets me have buildroot as part of my
SVN so I can keep it all tied neatly together.

Cheers,
A
