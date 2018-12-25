From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Dec 2018 13:48:18 +0100
Subject: [Buildroot] [PATCH 2/2] boot/systemd-boot: new package
In-Reply-To: <CADvTj4riYDgsZKYbWOi8KnB6PJXmKHpOm_n=rPGup=_z86JjUQ@mail.gmail.com>
References: <1545176489-17146-1-git-send-email-james.hilliard1@gmail.com>
 <1545176489-17146-2-git-send-email-james.hilliard1@gmail.com>
 <20181224212655.GG2703@scaer>
 <CADvTj4riYDgsZKYbWOi8KnB6PJXmKHpOm_n=rPGup=_z86JjUQ@mail.gmail.com>
Message-ID: <20181225124818.GK2703@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-24 16:44 -0600, James Hilliard spake thusly:
> On Mon, Dec 24, 2018 at 3:26 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-12-19 07:41 +0800, james.hilliard1 at gmail.com spake thusly:
> > > From: James Hilliard <james.hilliard1@gmail.com>
[--SNIP--]
> > > +     select BR2_PACKAGE_SYSTEMD_BOOT if BR2_INIT_SYSTEMD
> > I think it is much more simple if you just do:
> >     depends on !BR2_PACKAGE_SYSTEMD
[--SNIP--]
> > That way, you don't have to need to be schizophrenic about being a
> > generic-package or a meson-package. Just be a meson-package.
> So I ended up doing things this way so that the systemd-boot package
> is used for the image installation regardless of where the bootloader
> is compiled.

Well, I don;t think that is interesting, becasue the duplication is not
so big. There are in fact just a very few commands to do.

Besides, with the way you split the patches, if only the first one is
applied, then the boot files are in fact not installed. So that is not
good. You need to ensure that the series is functional (and makes sense)
even if only partially applied.

> > > +     select BR2_PACKAGE_UTIL_LINUX
> > > +     select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> >
> > Beware, that libblkid uses fork(), so needs an MMU, so you need to
> > propagate that dependency with (the comment is to indicate that it's an
> > inherited dependency):
> >
> >     depends on BR2_USE_MMU # util-linux' libblkid
> >
> > But since we're only building the boot blobs, can we do away without
> > util-linux?
> The issue I was running into here is that systemd's meson build system
> will not work without util-linux, even though util-linux does not need
> to be installed for the bootloader to function.

I made a very small patch to no longer require that, but it is
definietely not upstreamable. See below...

> > Looking at an impothetical situation (e.g. recovery system, or a
> > first-stage initramfs...):
> >
> >     minimalist system with just busybox,
> >   - systemd-boot as bootloader
> >
> > this would force having util-linux library, even though nothing would
> > use them...
> Yeah, this isn't ideal, from my discussions with systemd upstream
> there would need to be a major refactoring of their meson build system
> to allow building systemd-boot without util-linux.

OK, I found your PR: https://github.com/systemd/systemd/pull/11141
Next time you say "I talked with upstream", please add a pointer, so we
can go and see the discussion without asking you to explain all of it
again. ;-)

> Is there a way to
> satisfy the util-linux requirement without actually installing
> util-linux into the target?

Needs a patch, see below...

> > > diff --git a/boot/systemd-boot/buildroot.conf b/boot/systemd-boot/buildroot.conf
> > > diff --git a/boot/systemd-boot/loader.conf b/boot/systemd-boot/loader.conf
> > I see that your previous patch in systemd did not provide thoose two
> > files.
> I think I just had them in a different place, I'm not actually sure
> how useful it is to provide this since most setups will need to
> customize them in their post-image.sh. I included them since other
> packages like grub and gummiboot also provide defaults.

As I said previously, I don't think it is a good idea. And as explained
above, that means your series is not working is only the first patch is
applied.

[--SNIP--]
> > > +SYSTEMD_BOOT_SITE = $(call github,systemd,systemd,v$(SYSTEMD_BOOT_VERSION))
> > > +SYSTEMD_BOOT_DL_SUBDIR = systemd
> > Yes! :-)

In fact, it does not work as expected, because the generated tarball is
named ''systemd-boot-239.tar.gz instead of 'systemd-239.tar.gz'.

But it can be made to work by adding an explicit:

    SYSTEMD_BOOT_SOURCE = systemd-$(SYSTEMD_BOOT_VERSION).tar.gz

[--SNIP--]
> > > +ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
> > > +define SYSTEMD_BOOT_BUILD_CMDS
> > > +     mkdir -p $(@D)/build/src/boot/efi
> > > +     cp $(TARGET_DIR)/usr/lib/systemd/boot/efi/systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi \
> > > +             $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi
> > > +     cp $(TARGET_DIR)/usr/lib/systemd/boot/efi/linux$(SYSTEMD_BOOT_IMGARCH).efi.stub \
> > > +             $(@D)/build/src/boot/efi/linux$(SYSTEMD_BOOT_IMGARCH).efi.stub
> > > +endef
> >
> > You can now also get rid of this trick.
> So I have things like this so that the bootloader built by the systemd
> package can be reused by the systemd-boot package.

Yeah, I understand why you did that (but you should have said so in the
commit log), and I still do not think it is worth the complexity.

Yet, to prove how much more simple it is if you just accept the little
duplication, and because I did not have anything better to do during
x-mas, please have a look at the series I prepared, last three commits
on:
    https://git.buildroot.org/~ymorin/git/buildroot/log?h=yem/systemd-boot

I tested building systemd-boot standalone, and it works (not sure it
boots, I did not run-test it). I however did not try to test-build the
config where it is provided by systemd itself; I'll let it to you as an
exercise. ;-)

Feel free to grab those commits and ammend them further if needed; if
not, just grab them and resend them (you can git-fetch from
git://git.buildroot.org/~ymorin/git/buildroot).

However, if you do add new features (TPM, more archs), please do so as
additional patches, so the whole series is easier to review.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
