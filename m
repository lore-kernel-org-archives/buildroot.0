From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 17:00:26 +0100
Subject: [Buildroot] [PATCH v2] ncurses: remove
 BR2_PACKAGE_NCURSES_TARGET_{FORM, MENU, PANEL} options
In-Reply-To: <1487873325-10383-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487873325-10383-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170226170026.49270215@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 19:08:45 +0100, Thomas Petazzoni wrote:
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
> some symbolic links lib<foo>.so -> lib<foo>w.so in staging and target,
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
> 
>  - Removes the NCURSES_LIBS-y variable, and replaces it with a single
>    unconditional assignement to NCURSES_LIBS, only used to create the
>    lib<foo>w.so -> lib<foo>.so symbolic links when wchar support is
>    enabled.
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
>  - Simplifies all the symlink dance for lib<foo> -> lib<foo>w, because
>    as Yann E. Morin suggested, this dance is only needed in staging, not
>    in the target. Once binaries have been built, they refer to the
>    SONAME of the library, which is the lib<foo>w variant (for shared
>    linking). For static linking and .pc files, it's obvious that we
>    don't care about them on the target. Therefore the
>    NCURSES_LINK_LIBS_STATIC, NCURSES_LINK_LIBS_SHARED and
>    NCURSES_LINK_PC functions no longer take any argument: they always
>    apply to STAGING_DIR only. NCURSES_LINK_TARGET_LIBS is removed.
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
> Changes since v1:
>  - Remove the logic doing the lib<foo> -> lib<foo>w symlink dance on
>    $(TARGET_DIR). This is only needed on $(STAGING_DIR), as noted by
>    Yann E. Morin.
> ---
>  package/alsa-utils/Config.in |  3 --
>  package/iprutils/Config.in   |  3 --
>  package/iptraf-ng/Config.in  |  1 -
>  package/kismet/Config.in     |  1 -
>  package/ncurses/Config.in    | 15 ----------
>  package/ncurses/ncurses.mk   | 65 ++++++++++++++------------------------------
>  package/nload/Config.in      |  1 -
>  package/samba4/samba4.mk     |  2 +-
>  8 files changed, 22 insertions(+), 69 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
