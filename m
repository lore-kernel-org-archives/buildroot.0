From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 07 May 2014 16:43:46 +0200
Subject: [Buildroot] [PATCH] host-pkgconf: use --static option for
 static builds
In-Reply-To: <1394021977-60055-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1394021977-60055-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <536A46A2.2010502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/14 13:19, Vicente Olivert Riera wrote:
> Detect when BR2_PREFER_STATIC_LIBS is selected and modify the host
> pkg-config wrapper to append the --static option in that case.
> 
> Fixes:
>    http://autobuild.buildroot.net/results/161/161446dde7e8e774773eb2b34fd555f5ac22dd02/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Tested with an allpackageyesconfig with 
http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-x86-64-core2-full.config
as the toolchain (and PREFER_STATIC added to the config, of course).

 I ran this config with and without this patch applied, by running make -k
and then make -k again to collect the failures. 

 The following packages are fixed by this patch:
at
gdk-pixbuf
xerces
xfsprogs


 The following packages fail in both cases. I did a very basic
analysis for about half of them, but then I gave up :-)

python (duplicate symbols in -lpthread and -lc)
armadillo (builds a shared library and tries to link it with a static library)
audiofile (tries to link against libstdc++.so)
bash (multiple definition of function getenv)
util-linux (libpam needs -ldl)
directfb (tries to link against libstdc++.so)
mesa3d (tries to hardlink libGLESv1_CM.so instead of .a)
cdrkit (duplicate symbols in -lpthread and -lc)
libnspr (tries to link with gcc -shared ... --static ...)
rtmpdump (tries to link shared library against non-PIC .a libraries)
libssh2 (fails to link against -lgpg-error, dependency of gcrypt, which doesn't use pkg-config)
mysql (tries to link against libstdc++.so)
lm-sensors (tries to link with gcc -shared ... --static ...)
neard (duplicate symbols in -lpthread and -lc)
ofono (duplicate symbols in -lpthread and -lc)
coreutils (tries to link with gcc -shared ... --static ...)
crda (fails to link against -lgpg-error, dependency of gcrypt, which doesn't use pkg-config)
dhcpdump (fails to link agains -lusb, dependency of pcap, which doesn't use pkg-config)
dnsmasq (undefined references, but it does link against those libraries... weird)
keyutils (tries to link with gcc -shared ... --static ...)
elfutils (tries to link with gcc -shared ... --static ...)
exim (missing -pthread)
tcl (tries to link with gcc -shared ... --static ...)
fbgrab (missing -lm, dependency of libpng; fbgrab doesn't use pkg-config)
fbterm (missing -pthread)
fbv (missing -lz -lm, dependencies of libpng; fbv doesn't use pkg-config)
fetchmail (configure fails to link -lssl because of missing -lz; fetchmail doesn't use pkg-config)
flashrom (missing -lz, dependency of libpci)
openssh (configure fails to link -lssl because of missing -lz)
perl (but it succeeds the second build!)
libsigc (tries to link against libstdc++.so)
gnuplot (missing -pthread from libgd)
portaudio (tries to link against libstdc++.so)
libv4l (missing -pthread and -ljpeg)
taglib (tries to link with gcc -shared ... --static ...)
libvpx (failed sstrip; probably not related to static build)
heirloom-mailx (multiple definition of getopt)
polarssl (missing -lz, dependency of -lcrypto)
httping (missing -lm, dependency of -lfftw3)
iftop (configure fails on -lpcap, which doesn't use pkg-config)
inotify-tools (multiple definitions of internal symbols, weird)
iproute2 (tries to link with gcc -shared ... --static ...)
iprutils (undefined references to wattr from -lmenu (ncurses))
kismet (configure fails on -lpcap, which doesn't use pkg-config)
knock (configure fails on -lpcap, which doesn't use pkg-config)
lcdapi (tries to link with gcc -shared ... --static ...)
lcdproc (tries to link with gcc -shared ... --static ...)
lftp (tries to link against libstdc++.so)
libeXosip2 (missing -lssl + dependencies)
libfcgi (tries to link against libstdc++.so)
libgeotiff (configures fails to link with -ltiff)
libiqrf (tries to link with gcc -shared ... --static ...)
libiscsi (tries to link with gcc -shared ... --static ...)
libmicrohttpd (configure fails to link with -lgnutls)
libplist (tries to link with gcc -shared ... --static ...)
libqrencode (missing -pthread)
libroxml (missing -pthread)
libseccomp (tries to link with gcc -shared ... --static ...)
libserial (tries to link against libstdc++.so)
libwebsockets (tries to link with gcc -shared ... --static ...)
lighttpd (but succeeds the second time)
log4cplus
logrotate
ltp-testsuite (probably not related to static)
lxc
mtdev2tuio
mutt
ndisc6
slang
nfs-utils
nftables
ngrep
numactl
protobuf
olsr
openntpd
openpowerlink
oprofile
poppler
procps
proftpd
ptpd2
quagga
quota
rpm
rsh-redone
ruby
smstools3
snappy
squid
sudo
sysstat
tar
tcpreplay
ti-utils
tinyxml
tn5250
uemacs
urg
ushare
valgrind
vpnc
vsftpd
wget
wireshark
xinetd
xl2tp
xmlstarlet
znc


 For the interested, the log of these failures is available at
http://code.bulix.org/bezsjm-86178


 Regards,
 Arnout

> ---
>  package/pkgconf/pkg-config.in |    2 +-
>  package/pkgconf/pkgconf.mk    |   14 ++++++++++++++
>  2 files changed, 15 insertions(+), 1 deletions(-)
> 
> diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
> index 25a536b..4dec487 100644
> --- a/package/pkgconf/pkg-config.in
> +++ b/package/pkgconf/pkg-config.in
> @@ -1,2 +1,2 @@
>  #!/bin/sh
> -PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf $@
> +PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf @STATIC@ $@
> diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
> index f3f6526..9641371 100644
> --- a/package/pkgconf/pkgconf.mk
> +++ b/package/pkgconf/pkgconf.mk
> @@ -24,8 +24,22 @@ define HOST_PKGCONF_INSTALL_WRAPPER
>  		$(HOST_DIR)/usr/bin/pkg-config
>  endef
>  
> +define HOST_PKGCONF_STATIC
> +	$(SED) 's, at STATIC@,--static,' $(HOST_DIR)/usr/bin/pkg-config
> +endef
> +
> +define HOST_PKGCONF_SHARED
> +	$(SED) 's, at STATIC@,,' $(HOST_DIR)/usr/bin/pkg-config
> +endef
> +
>  PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
>  HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
>  
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
> +else
> +	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_SHARED
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
