Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD673F94CA0
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 19:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B10D942048;
	Tue, 21 Apr 2026 19:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnEQe3zQjgsx; Tue, 21 Apr 2026 19:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F5214203A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776798502;
	bh=HrfBKJtG+jM8Wa+IqE/6L0oRbUmL2UwwOye0rrGfOCw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O9tWGdlbD88UJ+H2pCUalzGp4xA5/YLZU3mDMk0S0rxfV4Yvnxhlo4MWddPA+JudL
	 5xD61lSFNprGpSSIZvuRaTfK4eo1NC34f7fy6I5d4HUl9mPKAmyqzcXHq9FXn61qo/
	 5zCJCcHqFVrm8u7JWQgxZxRnJn4+jglKxKrSsi4YVZb7JVgY/3/9jSUmT4KKpvbvr6
	 /4L0w+IK+6eRp626jcen+fVH2F2qELpkCfEKg+grm+IxUDMgzYwj6n9wz3hl81y/rd
	 D568XL7HC/+Ae/nseQx+SwVLIGzsVHgo1z5yFgH6ey6WaN8V5R1gL2CUNFsyx3dT6H
	 I5vvDsza25JTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F5214203A;
	Tue, 21 Apr 2026 19:08:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DAF8257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F486087F
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xwg6OZ4JbpSJ for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 19:08:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9818260841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9818260841
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9818260841
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:08:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7C9CA4C0185
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:08:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50872)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGSG-000000004gg-11io
 for buildroot@buildroot.org; Tue, 21 Apr 2026 19:08:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 21:08:16 +0200
Message-ID: <20260421190816.2723435-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776798496;
 bh=xgBz+Dc5SQTrNp9sS3upNZTR7qnIkQtPhiEjr1VjyPY=;
 h=From:To:Subject:Date:From;
 b=jwpXAP57ewX7KOjQdyWF1MBzgo2663XESTwSgxAhtB5XOQndakFwrbAXcnL5WUqIn
 a808IUdRf14NR1uxWF02IxIEdZu0i8yg9KwiggiBSn6rZJPpvAHJ3NSSNaK5zCPtaB
 h15vz4VWmbETY655f5mRbshTqfhs3hMK7hef2OJAEHItPkDbqkf6cT2N3FvC/GeRcJ
 C/NFzGFqGeqAptVxt2Tro/f98/DlT4sw82I2cL/tBK+oFHofhTqexzl7dqqGbJgYnO
 1ujf99cc1jm9oqgIKQvw01OgC1ikgUEGIuzDjUREe40bWhXAqRTJSLIkVui0zidQal
 2jFNMZuG5748w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jwpXAP57
Subject: [Buildroot] [PATCH 1/1] package/squid: bump version to 7.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/squid-cache/squid/blob/SQUID_7_5/ChangeLog

Removed patches which are included in this release.

Switched to tarball hash provided by upstream.

Updated license hash due to upstream commit
https://github.com/squid-cache/squid/commit/30a55c0819d96a16aab59fc5584d54be4a83f765

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch |  52 -----
 ...2-Proxy-auth-data-visible-to-scripts.patch | 212 ------------------
 package/squid/squid.hash                      |   5 +-
 package/squid/squid.mk                        |   8 +-
 4 files changed, 4 insertions(+), 273 deletions(-)
 delete mode 100644 package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
 delete mode 100644 package/squid/0002-Proxy-auth-data-visible-to-scripts.patch

