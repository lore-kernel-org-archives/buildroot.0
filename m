Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A0EC1427
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 10:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57BE40A8D;
	Tue,  3 Mar 2026 10:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gD1sQBnWzG9L; Tue,  3 Mar 2026 10:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6762040A79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772534290;
	bh=A+xSeVnNTzRa1dZe+S1LL5/sFBtpNcesC6hzHGLPmz0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kOuPZ9ODqIKMbY6rW7etKXJozEl5BMxB/WOSpFF7zQ1+CkS+557ftKiX7yJw10LBd
	 OSqBBY8/y8mjbrTytaWS2GT0ldOJ4ErbphGVCYnOIodBAyRE1nDRAqXvV0Tcf8y+Q4
	 kkQ57zOtwJF974oWM9C+a7xahw5iekjh+XeFhe4MP5wcTbdfqnKipIB8PR3FCrGDzf
	 dsmlX5TJ380DIlVJWupfsOOyzRuiNT+hVVqAIeWJP0DNFAWeJxItmicI7L5CT0FqOe
	 oP+bU4nX72cjAxSt6TJZnWGspYCrtPZkOIoAlGgwkuGqlavBGPcbBBs/7j/UOv+S64
	 6Uar8LedyQVMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6762040A79;
	Tue,  3 Mar 2026 10:38:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59292231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA9C61389
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QzpybTq7dHG for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 10:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C783761388
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C783761388
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C783761388
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:38:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso1724965f8f.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 02:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772534284; x=1773139084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1soujd+7f1mkYJRrPpTkr/qRpDEFyYVt0fYmhrftsl4=;
 b=rfCPw7cZA0ZjqWOOMFRfOcLyNgjVdeGz48Tbw+S/Wh0KZyquHdwVSROS2XpXgpfdbx
 japlS4haLj9BF1LWP9vmts84r4DWVHQYYvV6DYYcT0Oh6YHn7A2ZUXWExhTlVmafdy30
 90GUc+0FwzR4X9nvaRK06WcBzeWJijrLzx7eea+EEHBnhv1WiRPzMEUJxkuHSdS43r7L
 50QCa57FyLazLfqf7ZYy4TzMWnc/T3KpkAK/DuGgY7XpFlD6ZAkfNICZReKZnyRuWpLp
 3FPjk7qNP+NgcZPHEU5AMz9T3vdHk0Pc4rf4pma3B0+87KHOGQ2xxesML6UWM1WVyx9M
 P1iA==
X-Gm-Message-State: AOJu0YzXw6wcbOi3r0gFIVjOOgQPrblMelXYGFwaGNyn1TW7q14XBpBA
 Qgu+atM+H/durniJjXXKy7gf8stgKIs6f5i2fj5CgLc954huGhDbCMjpmQyMnhi9mxcnbdsQCLX
 CYdtJ
X-Gm-Gg: ATEYQzwFDCNzCbJYmSHUuTg53GCCbu7U9kl0kpdeeshv1ZcGsyQF3mg8IXfWm5Us5PR
 aBnLIIYoGoqGJGkq2vsIDxgrx6YNqpwYAZSZoLY/JhjNTzCulmXFBnW+gKxyNWkbf8bUxQggl3O
 vAiOAFYd6I6wf9raX/y65l7rrQ2QwyLDHxxxvHyyoQC7clq1rAhgw2tPb0WfCXm3ntzGjkll8C0
 hG1P5YSrZBlKkaeCQ01+GHJGQladwfBMfIH+YZ03lBhYdpPfmEWMYv+PlGnpDj5O5J8ypexnnZN
 WJ+o45plDNKBuRCvNoIXwMFHD6UA3qemNBsNv/caYYCdjZDRy/i0BSyRKPyDG0BlR6WvoV3MvW8
 bqZzxuU2SxJc8wf7cLqGtW5IAKS43fzbWVXZ+ER1RmOx6givfuADO3d+ifRHosTR0Nz7bflpzSH
 HQLVsNfxsQzFuqrxc=
X-Received: by 2002:a05:600c:444d:b0:483:885:f0b0 with SMTP id
 5b1f17b1804b1-483c9c243fbmr284107995e9.35.1772534283696; 
 Tue, 03 Mar 2026 02:38:03 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485125b7ed0sm31053575e9.0.2026.03.03.02.38.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 02:38:03 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 11:38:02 +0100
