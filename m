From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Aug 2017 00:29:52 +0200
Subject: [Buildroot] [PATCH] RFC: security hardening [RELO & FORTIFY]
In-Reply-To: <1501559354-56821-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1501559354-56821-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <9daed40a-317c-e034-9209-d01be7c01ebd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

 I certainly like the idea of adding these options!

 However, it should be two separate patches.

On 01-08-17 05:49, Matt Weber wrote:
> An adaptation of the OpenWRT Hardening options for RELO and Fortify
> (https://patchwork.ozlabs.org/patch/427454/)
> 
> The enabling of these options can be verified by a post build
> analysis of the elf file output using a tool like checksec.sh
> (https://github.com/slimm609/checksec.sh).
> 
> Initial testing of these options were performed using a build of
> the qemu_aarch64_virt_defconfig target.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ----
> 
> While testing this patch, I've noticed there are some hardening
> items which could be improved in the Buildroot toolchain build
> of (at least through my testing) the glibc variant.  I've started
> looking at enabling libssp and working the dependency/overlap between
> the standard library and GCC's approach.  The end goal I'm aiming
> for is a comparable toolchain to linaro when it comes to default
> hardening configuration.
> ---
>  Config.in           | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  package/Makefile.in | 20 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index e395995..323220c 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -726,6 +726,63 @@ config BR2_REPRODUCIBLE
>  	  This is labeled as an experimental feature, as not all
>  	  packages behave properly to ensure reproducibility.
>  
> +comment "Security Hardening Options"

 I like that you add a new section for this. I'd also put SSP in there, and move
it out of the Advanced menu (it's not that advanced...). To make it clean, it
will probably have to move below the advanced menu.

> +
> +choice
> +	bool "RELRO protection"
> +	help
> +	  Enable a link-time protection know as RELRO (Relocation Read Only)
> +	  which helps to protect from certain type of exploitation techniques

 Lines are too long (wrap at 72 characters, where tab counts for 8, so 62
characters after the indent).

> +	  altering the content of some ELF sections.
> +
> +config BR2_RELRO_NONE
> +	bool "None"
> +	help
> +	  Disables Relocation link-time protections.

 Disable -> No (you're not disabling them, you refrain from enabling them).

> +
> +config BR2_RELRO_PARTIAL
> +	bool "Partial"
> +	help
> +	  This option makes the dynamic section not writeable after
> +	  initialization (with almost no performance penalty).
> +
> +config BR2_RELRO_FULL
> +	bool "Full"
> +	help
> +	  This option includes the partial configurtation, but also

 configuration

> +	  marks the GOT as read-only at the cost of initializing time

 initialization

> +	  during startup.

 during program loading, i.e. every time an executable is started

(right?)

> +
> +endchoice
> +
> +choice
> +	bool "Buffer-overflows detection (FORTIFY_SOURCE)"

 Buffer-overflow (singular)

> +	help
> +	  Enable the _FORTIFY_SOURCE macro which introduces additional
> +	  checks to detect buffer-overflows in the following standard library
> +	  functions: memcpy, mempcpy, memmove, memset, strcpy, stpcpy,
> +	  strncpy, strcat, strncat, sprintf, vsprintf, snprintf, vsnprintf,
> +	  gets.

 I believe there are more (a lot more?) functions that get fortified, and it
probably depends on the version.

 Does this option make sense at all with musl or uClibc-ng?

> +
> +config BR2_FORTIFY_SOURCE_NONE
> +	bool "None"
> +	help
> +	  Disables additional checks to detect buffer-overflows.
> +
> +config BR2_FORTIFY_SOURCE_1
> +	bool "Conservative"
> +	help
> +	  This option sets _FORTIFY_SOURCE set to 1 and only introduces
> +	  checks that sholdn't change the behavior of conforming programs,

 shouldn't

> +
> +config BR2_FORTIFY_SOURCE_2
> +	bool "Aggressive"
> +	help
> +	  This option sets _FORTIFY_SOURCES set to 2 and some more checking
> +	  is added, but some conforming programs might fail.

 Can you describe this a bit more accurately? "conforming programs may fail" is
a bit vague... If this really happens, perhaps this shouldn't be a system-wide
option but instead be used by individual packages that *do* work correctly.

> +
> +endchoice
> +
>  endmenu
>  
>  endmenu
> diff --git a/package/Makefile.in b/package/Makefile.in
> index a1a5316..68ba50c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -181,6 +181,26 @@ TARGET_CXXFLAGS += -fstack-protector-all
>  TARGET_FCFLAGS += -fstack-protector-all
>  endif
>  
> +ifeq ($(BR2_RELRO_PARTIAL),y)
> +TARGET_CFLAGS += -Wl,-z,relro
> +TARGET_CXXFLAGS += -Wl,-z,relro
> +TARGET_FCFLAGS += -Wl,-z,relro

 These should definitely also go into TARGET_LDFLAGS.

 But perhaps it would be good to refactor this now, define

TARGET_ALLLDFLAGS += -Wl,-z,relro

...

TARGET_CFLAGS += $(TARGET_ALLLDFLAGS)
TARGET_CXXFLAGS += $(TARGET_ALLLDFLAGS)
TARGET_FCFLAGS += $(TARGET_ALLLDFLAGS)
TARGET_LDFLAGS += $(TARGET_ALLLDFLAGS)

 Something similar can be done with TARGET_ALLFLAGS for flags that *don't* go
into LDFLAGS (like stack-protector).

> +else ifeq ($(BR2_RELRO_FULL),y)
> +TARGET_CFLAGS += -Wl,-z,now -Wl,-z,relro

 Not sure if it is better, but this could be -Wl,-z,now,-z,relro


> +TARGET_CXXFLAGS += -Wl,-z,now -Wl,-z,relro
> +TARGET_FCFLAGS += -Wl,-z,now -Wl,-z,relro
> +endif
> +
> +ifeq ($(BR2_FORTIFY_SOURCE_1),y)
> +TARGET_CFLAGS += -D_FORTIFY_SOURCE=1
> +TARGET_CXXFLAGS += -D_FORTIFY_SOURCE=1
> +TARGET_FCFLAGS += -D_FORTIFY_SOURCE=1

 Does -D work for fortran? If yes, why don't we have TARGET_CPPFLAGS in
TARGET_FCFLAGS?

 Also it should probably go into TARGET_CPPFLAGS as well.

 Regards,
 Arnout

> +else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
> +TARGET_CFLAGS += -D_FORTIFY_SOURCE=2
> +TARGET_CXXFLAGS += -D_FORTIFY_SOURCE=2
> +TARGET_FCFLAGS += -D_FORTIFY_SOURCE=2
> +endif
> +
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  TARGET_CROSS = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-
>  else
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
