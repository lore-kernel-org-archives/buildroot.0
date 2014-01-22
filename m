From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 22 Jan 2014 16:07:10 +1300
Subject: [Buildroot] [PATCH 1/1] Fixed tcpreplay auto build errors
In-Reply-To: <1390300886-15282-1-git-send-email-martin@barkynet.com>
References: <1390300886-15282-1-git-send-email-martin@barkynet.com>
Message-ID: <CAFOYHZDW+N_0oOYDCigr8-hG=vP-wW=Yey7ADrponotyXnxRFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 21, 2014 at 11:41 PM, Martin Bark <martin@barkynet.com> wrote:
> tcpreplay fails to compile unless it finds the tcpdump binary.  This patch
> makes tcpreplay dependent on tcpdump and sets the configure script to use
> tcpdump on the target
>
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/tcpreplay/Config.in    |    1 +
>  package/tcpreplay/tcpreplay.mk |    5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
> index 2ba2eb5..49c3284 100644
> --- a/package/tcpreplay/Config.in
> +++ b/package/tcpreplay/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_TCPREPLAY
>         bool "tcpreplay"
>         depends on BR2_USE_MMU # fork()
>         select BR2_PACKAGE_LIBPCAP
> +       select BR2_PACKAGE_TCPDUMP
>         help
>           Tcpreplay is a tool for replaying network traffic from files saved
>           with tcpdump or other tools which write pcap(3) files.
> diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
> index 0939c6c..f6a7c85 100644
> --- a/package/tcpreplay/tcpreplay.mk
> +++ b/package/tcpreplay/tcpreplay.mk
> @@ -11,8 +11,9 @@ TCPREPLAY_LICENSE_FILES = docs/LICENSE
>  TCPREPLAY_CONF_ENV = \
>         tr_cv_libpcap_version=">= 0.7.0" \
>         ac_cv_have_bpf=no
> -TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
> -TCPREPLAY_DEPENDENCIES = libpcap
> +TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr \
> +       --with-tcpdump=$(TARGET_DIR)/usr/sbin/tcpdump
> +TCPREPLAY_DEPENDENCIES = libpcap tcpdump
>
>  # libpcap may depend on symbols in libusb as well
>  TCPREPLAY_LIBS = -lpcap $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
> --
> 1.7.9.5

I think it would be nice if tcpreplay could build without tcpdump (on
the host or target). In the meantime this seems like the best
solution.

Acked-by: Chris Packham <judge.packham@gmail.com>
