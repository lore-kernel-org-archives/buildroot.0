From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Nov 2017 22:14:42 +0100
Subject: [Buildroot] [PATCH v2 2/2] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <1508936397-33651-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1508936397-33651-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1508936397-33651-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <e29b21b0-6c5f-ef3b-4123-9e8782639f43@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

 In the subject: s/RELFO/RELRO/

On 25-10-17 14:59, Matt Weber wrote:
> This enables a user to build a complete system using these
> options.  It is important to note that not all packages will
> build correctly to start with.

 So perhaps you could make another patch that extends the autobuilders to test
this option. Just modify utils/genrandconfig and in the gen_config function
randomly enable these options.

> Additional initial patches
> which update linker ordering changes, etc will be upstreamed
> and then submitted to buildroot as a patch or bump.
> 
> A good testing tool to check a target's elf files for compliance
> to an array of hardening techniques can be found here:
> https://github.com/slimm609/checksec.sh
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v1 -> v2
>  - Cosmetic caps on titles
> ---
>  Config.in           | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  package/Makefile.in | 25 +++++++++++++++++++++++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 61f6aa6..68eff24 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -730,6 +730,64 @@ endchoice
>  comment "Stack Smashing Protection needs a toolchain w/ SSP"
>  	depends on !BR2_TOOLCHAIN_HAS_SSP
>  
> +choice
> +	bool "RELRO Protection"
> +	help
> +	  Enable a link-time protection know as RELRO (RELocation Read Only)
> +	  which helps to protect from certain type of exploitation techniques
> +	  altering the content of some ELF sections.
> +
> +config BR2_RELRO_NONE
> +	bool "None"
> +	help
> +	  Enables Relocation link-time protections.
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
> +	  This option includes the partial configuration, but also
> +	  marks the GOT as read-only at the cost of initialization time
> +	  during program loading, i.e every time an executable is started.

 Do these options make sense at all in static linking? Isn't it implicit then
(text is always readonly I think)? -pie is certainly invalid in static linking
(at least with uClibc).

 Also, does it make sense on NOMMU, even shared? I mean, "readonly" doesn't mean
much when there is no MMU I think...

> +
> +endchoice
> +
> +choice
> +	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
> +	help
> +	  Enable the _FORTIFY_SOURCE macro which introduces additional
> +	  checks to detect buffer-overflows in the following standard library
> +	  functions: memcpy, mempcpy, memmove, memset, strcpy, stpcpy,
> +	  strncpy, strcat, strncat, sprintf, vsprintf, snprintf, vsnprintf,
> +	  gets.
> +
> +config BR2_FORTIFY_SOURCE_NONE
> +	bool "None"
> +	help
> +	  Enables additional checks to detect buffer-overflows.
> +
> +config BR2_FORTIFY_SOURCE_1
> +	bool "Conservative"
> +	help
> +	  This option sets _FORTIFY_SOURCE set to 1 and only introduces
> +	  checks that shouldn't change the behavior of conforming programs.
> +	  Adds checks at compile-time only.
> +
> +config BR2_FORTIFY_SOURCE_2
> +	bool "Aggressive"
> +	help
> +	  This option sets _FORTIFY_SOURCES set to 2 and some more checking
> +	  is added, but some conforming programs might fail.
> +	  Also adds checks at run-time (detected buffer overflow terminates
> +	  the program)

 Do you know how these behave in uClibc and musl? Waldemar, any idea? Obviously
the gcc part will still be activated, which covers about half of the functionality.

> +
> +endchoice
> +
>  endmenu
>  
>  source "toolchain/Config.in"
> diff --git a/package/Makefile.in b/package/Makefile.in
> index a1a5316..c99361f 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -144,6 +144,9 @@ TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>  TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>  
> +TARGET_CFLAGS_RELRO = -Wl,-z,relro
> +TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
> +
>  ifeq ($(BR2_BINFMT_FLAT),y)
>  TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>  	-Wl$(comma)-elf2flt)
> @@ -181,6 +184,28 @@ TARGET_CXXFLAGS += -fstack-protector-all
>  TARGET_FCFLAGS += -fstack-protector-all
>  endif
>  
> +ifeq ($(BR2_RELRO_PARTIAL),y)
> +TARGET_CFLAGS += $(TARGET_CFLAGS_RELRO)
> +TARGET_CXXFLAGS += $(TARGET_CFLAGS_RELRO)
> +TARGET_FCFLAGS += $(TARGET_CFLAGS_RELRO)

 Since these are linker flags, it _should_ be sufficient to add them to LDFLAGS.
There may be some packages that don't listen to LDFLAGS so in that sense it
could be a good idea to add it to CFLAGS as well, but I tend to prefer to fix
the packages. Only, there is no easy way to detect that LDFLAGS are ignored.

> +TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
> +else ifeq ($(BR2_RELRO_FULL),y)
> +TARGET_CFLAGS += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
> +TARGET_CXXFLAGS += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
> +TARGET_FCFLAGS += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
> +TARGET_LDFLAGS += -pie
> +endif
> +
> +ifeq ($(BR2_FORTIFY_SOURCE_1),y)
> +TARGET_CFLAGS += -D_FORTIFY_SOURCE=1
> +TARGET_CXXFLAGS += -D_FORTIFY_SOURCE=1

 It should go into CPPFLAGS (which automatically goes into CFLAGS and CXXFLAGS).

> +TARGET_FCFLAGS += -D_FORTIFY_SOURCE=1

 FCFLAGS indeed needs to be handled separately. Except: is FORTIFY valid/useful
for Fortran?


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
