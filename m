From: Matthew Starr <mstarr@hedonline.com>
Date: Tue, 3 Nov 2015 12:38:04 -0600
Subject: [Buildroot] [PATCH] wf111: fix overwriting module files during
	install
In-Reply-To: <20151103183410.0e80264e@free-electrons.com>
References: <1446569533-25368-1-git-send-email-antoine.tenart@free-electrons.com>
 <20151103183410.0e80264e@free-electrons.com>
Message-ID: <64CA5C49A43E314D9F7DAE05370E2F7B06771306@hed-dc01.hed.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

The problem with this is the wf111 package depends on the manufacturer's
build and install method through their makefile included in the binary
file
they provide as an input to the wf111 package.  This is a single step
build and
install process.

You could make a new set of steps to build and install in the wf111.mk
file,
but then any manufacturer changes in future versions of the software
could and most likely will break the wf111.mk file.

Best regards,
 
Matthew Starr

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Tuesday, November 03, 2015 11:34 AM
> To: Antoine Tenart
> Cc: buildroot at busybox.net; Matthew Starr
> Subject: Re: [Buildroot] [PATCH] wf111: fix overwriting module files
during
> install
> 
> Dear Antoine Tenart,
> 
> On Tue,  3 Nov 2015 17:52:13 +0100, Antoine Tenart wrote:
> > From: Matthew Starr <mstarr@hedonline.com>
> >
> > When installing the WF111 modules, the module.* files generated
during
> > the kernel compilation were overrided. This ended up having the
wrong
> > information about the modules compiled in a given image (and only
the
> > one about the WF111 module). This could be verified using the
> > "modprobe -l" command, with only the wf111 module showing up.
> >
> > This patch fixes this, by removing the manual copy of the generated
> > files (in WF111_INSTALL_TARGET_CMDS) and by instead using the build
> > command to populate our target directory, containing the module.*
> > files. This way the files are not overrided but instead updated with
> > the additional WF111 informations.
> >
> > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> > Tested-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> > ---
> >  package/wf111/wf111.mk | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk index
> > 479d665760b1..e63a1d2a19c7 100644
> > --- a/package/wf111/wf111.mk
> > +++ b/package/wf111/wf111.mk
> > @@ -24,11 +24,7 @@ endif
> >  define WF111_BUILD_CMDS
> >  	$(MAKE) -C $(@D) PWD=$(@D) \
> >  		$(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
> > -		install_static
> > -endef
> > -
> > -define WF111_INSTALL_TARGET_CMDS
> > -	cp -dpfr $(@D)/output/* $(TARGET_DIR)
> > +		OUTPUT=$(TARGET_DIR) install_static
> >  endef
> >
> >  $(eval $(generic-package))
> 
> This is not great. Having WF111_BUILD_CMDS install things is wrong.
> Please make sure the build step is separate from the install step.
> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
http://free-electrons.com
