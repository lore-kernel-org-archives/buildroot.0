From: Vadym Kochan <vadim4j@gmail.com>
Date: Wed, 30 Jan 2019 14:03:51 +0200
Subject: [Buildroot] [PATCH v2 0/3] Add gettext-tiny package
In-Reply-To: <20190105200046.31512-1-vadim4j@gmail.com>
References: <20190105200046.31512-1-vadim4j@gmail.com>
Message-ID: <20190130120351.GA15126@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Sat, Jan 05, 2019 at 10:00:43PM +0200, Vadim Kochan wrote:
> Add lightweight alternative for the GNU gettext package - gettext-tiny.
> The sources are used from sabotage-linux project. Some files are used
> from the original gettext gnu like po/*, gettextize and some m4 files.
> 
> The original gettext package is renamed to gettext-gnu because now gettext is
> a virtual package and gettext-gnu and gettext-tiny became as gettext providers.
> 
> The main purpose of gettext-tiny is to be used only for the host if NLS
> is not enabled.
> 
> There was issue with using gettext-tiny for "wine" because it requires
> libgettextpo for wrc tool to be able translate Windows's resource files
> to *.pot, but this option might be disabled if NLS is disabled (done in
> patch 0001.
> 
> v2:
>     1) Add patch to disable gettext option for "wine" if NLS is disabled.
> 
>     2) Fix build issue with libuio by adding config.rpath by separate package
>        patch:
> 
>            0002-Add-config.rpath-from-gettext-gnu-distro-0.19.8.1.patch
> 
>     3) Use gettext-tiny only as for HOST alternative and if NLS is disabled.
>        There is no option to manually select gettext-gnu or gettext-tiny which
>        is controlled by gettext virtual package.
> 
>     4) Drop "files" folder with copied files from original gettext gnu, but
>        download them from:
> 
>            https://git.savannah.gnu.org/cgit/gettext.git
> 
>        Thanks to Yann E. Morin for help with this.
> 
>     5) gettextize is preprocessed from the original gettextize.in
> 
>     6) Use only host-generic-package for gettext-tiny, hence remove "target"
>        related stuff.
> 
> Vadim Kochan (3):
>   package/wine: Add gettext dependency for host-wine only with NLS
>     enabled
>   package/gettext: Turn into virtual package
>   package/gettext-tiny: Add new package
> 
>  DEVELOPERS                                         |   3 +
>  .../0001-error_print_progname.patch                |   0
>  .../0002-Update-after-gnulib-changed.patch         |   0
>  .../gettext.hash => gettext-gnu/gettext-gnu.hash}  |   0
>  package/gettext-gnu/gettext-gnu.mk                 | 103 +++
>  ...-format-not-a-string-literal-error-for-gc.patch |  55 ++
>  ...ig.rpath-from-gettext-gnu-distro-0.19.8.1.patch | 709 +++++++++++++++++++++
>  package/gettext-tiny/gettext-tiny.hash             |  14 +
>  package/gettext-tiny/gettext-tiny.mk               | 104 +++
>  package/gettext/Config.in                          |  27 +-
>  package/gettext/gettext.mk                         |  96 +--
>  package/wine/wine.mk                               |   4 +
>  12 files changed, 1016 insertions(+), 99 deletions(-)
>  rename package/{gettext => gettext-gnu}/0001-error_print_progname.patch (100%)
>  rename package/{gettext => gettext-gnu}/0002-Update-after-gnulib-changed.patch (100%)
>  rename package/{gettext/gettext.hash => gettext-gnu/gettext-gnu.hash} (100%)
>  create mode 100644 package/gettext-gnu/gettext-gnu.mk
>  create mode 100644 package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
>  create mode 100644 package/gettext-tiny/0002-Add-config.rpath-from-gettext-gnu-distro-0.19.8.1.patch
>  create mode 100644 package/gettext-tiny/gettext-tiny.hash
>  create mode 100644 package/gettext-tiny/gettext-tiny.mk
> 
> -- 
> 2.14.1
> 

Just 'd like to know if someone will have a chance to review/test these changes.

Thanks,
Vadim Kochan
