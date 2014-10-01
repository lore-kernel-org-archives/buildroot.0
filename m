From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 01 Oct 2014 18:30:54 +0200
Subject: [Buildroot] [PATCH] valgrind: allow building on more ARM systems
In-Reply-To: <1412176549-15127-1-git-send-email-mike@mikebwilliams.com>
References: <1412176549-15127-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <413cd7b6-4ed2-415b-8a6d-36f7148a6505@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike Williams <mike@mikebwilliams.com> schreef:
>Signed-off-by: Mike Williams <mike@mikebwilliams.com>
>---
> package/valgrind/Config.in   | 7 ++++---
> package/valgrind/valgrind.mk | 2 +-
> 2 files changed, 5 insertions(+), 4 deletions(-)
>
>diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
>index fd5649b..253555b 100644
>--- a/package/valgrind/Config.in
>+++ b/package/valgrind/Config.in
>@@ -1,8 +1,9 @@
> config BR2_PACKAGE_VALGRIND
> 	bool "valgrind"
>-	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a8 || \
>-		   BR2_cortex_a9 || BR2_powerpc || BR2_mips || \
>-		   BR2_mipsel || BR2_mips64 || BR2_mips64el
>+	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a5 || \
>+		   BR2_cortex_a7 || BR2_cortex_a8 || BR2_cortex_a9 || \
>+		   BR2_cortex_a12 || BR2_cortex_a15 || BR2_powerpc || \
>+		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> 	help
> 	  Tool for debugging and profiling Linux programs.
> 
>diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
>index 24d0290..8bea031 100644
>--- a/package/valgrind/valgrind.mk
>+++ b/package/valgrind/valgrind.mk
>@@ -17,7 +17,7 @@ VALGRIND_AUTORECONF = YES
> # not. Therefore, we adjust the host tuple to specify we're on
> # ARMv7. The valgrind package is guaranteed, through Config.in, to
> # only be selected on Cortex A8 and Cortex A9 platforms.
>-ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
>+ifeq ($(BR2_cortex_a5)$(BR2_cortex_a7)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a12)$(BR2_cortex_a15),y)
> VALGRIND_CONF_OPT += \
> 	--host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
> endif

In fact, mips64+n32 abi is not supported, so I think
 this should be reflected too. I guess the same applies
 to the the le variant...
