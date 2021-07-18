From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 13:50:57 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/sane-backends: fix uclibc
 compile (missing stdarg.h include for va_list/va_start/va_end)
In-Reply-To: <20210618183150.618-1-ps.report@gmx.net>
References: <20210618183150.618-1-ps.report@gmx.net>
Message-ID: <20210718135057.33e39218@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 18 Jun 2021 20:31:49 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add missing stdarg.h include for va_list/va_start/va_end.
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/88f4ea971875b1a5eb88662326d9343341eaaea2
> 
>   microtek.c: In function ?MDBG_INIT?:
>   microtek.c:163:3: error: unknown type name ?va_list?
>     163 |   va_list ap;
>         |   ^~~~~~~
>   microtek.c:78:1: note: ?va_list? is defined in header ?<stdarg.h>?; did you forget to ?#include <stdarg.h>??
>      77 | #include "microtek.h"
>     +++ |+#include <stdarg.h>
>      78 |
>   microtek.c:164:3: warning: implicit declaration of function ?va_start?; did you mean ?sane_start?? [-Wimplicit-function-declaration]
>     164 |   va_start(ap, format);
>         |   ^~~~~~~~
>         |   sane_start
>   microtek.c:165:54: warning: passing argument 4 of ?vsnprintf? makes pointer from integer without a cast [-Wint-conversion]
>     165 |   vsnprintf(_mdebug_string, MAX_MDBG_LENGTH, format, ap);
>         |                                                      ^~
>         |                                                      |
>         |                                                      int
>   In file included from ../include/sane/sanei_config.h:50,
>                    from microtek.c:70:
>   .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:359:57: note: expected ?__va_list_tag *? but argument is of type ?int?
>     359 |         const char *__restrict __format, __gnuc_va_list __arg)
>         |                                          ~~~~~~~~~~~~~~~^~~~~
>   microtek.c:166:3: warning: implicit declaration of function ?va_end? [-Wimplicit-function-declaration]
>     166 |   va_end(ap);
>         |   ^~~~~~
> 
> and
> 
>   sm3600-scanutil.c: In function ?debug_printf?:
>   sm3600-scanutil.c:69:3: error: unknown type name ?va_list?
>      69 |   va_list ap;
>         |   ^~~~~~~
>   sm3600-scanutil.c:48:1: note: ?va_list? is defined in header ?<stdarg.h>?; did you forget to ?#include <stdarg.h>??
>      47 | #include "sm3600-scantool.h"
>     +++ |+#include <stdarg.h>
>      48 |
>   sm3600-scanutil.c:75:3: warning: implicit declaration of function ?va_start?; did you mean ?sane_start?? [-Wimplicit-function-decla
> ration]
>      75 |   va_start(ap,szFormat);
>         |   ^~~~~~~~
>         |   sane_start
>   sm3600-scanutil.c:76:28: warning: passing argument 3 of ?vfprintf? makes pointer from integer without a cast [-Wint-conversion]
>      76 |   vfprintf(stderr,szFormat,ap);
>         |                            ^~
>         |                            |
>         |                            int
>   In file included from ../include/sane/sanei_config.h:50,
>                    from sm3600.c:70:
>   .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:339:23: note: expected ?__va_list_tag *? but argument is of type
>  ?int?
>     339 |        __gnuc_va_list __arg);
>         |        ~~~~~~~~~~~~~~~^~~~~
>   In file included from sm3600.c:94:
>   sm3600-scanutil.c:77:3: warning: implicit declaration of function ?va_end? [-Wimplicit-function-declaration]
>      77 |   va_end(ap);
>         |   ^~~~~~
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...-fix-uclibc-compile-include-stdarg.h.patch | 58 ++++++++++++++++++
>  ...canutil-fix-uclibc-compile-include-s.patch | 59 +++++++++++++++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch
>  create mode 100644 package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