Message-ID: <20260303103802.274517-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772534284; x=1773139084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=1soujd+7f1mkYJRrPpTkr/qRpDEFyYVt0fYmhrftsl4=;
 b=RcO7O2XWNGTC2sGBCwXnK5Ib0RarbfXfMWyofv/YlLvAeVnLK+cdXy0Au9rPBIMW+Q
 V2kFQgO0/2FX1TxNYGzBqvzVDfrUHBEPyLWHMYMhhnIgLU7IXT0gwoPJ2v60OgFq93qI
 600wizr26wST++ObBmJhM0meDKSvOX46XLkwqJD/HqoQ+AB7rnOFqvepU3ZXe6SI1KA6
 7sbTR7ELhC63mh66U+9dvIkUWbyANwZoRIQleWoyZ50ZJ114dhH0yRvwpiEGU1GYEqOx
 QfJzEdbbv9du4OAR7uA5Sndd0k03KIoOcw1H9zLsTe/xjlU1uRN3Iiz614fUsrjyTCVL
 BQRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RcO7O2XW
Subject: [Buildroot] [PATCH 1/1] package/squid: add patch for CVE-2025-62168
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

- CVE-2025-62168:
    Squid is a caching proxy for the Web. In Squid versions prior to 7.2,
    a failure to redact HTTP authentication credentials in error handling
    allows information disclosure. The vulnerability allows a script to
    bypass browser security protections and learn the credentials a
    trusted client uses to authenticate. This potentially allows a remote
    client to identify security tokens or credentials used internally by a
    web application using Squid for backend load balancing. These attacks
    do not require Squid to be configured with HTTP authentication. The
    vulnerability is fixed in version 7.2. As a workaround, disable debug
    information in administrator mailto links generated by Squid by
    configuring squid.conf with email_err_data off.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-62168
  - https://github.com/squid-cache/squid/commit/0951a0681011dfca3d78c84fd7f1e19c78a4443f

The backport has been compared against debian patch [1].

[1] https://sources.debian.org/src/squid/6.13-2%2Bdeb13u1/debian/patches/CVE-2025-62168.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...2-Proxy-auth-data-visible-to-scripts.patch | 212 ++++++++++++++++++
 package/squid/squid.mk                        |   3 +
 2 files changed, 215 insertions(+)
 create mode 100644 package/squid/0002-Proxy-auth-data-visible-to-scripts.patch

