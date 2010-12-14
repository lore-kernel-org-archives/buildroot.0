From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Tue, 14 Dec 2010 11:33:08 -0800
Subject: [Buildroot] [PATCH] buildroot:linux: Add options to checkout
 Linux kernel source from SVN or GIT repository.
In-Reply-To: <AANLkTinnDf3BbYuU2HsvRMuoO2eezwoN-23e7z_cScSQ@mail.gmail.com>
References: <1292304542-29813-1-git-send-email-sonic.adi@gmail.com>
	<1292304542-29813-2-git-send-email-sonic.adi@gmail.com>
	<AANLkTinnDf3BbYuU2HsvRMuoO2eezwoN-23e7z_cScSQ@mail.gmail.com>
Message-ID: <20101214193307.GH23258@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

* Sonic Zhang <sonic.adi@gmail.com> [2010-12-14 17:12:01]:

> Please ignore this patch. I will send out a new version.

Ok, I'm looking forward to it (and to the other one). The download
mechanism still has some shortcomings.

For keeping the version control information, this folds in the "doing
application development with Buildroot" process discussion, which we
should really get going to discuss this and come up with a reasonable
solution (Thomas? Peter? do you have any input on this?).

As for the Linux kernel, I am running into the same problem as well (not
only for the kernel, but for any non-package software like bootloaders),
so we need to find a common way of downloading sources from the web,
Svn, Git or whatever, being in the GENTARGETS infrastructure or not.
Here again, any input is most welcome so we can design the appropriate
solution (see my email on X-Loader support for a few more insights on
this).

- Maxime

> 
> 
> Sonic Zhang
> 
> On Tue, Dec 14, 2010 at 1:29 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> > From: Sonic Zhang <sonic.zhang@analog.com>
> >
> > Current buildroot Config.in and linux.mk don't support kernel source in SVN
> > or GIT repository. A pre-checkouted local SVN or GIT kernel tree set in
> > KERNEL_CUSTOM_TREE is the only option. Because the local path can be anywhere,
> > no buildroot default config file can be defined in sub folder
> > target/device/company/boards to run quick building. It is inconvient to run
> > regression testing. Since buildroot has already support SVN and GIT repository
> > for application packages, it is reasonable to have it for linux kernel as well.
> >
> > Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> > ---
> > ?linux/Config.in | ? 19 ++++++++++++++++++-
> > ?linux/linux.mk ?| ? 24 +++++++++++++++++++++++-
> > ?2 files changed, 41 insertions(+), 2 deletions(-)
> >
> > diff --git a/linux/Config.in b/linux/Config.in
> > index 480adca..07b08e2 100644
> > --- a/linux/Config.in
> > +++ b/linux/Config.in
> > @@ -52,6 +52,10 @@ config BR2_LINUX_KERNEL_CUSTOM_TREE
> > ? ? ? ?help
> > ? ? ? ? ?This option allows use of an already unpacked linux tree.
> >
> > +config BR2_LINUX_KERNEL_CUSTOM_REPOSITORY
> > + ? ? ? bool "Custom source repository"
> > + ? ? ? help
> > + ? ? ? ? This option allows to specify the svn or git repository.
> > ?endchoice
> >
> > ?config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
> > @@ -67,12 +71,25 @@ config BR2_LINUX_KERNEL_CUSTOM_PATH
> > ? ? ? ?string "PATH of custom kernel tree"
> > ? ? ? ?depends on BR2_LINUX_KERNEL_CUSTOM_TREE
> >
> > +config BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_LOCATION
> > + ? ? ? string "URL of custom kernel repository"
> > + ? ? ? depends on BR2_LINUX_KERNEL_CUSTOM_REPOSITORY
> > + ? ? ? help
> > + ? ? ? ? This is either the clone URL of GIT or trunk/tag/branch URL of SVN.
> > +
> > +config BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_VERSION
> > + ? ? ? string "revision(svn/git), tag(git) or branch(git) of custom kernel source"
> > + ? ? ? depends on BR2_LINUX_KERNEL_CUSTOM_REPOSITORY
> > + ? ? ? default "HEAD"
> > + ? ? ? help
> > + ? ? ? ? Tag or branch of GIT repository should be filled in here.
> > +
> > ?config BR2_LINUX_KERNEL_VERSION
> > ? ? ? ?string
> > ? ? ? ?default "2.6.36" if BR2_LINUX_KERNEL_2_6_36
> > ? ? ? ?default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
> > ? ? ? ?default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
> > - ? ? ? default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL || BR2_LINUX_KERNEL_CUSTOM_TREE
> > + ? ? ? default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL || BR2_LINUX_KERNEL_CUSTOM_TREE || BR2_LINUX_KERNEL_CUSTOM_REPOSITORY
> >
> > ?#
> > ?# Patch selection
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 4b680fd..55fddfa 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -7,11 +7,33 @@ LINUX26_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> >
> > ?# Compute LINUX26_SOURCE and LINUX26_SITE from the configuration
> > ?ifeq ($(LINUX26_VERSION),custom)
> > +
> > +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_REPOSITORY),y)
> > +PKG:=LINUX26
> > +LINUX26_SITE:=$(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_LOCATION))
> > +LINUX26_DL_VERSION:=$(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_VERSION))
> > +
> > +ifeq ($(findstring svn://,$(LINUX26_SITE)),svn://)
> > +LINUX26_SITE_METHOD:=svn
> > +LINUX26_DL_DIR:=linux-$(notdir $(LINUX26_SITE))
> > +else
> > +LINUX26_SITE_METHOD:=git
> > +LINUX26_DL_DIR:=linux-$(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_VERSION))
> > +LINUX26_BRANCH:=$(LINUX26_DL_VERSION)
> > +endif
> > +
> > +LINUX26_BASE_NAME:=$(LINUX26_DL_DIR)
> > +LINUX26_SOURCE:=$(LINUX26_DL_DIR).tar.gz
> > +else
> > +
> > ?ifneq ($(BR2_LINUX_KERNEL_CUSTOM_TREE),y)
> > ?LINUX26_TARBALL:=$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
> > ?LINUX26_SITE:=$(dir $(LINUX26_TARBALL))
> > -LINUX26_SOURCE:=$(notdir $(LINUX26_TARBALL))
> > +LINUX26_SOURCE:=linux-$(notdir $(LINUX26_TARBALL))
> > ?endif
> > +
> > +endif
> > +
> > ?else
> > ?LINUX26_SOURCE:=linux-$(LINUX26_VERSION).tar.bz2
> > ?LINUX26_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
> > --
> > 1.6.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Maxime Petazzoni <http://www.bulix.org>
 ``One by one, the penguins took away my sanity.''
Writing software in California
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/cebdf594/attachment.pgp>
