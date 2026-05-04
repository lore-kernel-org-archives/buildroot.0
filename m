Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3A8FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14486157A;
	Mon,  4 May 2026 14:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ER1r40BbZ4PW; Mon,  4 May 2026 14:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33939615A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906099;
	bh=fu+3KHQRM6LuBBPWpvT3J8ovZe0P1SxiAzeJUq60deM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gANMnWTP+4RF9ILUKhUOxrng5PEXOvTulBcuDLUztnJ9wOTxDeuhljelFS2W+a4wG
	 uclYAo4/VBILMW1MsJ0x50z/ludHbvNggdXwywLfNwdUAyIa0+fIjGIO1xO7mocIUO
	 q7Aaa8nhOtAYvwlC1wH6naXxfV1JHuRBY+wkSZB0p05hk352t2qq9CEMPvB7LRrwls
	 Rh4TeOfBqF53UvQ00hBwAOtuTNmt10viUNwbvh9ew4o05kVQtcp2VfrGTD8n+OZNYy
	 LmbVBMTz7/UTx5omVtkr0bH62B3vy75AtfnO/ZWPBKx7vup18mCVc3uwja3b5PJ1TT
	 yqvDN+RqBMAow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33939615A0;
	Mon,  4 May 2026 14:48:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 823CD190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6833E84680
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-Oxt2xhbTCu for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3FB5845CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3FB5845CB
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3FB5845CB
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so21097885e9.1
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906093; x=1778510893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=81XBQx7soWsQdnjNJ7GcNsD9ZXCWLg6qgutEsuUZFDg=;
 b=PPfgxQF6Nf1sUJftT43CfPmRJT/z/AxgZFGKu0z8o+gD5FjaS+Tni8Qu6fu1Yo1sbW
 W4x4mCvLJObLZiQW6DPaTNuCNt/JziOA+fYmwphPVmj4AVxLigGR/fqUYZFVkTw9jkY4
 /nOyDViBdk/861kIfxfO30BJYtjbK2fjCQrjAX+kca539JaWDE2rf1pAInXj03ZXpEyd
 EptKDnIP7ezkO/SkvVJCevHTLuSVsFii7hoG+rHz2hu03aHBns0xOzZ2N7V69M0mJtzW
 mJ3x6vZrI6wwjTRHKNjrlFrpsHlxULg0WAgf8Z+lsl98oPjA/wAQs1W4Fbra4MQbQGiw
 QsEg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/NkS4tX9Ta1wshJwyQHrHEIzO+Nvs+4VZAaOabkER7jRaDjpCQta4FId3fHthfuPo4Jn/gGEuRsS4=@buildroot.org
X-Gm-Message-State: AOJu0YyNWsOopQVKjWo6a8VY7+UN9FflBfaX7Ryz+ouBKzSEMJpcBVU4
 joVaHcJYQwQWDMNUj5qUByE4GDaWQkoNuMj4cmrNNaHdk+kg30bg4w+zwIZrMaAJJJM=
X-Gm-Gg: AeBDietDj1AF8P0o3wKVA7Sl0J5Ju3t1KSuEK+aKeHnOS27wh/7jBeb+83LygGjQOg5
 DNeW1BJ533oF4PXy3njSLabKCns0XP8oaKbGfDx2xM1QNHhWh/znclc3OB3Tr/s5UgUrQRUmFGN
 6FsgzEJOo4WCkrUvH62l3IQOOpfRx4q6b7Tr6CyzwE1z5aTtyk2QZZuV7ixvsLAvfcgkuCj3fWO
 /a5qqWnYKjF5VfeSv0u/ffgr5LduDB6F8VBJ1AWMyCCqem6bAAWr/FV2U2pCV/ZDcAS+0927o8K
 ix7H4w1XJWkvqzFGjQghxSitZxLmeVlf/RWHl3H1+w4vq0OjVPxjHZDkruwO79B4SxQsVBy1nde
 lfTCfh50NRmAbiWOj4wvOtoGvMrz5w/htoIILH2jwYcSxzktejCOnwQV8KRxAlRpDpRWE9iiH0N
 Qzo2LsMMFXrRV7jSNRj/8H0jJg8g==
