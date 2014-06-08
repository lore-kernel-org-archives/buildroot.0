From: Mike Zick <minimod@morethan.org>
Date: Sun, 8 Jun 2014 07:57:48 -0500
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion
 and internal variables
In-Reply-To: <CAHXCMMJuUfxqVJe8HWe5j5hH3GKNUyf_76RM3Wej2=1c+KehMQ@mail.gmail.com>
References: <bug-7172-163@https.bugs.busybox.net/>
 <20140608070329.A41679CEEE@busybox.osuosl.org>
 <20140608053821.1c486f66@core2quad.morethan.org>
 <CAHXCMMJuUfxqVJe8HWe5j5hH3GKNUyf_76RM3Wej2=1c+KehMQ@mail.gmail.com>
Message-ID: <20140608075748.12ce3c94@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Jun 2014 13:24:13 +0200
Samuel Martin <s.martin49@gmail.com> wrote:

> > Hmm...
> > I guess I should add a selection to build host-patchelf to BR.
> > Someone else out there might need it, even if they don't need
> > ld.so token expansion in runpath and/or rpath.
> >
> > Thanks for taking the time to check this out.
> > Might have to mark it as: "Can't be fixed" in the bug tracker.
> >  
> 
> BTW, why do you need to tweak RPATH in the target fs? What is your
> use-case? (just curious ;-])
> 
> Buildroot builds and installs everything consistently, so libraries
> get installed in /lib and /usr/lib, and binaries do not have any
> RPATH.
> 
> Usually, one needs RPATH when some binaries needs libraries that are
> not installed in the default locations.
> Some others solutions are:
> 1) set the LD_LIBRARY_PATH in the binary environment;
> 2) add the additional paths in some
> $(TARGET_DIR)/etc/ld.so.conf.d/*.conf files.
>

After-market feature supplements for consumer devices. 
In this case, the Amazon Kindle e-book readers:
http://www.mobileread.com/forums/forumdisplay.php?f=150 (as: knc1)
Specifically, the project-of-the-moment:
https://bitbucket.org/twobob/kual-system
See: ARMhf on the Kindle(s) at the first link above.

Requirements (limitations, opportunities to stretch mind, etc):

* Do not disturb Amazon/Lab126 system image.
** Limited storage space for changes
** Causes end-users no end of grief when a vendor update is issued
** No Kernel / u-boot updates allowed - outside of end-user skills

* End-user additions to reside in user accessible storage (same
storage used by books)
** Its FAT32 (no sym-links)
** Supplement the vendors old (pre-GPLv3) soft-float system and
applications with a modern hard-float system and applications. 
(devices more recent than the Kindle Keyboard are Cortex-A{8,9}).

The Buildroot related issue-of-the-moment:

BR2_TARGET_LDFLAGS="-Wl,--dynamic-linker=/mnt/us/extensions/system/lib/ld-linux-armhf.so.3,-rpath=/mnt/us/extensions/system/lib,--enable-new-dtags"

But:

BR2_TARGET_LDFLAGS="-Wl,--dynamic-linker=/mnt/us/extensions/system/lib/ld-linux-armhf.so.3,-rpath=${ORIGIN}/../lib/${CPU},--enable-new-dtags"

Might well be useful in our simplified FHS extension layout.

- - - -

If you own a Kindle (grayscale) e-book reader - give some of our stuff
a try.  (Hint: Start with the KUAL application launcher.)

We (the Mobileread developer community) have done everything from change
the battery graphic to a percentage display;
upto and including speaker independent voice recognition reader control.

A real "busman's holiday" for embedded firmware developers.  ;)

Mike
