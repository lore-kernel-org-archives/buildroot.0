From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 22:42:22 +0100
Subject: [Buildroot] [PATCH 1/2] ngrep: bump to version 1.47
In-Reply-To: <20181101132326.13015-1-fontaine.fabrice@gmail.com>
References: <20181101132326.13015-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103224222.229c064a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Nov 2018 14:23:25 +0100, Fabrice Fontaine wrote:

> - Add an upstream patch to fix --enable-pcre

If there is a --enable-pcre option, it is a strong indication that PCRE
is not mandatory. Indeed:

$ ./configure --help
[...]
--enable-pcre           use PCRE instead of GNU regex (default GNU)

So PCRE is not mandatory.

> -NGREP_LIBS = -lpcap -lpcre

Since this variable no longer exists...

>  ifeq ($(BR2_STATIC_LIBS),y)
>  NGREP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
>  endif
> @@ -20,7 +20,6 @@ NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"

This assignment becomes totally pointless.

>  NGREP_CONF_OPTS = \
>  	--with-pcap-includes=$(STAGING_DIR)/usr/include/pcap \
>  	--enable-pcre \
> -	--with-pcre=$(STAGING_DIR)/usr \
>  	--disable-dropprivs \
>  	--disable-pcap-restart
>  

You should add a --disable-tcpkill here, and then in your PATCH 2/2,
add the optional dependency on libdnet.

Your series on wireshark has the same issue: the first patch should
ensure all new optional dependencies are unconditionally disabled, and
then follow-up patches should enable them conditionally. This is
necessary for a correctly bisectable patch series. When patches are so
close in the same series, it's not a big big deal, but it's always
better when it's done really correctly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
