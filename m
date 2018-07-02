From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jul 2018 23:04:11 +0200
Subject: [Buildroot] [PATCH v2] Makefile: respect strip exclusions for
 special libraries
In-Reply-To: <20180702222516.5467cc60@windsurf.home>
References: <20180702160027.28557-1-john@metanate.com>
 <20180702164044.GD2604@scaer> <20180702175711.70bf95c7@donbot>
 <20180702222516.5467cc60@windsurf.home>
Message-ID: <20180702210411.GF2604@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, John, All,

On 2018-07-02 22:25 +0200, Thomas Petazzoni spake thusly:
> [...] I find this whole thing pretty complex/noisy. Can we do
> better ?
> 
> Here is some untested initial proposal:
> 
> # When stripping, obey to BR2_STRIP_EXCLUDE_DIRS and
> # BR2_STRIP_EXCLUDE_FILES
> STRIP_FIND_COMMON_CMD = \
> 	find $(TARGET_DIR) \
> 	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)),, \
> 		\( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
> 	) \
> 	-not $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) \
> 	-print0
> 
> # Regular stripping for everything, except libpthread, ld-*.so and
> # kernel modules.
> STRIP_FIND_CMD = \
> 	$(STRIP_FIND_COMMON_CMD) \
> 	-type f \( -perm /111 -o -name '*.so*' \) \
> 	-not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko) \)
> 
> # Special stripping (only debugging symbols) for libpthread and ld-*.so.
> STRIP_FIND_SPECIAL_LIBS_CMD = \
> 	$(STRIP_FIND_COMMON_CMD) \
> 	\( -name 'ld-*.so*' -o -name 'libpthread*.so*' \)
> 
> And then:
> 
> 	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
> 	$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 $(STRIPCMD) $(STRIP_STRIP_DEBUG) || true
> 
> Thoughts ?

Not tested, but it really looks nice.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
