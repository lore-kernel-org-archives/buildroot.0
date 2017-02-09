From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  9 Feb 2017 11:29:51 +0100
Subject: [Buildroot] [PATCH 1/2] libevent: disable sample programs to
	workaround static linking issue
Message-ID: <20170209102952.6351-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/1e7/1e7027b1b87d88b4517b1b19d3a2ae54c24f2c10/
http://autobuild.buildroot.net/results/ff7/ff7e010b41e7448d15d20396e9e9bd7319dd493b/
http://autobuild.buildroot.net/results/269/269a3a76f61c65423ba703a85e94cc003fb75e4c/

Libevent/libtool gets confused by the library order when statically linking
the sample programs and passes -lz before -lcrypto even though libcrypto
uses zlib.

/bin/bash ./libtool --tag=CC --mode=link ..  -o sample/https-client \
	sample/https-client.o sample/hostcheck.o \
	sample/openssl_hostname_validation.o libevent.la \
	libevent_openssl.la -lssl -lcrypto -lz -lz -lcrypto

libtool: link: ..  -o sample/https-client sample/https-client.o \
	sample/hostcheck.o sample/openssl_hostname_validation.o \
	./.libs/libevent.a ./.libs/libevent_openssl.a \
	-lssl -lz -lcrypto

../libcrypto.a(c_zlib.o): In function `zlib_stateful_expand_block':
c_zlib.c:(.text+0x30): undefined reference to `inflate'

This is most likely fixable, but as the sample programs aren't installed /
used, simply skip building them to save time and work around this issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevent/libevent.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 0a5417f98..128bb2ac7 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -11,6 +11,7 @@ LIBEVENT_LICENSE = BSD-3c, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
 # For 0001-Disable-building-test-programs.patch
 LIBEVENT_AUTORECONF = YES
+LIBEVENT_CONF_OPTS = --disable-samples
 
 define LIBEVENT_REMOVE_PYSCRIPT
 	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
-- 
2.11.0
