From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Mar 2012 20:51:17 +0200
Subject: [Buildroot] [PATCH] valgrind: allow selecting which tools to
	install
In-Reply-To: <3d26fc988e01a367dd05.1331743859@beantl019720>
References: <3d26fc988e01a367dd05.1331743859@beantl019720>
Message-ID: <201203252051.17560.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 14 March 2012 17:50:59 Thomas De Schampheleire wrote:
> The full valgrind installation takes more than 20 MB, while one typically does
> not use all of its tools. This patch adds extra config options to select which
> tools to install.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Strange that this patch didn't get any feedback before...  I guess we
all trust Thomas enough to make good patches :-)

 I'm a bit at loss as to what to do now.  I believe this patch is useful
and good enough to go in as it is.  So:
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 On the other hand, I do have some ideas how to make it even better.
But if I write these down, I'm afraid it will slow down the inclusion
of a useful and well-implemented feature...  Well, I'll take the risk:

[snip]
> +config BR2_PACKAGE_VALGRIND_MEMCHECK
> +	bool "Memcheck: a memory error detector"
> +	default y
> +	help
> +	  This option allows to install the Memcheck tool
> +
> +config BR2_PACKAGE_VALGRIND_CACHEGRIND
> +	bool "Cachegrind: a cache and branch-prediction profiler"
> +	default y
> +	help
> +	  This option allows to install the Cachegrind tool

 Even though this breaks existing configurations, I believe that all
tools (with the possible exception of memcheck) should default to
no.  For existing configurations, that's what most people will want
anyway.  And for new configurations, I think it's usually just one,
maybe two tools that are needed, so it's a lot of work to disable
all of them.

[snip]
> +config BR2_PACKAGE_VALGRIND_PTRCHECK
> +	bool "Ptrcheck: an experimental head, stack and global array overrun detector"
> +	default y
> +	help
> +	  This option allows to install the Ptrcheck tool

 At the very least, the experimental ones should default to no.

[snip]
> +config BR2_PACKAGE_VALGRIND_NULGRIND
> +	bool "Nulgrind: the minimal Valgrind tool"
> +	default y
> +	help
> +	  This option allows to install the Nulgrind tool

 And this one definitely should default to no.

[snip]
> +ifeq ($(BR2_PACKAGE_VALGRIND_MEMCHECK),)
> +define VALGRIND_REMOVE_MEMCHECK
> +	rm -f $(TARGET_DIR)/usr/lib/valgrind/*memcheck*
> +endef
> +
> +VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_MEMCHECK
> +endif

 It's probably just personal preference, but I like to see:

define VALGRIND_REMOVE_MEMCHECK
	rm -f $(TARGET_DIR)/usr/lib/valgrind/*memcheck*
endef

VALGRIND_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_VALGRIND_MEMCHECK),,VALGRIND_REMOVE_MEMCHECK)

(although the double comma isn't making things very clear either...)


 It would actually be better to not build the unneeded tools at all, by 
setting
VALGRIND_MAKE_OPT = TOOLS="..." EXP_TOOLS="..."

 Unfortunately, Makefile.autotools.in doesn't use PKG_MAKE_OPT for the 
install targets (which is probably a bug...), so that won't work.

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
