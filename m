From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 23:30:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix build with
 musl-1.2.0
In-Reply-To: <20200503075312.703486-1-bernd.kuhls@t-online.de>
References: <20200503075312.703486-1-bernd.kuhls@t-online.de>
Message-ID: <20200509233034.40e44309@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 May 2020 09:53:12 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/minidlna/0001-uuid.c-add-asm-unistd.h-include-to-fix-build-with-mu.patch b/package/minidlna/0001-uuid.c-add-asm-unistd.h-include-to-fix-build-with-mu.patch
> new file mode 100644
> index 0000000000..5e64103c34
> --- /dev/null
> +++ b/package/minidlna/0001-uuid.c-add-asm-unistd.h-include-to-fix-build-with-mu.patch
> @@ -0,0 +1,34 @@
> +From 9e21f3f91195a7c4a73ebf112823f7dbb94732db Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 3 May 2020 09:42:57 +0200
> +Subject: [PATCH] uuid.c: add asm/unistd.h include to fix build with
> + musl-1.2.0
> +
> +Build was broken due to musl commit
> +https://git.musl-libc.org/cgit/musl/commit/?id=5a105f19b5aae79dd302899e634b6b18b3dcd0d6
> +
> +To fix also include asm/unistd.h following the configure.ac check for
> +the __NR_clock_gettime syscall.
> +
> +Patch sent upstream: https://sourceforge.net/p/minidlna/patches/182/
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + uuid.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/uuid.c b/uuid.c
> +index 6e6a9ec..78f110c 100644
> +--- a/uuid.c
> ++++ b/uuid.c
> +@@ -36,6 +36,7 @@
> + #if HAVE_MACH_MACH_TIME_H
> + #include <mach/mach_time.h>
> + #elif HAVE_CLOCK_GETTIME_SYSCALL
> ++#include <asm/unistd.h>

I am not an expert with all the time changes in the kernel/libc, but
this seems quite wrong:

 (1) Including <asm/...> headers should typically not be done

 (2) The commit at
     https://git.musl-libc.org/cgit/musl/commit/?id=5a105f19b5aae79dd302899e634b6b18b3dcd0d6
     says:

this patch renames the syscalls on 32-bit archs to clock_gettime32 and
gettimeofday_time32, so that applications using the original names
will fail to build without being fixed.

     So the breakage is intentional, and it should be fixed in the
     application.

So the big question is why does minidlna wants to do the syscall
directly instead of using clock_gettime(), which is the right thing to
do ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
