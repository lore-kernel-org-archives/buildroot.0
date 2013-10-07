From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Oct 2013 23:46:01 +0200
Subject: [Buildroot] [PATCH 1/1] ngrep: fix static linking issue with
 libpcre
In-Reply-To: <5251C11A.10808@openwide.fr>
References: <5251C11A.10808@openwide.fr>
Message-ID: <52532B99.20204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Romain,

On 10/06/13 21:59, Romain Naour wrote:
>
> -lpcre must be placed in LIBS
> So, use EXTRA_LIBS variable instead of LDFLAGS

  Ideally, the commit message should explain why it should be placed in 
LIBS instead of LDFLAGS.

>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>   package/ngrep/ngrep-1.45-configure-extra-lib.patch | 22 ++++++++++++++++++++++
>   package/ngrep/ngrep.mk                             |  3 ++-
>   2 files changed, 24 insertions(+), 1 deletion(-)
>   create mode 100644 package/ngrep/ngrep-1.45-configure-extra-lib.patch
>
> diff --git a/package/ngrep/ngrep-1.45-configure-extra-lib.patch b/package/ngrep/ngrep-1.45-configure-extra-lib.patch
> new file mode 100644
> index 0000000..aeb6a39
> --- /dev/null
> +++ b/package/ngrep/ngrep-1.45-configure-extra-lib.patch
> @@ -0,0 +1,22 @@
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + configure | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure b/configure
> +index 621f1be..bd5649f 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3533,7 +3533,7 @@ fi
> +
> + EXTRA_DEFINES=""
> + EXTRA_INCLUDES=""
> +-EXTRA_LIBS=""
> ++EXTRA_LIBS ?= ""

  This is a non-Posix bashism. You'd need something like

EXTRA_LIBS=${EXTRA_LIBS:-}

  However, why not just use the LIBS environment variable? Oh, looks like 
the Makefile.in is broken as well and should be patched to use @LIBS@ 
(which also removes the need for this EXTRA_LIBS hack).

  Is this project still maintained upstream? If not, don't bother 
creating upstreamable patches. If it is still maintained, a proper 
upstreamable patch could change configure.in to use PKG_CHECK_MODULES for 
libpcreposix.

  Regards,
  Arnout

> +
> +
> +
> +--
> +1.8.4
> +
> diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
> index 99b8f46..1501dab 100644
> --- a/package/ngrep/ngrep.mk
> +++ b/package/ngrep/ngrep.mk
> @@ -8,7 +8,8 @@ NGREP_VERSION = 1.45
>   NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
>   NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
>   NGREP_INSTALL_STAGING = YES
> -NGREP_CONF_ENV = LDFLAGS="-lpcre"
> +NGREP_CONF_ENV = EXTRA_LIBS="-lpcre"
> +
>   NGREP_CONF_OPT =  \
>   	--with-pcap-includes=$(STAGING_DIR)/usr/include \
>   	--enable-pcre \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