diff --git a/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch b/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
deleted file mode 100644
index 695ba0255e..0000000000
--- a/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0d89165ee6da10e6fa50c44998b3cd16d59400e9 Mon Sep 17 00:00:00 2001
-From: Alex Rousskov <rousskov@measurement-factory.com>
-Date: Sat, 30 Aug 2025 06:49:36 +0000
-Subject: [PATCH] Fix ASN.1 encoding of long SNMP OIDs (#2149)
-
-Upstream: https://github.com/squid-cache/squid/commit/250a18e0a80694b919972a1836cdfe20f2e1baa0
-CVE: CVE-2025-59362
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- lib/snmplib/asn1.c | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/lib/snmplib/asn1.c b/lib/snmplib/asn1.c
-index 81f2051fbe7..2852c26b220 100644
---- a/lib/snmplib/asn1.c
-+++ b/lib/snmplib/asn1.c
-@@ -735,6 +735,7 @@ asn_build_objid(u_char * data, int *datalength,
-      * lastbyte ::= 0 7bitvalue
-      */
-     u_char buf[MAX_OID_LEN];
-+    u_char *bufEnd = buf + sizeof(buf);
-     u_char *bp = buf;
-     oid *op = objid;
-     int asnlength;
-@@ -753,6 +754,10 @@ asn_build_objid(u_char * data, int *datalength,
-     while (objidlength-- > 0) {
-         subid = *op++;
-         if (subid < 127) {  /* off by one? */
-+            if (bp >= bufEnd) {
-+                snmp_set_api_error(SNMPERR_ASN_ENCODE);
-+                return (NULL);
-+            }
-             *bp++ = subid;
-         } else {
-             mask = 0x7F;    /* handle subid == 0 case */
-@@ -770,8 +775,16 @@ asn_build_objid(u_char * data, int *datalength,
-                 /* fix a mask that got truncated above */
-                 if (mask == 0x1E00000)
-                     mask = 0xFE00000;
-+                if (bp >= bufEnd) {
-+                    snmp_set_api_error(SNMPERR_ASN_ENCODE);
-+                    return (NULL);
-+                }
-                 *bp++ = (u_char) (((subid & mask) >> bits) | ASN_BIT8);
-             }
-+            if (bp >= bufEnd) {
-+                snmp_set_api_error(SNMPERR_ASN_ENCODE);
-+                return (NULL);
-+            }
-             *bp++ = (u_char) (subid & mask);
-         }
-     }
diff --git a/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch b/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
deleted file mode 100644
index 2e5c67c8c1..0000000000
--- a/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
+++ /dev/null
@@ -1,212 +0,0 @@
-From 0951a0681011dfca3d78c84fd7f1e19c78a4443f Mon Sep 17 00:00:00 2001
-From: Amos Jeffries <yadij@users.noreply.github.com>
-Date: Sat, 11 Oct 2025 16:33:02 +1300
-Subject: [PATCH] Bug 3390: Proxy auth data visible to scripts (#2249)
-
-Original changes to redact credentials from error page %R code
-expansion output was incomplete. It missed the parse failure
-case where ErrorState::request_hdrs raw buffer contained
-sensitive information.
-
-Also missed was the %W case where full request message headers
-were generated in a mailto link. This case is especially
-problematic as it may be delivered over insecure SMTP even if
-the error was secured with HTTPS.
-
-After this change:
-* The HttpRequest message packing code for error pages is de-duplicated
-  and elides authentication headers for both %R and %W code outputs.
-* The %R code output includes the CRLF request message terminator.
-* The email_err_data directive causing advanced details to be added to
-  %W mailto links is disabled by default.
-
-Also redact credentials from generated TRACE responses.
-
----------
-
-Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
-
-CVE: CVE-2025-62168
-Upstream: https://github.com/squid-cache/squid/commit/0951a0681011dfca3d78c84fd7f1e19c78a4443f
-[thomas: remove release note, backport errorpage.cc]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/HttpRequest.cc                  |  6 +++---
- src/HttpRequest.h                   |  2 +-
- src/cf.data.pre                     |  8 +++++++-
- src/client_side_reply.cc            | 14 +++++++-------
- src/errorpage.cc                    | 17 ++++-------------
- src/errorpage.h                     |  1 -
- src/tests/stub_HttpRequest.cc       |  2 +-
- 8 files changed, 26 insertions(+), 27 deletions(-)
-
-diff --git a/src/HttpRequest.cc b/src/HttpRequest.cc
-index cd7ee71d4af..c6ed5bee45d 100644
---- a/src/HttpRequest.cc
-+++ b/src/HttpRequest.cc
-@@ -341,7 +341,7 @@ HttpRequest::swapOut(StoreEntry * e)
- 
- /* packs request-line and headers, appends <crlf> terminator */
- void
--HttpRequest::pack(Packable * p) const
-+HttpRequest::pack(Packable * const p, const bool maskSensitiveInfo) const
- {
-     assert(p);
-     /* pack request-line */
-@@ -349,8 +349,8 @@ HttpRequest::pack(Packable * p) const
-                SQUIDSBUFPRINT(method.image()), SQUIDSBUFPRINT(url.path()),
-                http_ver.major, http_ver.minor);
-     /* headers */
--    header.packInto(p);
--    /* trailer */
-+    header.packInto(p, maskSensitiveInfo);
-+    /* indicate the end of the header section */
-     p->append("\r\n", 2);
- }
- 
-diff --git a/src/HttpRequest.h b/src/HttpRequest.h
-index 6d369029322..28dc4daf99d 100644
---- a/src/HttpRequest.h
-+++ b/src/HttpRequest.h
-@@ -206,7 +206,7 @@ class HttpRequest: public Http::Message
- 
-     void swapOut(StoreEntry * e);
- 
--    void pack(Packable * p) const;
-+    void pack(Packable * p, bool maskSensitiveInfo = false) const;
- 
-     static void httpRequestPack(void *obj, Packable *p);
- 
-diff --git a/src/cf.data.pre b/src/cf.data.pre
-index 0a73020e111..2dce65a4d0a 100644
---- a/src/cf.data.pre
-+++ b/src/cf.data.pre
-@@ -8941,12 +8941,18 @@ NAME: email_err_data
- COMMENT: on|off
- TYPE: onoff
- LOC: Config.onoff.emailErrData
--DEFAULT: on
-+DEFAULT: off
- DOC_START
- 	If enabled, information about the occurred error will be
- 	included in the mailto links of the ERR pages (if %W is set)
- 	so that the email body contains the data.
- 	Syntax is <A HREF="mailto:%w%W">%w</A>
-+
-+	SECURITY WARNING:
-+		Request headers and other included facts may contain
-+		sensitive information about transaction history, the
-+		Squid instance, and its environment which would be
-+		unavailable to error recipients otherwise.
- DOC_END
- 
- NAME: deny_info
-diff --git a/src/client_side_reply.cc b/src/client_side_reply.cc
-index d73bf3f99f6..fc2feccf802 100644
---- a/src/client_side_reply.cc
-+++ b/src/client_side_reply.cc
-@@ -94,7 +94,7 @@ clientReplyContext::clientReplyContext(ClientHttpRequest *clientContext) :
- void
- clientReplyContext::setReplyToError(
-     err_type err, Http::StatusCode status, char const *uri,
--    const ConnStateData *conn, HttpRequest *failedrequest, const char *unparsedrequest,
-+    const ConnStateData *conn, HttpRequest *failedrequest, const char *,
- #if USE_AUTH
-     Auth::UserRequest::Pointer auth_user_request
- #else
-@@ -104,9 +104,6 @@ clientReplyContext::setReplyToError(
- {
-     auto errstate = clientBuildError(err, status, uri, conn, failedrequest, http->al);
- 
--    if (unparsedrequest)
--        errstate->request_hdrs = xstrdup(unparsedrequest);
--
- #if USE_AUTH
-     errstate->auth_user_request = auth_user_request;
- #endif
-@@ -995,11 +992,14 @@ clientReplyContext::traceReply()
-     triggerInitialStoreRead();
-     http->storeEntry()->releaseRequest();
-     http->storeEntry()->buffer();
-+    MemBuf content;
-+    content.init();
-+    http->request->pack(&content, true /* hide authorization data */);
-     const HttpReplyPointer rep(new HttpReply);
--    rep->setHeaders(Http::scOkay, nullptr, "text/plain", http->request->prefixLen(), 0, squid_curtime);
-+    rep->setHeaders(Http::scOkay, nullptr, "message/http", content.contentSize(), 0, squid_curtime);
-+    rep->body.set(SBuf(content.buf, content.size));
-     http->storeEntry()->replaceHttpReply(rep);
--    http->request->swapOut(http->storeEntry());
--    http->storeEntry()->complete();
-+    http->storeEntry()->completeSuccessfully("traceReply() stored the entire response");
- }
- 
- #define SENDING_BODY 0
-diff --git a/src/errorpage.cc b/src/errorpage.cc
-index d7a588d099f..06046de9ebb 100644
---- a/src/errorpage.cc
-+++ b/src/errorpage.cc
-@@ -792,7 +792,6 @@ ErrorState::~ErrorState()
- {
-     safe_free(redirect_url);
-     safe_free(url);
--    safe_free(request_hdrs);
-     wordlistDestroy(&ftp.server_msg);
-     safe_free(ftp.request);
-     safe_free(ftp.reply);
-@@ -850,7 +849,7 @@ ErrorState::Dump(MemBuf * mb)
-                     SQUIDSBUFPRINT(request->url.path()),
-                     AnyP::ProtocolType_str[request->http_ver.protocol],
-                     request->http_ver.major, request->http_ver.minor);
--        request->header.packInto(&str);
-+        request->header.packInto(&str, true /* hide authorization data */);
-     }
- 
-     str.append("\r\n", 2);
-@@ -1112,18 +1111,10 @@ ErrorState::compileLegacyCode(Build &build)
-                 p = "[no request]";
-             break;
-         }
--        if (request) {
--            mb.appendf(SQUIDSBUFPH " " SQUIDSBUFPH " %s/%d.%d\n",
--                       SQUIDSBUFPRINT(request->method.image()),
--                       SQUIDSBUFPRINT(request->url.path()),
--                       AnyP::ProtocolType_str[request->http_ver.protocol],
--                       request->http_ver.major, request->http_ver.minor);
--            request->header.packInto(&mb, true); //hide authorization data
--        } else if (request_hdrs) {
--            p = request_hdrs;
--        } else {
-+        else if (request)
-+            request->pack(&mb, true /* hide authorization data */);
-+        else
-             p = "[no request]";
--        }
-         break;
- 
-     case 's':
-diff --git a/src/errorpage.h b/src/errorpage.h
-index abca4a17d7b..297b306978d 100644
---- a/src/errorpage.h
-+++ b/src/errorpage.h
-@@ -194,7 +194,6 @@ class ErrorState
-         MemBuf *listing = nullptr;
-     } ftp;
- 
--    char *request_hdrs = nullptr;
-     char *err_msg = nullptr; /* Preformatted error message from the cache */
- 
-     AccessLogEntryPointer ale; ///< transaction details (or nil)
-diff --git a/src/tests/stub_HttpRequest.cc b/src/tests/stub_HttpRequest.cc
-index 495597d9a1b..48a0f1ce03e 100644
---- a/src/tests/stub_HttpRequest.cc
-+++ b/src/tests/stub_HttpRequest.cc
-@@ -45,7 +45,7 @@ bool HttpRequest::expectingBody(const HttpRequestMethod &, int64_t &) const STUB
- bool HttpRequest::bodyNibbled() const STUB_RETVAL(false)
- int HttpRequest::prefixLen() const STUB_RETVAL(0)
- void HttpRequest::swapOut(StoreEntry *) STUB
--void HttpRequest::pack(Packable *) const STUB
-+void HttpRequest::pack(Packable *, bool) const STUB
- void HttpRequest::httpRequestPack(void *, Packable *) STUB
- HttpRequest * HttpRequest::FromUrl(const SBuf &, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
- HttpRequest * HttpRequest::FromUrlXXX(const char *, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 329d61ca93..508b5517c5 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,4 @@
+# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_5
+sha256  f6058907db0150d2f5d228482b5a9e5678920cf368ae0ccbcecceb2ff4c35106  squid-7.5.tar.xz
 # Locally calculated
-sha256  9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd  squid-6.14.tar.xz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index c031f1aa03..6d403c6c2e 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.14
+SQUID_VERSION = 7.5
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
 SQUID_LICENSE = GPL-2.0+
@@ -12,12 +12,6 @@ SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
 SQUID_SELINUX_MODULES = apache squid
 
-# 0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
-SQUID_IGNORE_CVES += CVE-2025-59362
-
-# 0002-Proxy-auth-data-visible-to-scripts.patch
-SQUID_IGNORE_CVES += CVE-2025-62168
-
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
