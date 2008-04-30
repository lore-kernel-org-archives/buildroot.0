From: Will Newton <will.newton@gmail.com>
Date: Wed, 30 Apr 2008 16:18:00 +0100
Subject: [Buildroot] fixing libtool in buildroot
In-Reply-To: <46a136670804300814n1fb0bb1bi796d5e1db3a82134@mail.gmail.com>
References: <46a136670804300814n1fb0bb1bi796d5e1db3a82134@mail.gmail.com>
Message-ID: <87a5b0800804300818w26275393x8eb43fbdec13c1e4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 30, 2008 at 4:14 PM, John Voltz <john.voltz@gmail.com> wrote:
> I've got a modification/patch I would like to run by everybody before I
> commit it. It will remove all of the libdirla.patch patches in the packages
> that use Makefile.autotools.in and instead integrate the patch with
> Makefile.autotools.in. If the package has ltmain.sh, Makefile.autotools.in
> will automatically patch it. This is what that looks like:
>
> # Retrieve and unpack the archive
> $(BUILD_DIR)/%/.stamp_extracted:
>     $(call MESSAGE,"Extracting")
>     $(Q)mkdir -p $(@D)
>     $(Q)$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
>      $(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
> # some packages have messed up permissions inside
>     $(Q)chmod -R ug+rw $(@D)
> # if the package uses libtool, patch it for cross-compiling in buildroot
>      $(Q)test -e $(@D)/ltmain.sh && toolchain/patch-kernel.sh $(@D) package
> buildroot-libtool.patch
>     $(Q)touch $@
>
> I am also adding to the patch a one line fix that prevents libtool from
> relinking during the "make install" phase of the build. This is simply:
>
> need_relink = no
>
> Attached is the new buildroot-libtool.patch
>
> Let me know what you think, or if you see problems with that, otherwise I
> will go ahead and commit it tomorrow.

Packages may have more than one ltmain.sh, for example gettext.