X-Received: by 2002:a05:600c:4884:b0:48d:364:e236 with SMTP id
 5b1f17b1804b1-48d0364e397mr55451015e9.18.1777906092731; 
 Mon, 04 May 2026 07:48:12 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a824f9f0dsm317170575e9.15.2026.05.04.07.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:48:12 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:48:11 +0200
Message-ID: <20260504144811.11198-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421190816.2723435-1-bernd@kuhls.net>
References: <20260421190816.2723435-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906093; x=1778510893; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81XBQx7soWsQdnjNJ7GcNsD9ZXCWLg6qgutEsuUZFDg=;
 b=gAz6dOdtbgtppwwHIGDQz8InP5I82URrrbR49qDRslMUEVvGUffEJ5p2d+I+Y4WzIO
 O8WtKzEaq5b9IlGCKMv//TwTyjLoNmMNsxcEdbuXQi8WVkv1V6QrvVcvJIn4R/hHGHjT
 tK8nvKKZEri1wGa3lACIEM+HSZ1RbMHBkycIq4ZKxJOC710HNF/Ii/iAOI7jLi4wm833
 alW37csDscGIn1cauC+liQVPh8uJdVuI4Qn59gOiaDE5KWDwZK6nwrgMQRtM0OKwHTun
 6oQaEps/jZDpCCPk8n1p4PfXyekO4AbCCndDZh5BgwEkToZdtenYw+XHJwzifjlSpPxT
 gk0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gAz6dOdt
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: bump version to 7.5
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

