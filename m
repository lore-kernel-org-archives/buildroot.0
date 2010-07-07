From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 7 Jul 2010 19:19:28 +0200
Subject: [Buildroot] Crosstool/Buildroot integration issue
In-Reply-To: <BLU0-SMTP11A24568AF672F1DE458A4E7B30@phx.gbl>
References: <BLU0-SMTP11A24568AF672F1DE458A4E7B30@phx.gbl>
Message-ID: <201007071919.28956.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andy, All,

On Wednesday 07 July 2010 16:19:44 Andy Gibbs wrote:
> I know you've been working on improving the integration of crosstool
> and buildroot recently.  Thank you - I really appreciate it,

Hey! Nice to see someone is interested in that! :-)

> but I'd like to point out an extra detail that may have been missed so
> far, and looking at toolchain/external-toolchain/ext-tool.mk in the git
> trunk, I think this still is missing.
> 
> Crosstool generates character set libraries in the 'sys-root/usr/lib/gconv'

There's no sysrot/usr/lib/gconv in my uClibc-based toolchain! :-P

> folder, but these are not being copied across into the target folder when
> all the other libraries are copied.  These means that certain applications
> that rely on these libraries don't function correctly.  It's a simple two
> line patch to the bottom of ext-tool.mk:
[--SNIp--]
> + $(Q)cp -dr $(ARCH_SYSROOT_DIR)/usr/lib/gconv $(TARGET_DIR)/usr/lib

Well, I'd rather we had something like:
- in menuconfig:
    () Additional dirs to copy from sysroot
      Help:
        This is a space-separated list of paths that you want to copy
        from the sysroot to the target. Make the paths relative to the
        sysroot. Example:
          /usr/lib/gconv /usr/include

- and in ext-tool.mk (to replace your changes, above):
  $(Q)for d in $(BR_EXT_TOOL_DIRS_EXTRA); do \
        if [ -d "$(ARCH_SYSROOT_DIR)$${d}" ]; then
          mkdir -p "$(TARGET_DIR)$${d}"
          cp -a "$${d}/." "$(TARGET_DIR)${d}/."
        else
          echo "No such directory '$${d}' whiel trying to copy from sysroot"
        fi
      done

But that's just my 2-cent advice...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
