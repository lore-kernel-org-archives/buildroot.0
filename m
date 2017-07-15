From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 14:47:14 +0200
Subject: [Buildroot] [PATCH] package/lshw: don't use NONLS when
 BR2_SYSTEM_ENABLE_NLS is not set
In-Reply-To: <20170715111205.4748-1-romain.naour@gmail.com>
References: <20170715111205.4748-1-romain.naour@gmail.com>
Message-ID: <20170715144714.57f47c0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Jul 2017 13:12:05 +0200, Romain Naour wrote:
> Since [1], NONLS is added to LSHW_CFLAGS even for glibc based toolchain.
> Previously it was not the case since BR2_ENABLE_LOCALE is always
> selected for glibc based toolchain.
> 
> With NONLS, config.h try to redefine two Intl function (textdomain and
> bindtextdomain) that are used by glibc internally.
> 
> This break the build with the following error:
> sysroot/usr/include/libintl.h:82:52: error: expected unqualified-id before 'throw'
>  extern char *textdomain (const char *__domainname) __THROW;
> 
> The NONLS mode is really for cases where the C library does not provide
> *any* gettext implementation, as would be the case with uClibc without
> intl stubs enabled.
> 
> But in the context of Buildroot, all C libraries provide a gettext
> implementation. It might be full-featured or minimal, but it always
> exists.
> 
> So, remove NONLS from CFLAGS to avoid the build issue with glibc
> toolchains.
> 
> Build tested with a uClibc toolchain without locale enabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9bf/9bf5437b4348ea8077013b80a51ce05fa328247d
> 
> [1] 3acd9f845de0489071719d52d774aab48d7f9c33
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/lshw/lshw.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
