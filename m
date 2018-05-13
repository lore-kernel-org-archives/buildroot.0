From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 17:14:43 +0200
Subject: [Buildroot] [PATCH 1/1] woff2: fix build on m68k
In-Reply-To: <20180510101101.22094-1-fontaine.fabrice@gmail.com>
References: <20180510101101.22094-1-fontaine.fabrice@gmail.com>
Message-ID: <20180513151443.GB22130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2018-05-10 12:11 +0200, Fabrice Fontaine spake thusly:
> Same issue on woff2 than in some other packages such as lcdapi: see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509

Since we now have at least 5 packages affected by this bug, can't we
just include this into the CFLAGS uncoditionally, i.e.:

    diff --git a/package/Makefile.in b/package/Makefile.in
    index 4325f7b3a9..584c7fafb1 100644
    --- a/package/Makefile.in
    +++ b/package/Makefile.in
    @@ -173,6 +173,12 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
     TARGET_CXXFLAGS = $(TARGET_CFLAGS)
     TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
     
    +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
    +ifeq ($(BR2_m68k_cf),y)
    +TARGET_CFLAGS += -fno-dwarf2-cfi-asm
    +TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
    +endif
    +
     ifeq ($(BR2_BINFMT_FLAT),y)
     TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
        -Wl$(comma)-elf2flt)

...with the workaround removed from the 4 affected packages: berkeleydb,
kmsxx, lcdapi, and libasplib?

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.net/results/6c97a08e6ca2e914d54fbb525b3f0bb90023ef07
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/woff2/woff2.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/woff2/woff2.mk b/package/woff2/woff2.mk
> index b2ff33fe98..2f0206c82b 100644
> --- a/package/woff2/woff2.mk
> +++ b/package/woff2/woff2.mk
> @@ -21,4 +21,10 @@ ifneq ($(BR2_SHARED_LIBS),y)
>  WOFF2_CONF_OPTS += -DCMAKE_SKIP_RPATH=ON
>  endif
>  
> +# Internal error, aborting at dw2gencfi.c:215 in emit_expr_encoded
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
> +ifeq ($(BR2_m68k_cf),y)
> +WOFF2_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -fno-dwarf2-cfi-asm"
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.14.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
