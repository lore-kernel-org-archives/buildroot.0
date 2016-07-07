From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 22:14:23 +0200
Subject: [Buildroot] [PATCH] cifs-utils: disable PIE for m68k
In-Reply-To: <20160707174653.GA22696@waldemar-brodkorb.de>
References: <20160707174653.GA22696@waldemar-brodkorb.de>
Message-ID: <20160707221423.624856aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jul 2016 19:46:53 +0200, Waldemar Brodkorb wrote:
> PIE is not supported for uClibc-ng/m68k.
> 
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/4246de0280d4e7f8765adefd379c9dd414c316f1/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/cifs-utils/cifs-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
> index 9d4e223..c90a504 100644
> --- a/package/cifs-utils/cifs-utils.mk
> +++ b/package/cifs-utils/cifs-utils.mk
> @@ -10,7 +10,7 @@ CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
>  CIFS_UTILS_LICENSE = GPLv3+
>  CIFS_UTILS_LICENSE_FILES = COPYING
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> +ifneq ($(BR2_STATIC_LIBS)$(BR2_m68k),)
>  CIFS_UTILS_CONF_OPTS += --disable-pie
>  endif
>  

I've applied, but I'm wondering if we don't need to introduce a
BR2_TOOLCHAIN_SUPPORTS_PIE hidden boolean. PIE is not supported on ARC
and m68k, and it's not supported when statically linking with uClibc.

I have seen gcc patches for musl that make static PIE work, see
https://github.com/richfelker/musl-cross-make/blob/master/patches/gcc-5.3.0/0005-staticpie.diff.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
