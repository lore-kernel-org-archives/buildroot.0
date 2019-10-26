From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 12:37:33 +0200
Subject: [Buildroot] [PATCH] package/libselinux: fix the build with
 Python 3.8
In-Reply-To: <20191025132732.12043-1-thomas.petazzoni@bootlin.com>
References: <20191025132732.12043-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191026123733.299cc841@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 15:27:31 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Following the switch to Python 3.8, the libselinux Python extension
> started to fail building. This is fixed by upstream commit
> 2efa06857575e4118e91ca250b6b92da68b130d5, which we backport as
> 0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch.
> 
> This patch has the nice merit of switching to using distutils to build
> the Python extension of libselinux, instead of some custom logic. This
> allows to significantly simplify our libselinux.mk: we can rely on
> PKG_PYTHON_DISTUTILS_ENV and HOST_PKG_PYTHON_DISTUTILS_ENV instead of
> lots of custom variables.
> 
> However, upstream commit 2efa06857575e4118e91ca250b6b92da68b130d5 had
> its own issues:
> 
>  * Hardcode of -I $(DESTDIR)/$(INCLUDEDIR) -L $(DESTDIR)/$(LIBDIR) at
>    build time, while DESTDIR is normally empty at build time, causing
>    bogus -I /usr/include -L /usr/lib to be used
> 
>    This is fixed in
>    0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch
> 
>  * New usage of ln --relative, which is not supported in older
>    distributions.
> 
>    This is fixed in
>    0005-Remove-ln-relative-usage-in-install-pywrap.patch
> 
>  * Usage of the host Python "imp" module to query the extension used
>    for native Python module, but that returns an incorrect result when
>    cross-compiling. We chose to simplify the code to not have to query
>    for this information.
> 
>    This is fixed in
>    0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> 
> With this patch, the libselinux Python module was built-tested with
> Python 2 and Python 3, and run-time tested as well in both
> configurations, for both the target and host variants of libselinux.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/aeb58de7ad674b980258e6ed30c7da3949a04452/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...ython-distutils-to-install-SELinux-p.patch | 207 ++++++++++++++++++
>  ...-t-pass-bogus-I-and-L-to-python-setu.patch |  34 +++
>  ...-ln-relative-usage-in-install-pywrap.patch |  27 +++
>  ...T-and-rely-on-the-installed-file-nam.patch |  47 ++++
>  package/libselinux/libselinux.mk              |  16 +-
>  5 files changed, 319 insertions(+), 12 deletions(-)
>  create mode 100644 package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch
>  create mode 100644 package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch
>  create mode 100644 package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch
>  create mode 100644 package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
