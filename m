From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 20:51:33 +0100
Subject: [Buildroot] [PATCH next v7 1/2] libkrb5: New package
In-Reply-To: <1519124017-7510-1-git-send-email-nerv@dawncrow.de>
References: <1519124017-7510-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20180225205133.5a02f4ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Feb 2018 11:53:36 +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

This still doesn't build for me, as I reported on a previous
iteration, but I found out why: I have libverto installed on my host
system, and libkrb5 tries to use it instead of the bundled one.

> +LIBKRB5_VERSION_MAJOR = 1.16
> +LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR)
> +LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
> +LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
> +LIBKRB5_SUBDIR = src
> +LIBKRB5_LICENSE = MIT
> +LIBKRB5_LICENSE_FILES = NOTICE
> +LIBKRB5_INSTALL_STAGING = YES

Please add:

LIBKRB5_CONF_OPTS = --without-system-verto

here to solve this build issue.

However, I see that it has a bunch of similar options:

 --with-system-et
 --with-system-ss
 --with-system-db

and it also has other options like --without-libedit and
--with-readline. You should handle all those options, at the very least
to disable detection libedit and readline.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
