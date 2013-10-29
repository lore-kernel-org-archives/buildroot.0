From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 22:36:59 +0100
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <52702024.3060303@zankel.net>
References: <20131029204108.5d707d09@skate> <52701682.2040208@zankel.net>
 <20131029211622.62459eef@skate> <52702024.3060303@zankel.net>
Message-ID: <20131029223659.125f8fc1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Tue, 29 Oct 2013 13:52:52 -0700, Chris Zankel wrote:
> On 10/29/13, 1:16 PM, Thomas Petazzoni wrote:
> > Are you interested in receiving a daily e-mail with the Xtensa build
> > failures, if any?
> Are they different from the one on the mailing list?
> 
> For example:
> [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-28

They are different only in the sense that they contain the failures for
only a given architecture, and they are sent to the architecture
maintainer directly rather than to the list. This allows you to look
only at "your" failures rather than the entire set of failures, and
ensure that you see the e-mail even if you don't read the entire
mailing list traffic.

> > Unfortunately, seeing the absolute desert of release activity the
> > uClibc project is showing, I am not sure when any feature of this
> > size can be merged, and even worse released :-(
> Hopefully, I can push them to make a 'pre-release'.

Cool!

> > In the mean time, it would be good if we could identify such
> > packages, and add the appropriate dependencies to avoid autobuilder
> > failures. Can you point us which packages need NPTL support?
> I'll go through my list again, and will run some builds. Give me a
> few days to a week to come up with a list and patches...

Ok, thanks!

> > For the record, the 10 packages causing the highest number of
> > problems since July, 1st 2013, are:
> >
> > +-------------------+-----+
> > | reason            | cnt |
> > +-------------------+-----+
> > | binutils-2.21.1   |  96 |
> > | m4-1.4.16         |  37 |
> > | binutils-2.22     |  30 |
> > | libnspr-4.9.6     |  21 |
> > | m4-1.4.17         |  17 |
> > | cdrkit-1.1.11     |  14 |
> > | ffmpeg-0.8.12     |   8 |
> > | iozone-3_414      |   8 |
> > | gstreamer-0.10.36 |   6 |
> > | libpfm4-4.3.0     |   6 |
> > +-------------------+-----+
> >
> > Looks like fixing binutils is a good thing to do in the very near
> > future. Can you send a patch for that?
> Actually, when you run automatic builds, do you 'cache' the dl 
> directory? What I noticed is that 'snapshots' of packages are not
> (were not) updated (probably because the filename doesn't change). If
> cached, it would be good to delete all 'snapshot' from the dl
> directory (short term solution). I'll see if I can come up with a
> solution to  'pin' a working version for uClibc for Xtensa.
> 
> Some of the binutils errors might come from using 'uClibc' snapshots, 
> and if the uClibc-snapshot package is not cleared, the same error
> will continue to show up even if fixed.

The autobuilders indeed have a download cache. However, they randomly
remove 5 tarballs from the download cache after each build, to ensure
we regularly re-download tarballs from their upstream location, which
allows to check that we have it correct in BR.

At the time of this writing,  the uClibc-snapshot.tar.bz2 is present in
two of the autobuilders instances, and the date is quite recent:

$ find 1/dl/ 2/dl/ 3/dl/ -name 'uClibc-snapshot.tar.bz2' | xargs ls -l
-rw-r--r-- 1 thomas thomas 2857900 Oct 29 01:10 1/dl/uClibc-snapshot.tar.bz2
-rw-r--r-- 1 thomas thomas 2857900 Oct 26 02:10 2/dl/uClibc-snapshot.tar.bz2

However, it's true that some of the builds may have been done with
older uClibc snapshots. Using uClibc-snapshot.tar.bz2 is really not
great since it doesn't guarantee the reproducibility of builds.
Unfortunately, they only keep one month of snapshots at
http://uclibc.org/downloads/snapshots/ so that's not really usable for
our purpose.

The only option that I can see is to introduce fake 'uClibc-xtensa'
version, which downloads a specific git commit. This way, we are sure
to have the same version between builds, and you can update this
version by sending a patch to Buildroot whenever needed.

Thoughts?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
