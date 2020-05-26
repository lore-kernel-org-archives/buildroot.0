From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 21:44:12 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] boot/grub2: Fix GRUB i386-pc build with Ubuntu gcc
In-Reply-To: <20200526182937.2246421-1-fontaine.fabrice@gmail.com>
References: <20200526182937.2246421-1-fontaine.fabrice@gmail.com>
Message-ID: <20200526194412.GA8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-26 20:29 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=12946

I was not able to reproduce the build issue, on Ubuntu 19.10. Can we
have a defconfig that exhibits the issue?

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add autoreconf

The added patch only touches gentpl.py, which is not one of the usual
autotools-related files, so why do we have to autoreconf?

This is becaise gentpl.py is needed to generate Makefile.util.am and
grub-core/Makefile.core.am, and those two files also have a dependency
on gentpl.py.

So, as we patch gentpl/py, the dependency kicks in, the .am files are
regenerated, and the autotools machinery decides to re-autoreconf. And
that breaks.

However, gentpl.py should be run *before* running autoreconf (as the
convoluted upstream autogen.sh script shows), to avoid re-running the
autoconf suite during the build.

But that it is not so trivial either, because gentpl.py is called from
the convoluted autogen.sh, which ends up calling autoreconf (but
obviously without our custom variables...

However, it looks like autogen.sh can be told to not run autoreconf if
the environment variable FROM_BOOTSTRAP is set and non-empty. Then we
can run our autoreconf hook as usual, hopefully...

And also, gentpl.py is a python script, so it means that grub now gains
a dependency to python or python3. Not good, not good... :-(

I know we usualy try to avoid that if at all possible, but can we not
just patch the generated files as well?

Regards,
Yann E. MORIN.

>  ...x-GRUB-i386-pc-build-with-Ubuntu-gcc.patch | 48 +++++++++++++++++++
>  boot/grub2/grub2.mk                           |  2 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
> 
> diff --git a/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch b/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
> new file mode 100644
> index 0000000000..d8acbc5621
> --- /dev/null
> +++ b/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
> @@ -0,0 +1,48 @@
> +From 6643507ce30f775008e093580f0c9499dfb2c485 Mon Sep 17 00:00:00 2001
> +From: Simon Hardy <simon.hardy@itdev.co.uk>
> +Date: Tue, 24 Mar 2020 13:29:12 +0000
> +Subject: build: Fix GRUB i386-pc build with Ubuntu gcc
> +
> +With recent versions of gcc on Ubuntu a very large lzma_decompress.img file is
> +output. (e.g. 134479600 bytes instead of 2864.) This causes grub-mkimage to
> +fail with: "error: Decompressor is too big."
> +
> +This seems to be caused by a section .note.gnu.property that is placed at an
> +offset such that objcopy needs to pad the img file with zeros.
> +
> +This issue is present on:
> +Ubuntu 19.10 with gcc (Ubuntu 8.3.0-26ubuntu1~19.10) 8.3.0
> +Ubuntu 19.10 with gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
> +
> +This issue is not present on:
> +Ubuntu 19.10 with gcc (Ubuntu 7.5.0-3ubuntu1~19.10) 7.5.0
> +RHEL 8.0 with gcc 8.3.1 20190507 (Red Hat 8.3.1-4)
> +
> +The issue can be fixed by removing the section using objcopy as shown in
> +this patch.
> +
> +Signed-off-by: Simon Hardy <simon.hardy@itdev.co.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +[Retrieved from:
> +http://git.savannah.gnu.org/cgit/grub.git/commit/?id=6643507ce30f775008e093580f0c9499dfb2c485]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + gentpl.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gentpl.py b/gentpl.py
> +index 387588c05..c86550d4f 100644
> +--- a/gentpl.py
> ++++ b/gentpl.py
> +@@ -766,7 +766,7 @@ def image(defn, platform):
> + if test x$(TARGET_APPLE_LINKER) = x1; then \
> +   $(MACHO2IMG) $< $@; \
> + else \
> +-  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; \
> ++  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; \
> + fi
> + """)
> + 
> +-- 
> +cgit v1.2.1
> +
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index a202525d71..9063ab8f19 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -12,6 +12,8 @@ GRUB2_LICENSE_FILES = COPYING
>  GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
>  HOST_GRUB2_DEPENDENCIES = host-bison host-flex
>  GRUB2_INSTALL_IMAGES = YES
> +# 0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
> +GRUB2_AUTORECONF = YES
>  
>  ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
>  GRUB2_INSTALL_TARGET = YES
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
