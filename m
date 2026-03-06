Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C90FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A6061453;
	Fri,  6 Mar 2026 19:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1Jz5rMuEbmq; Fri,  6 Mar 2026 19:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F214C614CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826825;
	bh=sqjWkmxZwhYRHonuK4t6LRhbtEhz2DZzOPnN1eDKicI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Os7ZNC3qaPHJh3LlcMXDgSmExCu11tqtlTEpst/4FRVIGRzE+TEMbQ3ghNwn0xQGX
	 4hdaUUnlB3BNCuFy+7mSlgoL2zmO9AynoQHffKfJU+k2zKRvc4ZrJb2DS/1mGF3qRD
	 pQ4QMlUZZRhdv/Z5oXgAUB6LFSkUwSuI+8U/Xw/rSn8l+ule8cmdX7M7wjOslmsT2I
	 DSs+b1FHeM306UmgH2jBXJ58fbEbgnDBqSy0z+t0L89BZS03K6nI+8dPyw4dUovrIZ
	 criRDobydZBRxWxBG3g4sLWSZY4hgEFPwZajQxEfujc+NdnulOO3842A5qo65vtrSG
	 o6HlwkZS4+uuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F214C614CB;
	Fri,  6 Mar 2026 19:53:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 408E8223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2686840455
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuhjrrOKVVqn for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C41934045B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C41934045B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C41934045B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso79823305e9.1
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826809; x=1773431609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IJjLv6+UJOFmt3QwIncluM+p96mG7sAs2zxIeF0HZ3Q=;
 b=koMSWXrTo689mT7ydARCvhpc9a+yPlC1ZDfrNxkNbrXTh9OGqKB6zRelccubbiRh/T
 NxP07KrNYcJQfg4/VVtumi/TrIcB5lhrtRLWOqS7rlfAwhPo4TMFP7PaKVCifoZvWw04
 HIBFhpqOFAwNgnCdeE3mQC1RGfROAjsi/jtgbQlM6cV6j797oPgjfvh0BfDvjqNN+w74
 sXNsoE/3EVCFPVi0q9U0o9vf258kdN2xHoFibDEPFQrI846oNxUOKWP0+J2PKCZ0Mo0K
 RilG4WI+tdmN0bi9wG7UaMC5xMe6pUWa/4Y3sDUqtVwyH9BVyETVWDlMHMFGMIN9EJPL
 U5eg==
X-Gm-Message-State: AOJu0Yzg1DbyIFWoMlOjYELZ/eYhS/EaDE4Owk4TfGcx1728DUhgTtCO
 cempVAgLXzvUzck0AJgGVZGP73VJyLDyTmXHfT7J4vc0QPnr3xeXI2z9y+1FJtUYPHiVwJLyp3c
 Rg0qi
X-Gm-Gg: ATEYQzx6f0ZXU2/g7qYUbzRdwQ0x4SIQW7yDC7TzlHRrEDUv/yN4G1w2v82FyjyfS1l
 BsDbreeP5Px9G4PR7MFv8hQVlegXH5VdIuW5BF4dviyx0caAYtzPb5/LirU3qFKAdT6mQIZP4NL
 NwLfrh8s5qP8AViGv2j6uDCrkc48AIUwscJtP0FQzZXDldsynScbJU0aVZuwnrcMFpyq7cexCiK
 jvmc9FwHwg7Tu4Kn1tlSP2x7HQBw4i9XfezBDXgzsEAdyopHjqIppGslRS8O/rljUn5ZmQIFRJm
 kEPD9TpgPBZUYAXsB98XooLddW+gfyEju1otM+lSapBZTMcszLWSEJesSWz4qzEDb6GqicGhDtI
 tkrn3EWUBj6U/WSuCrvkLH/V5qgZxV2Bn0fB9Q+yCHZaO7EIiFOTJnzQXey+4ghbZuRlTsJXt00
 pAOkowu030LDNw4gZWAbUn47AeYw==
X-Received: by 2002:a05:600c:1e2a:b0:480:69b6:dfed with SMTP id
 5b1f17b1804b1-4852695d16fmr55862385e9.24.1772826808554; 
 Fri, 06 Mar 2026 11:53:28 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276b75eesm48696145e9.14.2026.03.06.11.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:28 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:27 +0100
