From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 15:40:33 +0200
Subject: [Buildroot] [PATCH] package/gnutls: make the OpenSSL
 compatibility library optional
In-Reply-To: <20190815221933.18645-1-unixmania@gmail.com>
References: <20190815221933.18645-1-unixmania@gmail.com>
Message-ID: <20190817154033.47939aea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Aug 2019 19:19:33 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Add a BR2_PACKAGE_GNUTLS_OPENSSL option, disabled by default since it is
> not used by any package that depends on gnutls.
> 
> The library is licensed under GPLv3, which can be a problem for embedded
> systems due to the so-called anti-tivoization clause.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

We normally don't apply such changes in master after -rc1, but
considering the fact that it allows to disable a GPLv3 part of the
library, I found it important enough to have in master.

> +ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
>  GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
> -GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
> +GNUTLS_LICENSE_FILES = doc/COPYING.LESSER doc/COPYING
> +else
> +GNUTLS_LICENSE = LGPL-2.1+ (core library)
> +GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
> +endif

You don't need to repeat the license details for both cases, you can
simply append to them when the gnutls-openssl library is enabled. For
the _LICENSE variable, this requires a trick:

FOO_LICENSE := $(FOO_LICENSE), GPL-3.0+ (gnutls-openssl library)

Applied to master with this changed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
