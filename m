From: Yi Zheng <goodmenzy@gmail.com>
Date: Mon, 4 Nov 2019 12:01:35 +0800
Subject: [Buildroot] [PATCH] netsniff-ng: add dependency on libsodium.
Message-ID: <CAJPHfYPx=t_sWDGZ=U9FNmAZ7EHgG6wzpKfemvuTqrS2uXKsZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tool 'curvetun' in netsniff-ng package can only be built
when NACL/Sodium lib is added.

Adjust the dependency and the configure environ settings to
build the curvetun tool.

Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
---
 package/netsniff-ng/netsniff-ng.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/netsniff-ng/netsniff-ng.mk
b/package/netsniff-ng/netsniff-ng.mk
index 283ecaf245..34a9fd8a3a 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -11,9 +11,10 @@ NETSNIFF_NG_LICENSE = GPL-2.0
 NETSNIFF_NG_LICENSE_FILES = README COPYING
 # Prevent netsniff-ng configure script from finding a host installed nacl
 NETSNIFF_NG_CONF_ENV = \
-       NACL_INC_DIR=/dev/null \
-       NACL_LIB_DIR=/dev/null
-NETSNIFF_NG_DEPENDENCIES = libnl libpcap libnetfilter_conntrack liburcu
+       NACL_INC_DIR=$(STAGING_DIR)/usr/include/sodium \
+       NACL_LIB_DIR=$(STAGING_DIR)/lib\
+       NACL_LIB=sodium
+NETSNIFF_NG_DEPENDENCIES = libnl libpcap libnetfilter_conntrack
liburcu libsodium

 ifeq ($(BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN),y)
 NETSNIFF_NG_DEPENDENCIES += libcli libnet
--
2.23.0
