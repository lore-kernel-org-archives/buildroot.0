From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Thu, 5 Sep 2013 07:58:28 -0500
Subject: [Buildroot] [PATCH 01/17] libsepol: new package
In-Reply-To: <20130905094446.3f139253@skate>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>	<1378336196-27403-2-git-send-email-clshotwe@rockwellcollins.com>
 <20130905094446.3f139253@skate>
Message-ID: <OF7340EC06.079EF0FB-ON86257BDD.00464188-86257BDD.004745F1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thanks for the quick review.  I have a few questions before I submit a new 
version of 
the patch.

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/05/2013 
02:44:46 AM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> You're introducing this new menu directly under "Target packages",
> while this package (and a few of the others you're adding) are
> libraries, so they should be under "Target packages -> Libraries".
> 
> I have nothing against adding both "Target packages -> Security" and
> "Target packages -> Libraries -> Security", but that would require a
> quick look at the existing packages that would also fit in those new
> categories.

I was hoping to keep all of the SELinux packages in one place to make it 
easier
to enable everything but I can move the libraries into a 
"Target packages -> Libraries -> Security" instead.

> > +LIBSEPOL_SITE = 
http://userspace.selinuxproject.org/releases/20130423/
> > +LIBSEPOL_LICENSE = LGPLv2.1
> 
> Is it really LGPLv2.1 or LGPLv2.1+ ? It's never said in the COPYING
> file, you'd have to look at the copyright headers without the source
> code.

I checked the source files and it is definitely LGPLv2.1+. I'll make that 
change.

> > +define LIBSEPOL_BUILD_CMDS
> > +   $(MAKE) -C $(@D) $(LIBSEPOL_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> 
> DESTDIR is most likely not needed in the build step.

Unfortunately, the Makefiles in the SELinux packages require DESTDIR to be 
specified
to determine setup include and library paths.  I thought it would be 
easier
to just work with the existing Makefiles rather than to rewrite them.

> > +define HOST_LIBSEPOL_INSTALL_CMDS
> > +   $(MAKE) -C $(@D) install $(HOST_LIBSEPOL_MAKE_CMDS) 
DESTDIR=$(HOST_DIR)
> > +   mv $(HOST_DIR)/lib/libsepol.so.1 $(HOST_DIR)/usr/lib
> > +   (cd $(HOST_DIR)/usr/lib; rm -f libsepol.so; ln -s libsepol.so.
> 1 libsepol.so)
> > +   -rmdir $(HOST_DIR)/lib
> 
> So I guess the problem here is that the library gets installed in /lib
> while you wanted it in /usr/lib. It's not very pretty but maybe you can
> cheat by passing DESTDIR=$(HOST_DIR)/usr.

Oh I wish these packages followed standard conventions.  They are 
purposefully 
installing the library in /lib and symlinking to it from /usr/lib. This 
little 
hack was created to correct this to match what most other packages do. 
If it is alright, I will just leave it like that and not worry about it 
(i.e. have the library install to /lib), otherwise I can patch the 
makefile 
to make it a little cleaner.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130905/13b73bbf/attachment.html>
