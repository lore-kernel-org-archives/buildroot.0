From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 12:57:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/util-linux: libuuid needs -lintl
In-Reply-To: <16c19005f9076a857c9082f1f6fbe6617a1ec9a6.1417276704.git.yann.morin.1998@free.fr>
References: <cover.1417276704.git.yann.morin.1998@free.fr>
 <16c19005f9076a857c9082f1f6fbe6617a1ec9a6.1417276704.git.yann.morin.1998@free.fr>
Message-ID: <20141130115742.GC4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2014-11-29 16:59 +0100, Yann E. MORIN spake thusly:
> When gettext is needed (with locales), libuuid needs to be linked
> against -lintl.
> 
> In dynamic link, this is solved via the DT_NEEDED ELF tag, but for
> static links, it does not get pulled in automatically.
> 
> fix that by adding a Libs.private section to uid.pc, but only if
> it needed.
> 
> First part at fixing:
>     http://autobuild.buildroot.net/results/c46/c467aeec258909bb82eda77123803944f97d8df8/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/util-linux/util-linux.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 6ecd16d..dc10193 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -128,6 +128,14 @@ endif
>  
>  UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_GETTY_SYMLINK
>  
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PACKAGE_UTIL_LINUX_LIBUUID),yy)
> +define UTIL_LINUX_TWEAK_UUID_PC
> +	$(SED) '/Libs\.private: .*/d' $(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
> +	printf "Libs.private: -lintl\n" >>$(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
> +endef
> +UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_TWEAK_UUID_PC
> +endif

We've been discussing this on IRC, that we should come up with a patch
that could be upstreamable. Unfortunately, I have no idea on how to do
that...

It all boils down to util-linux not using the standard expansion
mechanism of autoconf (i.e. to replace @VARIABLE@ in .in files with the
value detected by ./configure).

Also, the way they are checking for gettext is way beyond my
understanding (well, I think I grasped most of it), and they have no
variable that expressly states whether -lintl is needed, just a LIBINTL
variable that contains whatever must be used to link with the
gettext-providing library.

The amount of work to fix that is way above the time left before our
release, so I believe we should go with that patch for now, and revisit
it later when we have some more time.

Opinions?

>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
>  
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
