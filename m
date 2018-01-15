From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 21:37:06 +0100
Subject: [Buildroot] [PATCH 1/1] kconfig: Apply upstream nconfig
 ncurses/ncursesw fix
In-Reply-To: <20180114172807.28196-1-g@maral.me>
References: <20180114163932.GA24925@enterprise.starfleet>
 <20180114172807.28196-1-g@maral.me>
Message-ID: <20180115213706.61ee21b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Jan 2018 09:28:07 -0800, Guillermo A. Amaral wrote:
> Buildroot's "make nconfig" command stopped working a while ago on all my
> Gentoo systems. Running the command would result in a crash.
> 
> I found that the issue was caused by lxdialog's cflags which are also
> used to build nconfig; It would detect *ncursesw* and turn on WIDECHAR
> support -- but the Makefile would still link to plain *ncurses* while
> building nconfig (which was built without WIDECHAR support).
> 
> This would cause a crash after using *wattrset* on a WINDOW instance.
> WIDECHAR *wattrset* would try to set the _color member in the WINDOW
> struct which does not exist in the NON-WIDECHAR ncurses instance. It
> would end up clobbering data outside the struct (usually _line entries).
> 
> I found an upstream patch fixing the issue, so I'm applying it to
> Buildroot's kconfig.
> 
> Signed-off-by: Guillermo A. Amaral <g@maral.me>
> ---
>  support/kconfig/Makefile                           |  3 +-
>  ...onfig-nconfig-fix-multi-byte-UTF-handling.patch | 45 ++++++++++++++++++++++
>  support/kconfig/patches/series                     |  1 +
>  3 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 support/kconfig/patches/18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch

I've applied after tweaking a bit the commit title ("support/kconfig"
instead of "kconfig") and the commit log (using the singular first
person is not very common).

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
