From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 20 Feb 2014 15:00:18 +0100
Subject: [Buildroot] Parallel make messes up post-build in -next
In-Reply-To: <CAHkwnC-Pm8qE8beKmaJKkHsioOuGjWrgcM8oyxni2AuDChYF+Q@mail.gmail.com>
References: <20140220095550.GA16493@pc-eric>
 <CAHkwnC-Pm8qE8beKmaJKkHsioOuGjWrgcM8oyxni2AuDChYF+Q@mail.gmail.com>
Message-ID: <CAAXf6LVGJBDDYuMapT37LtwBnKTEe+LK==6T_YffAP6U8RnMkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Thu, Feb 20, 2014 at 2:42 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Thu, Feb 20, 2014 at 10:55 AM, Eric Le Bihan
> <eric.le.bihan.dev@free.fr> wrote:
>> Hi!
>>
>> I am currently testing the -next branch and I've encountered the following
>> problem: the copy of my overlay and the execution of my post-build script is
>> now performed *after* the generation of my image.
>>
>> Reverting commit a24877586a566e052897e50e6a0c2f53cfb029f5, which adds support
>> for top-level parallel make, fixes the issue.
>>
>> Has anyone else experienced this problem?
>>
>
> Can you try this patch?
>
> diff --git a/Makefile b/Makefile
> index 20aabd6..de568e3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -507,6 +507,8 @@ endif
>  STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
>  STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so*
> $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
>
> +$(TARGETS_ROOTFS): target-finalize
> +
>  target-finalize: $(TARGETS)
>         rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
>                 $(TARGET_DIR)/usr/lib/pkgconfig
> $(TARGET_DIR)/usr/share/pkgconfig \
> @@ -534,8 +536,6 @@ endif
>                 find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
>                 xargs -r $(KSTRIPCMD); fi
>
> -$(TARGETS_ROOTFS): target-finalize
> -
>  # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
>  # besides the one in which crash occurred; or SIGTRAP kills my program when
>  # I set a breakpoint"
>


Why do you think this would change anything?
As far as I know, the order of the dependency expression does not matter...
