From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 28 Jul 2008 18:50:03 +1000
Subject: [Buildroot] Makefile.autotools.in does not work
	wellwith	projects
In-Reply-To: <1217234557.7955.8.camel@localhost>
References: <1216910589.29392.18.camel@localhost>
	<20080725001242.GB25141@cloud.net.au>
	<80DE307AE1CF4656A7072295EA2408F8@aeglos>
	<20080727013317.GA1706@cloud.net.au>
	<1217234557.7955.8.camel@localhost>
Message-ID: <20080728085003.GA22274@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 28, 2008 at 10:42:37AM +0200, Hans-Christian Egtvedt wrote:
> On Sun, 2008-07-27 at 11:33 +1000, Hamish Moffatt wrote:
> > On Sat, Jul 26, 2008 at 08:53:43AM +0200, Ulf Samuelsson wrote:
> > > Subject: Re: [Buildroot] Makefile.autotools.in does not work wellwith  
> > > projects
> > >
> > >> On Thu, Jul 24, 2008 at 04:43:09PM +0200, Hans-Christian Egtvedt wrote:
> > >>> The Makefile.autotools.in uses a rule which touches a
> > >>> stamp_target_installed file, this does not work well with projects.
> > >>>
> > >>> The Makefile should depend on a file on the target root file system,
> > >>> file not there => install to target again.
> > >>
> > >> Indeed - install stamps are pure evil. They don't work with multiple
> > >> projects and they mean you can't "rm -rf
> > >> project_build_$(ARCH)/$(PROJECT)/root".
> > >
> > > I do not think that you want to have install stamps in the root file system
> > > because they will end up in the target (unless they are ignored when
> > > the rootfs is created).
> > 
> > I don't think you should use stamps at all - test for a target file
> > instead.
> 
> And two minutes later I have a RFC for this solution, see attached
> patch.
[..]
>  # Install to target dir
> -$(BUILD_DIR)/%/.stamp_target_installed:
> +$(TARGET_DIR)/%/$($($(PKG)_NAME)_TARGET_INSTALLED_TOUCH_FILE):
>  	$(call MESSAGE,"Installing to target")
> -	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
> +	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $($(PKG)_DIR)/$($(PKG)_SUBDIR)
[..]
>  # define sub-target stamps
> -$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
> +$(2)_TARGET_INSTALL_TARGET =	$$(TARGET_DIR)/$$($(2)_TARGET_INSTALLED_TOUCH_FILE)

Will every package that uses Makefile.autotools.in need to be modified
to define the target installed file? If so, would you like to prepare a
large patch? :) Alternatively, perhaps $(2)_TARGET_INSTALL_TARGET could
be fall back to the old definition if the new variable is not supplied,
using some ifeq logic.

Thanks for working on this!
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
