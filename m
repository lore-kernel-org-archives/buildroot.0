From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 16 Feb 2021 21:45:38 +0100
Subject: [Buildroot] [PATCH] package/uboot-tools: depend on u-boot when
 selected
In-Reply-To: <20210216212321.0da56ad2@windsurf.home>
References: <20210216142007.24983-1-patrickdepinguin@gmail.com>
 <20210216212321.0da56ad2@windsurf.home>
Message-ID: <CAAXf6LW2FGLwN48D_AswkF2jQm1QRRmvRW3UV=bqnh=3e5rKtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 16, 2021, 21:23 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Tue, 16 Feb 2021 15:20:07 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > The envimage creation logic only depended on u-boot when the user did not
> > specify a custom envimage source via
> > BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE . This assumes that a
> > user-provided envimage source is never coming from the u-boot source
> > tree.
> >
> > But especially given the fact that the envimage creation logic used to be
> > part of the u-boot package, this is a realistic scenario: users may have
> > provided a value of BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE based on
> > $(UBOOT_DIR), e.g.:
> >
> >     $(UBOOT_DIR)/board/foo-vendor/bar-board/env.txt
> >
> > Therefore, always add the u-boot dependency if u-boot is selected, for
> > either case of custom or default envimage source.
> >
> > Signed-off-by: Thomas De Schampheleire <
> thomas.de_schampheleire at nokia.com>
> > ---
> >  package/uboot-tools/uboot-tools.mk | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
>
> I've applied to master, after slightly reworking the logic. Indeed you
> had this:
>
> ifeq ($(env):$(uboot),:y)
> ...
> endif
>
> ifeq ($(uboot),y)
> ...
> endif
>
> Which I modified to:
>
> ifeq ($(uboot),y)
> ...
>
> ifeq ($env),)
> ...
> endif
> endif


Ok, perfect, thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210216/a4e40095/attachment.html>
