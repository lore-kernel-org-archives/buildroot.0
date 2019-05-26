From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 20:20:22 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/kvm-unit-tests: fix build without ssp on x86_64
In-Reply-To: <20190525222209.14372-1-fontaine.fabrice@gmail.com>
References: <20190525222209.14372-1-fontaine.fabrice@gmail.com>
Message-ID: <d0c26970-8d47-c56f-3491-f636348b674d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/05/2019 00:22, Fabrice Fontaine wrote:
> Makefile tries to detect stack-protector which will result in build
> failure on x86_64 if ssp is not available on host compiler so disable
> stack protector through EXTRA_CFLAGS

 I would like to actually understand the failure though... The error is:

/usr/bin/ld: x86/realmode.o: in function `print_serial_u32':
.../x86/realmode.c:104: undefined reference to `__stack_chk_fail'

 However, realmode.c is built with

gcc  -mno-red-zone -m32 -O1 -g -MMD -MF x86/.realmode.d  -Wall -Wwrite-strings
-Wclobbered -Wempty-body -Wuninitialized -Wignored-qualifiers
-Wunused-but-set-parameter  -fno-omit-frame-pointer    -Wno-frame-address
-fno-pic  -no-pie -Wmissing-parameter-type -Wold-style-declaration
-Woverride-init -std=gnu99 -ffreestanding -I
/data/buildroot/buildroot-test/instance-1/output/build/kvm-unit-tests-kvm-unit-tests-20171020/lib
-I
/data/buildroot/buildroot-test/instance-1/output/build/kvm-unit-tests-kvm-unit-tests-20171020/lib/x86
-I lib   -c -o x86/realmode.o x86/realmode.c

 So, stack-protector is *not* enabled... So what the hell is going on here?

 It seems to only happen on Xogium's Arch Linux server. Maybe there's something
weird going on with that server?

 Regards,
 Arnout

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e6f767755ffdb5ecc014eb5ad7519814f075a60e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Peter Korsgaard):
>  - Always disable stack-protector on x86_64 as we're using host compiler
> 
>  package/kvm-unit-tests/kvm-unit-tests.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> index 92d67fb34b..72762d21f2 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> @@ -37,6 +37,8 @@ KVM_UNIT_TESTS_CONF_OPTS =\
>  # x86-64 cannot do.
>  ifneq ($(BR2_x86_64),y)
>  KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
> +# Don't force -fstack-protector as we don't know if host compiler supports ssp 
> +KVM_UNIT_TESTS_MAKE_OPTS += EXTRA_CFLAGS=-fno-stack-protector
>  endif
>  
>  define KVM_UNIT_TESTS_CONFIGURE_CMDS
> @@ -44,11 +46,12 @@ define KVM_UNIT_TESTS_CONFIGURE_CMDS
>  endef
>  
>  define KVM_UNIT_TESTS_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) standalone
> +	$(TARGET_MAKE_ENV) $(MAKE) $(KVM_UNIT_TESTS_MAKE_OPTS) -C $(@D) \
> +		standalone
>  endef
>  
>  define KVM_UNIT_TESTS_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(KVM_UNIT_TESTS_MAKE_OPTS) -C $(@D) \
>  		DESTDIR=$(TARGET_DIR)/usr/share/kvm-unit-tests/ \
>  		install
>  endef
> 
