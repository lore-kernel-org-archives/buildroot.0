From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jul 2018 08:36:09 +0300
Subject: [Buildroot] [PATCH 24/50] package/busybox: invert dependency
 with net-tools
In-Reply-To: <b5c134bca07756a3f2b2d9d2dada05252ad262b1.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <b5c134bca07756a3f2b2d9d2dada05252ad262b1.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <20180703053609.vqdtuavkasojdhwm@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jul 02, 2018 at 11:11:58PM +0200, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/busybox/busybox.mk     | 1 +
>  package/net-tools/net-tools.mk | 8 ++------
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 8523271ceb..792a74cfd8 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
>  
>  # Packages that provide commands that may also be busybox applets:
>  BUSYBOX_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_NET_TOOLS),net-tools) \
>  	$(if $(BR2_PACKAGE_NETCAT),netcat) \
>  	$(if $(BR2_PACKAGE_NETCAT_OPENSBSD),netcat-openbsd) \
>  	$(if $(BR2_PACKAGE_NMAP),nmap) \
> diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
> index adab475b35..fc2546fa6b 100644
> --- a/package/net-tools/net-tools.mk
> +++ b/package/net-tools/net-tools.mk
> @@ -10,11 +10,6 @@ NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  NET_TOOLS_LICENSE = GPL-2.0+
>  NET_TOOLS_LICENSE_FILES = COPYING
>  
> -# Install after busybox for the full-blown versions
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -NET_TOOLS_DEPENDENCIES += busybox
> -endif
> -
>  define NET_TOOLS_CONFIGURE_CMDS
>  	(cd $(@D); yes "" | ./configure.sh config.in )
>  endef
> @@ -40,7 +35,8 @@ define NET_TOOLS_BUILD_CMDS
>  endef
>  
>  # install renames conflicting binaries, update does not
> -# ifconfig & route reside in /sbin for busybox
> +# ifconfig & route reside in /sbin for busybox, so ennsure we don't end

s/ennsure/ensure/

> +# up with two versions of those.
>  define NET_TOOLS_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) update
>  	mv -f $(TARGET_DIR)/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
