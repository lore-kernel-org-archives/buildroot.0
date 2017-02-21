From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Feb 2017 23:22:48 +0100
Subject: [Buildroot] [PATCH] ncurses: remove
 BR2_PACKAGE_NCURSES_TARGET_{FORM, MENU, PANEL} options
In-Reply-To: <1487713193-3469-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487713193-3469-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <b25eb61b-2e13-a7bc-18b9-fdb54715527c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 21/02/2017 ? 22:39, Thomas Petazzoni a ?crit :
> The ncurses sub-options BR2_PACKAGE_NCURSES_TARGET_{FORM,MENU,PANEL}
> are currently very badly broken: they only control whether the
> libform, libmenu and libpanel libraries are installed in
> $(TARGET_DIR), but do absolutely nothing about their installation in
> $(STAGING_DIR).
> 
> This means that when one of those options is disabled, the
> corresponding library is indeed not installed in the target, but is
> available in staging. It can therefore be detected by the configure
> script of another package and used... even though the library will not
> be in the target, causing a runtime failure.
> 
> Internally, ncurses.mk uses the "make install" logic of ncurses for
> the staging installation, but uses a completely hand-written logic for
> the target installation, which is the reason for this
> desynchronization between what's installed in staging and target.
> 
> When BR2_PACKAGE_NCURSES_WCHAR=y, this also causes some build
> failures. Indeed, when BR2_PACKAGE_NCURSES_WCHAR=y, Buildroot creates
> some symbolic links lib<foo>w.so -> lib<foo>.so in staging and target,
> but only for the lib<foo> that have been enabled by
> BR2_PACKAGE_NCURSES_TARGET_{FORM,MENU,PANEL}. Due to this, a package
> that for example needed the libmenu library but forgot to select
> BR2_PACKAGE_NCURSES_TARGET_MENU was:
> 
>  - Building fine with BR2_PACKAGE_NCURSES_WCHAR disabled (because
>    libmenu.so exists in staging), but would fail to run at runtime
>    because libmenu.so is not in the target.
> 
>  - Fail to build with BR2_PACKAGE_NCURSES_WCHAR=y because only
>    libmenuw.so exists, and not the libmenu.so symbolic link.
> 
> Since those libraries are small (43K for libform, 21K for libmenu and
> 8.2K for libpanel), this commit takes the very simple approach of
> removing those options, and installing the libraries
> unconditionally. It therefore uses the "make install" logic for both
> the staging *and* target installation.
> 
> In detail, this commit:
> 
>  - Removes the NCURSES_PROGS variable, not needed since
>    --without-progs already allows to disable the build and
>    installation of programs.

Not related to you patch bu maybe we can add --with-progs in:

$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs)

Otherwise this patch looks ok.

Best regards,
Romain

> 
>  - Removes the NCURSES_LIBS-y variable, and replaces it with a single
>    unconditional assignement to NCURSES_LIBS, only used to create the
>    lib<foo>w.so -> lib<foo>.so symbolic links when wchar support is
>    enabled.
> 
>  - Ensure the NCURSES_LINK_TARGET_LIBS hook gets called as a target
>    post installation hook, since the custom
>    NCURSES_INSTALL_TARGET_CMDS is removed.
> 
>  - Removes NCURSES_INSTALL_TARGET_CMDS and the functions it was
>    calling: NCURSES_INSTALL_TARGET_LIBS and
>    NCURSES_INSTALL_TARGET_PROGS.
> 
>  - Adds a NCURSES_TARGET_SYMLINK_RESET hook to create the reset ->
>    tset symbolic link, as was done before.
> 
>  - Adds a NCURSES_TARGET_CLEANUP_TERMINFO to cleanup the terminfo
>    files in the target, so that we stay in the same situation in terms
>    of installed terminfo files.
> 
>  - Removes the BR2_PACKAGE_NCURSES_TARGET_{FORM,MENU,PANEL} options
>    from the Config.in files: both their definition and usage.
> 
> It is worth mentioning that adding Config.in.legacy support is *NOT*
> necessary. Indeed:
> 
>  - If they were disabled before this patch, having them in
>    Config.in.legacy would not trigger the legacy warning.
> 
>  - If they were enabled before this patch, then the behavior is
>    unchanged: all libraries are now unconditionally installed. So
>    there is no point in warning the user.
> 
> We double-checked the installed size of a filesystem containing just
> ncurses before and after this patch, and the only folder that has its
> size changed is /usr/lib, growing from 852 KB to 932 KB in the wchar
> enabled case. That's a 80 KB system size increase.
> 
> This commit fixes the sngrep build failure and potentially numerous
> runtime issues with ncurses.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/7b5db21a6c568e6c6c8fe2b5d5a2f5ca24df510c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