diff --git a/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch b/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
new file mode 100644
index 0000000000..2e5c67c8c1
--- /dev/null
+++ b/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
@@ -0,0 +1,212 @@
+From 0951a0681011dfca3d78c84fd7f1e19c78a4443f Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <yadij@users.noreply.github.com>
+Date: Sat, 11 Oct 2025 16:33:02 +1300
+Subject: [PATCH] Bug 3390: Proxy auth data visible to scripts (#2249)
+
+Original changes to redact credentials from error page %R code
+expansion output was incomplete. It missed the parse failure
+case where ErrorState::request_hdrs raw buffer contained
+sensitive information.
+
+Also missed was the %W case where full request message headers
+were generated in a mailto link. This case is especially
+problematic as it may be delivered over insecure SMTP even if
+the error was secured with HTTPS.
+
+After this change:
+* The HttpRequest message packing code for error pages is de-duplicated
+  and elides authentication headers for both %R and %W code outputs.
+* The %R code output includes the CRLF request message terminator.
+* The email_err_data directive causing advanced details to be added to
+  %W mailto links is disabled by default.
+
+Also redact credentials from generated TRACE responses.
+
+---------
+
+Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
+
+CVE: CVE-2025-62168
+Upstream: https://github.com/squid-cache/squid/commit/0951a0681011dfca3d78c84fd7f1e19c78a4443f
+[thomas: remove release note, backport errorpage.cc]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/HttpRequest.cc                  |  6 +++---
+ src/HttpRequest.h                   |  2 +-
+ src/cf.data.pre                     |  8 +++++++-
+ src/client_side_reply.cc            | 14 +++++++-------
+ src/errorpage.cc                    | 17 ++++-------------
+ src/errorpage.h                     |  1 -
+ src/tests/stub_HttpRequest.cc       |  2 +-
+ 8 files changed, 26 insertions(+), 27 deletions(-)
+
+diff --git a/src/HttpRequest.cc b/src/HttpRequest.cc
+index cd7ee71d4af..c6ed5bee45d 100644
+--- a/src/HttpRequest.cc
++++ b/src/HttpRequest.cc
+@@ -341,7 +341,7 @@ HttpRequest::swapOut(StoreEntry * e)
+ 
+ /* packs request-line and headers, appends <crlf> terminator */
+ void
+-HttpRequest::pack(Packable * p) const
++HttpRequest::pack(Packable * const p, const bool maskSensitiveInfo) const
+ {
+     assert(p);
+     /* pack request-line */
+@@ -349,8 +349,8 @@ HttpRequest::pack(Packable * p) const
+                SQUIDSBUFPRINT(method.image()), SQUIDSBUFPRINT(url.path()),
+                http_ver.major, http_ver.minor);
+     /* headers */
+-    header.packInto(p);
+-    /* trailer */
++    header.packInto(p, maskSensitiveInfo);
++    /* indicate the end of the header section */
+     p->append("\r\n", 2);
+ }
+ 
+diff --git a/src/HttpRequest.h b/src/HttpRequest.h
+index 6d369029322..28dc4daf99d 100644
+--- a/src/HttpRequest.h
++++ b/src/HttpRequest.h
+@@ -206,7 +206,7 @@ class HttpRequest: public Http::Message
+ 
+     void swapOut(StoreEntry * e);
+ 
+-    void pack(Packable * p) const;
++    void pack(Packable * p, bool maskSensitiveInfo = false) const;
+ 
+     static void httpRequestPack(void *obj, Packable *p);
+ 
+diff --git a/src/cf.data.pre b/src/cf.data.pre
+index 0a73020e111..2dce65a4d0a 100644
+--- a/src/cf.data.pre
++++ b/src/cf.data.pre
+@@ -8941,12 +8941,18 @@ NAME: email_err_data
+ COMMENT: on|off
+ TYPE: onoff
+ LOC: Config.onoff.emailErrData
+-DEFAULT: on
++DEFAULT: off
+ DOC_START
+ 	If enabled, information about the occurred error will be
+ 	included in the mailto links of the ERR pages (if %W is set)
+ 	so that the email body contains the data.
+ 	Syntax is <A HREF="mailto:%w%W">%w</A>
++
++	SECURITY WARNING:
++		Request headers and other included facts may contain
++		sensitive information about transaction history, the
++		Squid instance, and its environment which would be
++		unavailable to error recipients otherwise.
+ DOC_END
+ 
+ NAME: deny_info
+diff --git a/src/client_side_reply.cc b/src/client_side_reply.cc
+index d73bf3f99f6..fc2feccf802 100644
+--- a/src/client_side_reply.cc
++++ b/src/client_side_reply.cc
+@@ -94,7 +94,7 @@ clientReplyContext::clientReplyContext(ClientHttpRequest *clientContext) :
+ void
+ clientReplyContext::setReplyToError(
+     err_type err, Http::StatusCode status, char const *uri,
+-    const ConnStateData *conn, HttpRequest *failedrequest, const char *unparsedrequest,
++    const ConnStateData *conn, HttpRequest *failedrequest, const char *,
+ #if USE_AUTH
+     Auth::UserRequest::Pointer auth_user_request
+ #else
+@@ -104,9 +104,6 @@ clientReplyContext::setReplyToError(
+ {
+     auto errstate = clientBuildError(err, status, uri, conn, failedrequest, http->al);
+ 
+-    if (unparsedrequest)
+-        errstate->request_hdrs = xstrdup(unparsedrequest);
+-
+ #if USE_AUTH
+     errstate->auth_user_request = auth_user_request;
+ #endif
+@@ -995,11 +992,14 @@ clientReplyContext::traceReply()
+     triggerInitialStoreRead();
+     http->storeEntry()->releaseRequest();
+     http->storeEntry()->buffer();
++    MemBuf content;
++    content.init();
++    http->request->pack(&content, true /* hide authorization data */);
+     const HttpReplyPointer rep(new HttpReply);
+-    rep->setHeaders(Http::scOkay, nullptr, "text/plain", http->request->prefixLen(), 0, squid_curtime);
++    rep->setHeaders(Http::scOkay, nullptr, "message/http", content.contentSize(), 0, squid_curtime);
++    rep->body.set(SBuf(content.buf, content.size));
+     http->storeEntry()->replaceHttpReply(rep);
+-    http->request->swapOut(http->storeEntry());
+-    http->storeEntry()->complete();
++    http->storeEntry()->completeSuccessfully("traceReply() stored the entire response");
+ }
+ 
+ #define SENDING_BODY 0
+diff --git a/src/errorpage.cc b/src/errorpage.cc
+index d7a588d099f..06046de9ebb 100644
+--- a/src/errorpage.cc
++++ b/src/errorpage.cc
+@@ -792,7 +792,6 @@ ErrorState::~ErrorState()
+ {
+     safe_free(redirect_url);
+     safe_free(url);
+-    safe_free(request_hdrs);
+     wordlistDestroy(&ftp.server_msg);
+     safe_free(ftp.request);
+     safe_free(ftp.reply);
+@@ -850,7 +849,7 @@ ErrorState::Dump(MemBuf * mb)
+                     SQUIDSBUFPRINT(request->url.path()),
+                     AnyP::ProtocolType_str[request->http_ver.protocol],
+                     request->http_ver.major, request->http_ver.minor);
+-        request->header.packInto(&str);
++        request->header.packInto(&str, true /* hide authorization data */);
+     }
+ 
+     str.append("\r\n", 2);
+@@ -1112,18 +1111,10 @@ ErrorState::compileLegacyCode(Build &build)
+                 p = "[no request]";
+             break;
+         }
+-        if (request) {
+-            mb.appendf(SQUIDSBUFPH " " SQUIDSBUFPH " %s/%d.%d\n",
+-                       SQUIDSBUFPRINT(request->method.image()),
+-                       SQUIDSBUFPRINT(request->url.path()),
+-                       AnyP::ProtocolType_str[request->http_ver.protocol],
+-                       request->http_ver.major, request->http_ver.minor);
+-            request->header.packInto(&mb, true); //hide authorization data
+-        } else if (request_hdrs) {
+-            p = request_hdrs;
+-        } else {
++        else if (request)
++            request->pack(&mb, true /* hide authorization data */);
++        else
+             p = "[no request]";
+-        }
+         break;
+ 
+     case 's':
+diff --git a/src/errorpage.h b/src/errorpage.h
+index abca4a17d7b..297b306978d 100644
+--- a/src/errorpage.h
++++ b/src/errorpage.h
+@@ -194,7 +194,6 @@ class ErrorState
+         MemBuf *listing = nullptr;
+     } ftp;
+ 
+-    char *request_hdrs = nullptr;
+     char *err_msg = nullptr; /* Preformatted error message from the cache */
+ 
+     AccessLogEntryPointer ale; ///< transaction details (or nil)
+diff --git a/src/tests/stub_HttpRequest.cc b/src/tests/stub_HttpRequest.cc
+index 495597d9a1b..48a0f1ce03e 100644
+--- a/src/tests/stub_HttpRequest.cc
++++ b/src/tests/stub_HttpRequest.cc
+@@ -45,7 +45,7 @@ bool HttpRequest::expectingBody(const HttpRequestMethod &, int64_t &) const STUB
+ bool HttpRequest::bodyNibbled() const STUB_RETVAL(false)
+ int HttpRequest::prefixLen() const STUB_RETVAL(0)
+ void HttpRequest::swapOut(StoreEntry *) STUB
+-void HttpRequest::pack(Packable *) const STUB
++void HttpRequest::pack(Packable *, bool) const STUB
+ void HttpRequest::httpRequestPack(void *, Packable *) STUB
+ HttpRequest * HttpRequest::FromUrl(const SBuf &, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
+ HttpRequest * HttpRequest::FromUrlXXX(const char *, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index d445f005b7..c031f1aa03 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -15,6 +15,9 @@ SQUID_SELINUX_MODULES = apache squid
 # 0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
 SQUID_IGNORE_CVES += CVE-2025-59362
 
+# 0002-Proxy-auth-data-visible-to-scripts.patch
+SQUID_IGNORE_CVES += CVE-2025-62168
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
