From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 15:19:49 +0200
Subject: [Buildroot] [PATCH 01/17] libsepol: new package
In-Reply-To: <OF7340EC06.079EF0FB-ON86257BDD.00464188-86257BDD.004745F1@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378336196-27403-2-git-send-email-clshotwe@rockwellcollins.com>
 <20130905094446.3f139253@skate>
 <OF7340EC06.079EF0FB-ON86257BDD.00464188-86257BDD.004745F1@rockwellcollins.com>
Message-ID: <20130905151949.2453e927@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton,

On Thu, 5 Sep 2013 07:58:28 -0500, clshotwe at rockwellcollins.com wrote:

> Thanks for the quick review.  I have a few questions before I submit a new 
> version of the patch.

Sure. Note that many of the comments I did on the first three patches
were identical, and apply to other patches in the series. If you could
rework the other patches according to those general comments, it would
be great (even though there will probably be other details to sort out
than those general comments).

> > I have nothing against adding both "Target packages -> Security" and
> > "Target packages -> Libraries -> Security", but that would require a
> > quick look at the existing packages that would also fit in those new
> > categories.
> 
> I was hoping to keep all of the SELinux packages in one place to make it 
> easier
> to enable everything but I can move the libraries into a 
> "Target packages -> Libraries -> Security" instead.

Well, libraries are normally 'selected' by the applications needing
them. So having the libraries separated from the programs is usually
not a big problem for the user, since library dependencies are
automatically pulled in when programs are enabled.

Moreover, we might end up later with a global knob 'I want SELinux' on
my system (depending on how the SELinux integration will look like),
and we can make that enable all the relevant packages automatically.

> > Is it really LGPLv2.1 or LGPLv2.1+ ? It's never said in the COPYING
> > file, you'd have to look at the copyright headers without the source
> > code.
> 
> I checked the source files and it is definitely LGPLv2.1+. I'll make that 
> change.

Ok.

> 
> > > +define LIBSEPOL_BUILD_CMDS
> > > +   $(MAKE) -C $(@D) $(LIBSEPOL_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> > 
> > DESTDIR is most likely not needed in the build step.
> 
> Unfortunately, the Makefiles in the SELinux packages require DESTDIR to be 
> specified
> to determine setup include and library paths.  I thought it would be 
> easier
> to just work with the existing Makefiles rather than to rewrite them.

Ah, right. libsepol isn't really concerned by this since it doesn't
have any dependency, but libselinux is indeed using DESTDIR at build
time to pass some include or library paths. It's a mistake of the build
system to think that the paths where things are at build time will be
the same as the one where things will be at run time, but anyway, in
this case it doesn't to cause any problem.

So, fine for passing DESTDIR= at build time, but since it's unusual,
maybe a comment above the BUILD_CMDS would be nice, like:

# DESTDIR= is needed at build time, as it's used by the Makefile to
# compute some library and header paths

(don't hesitate to fix my broken English as needed).

> > > +define HOST_LIBSEPOL_INSTALL_CMDS
> > > +   $(MAKE) -C $(@D) install $(HOST_LIBSEPOL_MAKE_CMDS) 
> DESTDIR=$(HOST_DIR)
> > > +   mv $(HOST_DIR)/lib/libsepol.so.1 $(HOST_DIR)/usr/lib
> > > +   (cd $(HOST_DIR)/usr/lib; rm -f libsepol.so; ln -s libsepol.so.
> > 1 libsepol.so)
> > > +   -rmdir $(HOST_DIR)/lib
> > 
> > So I guess the problem here is that the library gets installed in /lib
> > while you wanted it in /usr/lib. It's not very pretty but maybe you can
> > cheat by passing DESTDIR=$(HOST_DIR)/usr.
> 
> Oh I wish these packages followed standard conventions.  They are 
> purposefully 
> installing the library in /lib and symlinking to it from /usr/lib. This 
> little 
> hack was created to correct this to match what most other packages do. 
> If it is alright, I will just leave it like that and not worry about it 
> (i.e. have the library install to /lib), otherwise I can patch the 
> makefile to make it a little cleaner.

Ok, then probably what you did looks like the best compromise. Maybe a
little comment above that explains what you're doing this would be
good. Generally speaking, whenever something 'unusual' is done, it's
good to add a comment, which will help both at review time, but also at
maintenance time.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
