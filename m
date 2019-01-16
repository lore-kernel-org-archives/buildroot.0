From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Wed, 16 Jan 2019 12:43:30 +0100
Subject: [Buildroot] [PATCH v4 1/2] libopenssl: bump version to 1.1.1a
Message-ID: <CAKKE0ZGrgnuVRzqeMvGvQfdn8mYyrGuPr_A64x6cO9LDnzqjRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
First sorry for not replying properly, I was not subscribed to the ML yet.
About the breakage of wget, it is indeed because openssl got installed
in /lib instead of /usr/lib/

So I think only the second part of the patch of Ryan Coe is needed, ie :

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index e461e08..c3cb98a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -90,7 +90,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
                        linux-$(LIBOPENSSL_TARGET_ARCH) \
                        --prefix=/usr \
                        --openssldir=/etc/ssl \
-                       --libdir=/lib \
+                       --libdir=lib \
                        $(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
                        $(if $(BR2_STATIC_LIBS),no-shared,shared) \
                        no-rc5 \

I got the same issue with the axel package and it was enough to fix it.

BR,

Patrick Havelange
