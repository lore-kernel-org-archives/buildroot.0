From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Sun, 15 Dec 2013 14:01:02 -0600
Subject: [Buildroot] [PATCH v3 2/2] manual: update for multiple global
 patch dirs
In-Reply-To: <52AB41BA.3070200@mind.be>
References: <1386929361-21376-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1386929361-21376-2-git-send-email-rjbarnet@rockwellcollins.com>
 <52AB41BA.3070200@mind.be>
Message-ID: <OF2FA8E811.C335DBDC-ON86257C42.006D5F8D-86257C42.006DF537@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Arnout Vandecappelle <arnout@mind.be> wrote on 12/13/2013 11:19:54 AM:
 
> On 13/12/13 11:09, Ryan Barnett wrote:
[...]

> > diff --git a/docs/manual/customize-packages.txt 
b/docs/manual/customize-packages.txt
> > index 1820c54..8955756 100644
> > --- a/docs/manual/customize-packages.txt
> > +++ b/docs/manual/customize-packages.txt
> > @@ -8,16 +8,68 @@ It is sometimes useful to apply 'extra' patches to 
packages - over and
> >   above those provided in Buildroot. This might be used to support 
custom
> >   features in a project, for example, or when working on a new 
architecture.
> >
> > -The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
> > -used to specify a directory containing global package patches.
> > +The +BR2_GLOBAL_PATCH_DIR+ configuration option can be used to 
specify
> > +a space separated list of one or more directories containing global
> > +package patches. By specifying multiple global patch directories, a
> 
>   I think "global package patches" sounds strange. It's the directory 
> that is global, not the patches or the packages. So I'd just sai 
"package 
> patches".

Agree.

> > +user could implement a layered approach to patches. This could be
> > +useful when a user has multiple boards that share a common processor
> > +architecture. It is often the case that a subset of patches for a
> > +package need to be shared between the different boards a user has.
> > +However, each board may require specific patches for the package
> > +that build on top of the common subset of patches.
> >
> > -For a specific version <packageversion> of a specific package 
<packagename>,
> > -patches are applied as follows.
> > +For a specific version +<packageversion>+ of a specific package
> > ++<packagename>+, patches are applied as follows:
> >
> > -First, the default Buildroot patch set for the package is applied.
> > +. First, the default Buildroot patch set for the package is applied.
> >
> > -If the directory 
+$(BR2_GLOBAL_PATCH_DIR)/<packagename>/<packageversion>+
> > -exists, then all +*.patch+ files in the directory will be applied.
> > +. Then for every directory - +<global-patch-dir>+ - that exists in
> > +  +BR2_GLOBAL_PATCH_DIR+, the following will be done:
> > ++
> > +* If the directory
> > +  +<global-patch-dir>/<packagename>/<packageversion>/+ exists, then
> > +  all *.patch files in this directory will be applied.
> > ++
> > +* Otherwise, if the directory +<global-patch-dir>/<packagename>+ 
exists,
> > +  then all *.patch files in the directory will be applied.
> 
>   I would repeat here the explanation about the order in which patches 
> are applied, and the recommendation to number them.
> 
> The patches in each directory are applied in alphabetical order. So, to 
> ensure they are applied in the right order, it is highly recommended to 
> name the patch files like this:
> +<packagename>-<number>-<description>.patch+, where +<number>+ refers to 

> the 'apply order'.

Agree.

> >
> > -Otherwise, if the directory +$(BR2_GLOBAL_PATCH_DIR)/<packagename>+
> > -exists, then all +*.patch+ files in the directory will be applied.
> > +The +BR2_GLOBAL_PATCH_DIR+ option is the preferred method for
> > +specifying a custom patch directory for packages. It can be used to
> > +specify a patch directory for any package in buildroot. It should 
also
> > +be used in place of the custom patch directory options for Linux,
> > +U-Boot, and other packages that already haved custom patch directory
> > +options available to them. By doing this, it will allow a user to
> > +manage their patches from one top-level directory.
> 
>   Actually, BR2_LINUX_KERNEL_PATCH also supports downloading the patch, 
> which is not possible with BR2_GLOBAL_PATCH_DIR. As to the others, I 
> think these options should just be removed (not deprecated, but really 
> removed, with a clear explanation in Config.in.legacy). And in that case 

> this paragraph becomes redundant.

I will make note of the BR2_LINUX_KERNEL_PATCH supporting the downloading 
of the patch and that is the only way that it should be used. However, I 
would rather submit a separate patch series to deprecate the other 
options. Is this OK with you?

> > +
> > +An example directory structure for where a user has multiple
> > +directories specified for +BR2_GLOBAL_PATCH_DIR+ may look like this:
> > +
> > +-----
> > +board/
> > ++-- common-fooarch
> > +|   +-- patches
> > +|       +-- linux
> > +|       |   +-- linux-patch1.patch
> > +|       |   +-- linux-patch2.patch
> > +|       +-- u-boot
> > +|       +-- foopkg
> > ++-- fooarch-board
> > +    +-- patches
> > +        +-- linux
> > +        |   +-- linux-patch3.patch
> > +        +-- u-boot
> > +        +-- foopkg
> > +-----
> > +
> > +If the user has the +BR2_GLOBAL_PATCH_DIR+ configuration option set 
as
> > +follows:
> > +
> > +-----
> > +BR2_GLOBAL_PATCH_DIR="board/common-fooarch board/fooarch-board"
> > +-----
> > +
> > +Then the patches would applied as follows for the Linux kernel:
> > +
> > +. board/common-fooarch/patches/linux/linux-patch1.patch
> > +. board/common-fooarch/patches/linux/linux-patch2.patch
> > +. board/fooarch-board/patches/linux/linux-patch1.patch
> 
>   It's actually patch3 in the example above...

I'll fix that.

> > diff --git a/docs/manual/patch-policy.txt 
b/docs/manual/patch-policy.txt
> > index d9bc8ca..26586ad 100644
> > --- a/docs/manual/patch-policy.txt
> > +++ b/docs/manual/patch-policy.txt
> > @@ -50,8 +50,9 @@ Global patch directory
> >   ^^^^^^^^^^^^^^^^^^^^^^
> >
> >   The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
> > -used to specify a directory containing global package patches. See
> > -xref:packages-custom[] for details.
> > +used to specify a space separated list of one or more directories
> > +containing global package patches. See xref:packages-custom[] for
> > +details.
> >
> >
> >   How patches are applied
> > @@ -72,11 +73,15 @@ How patches are applied
> >   +
> >   * Otherwise, patch files matching +<packagename>-*.patch+
> >     are applied in alphabetical order.
> > -  So, to ensure they are applied in the right order, it is hightly
> > -  recommended to named the patch files like this:
> > +  So, to ensure they are applied in the right order, it is highly
> > +  recommended to name the patch files like this:
> >     +<packagename>-<number>-<description>.patch+, where +<number>+
> >     refers to the 'apply order'.
> >
> > +. If +BR2_GLOABL_PATCH_DIR+ is defined, the directories will be
> > +  enumerated in the order they are specified for patches. The patches
> 
>   I think the "for patches" here is meaningless.

Agree.

Thanks,
-Ryan

[...]
