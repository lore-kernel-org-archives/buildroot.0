From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 May 2020 00:06:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Patch to fix check_as
 macro in Rules.mak
In-Reply-To: <AM0P194MB06448CBCB64FBB28F3240C118BD00@AM0P194MB0644.EURP194.PROD.OUTLOOK.COM>
References: <AM0P194MB06448CBCB64FBB28F3240C118BD00@AM0P194MB0644.EURP194.PROD.OUTLOOK.COM>
Message-ID: <71697bf3-3641-ff09-d2ac-f507c4059089@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcel,

Le 24/04/2020 ? 14:47, Patzlaff, Marcel a ?crit?:
> This introduces a patch for uClibc to fix a feature check macro which
> does not work when building with binutils 2.31.x or higher. Without
> this fix, all binaries of uClibc will always request an executable
> stack and thus all other binaries that link to it!
> 
> See also https://bugs.busybox.net/show_bug.cgi?id=12801

Your patch is now upstream :
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=25751e796e83a75e0d443f96694e539ffbf4687a

Reviewed-by: Romain Naour <romain.naour@gmail.com>

[Build tested, between a toolchain with binutils 2.30 and 2.31]
Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> 
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> ---
>  ...heck_as-for-recent-binutils-versions.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/uclibc/0003-Rules.mak-Fix-check_as-for-recent-binutils-versions.patch
> 
> diff --git a/package/uclibc/0003-Rules.mak-Fix-check_as-for-recent-binutils-versions.patch b/package/uclibc/0003-Rules.mak-Fix-check_as-for-recent-binutils-versions.patch
> new file mode 100644
> index 0000000000..1e8ca1e682
> --- /dev/null
> +++ b/package/uclibc/0003-Rules.mak-Fix-check_as-for-recent-binutils-versions.patch
> @@ -0,0 +1,42 @@
> +From 9c0a3c5c80cd9dbd1aa7b04dd7ad2d8ea98b244e Mon Sep 17 00:00:00 2001
> +From: Marcel Patzlaff <m.patzlaff@pilz.de>
> +Date: Fri, 24 Apr 2020 14:09:23 +0200
> +Subject: [PATCH 1/1] Rules.mak: Fix check_as for recent binutils versions
> +
> +As described in https://bugs.busybox.net/show_bug.cgi?id=12801 the
> +check for '-Wa,--noexecstack' is not working since binutils 2.31.x.
> +
> +This fix adapts the approach already taken with check_ld and uses a
> +temporary file. Further, check_gcc is also adapted to avoid future
> +problems.
> +
> +Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> +---
> + Rules.mak | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/Rules.mak b/Rules.mak
> +index 6a9f5cbca..a10518c03 100644
> +--- a/Rules.mak
> ++++ b/Rules.mak
> +@@ -189,11 +189,13 @@ endif
> + 
> + # A nifty macro to make testing gcc features easier
> + check_gcc=$(shell \
> +-	if $(CC) $(1) -S -o /dev/null -xc /dev/null > /dev/null 2>&1; \
> +-	then echo "$(1)"; else echo "$(2)"; fi)
> ++	tf="/tmp/cgccucl$$$$.o"; \
> ++	if $(CC) $(1) -S -o $$tf -xc /dev/null > /dev/null 2>&1; \
> ++	then echo "$(1)"; else echo "$(2)"; fi; rm -f $$tf )
> + check_as=$(shell \
> +-	if $(CC) -Wa,$(1) -Wa,-Z -c -o /dev/null -xassembler /dev/null > /dev/null 2>&1; \
> +-	then echo "-Wa,$(1)"; fi)
> ++	tf="/tmp/casucl$$$$.o"; \
> ++	if $(CC) -Wa,$(1) -Wa,-Z -c -o $$tf -xassembler /dev/null > /dev/null 2>&1; \
> ++	then echo "-Wa,$(1)"; fi; rm -f $$tf )
> + check_ld=$(shell \
> + 	tf="/tmp/clducl$$$$.c"; echo "int _start(){return 0;}int main(){return 0;}" >$$tf; \
> + 	if $(CC) $(LDFLAG-fuse-ld) $(CFLAG_-Wl--no-warn-mismatch) -Wl,$(1) $(CFLAG_-nostdlib) -o /dev/null $$tf > /dev/null 2>&1; \
> +-- 
> +2.20.1
> +
> 