In reply of:
> https://github.com/squid-cache/squid/blob/SQUID_7_5/ChangeLog
> 
> Removed patches which are included in this release.
> 
> Switched to tarball hash provided by upstream.
> 
> Updated license hash due to upstream commit
> https://github.com/squid-cache/squid/commit/30a55c0819d96a16aab59fc5584d54be4a83f765
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  ...Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch |  52 -----
>  ...2-Proxy-auth-data-visible-to-scripts.patch | 212 ------------------
>  package/squid/squid.hash                      |   5 +-
>  package/squid/squid.mk                        |   8 +-
>  4 files changed, 4 insertions(+), 273 deletions(-)
>  delete mode 100644 package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
>  delete mode 100644 package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
> 
> diff --git a/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch b/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
> deleted file mode 100644
> index 695ba0255e..0000000000
> --- a/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 0d89165ee6da10e6fa50c44998b3cd16d59400e9 Mon Sep 17 00:00:00 2001
> -From: Alex Rousskov <rousskov@measurement-factory.com>
> -Date: Sat, 30 Aug 2025 06:49:36 +0000
> -Subject: [PATCH] Fix ASN.1 encoding of long SNMP OIDs (#2149)
> -
> -Upstream: https://github.com/squid-cache/squid/commit/250a18e0a80694b919972a1836cdfe20f2e1baa0
> -CVE: CVE-2025-59362
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - lib/snmplib/asn1.c | 13 +++++++++++++
> - 1 file changed, 13 insertions(+)
> -
> -diff --git a/lib/snmplib/asn1.c b/lib/snmplib/asn1.c
> -index 81f2051fbe7..2852c26b220 100644
> ---- a/lib/snmplib/asn1.c
> -+++ b/lib/snmplib/asn1.c
> -@@ -735,6 +735,7 @@ asn_build_objid(u_char * data, int *datalength,
> -      * lastbyte ::= 0 7bitvalue
> -      */
> -     u_char buf[MAX_OID_LEN];
> -+    u_char *bufEnd = buf + sizeof(buf);
> -     u_char *bp = buf;
> -     oid *op = objid;
> -     int asnlength;
> -@@ -753,6 +754,10 @@ asn_build_objid(u_char * data, int *datalength,
> -     while (objidlength-- > 0) {
> -         subid = *op++;
> -         if (subid < 127) {  /* off by one? */
> -+            if (bp >= bufEnd) {
> -+                snmp_set_api_error(SNMPERR_ASN_ENCODE);
> -+                return (NULL);
> -+            }
> -             *bp++ = subid;
> -         } else {
> -             mask = 0x7F;    /* handle subid == 0 case */
> -@@ -770,8 +775,16 @@ asn_build_objid(u_char * data, int *datalength,
> -                 /* fix a mask that got truncated above */
> -                 if (mask == 0x1E00000)
> -                     mask = 0xFE00000;
> -+                if (bp >= bufEnd) {
> -+                    snmp_set_api_error(SNMPERR_ASN_ENCODE);
> -+                    return (NULL);
> -+                }
> -                 *bp++ = (u_char) (((subid & mask) >> bits) | ASN_BIT8);
> -             }
> -+            if (bp >= bufEnd) {
> -+                snmp_set_api_error(SNMPERR_ASN_ENCODE);
> -+                return (NULL);
> -+            }
> -             *bp++ = (u_char) (subid & mask);
> -         }
> -     }
> diff --git a/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch b/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
> deleted file mode 100644
> index 2e5c67c8c1..0000000000
> --- a/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
> +++ /dev/null
> @@ -1,212 +0,0 @@
> -From 0951a0681011dfca3d78c84fd7f1e19c78a4443f Mon Sep 17 00:00:00 2001
> -From: Amos Jeffries <yadij@users.noreply.github.com>
> -Date: Sat, 11 Oct 2025 16:33:02 +1300
> -Subject: [PATCH] Bug 3390: Proxy auth data visible to scripts (#2249)
> -
> -Original changes to redact credentials from error page %R code
> -expansion output was incomplete. It missed the parse failure
> -case where ErrorState::request_hdrs raw buffer contained
> -sensitive information.
> -
> -Also missed was the %W case where full request message headers
> -were generated in a mailto link. This case is especially
> -problematic as it may be delivered over insecure SMTP even if
> -the error was secured with HTTPS.
> -
> -After this change:
> -* The HttpRequest message packing code for error pages is de-duplicated
> -  and elides authentication headers for both %R and %W code outputs.
> -* The %R code output includes the CRLF request message terminator.
> -* The email_err_data directive causing advanced details to be added to
> -  %W mailto links is disabled by default.
> -
> -Also redact credentials from generated TRACE responses.
> -
> ----------
> -
> -Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
> -
> -CVE: CVE-2025-62168
> -Upstream: https://github.com/squid-cache/squid/commit/0951a0681011dfca3d78c84fd7f1e19c78a4443f
> -[thomas: remove release note, backport errorpage.cc]
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - src/HttpRequest.cc                  |  6 +++---
> - src/HttpRequest.h                   |  2 +-
> - src/cf.data.pre                     |  8 +++++++-
> - src/client_side_reply.cc            | 14 +++++++-------
> - src/errorpage.cc                    | 17 ++++-------------
> - src/errorpage.h                     |  1 -
> - src/tests/stub_HttpRequest.cc       |  2 +-
> - 8 files changed, 26 insertions(+), 27 deletions(-)
> -
> -diff --git a/src/HttpRequest.cc b/src/HttpRequest.cc
> -index cd7ee71d4af..c6ed5bee45d 100644
> ---- a/src/HttpRequest.cc
> -+++ b/src/HttpRequest.cc
> -@@ -341,7 +341,7 @@ HttpRequest::swapOut(StoreEntry * e)
> - 
> - /* packs request-line and headers, appends <crlf> terminator */
> - void
> --HttpRequest::pack(Packable * p) const
> -+HttpRequest::pack(Packable * const p, const bool maskSensitiveInfo) const
> - {
> -     assert(p);
> -     /* pack request-line */
> -@@ -349,8 +349,8 @@ HttpRequest::pack(Packable * p) const
> -                SQUIDSBUFPRINT(method.image()), SQUIDSBUFPRINT(url.path()),
> -                http_ver.major, http_ver.minor);
> -     /* headers */
> --    header.packInto(p);
> --    /* trailer */
> -+    header.packInto(p, maskSensitiveInfo);
> -+    /* indicate the end of the header section */
> -     p->append("\r\n", 2);
> - }
> - 
> -diff --git a/src/HttpRequest.h b/src/HttpRequest.h
> -index 6d369029322..28dc4daf99d 100644
> ---- a/src/HttpRequest.h
> -+++ b/src/HttpRequest.h
> -@@ -206,7 +206,7 @@ class HttpRequest: public Http::Message
> - 
> -     void swapOut(StoreEntry * e);
> - 
> --    void pack(Packable * p) const;
> -+    void pack(Packable * p, bool maskSensitiveInfo = false) const;
> - 
> -     static void httpRequestPack(void *obj, Packable *p);
> - 
> -diff --git a/src/cf.data.pre b/src/cf.data.pre
> -index 0a73020e111..2dce65a4d0a 100644
> ---- a/src/cf.data.pre
> -+++ b/src/cf.data.pre
> -@@ -8941,12 +8941,18 @@ NAME: email_err_data
> - COMMENT: on|off
> - TYPE: onoff
> - LOC: Config.onoff.emailErrData
> --DEFAULT: on
> -+DEFAULT: off
> - DOC_START
> - 	If enabled, information about the occurred error will be
> - 	included in the mailto links of the ERR pages (if %W is set)
> - 	so that the email body contains the data.
> - 	Syntax is <A HREF="mailto:%w%W">%w</A>
> -+
> -+	SECURITY WARNING:
> -+		Request headers and other included facts may contain
> -+		sensitive information about transaction history, the
> -+		Squid instance, and its environment which would be
> -+		unavailable to error recipients otherwise.
> - DOC_END
> - 
> - NAME: deny_info
> -diff --git a/src/client_side_reply.cc b/src/client_side_reply.cc
> -index d73bf3f99f6..fc2feccf802 100644
> ---- a/src/client_side_reply.cc
> -+++ b/src/client_side_reply.cc
> -@@ -94,7 +94,7 @@ clientReplyContext::clientReplyContext(ClientHttpRequest *clientContext) :
> - void
> - clientReplyContext::setReplyToError(
> -     err_type err, Http::StatusCode status, char const *uri,
> --    const ConnStateData *conn, HttpRequest *failedrequest, const char *unparsedrequest,
> -+    const ConnStateData *conn, HttpRequest *failedrequest, const char *,
> - #if USE_AUTH
> -     Auth::UserRequest::Pointer auth_user_request
> - #else
> -@@ -104,9 +104,6 @@ clientReplyContext::setReplyToError(
> - {
> -     auto errstate = clientBuildError(err, status, uri, conn, failedrequest, http->al);
> - 
> --    if (unparsedrequest)
> --        errstate->request_hdrs = xstrdup(unparsedrequest);
> --
> - #if USE_AUTH
> -     errstate->auth_user_request = auth_user_request;
> - #endif
> -@@ -995,11 +992,14 @@ clientReplyContext::traceReply()
> -     triggerInitialStoreRead();
> -     http->storeEntry()->releaseRequest();
> -     http->storeEntry()->buffer();
> -+    MemBuf content;
> -+    content.init();
> -+    http->request->pack(&content, true /* hide authorization data */);
> -     const HttpReplyPointer rep(new HttpReply);
> --    rep->setHeaders(Http::scOkay, nullptr, "text/plain", http->request->prefixLen(), 0, squid_curtime);
> -+    rep->setHeaders(Http::scOkay, nullptr, "message/http", content.contentSize(), 0, squid_curtime);
> -+    rep->body.set(SBuf(content.buf, content.size));
> -     http->storeEntry()->replaceHttpReply(rep);
> --    http->request->swapOut(http->storeEntry());
> --    http->storeEntry()->complete();
> -+    http->storeEntry()->completeSuccessfully("traceReply() stored the entire response");
> - }
> - 
> - #define SENDING_BODY 0
> -diff --git a/src/errorpage.cc b/src/errorpage.cc
> -index d7a588d099f..06046de9ebb 100644
> ---- a/src/errorpage.cc
> -+++ b/src/errorpage.cc
> -@@ -792,7 +792,6 @@ ErrorState::~ErrorState()
> - {
> -     safe_free(redirect_url);
> -     safe_free(url);
> --    safe_free(request_hdrs);
> -     wordlistDestroy(&ftp.server_msg);
> -     safe_free(ftp.request);
> -     safe_free(ftp.reply);
> -@@ -850,7 +849,7 @@ ErrorState::Dump(MemBuf * mb)
> -                     SQUIDSBUFPRINT(request->url.path()),
> -                     AnyP::ProtocolType_str[request->http_ver.protocol],
> -                     request->http_ver.major, request->http_ver.minor);
> --        request->header.packInto(&str);
> -+        request->header.packInto(&str, true /* hide authorization data */);
> -     }
> - 
> -     str.append("\r\n", 2);
> -@@ -1112,18 +1111,10 @@ ErrorState::compileLegacyCode(Build &build)
> -                 p = "[no request]";
> -             break;
> -         }
> --        if (request) {
> --            mb.appendf(SQUIDSBUFPH " " SQUIDSBUFPH " %s/%d.%d\n",
> --                       SQUIDSBUFPRINT(request->method.image()),
> --                       SQUIDSBUFPRINT(request->url.path()),
> --                       AnyP::ProtocolType_str[request->http_ver.protocol],
> --                       request->http_ver.major, request->http_ver.minor);
> --            request->header.packInto(&mb, true); //hide authorization data
> --        } else if (request_hdrs) {
> --            p = request_hdrs;
> --        } else {
> -+        else if (request)
> -+            request->pack(&mb, true /* hide authorization data */);
> -+        else
> -             p = "[no request]";
> --        }
> -         break;
> - 
> -     case 's':
> -diff --git a/src/errorpage.h b/src/errorpage.h
> -index abca4a17d7b..297b306978d 100644
> ---- a/src/errorpage.h
> -+++ b/src/errorpage.h
> -@@ -194,7 +194,6 @@ class ErrorState
> -         MemBuf *listing = nullptr;
> -     } ftp;
> - 
> --    char *request_hdrs = nullptr;
> -     char *err_msg = nullptr; /* Preformatted error message from the cache */
> - 
> -     AccessLogEntryPointer ale; ///< transaction details (or nil)
> -diff --git a/src/tests/stub_HttpRequest.cc b/src/tests/stub_HttpRequest.cc
> -index 495597d9a1b..48a0f1ce03e 100644
> ---- a/src/tests/stub_HttpRequest.cc
> -+++ b/src/tests/stub_HttpRequest.cc
> -@@ -45,7 +45,7 @@ bool HttpRequest::expectingBody(const HttpRequestMethod &, int64_t &) const STUB
> - bool HttpRequest::bodyNibbled() const STUB_RETVAL(false)
> - int HttpRequest::prefixLen() const STUB_RETVAL(0)
> - void HttpRequest::swapOut(StoreEntry *) STUB
> --void HttpRequest::pack(Packable *) const STUB
> -+void HttpRequest::pack(Packable *, bool) const STUB
> - void HttpRequest::httpRequestPack(void *, Packable *) STUB
> - HttpRequest * HttpRequest::FromUrl(const SBuf &, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
> - HttpRequest * HttpRequest::FromUrlXXX(const char *, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
> diff --git a/package/squid/squid.hash b/package/squid/squid.hash
> index 329d61ca93..508b5517c5 100644
> --- a/package/squid/squid.hash
> +++ b/package/squid/squid.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_5
> +sha256  f6058907db0150d2f5d228482b5a9e5678920cf368ae0ccbcecceb2ff4c35106  squid-7.5.tar.xz
>  # Locally calculated
> -sha256  9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd  squid-6.14.tar.xz
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index c031f1aa03..6d403c6c2e 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SQUID_VERSION = 6.14
> +SQUID_VERSION = 7.5
>  SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
>  SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
>  SQUID_LICENSE = GPL-2.0+
> @@ -12,12 +12,6 @@ SQUID_LICENSE_FILES = COPYING
>  SQUID_CPE_ID_VENDOR = squid-cache
>  SQUID_SELINUX_MODULES = apache squid
>  
> -# 0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
> -SQUID_IGNORE_CVES += CVE-2025-59362
> -
> -# 0002-Proxy-auth-data-visible-to-scripts.patch
> -SQUID_IGNORE_CVES += CVE-2025-62168
> -
>  SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  SQUID_CONF_ENV = \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