Message-ID: <20260306195327.8582-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303103802.274517-1-thomas.perale@mind.be>
References: <20260303103802.274517-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826809; x=1773431609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJjLv6+UJOFmt3QwIncluM+p96mG7sAs2zxIeF0HZ3Q=;
 b=OxqcvHjcdRtMJ7OqvtKPKcWaE18Cvl0ILrpWjapdKjxFWpHxqktEM4KaWDgN8S577k
 ZkoCphwUX0D3yg95HxXWrLNdIpi8IR/shy+NLZ00X+CuWk5SOT7R9I3EK/iKmsHoJf6W
 5xU19M8DxoIbGPDqPk6iNRqJG6vCbuUc+mRfMKGWZgFhPwpz+Vcb+mneIVME90KlVKVv
 DLeHsNPaBndQ22uduz5napWwHTxvYT/avhFWQeHgS6mCZxWwJR/H6MgDh4gs3HyFHL4G
 n2dJhCAI6Y+gL6iSwfB9Ba2az4qEa1D57tLBly9VpJ4ElpMFdF/GTCO1WVFgY39P34Eb
 /Htg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OxqcvHjc
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: add patch for
 CVE-2025-62168
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
> Fixes the following vulnerability:
> 
> - CVE-2025-62168:
>     Squid is a caching proxy for the Web. In Squid versions prior to 7.2,
>     a failure to redact HTTP authentication credentials in error handling
>     allows information disclosure. The vulnerability allows a script to
>     bypass browser security protections and learn the credentials a
>     trusted client uses to authenticate. This potentially allows a remote
>     client to identify security tokens or credentials used internally by a
>     web application using Squid for backend load balancing. These attacks
>     do not require Squid to be configured with HTTP authentication. The
>     vulnerability is fixed in version 7.2. As a workaround, disable debug
>     information in administrator mailto links generated by Squid by
>     configuring squid.conf with email_err_data off.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-62168
>   - https://github.com/squid-cache/squid/commit/0951a0681011dfca3d78c84fd7f1e19c78a4443f
> 
> The backport has been compared against debian patch [1].
> 
> [1] https://sources.debian.org/src/squid/6.13-2%2Bdeb13u1/debian/patches/CVE-2025-62168.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...2-Proxy-auth-data-visible-to-scripts.patch | 212 ++++++++++++++++++
>  package/squid/squid.mk                        |   3 +
>  2 files changed, 215 insertions(+)
>  create mode 100644 package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
> 
> diff --git a/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch b/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
> new file mode 100644
> index 0000000000..2e5c67c8c1
> --- /dev/null
> +++ b/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
> @@ -0,0 +1,212 @@
> +From 0951a0681011dfca3d78c84fd7f1e19c78a4443f Mon Sep 17 00:00:00 2001
> +From: Amos Jeffries <yadij@users.noreply.github.com>
> +Date: Sat, 11 Oct 2025 16:33:02 +1300
> +Subject: [PATCH] Bug 3390: Proxy auth data visible to scripts (#2249)
> +
> +Original changes to redact credentials from error page %R code
> +expansion output was incomplete. It missed the parse failure
> +case where ErrorState::request_hdrs raw buffer contained
> +sensitive information.
> +
> +Also missed was the %W case where full request message headers
> +were generated in a mailto link. This case is especially
> +problematic as it may be delivered over insecure SMTP even if
> +the error was secured with HTTPS.
> +
> +After this change:
> +* The HttpRequest message packing code for error pages is de-duplicated
> +  and elides authentication headers for both %R and %W code outputs.
> +* The %R code output includes the CRLF request message terminator.
> +* The email_err_data directive causing advanced details to be added to
> +  %W mailto links is disabled by default.
> +
> +Also redact credentials from generated TRACE responses.
> +
> +---------
> +
> +Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
> +
> +CVE: CVE-2025-62168
> +Upstream: https://github.com/squid-cache/squid/commit/0951a0681011dfca3d78c84fd7f1e19c78a4443f
> +[thomas: remove release note, backport errorpage.cc]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/HttpRequest.cc                  |  6 +++---
> + src/HttpRequest.h                   |  2 +-
> + src/cf.data.pre                     |  8 +++++++-
> + src/client_side_reply.cc            | 14 +++++++-------
> + src/errorpage.cc                    | 17 ++++-------------
> + src/errorpage.h                     |  1 -
> + src/tests/stub_HttpRequest.cc       |  2 +-
> + 8 files changed, 26 insertions(+), 27 deletions(-)
> +
> +diff --git a/src/HttpRequest.cc b/src/HttpRequest.cc
> +index cd7ee71d4af..c6ed5bee45d 100644
> +--- a/src/HttpRequest.cc
> ++++ b/src/HttpRequest.cc
> +@@ -341,7 +341,7 @@ HttpRequest::swapOut(StoreEntry * e)
> + 
> + /* packs request-line and headers, appends <crlf> terminator */
> + void
> +-HttpRequest::pack(Packable * p) const
> ++HttpRequest::pack(Packable * const p, const bool maskSensitiveInfo) const
> + {
> +     assert(p);
> +     /* pack request-line */
> +@@ -349,8 +349,8 @@ HttpRequest::pack(Packable * p) const
> +                SQUIDSBUFPRINT(method.image()), SQUIDSBUFPRINT(url.path()),
> +                http_ver.major, http_ver.minor);
> +     /* headers */
> +-    header.packInto(p);
> +-    /* trailer */
> ++    header.packInto(p, maskSensitiveInfo);
> ++    /* indicate the end of the header section */
> +     p->append("\r\n", 2);
> + }
> + 
> +diff --git a/src/HttpRequest.h b/src/HttpRequest.h
> +index 6d369029322..28dc4daf99d 100644
> +--- a/src/HttpRequest.h
> ++++ b/src/HttpRequest.h
> +@@ -206,7 +206,7 @@ class HttpRequest: public Http::Message
> + 
> +     void swapOut(StoreEntry * e);
> + 
> +-    void pack(Packable * p) const;
> ++    void pack(Packable * p, bool maskSensitiveInfo = false) const;
> + 
> +     static void httpRequestPack(void *obj, Packable *p);
> + 
> +diff --git a/src/cf.data.pre b/src/cf.data.pre
> +index 0a73020e111..2dce65a4d0a 100644
> +--- a/src/cf.data.pre
> ++++ b/src/cf.data.pre
> +@@ -8941,12 +8941,18 @@ NAME: email_err_data
> + COMMENT: on|off
> + TYPE: onoff
> + LOC: Config.onoff.emailErrData
> +-DEFAULT: on
> ++DEFAULT: off
> + DOC_START
> + 	If enabled, information about the occurred error will be
> + 	included in the mailto links of the ERR pages (if %W is set)
> + 	so that the email body contains the data.
> + 	Syntax is <A HREF="mailto:%w%W">%w</A>
> ++
> ++	SECURITY WARNING:
> ++		Request headers and other included facts may contain
> ++		sensitive information about transaction history, the
> ++		Squid instance, and its environment which would be
> ++		unavailable to error recipients otherwise.
> + DOC_END
> + 
> + NAME: deny_info
> +diff --git a/src/client_side_reply.cc b/src/client_side_reply.cc
> +index d73bf3f99f6..fc2feccf802 100644
> +--- a/src/client_side_reply.cc
> ++++ b/src/client_side_reply.cc
> +@@ -94,7 +94,7 @@ clientReplyContext::clientReplyContext(ClientHttpRequest *clientContext) :
> + void
> + clientReplyContext::setReplyToError(
> +     err_type err, Http::StatusCode status, char const *uri,
> +-    const ConnStateData *conn, HttpRequest *failedrequest, const char *unparsedrequest,
> ++    const ConnStateData *conn, HttpRequest *failedrequest, const char *,
> + #if USE_AUTH
> +     Auth::UserRequest::Pointer auth_user_request
> + #else
> +@@ -104,9 +104,6 @@ clientReplyContext::setReplyToError(
> + {
> +     auto errstate = clientBuildError(err, status, uri, conn, failedrequest, http->al);
> + 
> +-    if (unparsedrequest)
> +-        errstate->request_hdrs = xstrdup(unparsedrequest);
> +-
> + #if USE_AUTH
> +     errstate->auth_user_request = auth_user_request;
> + #endif
> +@@ -995,11 +992,14 @@ clientReplyContext::traceReply()
> +     triggerInitialStoreRead();
> +     http->storeEntry()->releaseRequest();
> +     http->storeEntry()->buffer();
> ++    MemBuf content;
> ++    content.init();
> ++    http->request->pack(&content, true /* hide authorization data */);
> +     const HttpReplyPointer rep(new HttpReply);
> +-    rep->setHeaders(Http::scOkay, nullptr, "text/plain", http->request->prefixLen(), 0, squid_curtime);
> ++    rep->setHeaders(Http::scOkay, nullptr, "message/http", content.contentSize(), 0, squid_curtime);
> ++    rep->body.set(SBuf(content.buf, content.size));
> +     http->storeEntry()->replaceHttpReply(rep);
> +-    http->request->swapOut(http->storeEntry());
> +-    http->storeEntry()->complete();
> ++    http->storeEntry()->completeSuccessfully("traceReply() stored the entire response");
> + }
> + 
> + #define SENDING_BODY 0
> +diff --git a/src/errorpage.cc b/src/errorpage.cc
> +index d7a588d099f..06046de9ebb 100644
> +--- a/src/errorpage.cc
> ++++ b/src/errorpage.cc
> +@@ -792,7 +792,6 @@ ErrorState::~ErrorState()
> + {
> +     safe_free(redirect_url);
> +     safe_free(url);
> +-    safe_free(request_hdrs);
> +     wordlistDestroy(&ftp.server_msg);
> +     safe_free(ftp.request);
> +     safe_free(ftp.reply);
> +@@ -850,7 +849,7 @@ ErrorState::Dump(MemBuf * mb)
> +                     SQUIDSBUFPRINT(request->url.path()),
> +                     AnyP::ProtocolType_str[request->http_ver.protocol],
> +                     request->http_ver.major, request->http_ver.minor);
> +-        request->header.packInto(&str);
> ++        request->header.packInto(&str, true /* hide authorization data */);
> +     }
> + 
> +     str.append("\r\n", 2);
> +@@ -1112,18 +1111,10 @@ ErrorState::compileLegacyCode(Build &build)
> +                 p = "[no request]";
> +             break;
> +         }
> +-        if (request) {
> +-            mb.appendf(SQUIDSBUFPH " " SQUIDSBUFPH " %s/%d.%d\n",
> +-                       SQUIDSBUFPRINT(request->method.image()),
> +-                       SQUIDSBUFPRINT(request->url.path()),
> +-                       AnyP::ProtocolType_str[request->http_ver.protocol],
> +-                       request->http_ver.major, request->http_ver.minor);
> +-            request->header.packInto(&mb, true); //hide authorization data
> +-        } else if (request_hdrs) {
> +-            p = request_hdrs;
> +-        } else {
> ++        else if (request)
> ++            request->pack(&mb, true /* hide authorization data */);
> ++        else
> +             p = "[no request]";
> +-        }
> +         break;
> + 
> +     case 's':
> +diff --git a/src/errorpage.h b/src/errorpage.h
> +index abca4a17d7b..297b306978d 100644
> +--- a/src/errorpage.h
> ++++ b/src/errorpage.h
> +@@ -194,7 +194,6 @@ class ErrorState
> +         MemBuf *listing = nullptr;
> +     } ftp;
> + 
> +-    char *request_hdrs = nullptr;
> +     char *err_msg = nullptr; /* Preformatted error message from the cache */
> + 
> +     AccessLogEntryPointer ale; ///< transaction details (or nil)
> +diff --git a/src/tests/stub_HttpRequest.cc b/src/tests/stub_HttpRequest.cc
> +index 495597d9a1b..48a0f1ce03e 100644
> +--- a/src/tests/stub_HttpRequest.cc
> ++++ b/src/tests/stub_HttpRequest.cc
> +@@ -45,7 +45,7 @@ bool HttpRequest::expectingBody(const HttpRequestMethod &, int64_t &) const STUB
> + bool HttpRequest::bodyNibbled() const STUB_RETVAL(false)
> + int HttpRequest::prefixLen() const STUB_RETVAL(0)
> + void HttpRequest::swapOut(StoreEntry *) STUB
> +-void HttpRequest::pack(Packable *) const STUB
> ++void HttpRequest::pack(Packable *, bool) const STUB
> + void HttpRequest::httpRequestPack(void *, Packable *) STUB
> + HttpRequest * HttpRequest::FromUrl(const SBuf &, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
> + HttpRequest * HttpRequest::FromUrlXXX(const char *, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index d445f005b7..c031f1aa03 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -15,6 +15,9 @@ SQUID_SELINUX_MODULES = apache squid
>  # 0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
>  SQUID_IGNORE_CVES += CVE-2025-59362
>  
> +# 0002-Proxy-auth-data-visible-to-scripts.patch
> +SQUID_IGNORE_CVES += CVE-2025-62168
> +
>  SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  SQUID_CONF_ENV = \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
