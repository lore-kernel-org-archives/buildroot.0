From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 24 Dec 2018 16:44:43 -0600
Subject: [Buildroot] [PATCH 2/2] boot/systemd-boot: new package
In-Reply-To: <20181224212655.GG2703@scaer>
References: <1545176489-17146-1-git-send-email-james.hilliard1@gmail.com>
 <1545176489-17146-2-git-send-email-james.hilliard1@gmail.com>
 <20181224212655.GG2703@scaer>
Message-ID: <CADvTj4riYDgsZKYbWOi8KnB6PJXmKHpOm_n=rPGup=_z86JjUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 24, 2018 at 3:26 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2018-12-19 07:41 +0800, james.hilliard1 at gmail.com spake thusly:
> > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > This is essentially the successor to gummiboot.
> >
> > This package will use the existing systemd-boot binaries when systemd
> > init is selected.
>
> I find this commit log a bit terse...
>
> When the packaging is non trivial, like this one, it is important to
> write in the commit log all the tricks that are used in the package.
>
> For example, you could start with something simple:
>
>     systemd-boot is part of the systemd source tree.
>
> Then, add a quick blurb about the patches:
>
>     To avoid duplication, we just symlink the patches from systemd.
>
> Then you should probably explain how you solved the dependency against
> systemd:
>
>
>     When systemd is enabled (as the init system), enabling the
>     systemd-boot package will simply select the corresponding
>     option in the systemd package. In this case, the systemd-boot
>     package is a generic-package, that builds nothing and isntall
>     othing, delegating everything to the systemd package.
>
>     When system is disabled, enabling the systemd-boot package will
>     actually build and install the boot blobs. To avoid building a
>     complete systemd, we explicitly request the build of each
>     individual blobs, and manually copy them at install time.
>
> And now, with this explanations, I will be able to properly question
> that design! ;-)
>
> See below...
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> [--SNIP--]
> > diff --git a/boot/systemd-boot/Config.in b/boot/systemd-boot/Config.in
> > new file mode 100644
> > index 0000000..922bb07
> > --- /dev/null
> > +++ b/boot/systemd-boot/Config.in
> > @@ -0,0 +1,24 @@
> > +config BR2_TARGET_SYSTEMD_BOOT
> > +     bool "systemd-boot"
> > +     depends on BR2_i386 || BR2_x86_64
>
> You'll need to get this architecture list in sync with the one in
> systemd. I would suggest that you limit yourself to what you can test
> and are interested in.
Since systemd-boot only supports a few architectures here
https://github.com/systemd/systemd/blob/06da5c63dd697ea4087e76c6d809b60b5780b87c/meson.build#L1386-L1395
I should be able to add support for the others fairly easily in my
next version.
>
> > +     select BR2_PACKAGE_SYSTEMD_BOOT if BR2_INIT_SYSTEMD
>
> I think it is much more simple if you just do:
>
>     depends on !BR2_PACKAGE_SYSTEMD
>
> and then add a comment (at the end of this Config.in)::
>
>     comment "systemd-boot is provided by systemd"
>         depends on BR2_PACKAGE_SYSTEMD
>
> That way, you don't have to need to be schizophrenic about being a
> generic-package or a meson-package. Just be a meson-package.
So I ended up doing things this way so that the systemd-boot package
is used for the image installation regardless of where the bootloader
is compiled.
>
> > +     select BR2_PACKAGE_UTIL_LINUX
> > +     select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>
> Beware, that libblkid uses fork(), so needs an MMU, so you need to
> propagate that dependency with (the comment is to indicate that it's an
> inherited dependency):
>
>     depends on BR2_USE_MMU # util-linux' libblkid
>
> But since we're only building the boot blobs, can we do away without
> util-linux?
The issue I was running into here is that systemd's meson build system
will not work without util-linux, even though util-linux does not need
to be installed for the bootloader to function.
>
> Looking at an impothetical situation (e.g. recovery system, or a
> first-stage initramfs...):
>
>     minimalist system with just busybox,
>   - systemd-boot as bootloader
>
> this would force having util-linux library, even though nothing would
> use them...
Yeah, this isn't ideal, from my discussions with systemd upstream
there would need to be a major refactoring of their meson build system
to allow building systemd-boot without util-linux. Is there a way to
satisfy the util-linux requirement without actually installing
util-linux into the target?
>
> [--SNIP--]
> > diff --git a/boot/systemd-boot/buildroot.conf b/boot/systemd-boot/buildroot.conf
> > new file mode 100644
> > index 0000000..16d4d85
> > --- /dev/null
> > +++ b/boot/systemd-boot/buildroot.conf
> > @@ -0,0 +1,3 @@
> > +title        Buildroot
> > +linux        /bzImage
> > +options      root=/dev/sda2 rootwait console=tty1
> > diff --git a/boot/systemd-boot/loader.conf b/boot/systemd-boot/loader.conf
> > new file mode 100644
> > index 0000000..93b77b8
> > --- /dev/null
> > +++ b/boot/systemd-boot/loader.conf
> > @@ -0,0 +1,2 @@
> > +timeout 3
> > +default buildroot
>
> I see that your previous patch in systemd did not provide thoose two
> files.
I think I just had them in a different place, I'm not actually sure
how useful it is to provide this since most setups will need to
customize them in their post-image.sh. I included them since other
packages like grub and gummiboot also provide defaults.
>
> Note: we'd need a way to also share those two files (buildroot.conf and
> loader.conf) between systemd-boot and systemd.
With how I currently have things set up systemd-boot will install them
for systemd if selected. When building the usespace part by itself
these aren't neccesary as they would be expected to be created some
time else such as runtime.
>
> > diff --git a/boot/systemd-boot/systemd-boot.mk b/boot/systemd-boot/systemd-boot.mk
> > new file mode 100644
> > index 0000000..7f97ef0
> > --- /dev/null
> > +++ b/boot/systemd-boot/systemd-boot.mk
> > @@ -0,0 +1,126 @@
> > +################################################################################
> > +#
> > +# systemd-boot
> > +#
> > +################################################################################
> > +
> > +SYSTEMD_BOOT_VERSION = 239
>
> You'll need to add a comment here and in systemd, to keep the versions
> in sync (like you've seen in mesa3d and mesa3d-headers).
>
> > +SYSTEMD_BOOT_SITE = $(call github,systemd,systemd,v$(SYSTEMD_BOOT_VERSION))
> > +SYSTEMD_BOOT_DL_SUBDIR = systemd
>
> Yes! :-)
>
> > +SYSTEMD_BOOT_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
> > +SYSTEMD_BOOT_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
> > +SYSTEMD_BOOT_INSTALL_STAGING = NO
> > +SYSTEMD_BOOT_INSTALL_TARGET = NO
> > +SYSTEMD_BOOT_INSTALL_IMAGES = YES
> > +SYSTEMD_BOOT_DEPENDENCIES = \
> > +     gnu-efi \
> > +     util-linux
> > +ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
> > +SYSTEMD_BOOT_DEPENDENCIES += systemd
> > +endif
>
> You can get rid of this dependency, once you switch to a depends on
> !SYSTEMD in the Config.in.
This is intentional since the systemd-boot package will essentially go
into an install only mode when BR2_PACKAGE_SYSTEMD_BOOT is present as
the bootloader can be simply copied out of the target filesystem.
>
> > +ifeq ($(BR2_i386),y)
> > +SYSTEMD_BOOT_IMGARCH = ia32
> > +else ifeq ($(BR2_x86_64),y)
> > +SYSTEMD_BOOT_IMGARCH = x64
> > +endif
> > +
> > +ifneq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
> > +SYSTEMD_BOOT_CONF_OPTS += \
> > +     -Drootlibdir='/usr/lib' \
> > +     -Dblkid=true \
>
> Can we get rid of libblkid here?
I'll double check this, however I recall the systemd buildsystem would
not function without present.
>
> > +     -Dman=false \
> > +     -Dima=false \
> > +     -Dlibcryptsetup=false \
> > +     -Defi=true \
> > +     -Defi-cc=$(TARGET_CC) \
> > +     -Defi-ld=$(TARGET_LD) \
> > +     -Defi-libdir=$(STAGING_DIR)/usr/lib \
> > +     -Defi-ldsdir=$(STAGING_DIR)/usr/lib \
> > +     -Defi-includedir=$(STAGING_DIR)/usr/include/efi \
>
> As far as I could see from the code, those 5 last options already
> default to the proper values. Why did you need to force them?
I'll double check if these are actually required, could have been left
over testing code I had when trying to trace the meson build system
issue https://patchwork.ozlabs.org/patch/1014226/.
>
> > +     -Dgnu-efi=true \
> > +     -Dldconfig=false \
> > +     -Ddefault-dnssec=no \
> > +     -Dtests=false \
> > +     -Dnobody-group=nogroup \
> > +     -Didn=true \
> > +     -Dnss-systemd=true \
>
> Since we're only building the boot blobs, why do we need to have those
> two set to 'true', when all the rest is set to false?
I'll see if these can be removed.
>
> > +     -Dacl=false \
> > +     -Daudit=false \
> > +     -Delfutils=false \
> > +     -Dlibidn=false \
> > +     -Dlibidn2=false \
> > +     -Dseccomp=false \
> > +     -Dxkbcommon=false \
> > +     -Dbzip2=false \
> > +     -Dlz4=false \
> > +     -Dpam=false \
> > +     -Dxz=false \
> > +     -Dzlib=false \
> > +     -Dlibcurl=false \
> > +     -Dgcrypt=false \
> > +     -Dpcre2=false \
> > +     -Dmicrohttpd=false \
> > +     -Dqrencode=false \
> > +     -Dselinux=false \
> > +     -Dhwdb=false \
> > +     -Dbinfmt=false \
> > +     -Dvconsole=false \
> > +     -Dquotacheck=false \
> > +     -Dtmpfiles=false \
> > +     -Dsysusers=false \
> > +     -Dfirstboot=false \
> > +     -Drandomseed=false \
> > +     -Dbacklight=false \
> > +     -Drfkill=false \
> > +     -Dlogind=false \
> > +     -Dmachined=false \
> > +     -Dimportd=false \
> > +     -Dhostnamed=false \
> > +     -Dmyhostname=false \
> > +     -Dtimedated=false \
> > +     -Dlocaled=false \
> > +     -Dcoredump=false \
> > +     -Dpolkit=false \
> > +     -Dnetworkd=false \
> > +     -Dresolve=false \
> > +     -Dtimesyncd=false \
> > +     -Dsmack=false \
> > +     -Dhibernate=false
> > +endif
> > +
> > +SYSTEMD_BOOT_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> > +SYSTEMD_BOOT_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> > +
> > +ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
> > +define SYSTEMD_BOOT_BUILD_CMDS
> > +     mkdir -p $(@D)/build/src/boot/efi
> > +     cp $(TARGET_DIR)/usr/lib/systemd/boot/efi/systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi \
> > +             $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi
> > +     cp $(TARGET_DIR)/usr/lib/systemd/boot/efi/linux$(SYSTEMD_BOOT_IMGARCH).efi.stub \
> > +             $(@D)/build/src/boot/efi/linux$(SYSTEMD_BOOT_IMGARCH).efi.stub
> > +endef
>
> You can now also get rid of this trick.
So I have things like this so that the bootloader built by the systemd
package can be reused by the systemd-boot package. I could refactor
things so that the systemd package has an option to install the
bootloader itself although that will increase code duplication which I
was trying to avoid, separating the installation stage would also make
it harder to find the systemd-boot option in menuconfig when using a
systemd init system as the only options for it would then be under the
normal systemd package. It seemed to make sense to have the
systemd-boot package be used to control whether the bootloader is
installed to efi-part and have the systemd boot package merely handle
userspace/rootfs bootloader build and installation. A potential use
case for building the userspace components without the efi-part
component is if one needs to create an installer/bootstrap image that
must use an alternate bootloader such as grub while wanting to use the
userspace tools to do the actual permanent runtime installation(of
course this could also be controlled by the systemd package).

