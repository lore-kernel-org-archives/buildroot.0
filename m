From: COFFIGNAL Alexandre <acoffignal@GERAL.com>
Date: Mon, 30 Jun 2014 11:43:06 +0000
Subject: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues
 when zlib support enabled
In-Reply-To: <20140629163016.41256df2@free-electrons.com>
References: <1403878684-11934-1-git-send-email-acoffignal@geral.com>
 <20140629163016.41256df2@free-electrons.com>
Message-ID: <f8abef86a41446e6ac7848dfa49e9842@VMSMBX02.gpi.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

Yes this issue occurs only when  zlib-dev is installed in host system. (if I rename /usr/lib/libz.so in my host system, compilation works perfectly)  

Here compile error (without patch )

libtool: link: /bin/grep -E -e "^libssh2_.*" ".libs/libssh2.exp" > ".libs/libssh2.expT"
libtool: link: mv -f ".libs/libssh2.expT" ".libs/libssh2.exp"
libtool: link: echo "{ global:" > .libs/libssh2.ver
libtool: link:  cat .libs/libssh2.exp | sed -e "s/\(.*\)/\1;/" >> .libs/libssh2.ver
libtool: link:  echo "local: *; };" >> .libs/libssh2.ver
libtool: link:  /home/alexandre/Documents/Projets/Clients/ICE/Src/ice-buildroot-imx6/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc -shared  -fPIC -DPIC  .libs/channel.o .libs/comp.o .libs/crypt.o .libs/hostkey.o .libs/kex.o .libs/mac.o .libs/misc.o .libs/packet.o .libs/publickey.o .libs/scp.o .libs/session.o .libs/sftp.o .libs/userauth.o .libs/transport.o .libs/version.o .libs/knownhost.o .libs/agent.o .libs/openssl.o .libs/libgcrypt.o .libs/pem.o .libs/keepalive.o .libs/global.o   -Wl,-rpath -Wl,/home/alexandre/Documents/Projets/Clients/ICE/Src/ice-buildroot-imx6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -L/home/alexandre/Documents/Projets/Clients/ICE/Src/ice-buildroot-imx6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lssl -lcrypto -L/usr/lib -lz  -Os   -Wl,-soname -Wl,libssh2.so.1 -Wl,-version-script -Wl,.libs/libssh2.ver -o .libs/libssh2.so.1.0.1
/home/alexandre/Documents/Projets/Clients/ICE/Src/ice-buildroot-imx6/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.8.3/../../../../arm-linux-gnueabihf/bin/ld: cannot find /usr/lib/libc_nonshared.a
collect2: error: ld returned 1 exit status
make[3]: *** [libssh2.la] Erreur 1
make[3]: quittant le r?pertoire ? /home/alexandre/Documents/Projets/Clients/ICE/Src/ice-buildroot-imx6/buildroot/output/build/libssh2-1.4.3/src ?
make[2]: *** [all] Erreur 2
make[2]: quittant le r?pertoire ? /home/alexandre/Documents/Projets/Clients/ICE/Src/ice-buildroot-imx6/buildroot/output/build/libssh2-1.4.3/src ?
make[1]: *** [all-recursive] Erreur 1
make[1]: quittant le r?pertoire ? /home/alexandre/Documents/Projets/Clients/ICE/Src/ice-buildroot-imx6/buildroot/output/build/libssh2-1.4.3 ?
make: *** [/home/alexandre/Documents/Projets/Clients/ICE/Src/ice-buildroot-imx6/buildroot/output/build/libssh2-1.4.3/.stamp_built] Erreur 2

In this log, we can see link option : -L /usr/lib/ -lz  , that breaks compilation.

Best regards,

Alexandre

-----Message d'origine-----
De?: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Envoy??: dimanche 29 juin 2014 16:30
??: COFFIGNAL Alexandre
Cc?: buildroot at buildroot.org
Objet?: Re: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues when zlib support enabled

Dear Alexandre Coffignal,

On Fri, 27 Jun 2014 16:18:04 +0200, Alexandre Coffignal wrote:
> 
> Signed-off-by: Alexandre Coffignal <acoffignal@geral.com>
> ---
>  package/libssh2/libssh2.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index 19df9af..73aae8e 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -28,7 +28,8 @@ endif
>  # Add zlib support if enabled
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  LIBSSH2_DEPENDENCIES += zlib
> -LIBSSH2_CONF_OPT += --with-libz
> +LIBSSH2_CONF_OPT += --with-libz \
> +	--with-libz-prefix=$(STAGING_DIR)/usr
>  else
>  LIBSSH2_CONF_OPT += --without-libz
>  endif

Thanks for the patch. However, I was not able to reproduce the issue,
be it on a system with zlib-dev installed or not. Can you provide more
details about the issue you're seeing?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
