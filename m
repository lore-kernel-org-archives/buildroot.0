From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 17:07:50 +0100
Subject: [Buildroot] [git commit] package/ibrdtnd: add openssl 1.1.x
 compatibility
Message-ID: <20190205162518.6437F82237@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fc275936f1e2efd369d456e50ec5a0d517dc5af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream
https://github.com/ibrdtn/ibrdtn/pull/265

Fixes
http://autobuild.buildroot.net/results/385/3852a414afacbe3c044b1e49be8ccf8c554c8565

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ibrdtnd-added-openssl-compatibility.patch | 205 +++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/package/ibrdtnd/0001-ibrdtnd-added-openssl-compatibility.patch b/package/ibrdtnd/0001-ibrdtnd-added-openssl-compatibility.patch
new file mode 100644
index 0000000000..8d100e2a2a
--- /dev/null
+++ b/package/ibrdtnd/0001-ibrdtnd-added-openssl-compatibility.patch
@@ -0,0 +1,205 @@
+From 8785fe0be66c8d6eaa94ffde921909a7ec220123 Mon Sep 17 00:00:00 2001
+From: Eneas U de Queiroz <cote2004-github@yahoo.com>
+Date: Sat, 26 May 2018 23:44:54 -0300
+Subject: [PATCH] ibrdtnd: added openssl compatibility
+
+This patch adds compatibility with openssl 1.1.0 to ibrdtnd.
+
+Upstream: https://github.com/ibrdtn/ibrdtn/pull/265
+
+Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/security/exchange/DHProtocol.cpp | 36 ++++++++++---
+ src/security/exchange/Makefile.am    |  2 +
+ src/security/exchange/openssl_compat.cpp       | 62 ++++++++++++++++++++++
+ src/security/exchange/openssl_compat.h  | 13 +++++
+ 4 files changed, 107 insertions(+), 6 deletions(-)
+ create mode 100644 src/security/exchange/openssl_compat.cpp
+ create mode 100644 src/security/exchange/openssl_compat.h
+
+diff --git a/src/security/exchange/DHProtocol.cpp b/src/security/exchange/DHProtocol.cpp
+index e94c502..3e0ad71 100644
+--- a/src/security/exchange/DHProtocol.cpp
++++ b/src/security/exchange/DHProtocol.cpp
+@@ -30,6 +30,7 @@
+ 
+ #include <openssl/rand.h>
+ #include <openssl/pem.h>
++#include "openssl_compat.h"
+ 
+ #define DH_KEY_LENGTH 1024
+ 
+@@ -132,6 +133,7 @@ namespace dtn
+ 
+ 		void DHProtocol::begin(KeyExchangeSession &session, KeyExchangeData &data)
+ 		{
++			const BIGNUM *pub_key, *p, *g;
+ 			// get session state
+ 			DHState &state = session.getState<DHState>();
+ 
+@@ -159,9 +161,12 @@ namespace dtn
+ 			// prepare request
+ 			KeyExchangeData request(KeyExchangeData::REQUEST, session);
+ 
+-			write(request, state.dh->pub_key);
+-			write(request, state.dh->p);
+-			write(request, state.dh->g);
++			DH_get0_pqg(state.dh, &p, NULL, &g);
++			DH_get0_key(state.dh, &pub_key, NULL);
++
++			write(request, pub_key);
++			write(request, p);
++			write(request, g);
+ 
+ 			manager.submit(session, request);
+ 		}
+@@ -177,6 +182,15 @@ namespace dtn
+ 				{
+ 					if (data.getAction() == KeyExchangeData::REQUEST)
+ 					{
++						BIGNUM *p = BN_new();
++						BIGNUM *g = BN_new();
++						if (p == NULL || g == NULL)
++						{
++							BN_free(p);
++							BN_free(g);
++							throw ibrcommon::Exception("Error while allocating space for DH parameters");
++						}
++
+ 						BIGNUM* pub_key = BN_new();
+ 						read(data, &pub_key);
+ 
+@@ -184,8 +198,16 @@ namespace dtn
+ 						state.dh = DH_new();
+ 
+ 						// read p and g paramter from message
+-						read(data, &state.dh->p);
+-						read(data, &state.dh->g);
++						read(data, &p);
++						read(data, &g);
++
++						if (DH_set0_pqg(state.dh, p, NULL, g))
++						{
++							BN_free(p);
++							BN_free(g);
++							BN_free(pub_key);
++							throw ibrcommon::Exception("Error while setting DH parameters");
++						}
+ 
+ 						int codes;
+ 						if (!DH_check(state.dh, &codes))
+@@ -213,7 +235,9 @@ namespace dtn
+ 						state.secret.assign((const char*)secret, length);
+ 
+ 						KeyExchangeData response(KeyExchangeData::RESPONSE, session);
+-						write(response, state.dh->pub_key);
++						const BIGNUM *state_dh_pub_key;
++						DH_get0_key(state.dh, &state_dh_pub_key, NULL);
++						write(response, state_dh_pub_key);
+ 
+ 						manager.submit(session, response);
+ 
+diff --git a/src/security/exchange/Makefile.am b/src/security/exchange/Makefile.am
+index a6b2f83..71ed836 100644
+--- a/src/security/exchange/Makefile.am
++++ b/src/security/exchange/Makefile.am
+@@ -22,6 +22,8 @@ exchange_SOURCES += \
+ 	NFCProtocol.cpp \
+ 	NoneProtocol.h \
+ 	NoneProtocol.cpp \
++	openssl_compat.h \
++	openssl_compat.cpp \
+ 	QRCodeProtocol.h \
+ 	QRCodeProtocol.cpp
+ 	
+diff --git a/src/security/exchange/openssl_compat.cpp b/src/security/exchange/openssl_compat.cpp
+new file mode 100644
+index 0000000..e3baba0
+--- /dev/null
++++ b/src/security/exchange/openssl_compat.cpp
+@@ -0,0 +1,62 @@
++/*
++ * Copyright 2016 The OpenSSL Project Authors. All Rights Reserved.
++ *
++ * Licensed under the OpenSSL license (the "License").  You may not use
++ * this file except in compliance with the License.  You can obtain a copy
++ * in the file LICENSE in the source distribution or at
++ * https://www.openssl.org/source/license.html
++ */
++
++#include "openssl_compat.h"
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++
++void DH_get0_pqg(const DH *dh,
++                 const BIGNUM **p, const BIGNUM **q, const BIGNUM **g)
++{
++    if (p != NULL)
++        *p = dh->p;
++    if (q != NULL)
++        *q = dh->q;
++    if (g != NULL)
++        *g = dh->g;
++}
++
++int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
++{
++    /* If the fields p and g in d are NULL, the corresponding input
++     * parameters MUST be non-NULL.  q may remain NULL.
++     */
++    if ((dh->p == NULL && p == NULL)
++        || (dh->g == NULL && g == NULL))
++        return 0;
++
++    if (p != NULL) {
++        BN_free(dh->p);
++        dh->p = p;
++    }
++    if (q != NULL) {
++        BN_free(dh->q);
++        dh->q = q;
++    }
++    if (g != NULL) {
++        BN_free(dh->g);
++        dh->g = g;
++    }
++
++    if (q != NULL) {
++        dh->length = BN_num_bits(q);
++    }
++
++    return 1;
++}
++
++void DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM **priv_key)
++{
++    if (pub_key != NULL)
++        *pub_key = dh->pub_key;
++    if (priv_key != NULL)
++        *priv_key = dh->priv_key;
++}
++
++#endif /* OPENSSL_VERSION_NUMBER */
+diff --git a/src/security/exchange/openssl_compat.h b/src/security/exchange/openssl_compat.h
+new file mode 100644
+index 0000000..29e7d41
+--- /dev/null
++++ b/src/security/exchange/openssl_compat.h
+@@ -0,0 +1,13 @@
++#ifndef LIBCRYPTO_COMPAT_H
++#define LIBCRYPTO_COMPAT_H
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++
++#include <openssl/dh.h>
++
++void DH_get0_pqg(const DH *dh, const BIGNUM **p, const BIGNUM **q, const BIGNUM **g);
++int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
++void DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM **priv_key);
++
++#endif /* OPENSSL_VERSION_NUMBER */
++#endif /* LIBCRYPTO_COMPAT_H */
+-- 
+1.9.1
+