Do you think it makes sense to refactor things so that the bootloader
image installation is handled within the systemd package when systemd
init is selected or does it make sense to have the systemd-boot
package control image installation when using systemd init.
>
> > +else
> > +define SYSTEMD_BOOT_BUILD_CMDS
> > +     $(TARGET_MAKE_ENV) $(SYSTEMD_BOOT_NINJA_ENV) \
> > +             $(NINJA) $(NINJA_OPTS) -C $(@D)/build \
> > +             src/boot/efi/{systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi,linux$(SYSTEMD_BOOT_IMGARCH).efi.stub}
> > +endef
> > +endif
> > +
> > +define SYSTEMD_BOOT_INSTALL_IMAGES_CMDS
> > +     $(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi \
> > +             $(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_IMGARCH).efi
> > +     echo "boot$(SYSTEMD_BOOT_IMGARCH).efi" > \
> > +             $(BINARIES_DIR)/efi-part/startup.nsh
> > +     $(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/loader.conf \
> > +             $(BINARIES_DIR)/efi-part/loader/loader.conf
> > +     $(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/buildroot.conf \
> > +             $(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
>
> Should you not be doing the same in the systemd case?
Well with how this currently works the installation stage here will
work even if systemd-boot is built as part of systemd.
>
> Regards,
> Yann E. MORIN.
>
> > +endef
> > +
> > +ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
> > +$(eval $(generic-package))
> > +else
> > +$(eval $(meson-package))
> > +endif
> > diff --git a/boot/systemd-boot/systemd.hash b/boot/systemd-boot/systemd.hash
> > new file mode 120000
> > index 0000000..4259f40
> > --- /dev/null
> > +++ b/boot/systemd-boot/systemd.hash
> > @@ -0,0 +1 @@
> > +../../package/systemd/systemd.hash
> > \ No newline at end of file
> > --
> > 2.7.4
> >
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
