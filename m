From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Jun 2019 16:50:20 +0200
Subject: [Buildroot] [PATCH 0/4] Sanetize packages version
In-Reply-To: <627e16bb-a937-a00e-7d03-7373c69433ca@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612092624.1ca7836d@windsurf>
 <627e16bb-a937-a00e-7d03-7373c69433ca@bootlin.com>
Message-ID: <20190612165020.441113ee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jun 2019 10:39:18 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> >  (2) As suggested by Victor, add a separate variable that tells the Git
> >      download logic what is the actual tag/version to fetch, i.e:
> > 
> >     AT_VERSION = 3.1.23
> >     AT_GIT_COMMIT = release/$(AT_UPSTREAM_VERSION)
> > 
> > Perhaps option (1) is the easiest ? But it has the drawback that
> > <pkg>_VERSION doesn't contain just the actual version, but like we do
> > today, some possibly semi-random stuff in addition to the version (like
> > "release/1.2.3" or "foo-1.2.3).  
> 
> Changing the version variable does not impact the archive name inside
> the DL_DIR.

Which type of packages are you talking about here ? Github-fetched
packages (which are in fact regular tarballs), regular tarballs, or
Git-fetched packages.

> For these packages the tarball name is the one specify in
> the <pkg>_SOURCE variable which stay the same after the patch.

I am not sure what the "these" in "these packages" refers to.

> In contrast, all github fetched packages are impacted by changing the
> <pkg>_VERSION variable and as you point out, this cause a re-download on
> client side (on the server side we could use hardlinks so the disk-space
> is not impacted). I would add that it also impact the hash file that
> needs to match the new archive name.

I am not sure to follow you here. Are you saying that what Arnout
proposed doesn't work ? Or that it works ?

> >> Also, there are a few packages that use the <pkg>_VERSION variable to store
> >> more than just the version. For example gap-madam-bin-maxi have a suffix  
> > 
> > I don't see a gap-madam-bin-maxi package in Buildroot. I am missing
> > something ?  
> 
> Oupsy, I don't know what appended here, I meant the gpu-amd-bin-mx51
> subpackage of freescale-imx which is suffixed by either "-fb" or "-x11".

For this one, I believe it is a mistake for the "version" to contain
-fb or -x11, the package should do this:

GPU_AMD_BIN_MX51_VERSION = 11.09.01
ifeq ($(BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_FB),y)
GPU_AMD_BIN_MX51_SOURCE = amd-gpu-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)-fb.bin
else
GPU_AMD_BIN_MX51_SOURCE = amd-gpu-x11-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)-x11.bin
GPU_AMD_BIN_MX51_DEPENDENCIES = libxcb xlib_libX11 xlib_libXext \
        xlib_libXrender xlib_libXau xlib_libXdmcp
endif

> > Kodi has two different entries in release-monitoring.org:
> > 
> >  https://release-monitoring.org/project/5511/, which has only the
> >  version, but seems to be outdated
> > 
> >   https://release-monitoring.org/project/20547/, which has the version
> >   + codename, and seems to be updated
> > 
> > So it looks like we should use the second one, and therefore keep the
> > code name ?  
> 
> The second entry was not originally present. I added it myself because
> as you say the first one is pretty outdated. I preferred add a new entry
> rather than edit the existing one because the version scheme changed
> (this is now using the github repo) and could break one of the multiple
> disto that already map kodi.

OK, but then it answers your initial question: for Kodi itself, we
should use the "17.3-Foo" string as the version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
