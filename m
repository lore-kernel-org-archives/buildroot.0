From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2008 13:56:57 +0200
Subject: [Buildroot] advice on makefile
In-Reply-To: <1207827171.6817.432.camel@nigel-x60> (Nigel Kukard's message of
	"Thu\, 10 Apr 2008 11\:32\:51 +0000")
References: <1207827171.6817.432.camel@nigel-x60>
Message-ID: <87tzi9apo6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

Hi,

 Nigel> find $(RPM_DIR) -name '*.rej' | xargs --no-run-if-empty rm
 >> 
 >> What are those .rej files?

 Nigel> RPM5 v4.4.9 contained .rej files in the tar.gz, which made patch-kernel
 Nigel> choke.  Dirty I know ... but yea

Yddrk.

 >> Please use sed for replacing text.

 Nigel> Removed that line. it was hanging around from my previous
 Nigel> cleanup ... :\

Ok.

 >> It looks like you need to depend on beecrypt and neon installing into
 >> STAGING_DIR.

 Nigel> I do this later on....
 Nigel> rpm: libbeecrypt libneon libpopt ...

 Nigel> Problem is I don't want to depend on the fixed library names
 Nigel> .... would you suggest I depend on
 Nigel> $(STAGING_DIR)/usr/lib/libbeecrypt.so ... etc?

Yes, but that breaks parallel builds. You have to tell make that it
cannot start the configure step until those other libraries are
installed into STAGING_DIR.

I know that the current approach of having to hardcode the file name
used in the library .mk isn't really nice. We should probably come up
with an agreement regarding a fixed target name / file for libraries
to clean this up. Notice that this has to be a physical file name as a
PHONY target like <package>-staging-install always will be considered
out-of-date, so the configure target will rerun everytime you run
make.

You can see the avahi package for an example.

 >> Is all of this needed? Normally you just need to set prefix=/usr and
 >> use DESTDIR when installing into STAGING_DIR / TARGET_DIR.

 Nigel> I can try filter it out a bit, but 4.4.9 was very very picky.

Ok.

 Nigel> --program-prefix= \
 Nigel> --disable-build-versionscript \
 Nigel> --without-selinux \
 Nigel> --without-python \
 >> 
 >> We have a python package. Maybe we should add something like the
 >> DISABLE_NLS stuff for it?

 Nigel> Lets get rpm in without python, then improve on the extras later :)

Ok, it was more of generic note.

 Nigel> mandir=$(STAGING_DIR)/usr/man \
 >> 
 >> Is this needed? Doesn't make install support DESTDIR=$(STAGING_DIR)?

 Nigel> 4.4.9 was a nightmare ... I started from scratch, then added line by
 Nigel> line. I'll try 5.0.x and filter out.

Ok.

 >> Well, RPM_BINARIES=rpm, so if you don't forsee more programs to be
 >> added, just drop the loop.

 Nigel> yea ... i'm busy trying to determine if more are required

Ok.

 Nigel> rpm: libbeecrypt libneon libpopt $(RPM_TARGET_LIBS) $(RPM_TARGET_BINARIES)
 >> 
 >> The rpm target shouldn't depend on the full installation in TARGET_DIR
 >> of libeecrypt / libneon / libpopt, instead the configure target should
 >> depend on those libraries installing into $(STAGING_DIR).

 Nigel> I looked in some other .mk's and saw they normally depend on
 Nigel> the package name?

Yeah, quite some packages are broken in this regard :/

-- 
Bye, Peter Korsgaard
