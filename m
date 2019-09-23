From: Mircea Gliga <gliga.mircea@gmail.com>
Date: Mon, 23 Sep 2019 09:11:40 +0300
Subject: [Buildroot] [PATCH 1/1] package/libssh: add support for mbedtls
 crypto backend
In-Reply-To: <20190918174859.1627727d@windsurf>
References: <20190918110609.7172-1-gliga.mircea@gmail.com>
 <20190918174859.1627727d@windsurf>
Message-ID: <CAKpO6uFOE2ShN1JupQoiupNF-SVnWzMiJ5x9twcAueGG5p9how@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and thanks for the review,

The Config.in also has this part that automatically selects the OpenSSL
package if no crypto backend is already available:

> -       select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
> +       select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS ||
BR2_PACKAGE_LIBGCRYPT)

This is in sync with the old behavior, when mbedtls was not in scope.
And then in case there are multiple crypto backends available it will
prefer Libgcrypt, then OpenSSL and in the end mbedTLS:

> +     default BR2_PACKAGE_LIBSSH_LIBGCRYPT if BR2_PACKAGE_LIBGCRYPT
> +     default BR2_PACKAGE_LIBSSH_OPENSSL if BR2_PACKAGE_OPENSSL
> +     default BR2_PACKAGE_LIBSSH_MBEDTLS if BR2_PACKAGE_MBEDTLS

The default will be to select the first enabled crypto backend provider
in the same preference order as is used now, i.e. no change from current
behavior.

Thanks and regards
Mircea
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190923/fdf120f2/attachment.html>
