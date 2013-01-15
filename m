From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jan 2013 09:23:14 +0100
Subject: [Buildroot] [PATCH 1/1] httping: new package
In-Reply-To: <1358206327-28381-1-git-send-email-gilles.talis@gmail.com>
 (gilles talis's message of "Mon, 14 Jan 2013 15:32:07 -0800")
References: <1358206327-28381-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <871udmonwt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gilles" == gilles talis <gilles.talis@gmail.com> writes:

 gilles> From: Gilles Talis <gilles.talis@gmail.com>
 gilles> Httping is like 'ping' but for http-requests.
 gilles> Give it an url, and it'll show you how long it takes to connect,
 gilles> send a request and retrieve the reply (only the headers)

Thanks, committed with minor changes (see below).

 gilles> +++ b/package/httping/Config.in
 gilles> @@ -0,0 +1,23 @@
 gilles> +config BR2_PACKAGE_HTTPING
 gilles> +       bool "httping"
 gilles> +       help
 gilles> +         Httping is like 'ping' but for http-requests.
 gilles> +         Give it an url, and it'll show you how long it takes to connect,
 gilles> +         send a request and retrieve the reply (only the headers).
 gilles> +         Be aware that the transmission across the network also takes time!
 gilles> +         So it measures the latency of the webserver + network.
 gilles> +
 gilles> +         http://www.vanheusden.com/httping/
 gilles> +
 gilles> +if BR2_PACKAGE_HTTPING
 gilles> +
 gilles> +config BR2_PACKAGE_HTTPING_OPENSSL
 gilles> +       bool "OpenSSL support"
 gilles> +       select BR2_PACKAGE_OPENSSL
 gilles> +       help
 gilles> +         Adds openSSL support to httping

We normally automatically add openssl support if the openssl package is
enabled, so I've dropped this option.

 gilles> +
 gilles> +config BR2_PACKAGE_HTTPING_TFO
 gilles> +       bool "TCP Fast Open (TFO) support"

The TFO option seems to add very little overhead, so I think we could
have just always enabled it, but OK.

 gilles> +++ b/package/httping/httping.mk
 gilles> @@ -0,0 +1,37 @@
 gilles> +#############################################################
 gilles> +#
 gilles> +# httping
 gilles> +#
 gilles> +#############################################################
 gilles> +HTTPING_VERSION = 1.5.7

We normally have an empty line before _VERSION.

 gilles> +HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
 gilles> +HTTPING_SITE = http://www.vanheusden.com/httping
 gilles> +HTTPING_LICENSE = GPLv2
 gilles> +HTTPING_LICENSE_FILES = license.txt
 gilles> +
 gilles> +ifeq ($(BR2_PACKAGE_HTTPING_OPENSSL),y)
 gilles> +       HTTPING_DEPENDENCIES = openssl
 gilles> +else
 gilles> +       HTTPING_SSL = no
 gilles> +endif

 gilles> +
 gilles> +ifeq ($(BR2_PACKAGE_HTTPING_TFO),y)
 gilles> +       HTTPING_TFO = yes
 gilles> +endif
 gilles> +
 gilles> +define HTTPING_BUILD_CMDS
 gilles> +       $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 gilles> +               SSL=$(HTTPING_SSL) \
 gilles> +               DEBUG=no \
 gilles> +               TFO=$(HTTPING_TFO) -C $(@D)
 gilles> +endef

We normally indent the lines inside defines with <tabs> to be consistent
with make rules. I've cleaned this up a bit while changing the openssl
handling.

 gilles> +
 gilles> +define HTTPING_INSTALL_TARGET_CMDS
 gilles> +       $(INSTALL) -D -m 0755 $(@D)/httping $(TARGET_DIR)/usr/bin/httping

Upstream has a working 'make install', so I changed it to use that
instead.

-- 
Bye, Peter Korsgaard
