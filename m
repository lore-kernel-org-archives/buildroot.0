From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Apr 2013 10:52:00 +0200
Subject: [Buildroot] [PATCH] ofono: bump to version 1.12
In-Reply-To: <1365839373-19783-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sat, 13 Apr 2013 08:49:32 +0100")
References: <1365839373-19783-1-git-send-email-spdawson@gmail.com>
Message-ID: <87vc7qq0cv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/ofono/ofono.mk |    8 +++++++-
 spdawson>  1 file changed, 7 insertions(+), 1 deletion(-)

 spdawson> diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
 spdawson> index e552eac..47228b5 100644
 spdawson> --- a/package/ofono/ofono.mk
 spdawson> +++ b/package/ofono/ofono.mk
 spdawson> @@ -3,7 +3,7 @@
 spdawson>  # ofono
 spdawson>  #
 spdawson>  #############################################################
 spdawson> -OFONO_VERSION = 1.7
 spdawson> +OFONO_VERSION = 1.12
 spdawson>  OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 spdawson>  OFONO_DEPENDENCIES = \
 spdawson>  	host-pkgconf \
 spdawson> @@ -14,6 +14,12 @@ OFONO_DEPENDENCIES = \
 
 spdawson>  OFONO_CONF_OPT = --disable-test
 
 spdawson> +# N.B. Qualcomm QMI modem support requires O_CLOEXEC, which
 spdawson> +# is not available on uClibc.
 spdawson> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
 spdawson> +	OFONO_CONF_OPT += --disable-qmimodem
 spdawson> +endif

It does actually, but it's only visible if you define _GNU_SOURCE:

E.G. the following works:

#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(void)
{
  int fd = open("blah", O_RDWR | O_CLOEXEC);
  return 0;
}

-- 
Bye, Peter Korsgaard
