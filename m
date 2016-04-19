From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 13:26:03 +0200
Subject: [Buildroot] [PATCH 1/2] qt5connectivity: add sdpscanner tool
 for Qt5Bluetooth
In-Reply-To: <91eced6b-28ba-4cc4-aec7-ef30d7875fed@MAIL-SINTERS-01.sinters-int.fr>
References: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
 <CAGm1_ktt4d7ELbUUuEyPX6qiEvXbBdOGhkiC4+yu_s3K6VP4kw@mail.gmail.com>
 <5702CDE4.1080703@mind.be>
 <20160419001020.4db2ac0a@free-electrons.com>
 <91eced6b-28ba-4cc4-aec7-ef30d7875fed@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <20160419132603.3d96829c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

Thanks for looking into this!

On Tue, 19 Apr 2016 10:53:50 +0000, Julien CORJON wrote:

> > -$(INSTALL_PROGRAM) ../../lib/$(TARGET) $(INSTALL_ROOT)/home/test/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/$(TARGET)
> 
> Just made a bit of digging into qt5base source. This behaviour is from 
> qtbase/qmake/generators/unix/unixmake.cpp : 
> UnixMakefileGenerator::defaultInstall . Even if I understand how it 
> append the full path after the $(INSTALL_ROOT) I cannot understand the 
> why...

My guess is that since were passing -sysroot $(STAGING_DIR) to qt5's
configure script, this sysroot pass get prefixed everywhere.

> We can (and probably should) fix this misfunction but we will have to 
> force DESTDIR to staging and target in all qmake-based packages.

That's not a big deal, we're doing this for autotools packages already,
and it should be the normal thing to do.

Ideally, the installation for staging should be:

	$(MAKE) -C $(@D) INSTALL_ROOT=$(STAGING_DIR) install

and for the target:

	$(MAKE) -C $(@D) INSTALL_ROOT=$(TARGET_DIR) install

> Fixing only defaultInstall should keep qmake "automagically". Also It
> will be difficult to push such modification in Qt mainline.

Well, we need to understand why Qt behaves this way, and fix it
properly.

> > so in essence, they fixup the generated Makefile after the fact so
> > that they don't contain the hardcoded sysroot path. If we can't
> > find a clean solution with qmake, maybe that's a possible solution
> > to simplify the target installation of all those qt5 packages.
> 
> How can we handle this kind of fixup with make *-install-staging / * 
> -install-target?

We could have a generic "fixup" macro, which we register in all qt5
packages as a post-configure hook or something like that.

> > One thing I wonder is how packages like qwt or quazip get properly
> > installed to the target/staging, since they do use INSTALL_ROOT. I
> > had a quick look at quazip, and its Makefiles are correct, they
> > contain:
> >
> > -$(INSTALL_FILE) /home/test/buildroot/output/build/quazip-0.7.2/quazip/crypt.h
> > $(INSTALL_ROOT)/usr/include/quazip/
> >
> > I'm puzzled. Some Qt5 person to chime in and look into this problem?
> 
> I'm puzzled too on that one...

I think I might an idea for this one: we're passing
-headerdir /usr/include/qt5 to qt5's configure script, so the sysroot
path doesn't get prepended for header files installation.

Argh, no, not possible: this would mean that the other Qt5 packages
would install their headers in /usr/include, which is not the case.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
