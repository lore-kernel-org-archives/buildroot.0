From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 15 Apr 2019 12:08:23 +0300
Subject: [Buildroot] [RFC 1/1] infra/pkg-generic: Add rootfs post gen
 hook
In-Reply-To: <4693_1555318434_5CB446A2_4693_25_6_20190415085342.GH3490@r-lnx-nyma7486-2>
References: <20190415002635.3656-1-vadim4j@gmail.com>
 <20190415085819.1d5c4152@windsurf>
 <20190415073354.sld7grmlyjo6i24a@vkochan-ThinkPad-T470p>
 <7346_1555315114_5CB439AA_7346_454_2_20190415075822.GG3490@r-lnx-nyma7486-2>
 <20190415084238.GA13866@lwo1-lhp-f71841>
 <4693_1555318434_5CB446A2_4693_25_6_20190415085342.GH3490@r-lnx-nyma7486-2>
Message-ID: <20190415090823.GA17773@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Apr 15, 2019 at 10:53:42AM +0200, yann.morin at orange.com wrote:
> Vadym, All,
> 
> On 2019-04-15 11:42 +0300, Vadym Kochan spake thusly:
> > On Mon, Apr 15, 2019 at 09:58:22AM +0200, yann.morin at orange.com wrote:
> > > Vadim, All,
> > > 
> > > On 2019-04-15 10:33 +0300, Vadim Kochan spake thusly:
> > > > On Mon, Apr 15, 2019 at 08:58:19AM +0200, Thomas Petazzoni wrote:
> > > > > Hello Vadim,
> > > > > 
> > > > > On Mon, 15 Apr 2019 03:26:35 +0300
> > > > > Vadim Kochan <vadim4j@gmail.com> wrote:
> > > > > 
> > > > > > Add ability to generate image by custom package, and one of the
> > > > > > way to do it - is to add new $(PKG)_ROOTFS_POST_GEN_HOOK which will be
> > > > > > called after rootfs image is ready. This allows to have easier
> > > > > > alternative to post-image script in form of package, which might be
> > > > > > just selected by the user (or this package might be automatically
> > > > > > selected already already).
> > > > > 
> > > > > Hum, this description is a bit vague/fuzzy to me. Do you have a
> > > > > specific example that requires this rootfs post gen hook ?
> > > > > 
> > > > 
> > > > The use case is simple - allow to generate firmware image by custom
> > > > package instead of post-image script. I did not find some dependencies
> > > > or other hook to make it installed after rootfs image is ready, so only
> > > > option I found is to add yet-another-hook which will be called after
> > > > rootfs image is generated.
> > > 
> > > If you have a custom tool to generate a custom image, why don't you also
> > > provide a custom filesystem implementation of your own in fs/your-fs/
> > > like any other filesystem ?
> > > 
> > > Note that a filesystem can also be defined in a br2-external tree.
> > > 
> > 
> > Yes, I understand but this is not for fs image generation but for the
> > final firmware image (for flashing, e.g. sdcard image), for example:
> > 
> > 	https://github.com/vkochan/buildroot-external-rpi/blob/master/package/rpi-image/rpi-image.mk
> 
> I perfectly understand what this is about. But now, say that there are
> two (or more) packages that must provide a set of tools to run in
> sequence on the generated filesystem?
> 
> For example, the first is an incantation of genimage or some such, and
> the second one does a signature, and so on?
> 
> How would your proposal cover this?
Good point! Actually the package will cover genimage invocation, the
rest is still possible to handle in user's post-image (which will be called
after $(TARGETS_ROOTFS).

> 
> This is exactly what post-image is for: to be able to provide whatever
> project-specific, board-specific (etc..) tooling to run after filesystems
> have been generated.
> 
> Besides, your rpi-image stuff does not even solve your (non-)problem,
> because your project-specific defconfig still has to enable that package
> anyway, so it is not different than having a post-image script listed
> in the defconfig.
> 
Well the package is automatically selected by default if RPI's top
option is enabled (in ${EXTERNAL}/Config.in, actually it is 'implied',
so it can be easy disabled via menuconfig).

Thanks,
Vadim Kochan
