From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 13 May 2015 00:06:54 +0200
Subject: [Buildroot] [PATCH] google-breakpad: add patch to fix AArch64
 build issue
In-Reply-To: <1431467285-28262-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431467285-28262-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5552797E.1080106@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 12/05/2015 23:48, Thomas Petazzoni a ?crit :
> Fixes:
> 
>   http://autobuild.buildroot.org/results/b2b/b2bfbcc922b3041ab3a1892d5c1469ec68476682/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-add-missing-asm-ptrace-include.patch      | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
> 
> diff --git a/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch b/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
> new file mode 100644
> index 0000000..30e6160
> --- /dev/null
> +++ b/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
> @@ -0,0 +1,31 @@
> +Include <asm/ptrace.h> to get necessary definitions on AArch64
> +
> +In glibc commit
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=7d05a8168b45c0580e1f9a79c2dd26c8f0d31fca,
> +including <asm/ptrace.h> from <sys/user.h> on AArch64 has been
> +removed. So the Google Breakpad code, which used to build fine on
> +glibc 2.18 (CodeSourcery toolchain for example), no longer builds wiht

with

> +glibc 2.19 (Linaro toolchain for example).
> +
> +To fix this, this patch adds the missing <asm/ptrace.h> include (for
> +AArch64 only, to be conservative).
> +
> +This patch has not been submitted upstream, since more recent versions
> +of Google Breakpad have completely changed this part of the code.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Build tested with Linaro and Code Sourcery toolchains.
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
> +
> +Index: b/src/client/linux/minidump_writer/linux_dumper.h
> +===================================================================
> +--- a/src/client/linux/minidump_writer/linux_dumper.h
> ++++ b/src/client/linux/minidump_writer/linux_dumper.h
> +@@ -43,6 +43,9 @@
> + #include <stdint.h>
> + #include <sys/types.h>
> + #include <sys/user.h>
> ++#if defined(__aarch64__)
> ++#include <asm/ptrace.h>
> ++#endif
> + 
> + #include "common/memory.h"
> + #include "google_breakpad/common/minidump_format.h"
> 
