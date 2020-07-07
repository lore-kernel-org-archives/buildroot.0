From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 7 Jul 2020 14:56:23 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/qemu: add vnc support
In-Reply-To: <20200629205002.8087-2-jared.bents@rockwellcollins.com>
References: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
 <20200629205002.8087-2-jared.bents@rockwellcollins.com>
Message-ID: <c7e7fad0-f1dd-f0ad-37e9-07d7a4b32dd8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jared,

Le 29/06/2020 ? 22:50, Jared Bents a ?crit?:
> update to add vnc support to qemu if libvncserver is
> selected
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/qemu/qemu.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 0b76e432e0..520547e94e 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -98,6 +98,13 @@ else
>  QEMU_OPTS += --disable-libusb
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBVNCSERVER),y)
> +QEMU_OPTS += --enable-vnc
> +QEMU_DEPENDENCIES += libvncserver
> +else
> +QEMU_OPTS += --disable-vnc
> +endif

When vnc support is enabled, vnc suboption will try to detect automatically some
dependencies (like libpng see [1][2]).

vnc-sasl        SASL encryption for VNC server
vnc-jpeg        JPEG lossy compression for VNC server
vnc-png         PNG compression for VNC server

Either disable them explicitly or handle the optional dependencies.

[1]
https://git.buildroot.net/buildroot/commit/?id=ece36b9a46583315fe0d607099e16949ed6c2b0b
[2]
https://git.qemu.org/?p=qemu.git;a=blob;f=configure;h=23b5e93752b6a2597b2099b502184bc5fc352bf1;hb=fdd76fecdde1ad444ff4deb7f1c4f7e4a1ef97d6#l1818

Best regards,
Romain

> +
>  ifeq ($(BR2_PACKAGE_NETTLE),y)
>  QEMU_OPTS += --enable-nettle
>  QEMU_DEPENDENCIES += nettle
> @@ -140,7 +147,6 @@ define QEMU_CONFIGURE_CMDS
>  			--disable-bsd-user \
>  			--disable-containers \
>  			--disable-xen \
> -			--disable-vnc \
>  			--disable-virtfs \
>  			--disable-brlapi \
>  			--disable-curses \
> 
