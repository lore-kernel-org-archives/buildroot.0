From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Feb 2017 22:17:02 +0100
Subject: [Buildroot] [PATCH] ncurses: remove
 BR2_PACKAGE_NCURSES_TARGET_{FORM, MENU, PANEL} options
In-Reply-To: <1487713193-3469-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487713193-3469-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170222211702.GB3569@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-21 22:39 +0100, Thomas Petazzoni spake thusly:
> The ncurses sub-options BR2_PACKAGE_NCURSES_TARGET_{FORM,MENU,PANEL}
> are currently very badly broken: they only control whether the
> libform, libmenu and libpanel libraries are installed in
> $(TARGET_DIR), but do absolutely nothing about their installation in
> $(STAGING_DIR).
[--SNIP--]

Impressive xommit log. Great! :-)

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/ncurses/ncurses.mk   | 47 +++++++++++++-------------------------------
[--SNIP--]
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 343909f..acf59da 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
[--SNIP--]
> @@ -115,6 +110,7 @@ NCURSES_TERMINFO_FILES += \
>  
>  NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
>  NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_PC
> +NCURSES_POST_INSTALL_TARGET_HOOKS += NCURSES_LINK_TARGET_LIBS

Would do you need to create the symlinks in target/ ?

When a program (or lib) is linked to a library, its DT_SONAME is used,
not the filename.

So if you have this chain of symlink, with the last element being an
actual file:

    libform.so -> libformw.so -> libformw.so.6 -> libformw.so.6.0

Then 'ld -lform' will in fact use the file libformw.so.6.0, extract its
DT_SONAME, and use that as a DT_NEEDED in the executable.

In this case, the DT_SONAME is libformw.so.6

Then at runtime, ld.so will use the DT_NEEDED name to find what library
to use, so in our case it will be looking for libformw.so.6, and will
never look for libform.so to start with.

So the w-suffixed symlinks in target are useless.

Ditto the syminks about the static libs: they are totally useless in
target/

Otherwise, tjis is a nice cleanup.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
