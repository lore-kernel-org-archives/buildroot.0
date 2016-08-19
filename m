From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:27:13 +0200
Subject: [Buildroot] [PATCHv2] linux: cpupower needs gettext
In-Reply-To: <1471597793-14991-1-git-send-email-yann.morin.1998@free.fr>
References: <1471597793-14991-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160819112713.057808e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 11:09:53 +0200, Yann E. MORIN wrote:
> The cpupower linux tool needs gettext, always (even without locales).
> 
> We need to disable NLS, otherwise it tries to compile the .po files.
> We also need to pass -lintl, otherwise it forgets to link with it
> (because, the world is glibc-only, you did not know? And glibc does not
> need we link with -lintl, so why would we? Oh, yes, we also reinvented
> our super intelligent one-off Makefile rather than use one of the
> standard buildsystems).
> 
> Fixes #9181:
> 
>       CC       utils/helpers/sysfs.o
>     In file included from utils/helpers/amd.c:9:0: ./utils/helpers/helpers.h:13:21: fatal error: libintl.h: No such file or directory
>      #include <libintl.h>
>                          ^
> 
> Without NLS=false (yes, we could depend on host-gettext):
> 
>       MSGFMT   po/de.gmo
>     make[3]: msgfmt: Command not found
> 
> Without LDFLAGS=-lintl:
> 
>       CC       cpupower
>     ./utils/cpupower.o: In function `main':
>     cpupower.c:(.text.startup+0x1a4): undefined reference to `libintl_textdomain'
>     ./utils/idle_monitor/cpupower-monitor.o: In function `list_monitors':
>     cpupower-monitor.c:(.text+0x5dc): undefined reference to `libintl_gettext'
>     ./utils/cpupower-set.o: In function `cmd_set':
>     cpupower-set.c:(.text+0x38): undefined reference to `libintl_textdomain'
>     ./utils/cpupower-info.o: In function `cmd_info':
>     cpupower-info.c:(.text+0x20): undefined reference to `libintl_textdomain'
>     collect2: error: ld returned 1 exit status
> 
> Reported-by: Joergen Pihlflyckt <Jorgen.Pihlflyckt@ajeco.fi>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Joergen Pihlflyckt <Jorgen.Pihlflyckt@ajeco.fi>
> 
> ---
> Changes v1 -> v2:
>   - don't link with -lintl when not needed
> ---
>  linux/Config.tools.in        | 6 ++++++
>  linux/linux-tool-cpupower.mk | 4 +++-
>  2 files changed, 9 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
