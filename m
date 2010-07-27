From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Tue, 27 Jul 2010 11:36:17 +0100
Subject: [Buildroot] Evaluation of make variables
Message-ID: <1280226977.22687.37.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I've run into a similar problem now a few times where lines inside
define variables are not being evaluated in make context but in shell
context.
An example, I was trying to convert U-Boot's makefile to genpackage.
Here is an excerpt.
---
define U_BOOT_POST_PATCH_HOOK_CUSTOM
	echo -e "\n\n\n\nU_BOOT_POST_PATCH_HOOK_CUSTOM.\n\n\n"
ifneq ($(qstrip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
	toolchain/patch-kernel.sh $(@D) $(U_BOOT_CUSTOM_PATCH_DIR) u-boot-$(U_BOOT_VERSION)-\*.patch
endif
endef # U_BOOT_POST_PATCH_HOOK_CUSTOM.

U_BOOT_POST_PATCH_HOOKS+=U_BOOT_POST_PATCH_HOOK_CUSTOM
---



The output is then:
---
$ make V=1 u_boot
...
echo -e "\n\n\n\nU_BOOT_POST_PATCH_HOOK_CUSTOM.\n\n\n"




U_BOOT_POST_PATCH_HOOK_CUSTOM.



ifneq (,)
/bin/sh: -c: line 0: syntax error near unexpected token `,'
/bin/sh: -c: line 0: `ifneq (,)'
make: *** [/home/crehill/obair/buildroot.org/output/build/u_boot-HEAD/.stamp_patched] Error 2
---



As you can see, the "ifneq" is being passed to the shell, where it is
meaningless.
Is it the indentation of the line:
        $(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
in package/Makefile.package.in that causes it to be passed to the shell
instead of being taken as make instructions?


If I unindent that line I get an error:
---
$ make V=1 u_boot
package/Makefile.package.in:209: *** commands commence before first target.  Stop.
---

So, is there any way of using ifdef/ifeq/ifneq in the a "define"
variable that is used as a command?
