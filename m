Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A88E7E358
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 09:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7094081426;
	Fri,  3 Apr 2026 09:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2Mlu23oDg44; Fri,  3 Apr 2026 09:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A18E8142A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775207793;
	bh=NDXyh+v5eCky3ypj5wALjyeB9Ztv9FDd8IzT4sXK7Mg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dG2F/oLtPAJxK5nVho8AqYfxq6QRvP6z50K1YlmcNAkGo2iFWUskTSBYEXvXpjeW9
	 AsnULTXXNAla47SLar6S7h0FK5Fy2+BIhudZVtJ0oVTx14A7KEDh8z91pN0rNDiRM6
	 wHi7+lD/A3do2ktwV4/Lz2PH4Lrg6E/EiK1hbAg8gosh2BlxRYCI7353XepsTxQi6F
	 3JsU/yfTOIxxpKWxm0snD4fK9WLqk5rnwXHVNvYmq67YxObobDWvlUwRT1NdUh15l+
	 8SwvD7IY5VGwtHcTdANYyh4je7MTXzlvGA8FpeXDNYLNzuFGUVt0+RAtNgQ6hBYvqG
	 0VRlVIoXRu6BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A18E8142A;
	Fri,  3 Apr 2026 09:16:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B9F2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 09:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 374AC40055
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 09:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHPV98lCCkhG for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 09:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C72A40028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C72A40028
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C72A40028
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 09:16:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43cfa33a983so1076591f8f.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 02:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775207788; x=1775812588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2RYCQ/hcrz5acXo2ZN+cJqyKdbnaqFFEdCn26LzRdK0=;
 b=aCHgS7nhT2Z2TvMxpnjlN90js2XK9klzGXo8nlGFbCmRIaH7RWPKaLyIlClW0tLktX
 7O9p9LrmyOjEqC84vr0ILeVFkc3lFniyLrV1PhdvVBQI1NA8JagNDESbVbR9fg1mLOzh
 NxKZhLMtxXmFGUVukM4eQQcPOk2NngalY6YFqtfji/QV4kFPZswP+roTFj3BhGMtFgzj
 Vhy2Co6dffnGNzvEBBmz3hlZJfvmNnNucpkXGVoHrxmjnrpSBnICJa/Zql1kSLWeOfC3
 UMBrH9aD+RTiwjLlAO//Npu1vfKfo7y2RfzwFhMZdcBTz2IiuglI57xvrtHQqJ9783cr
 mGZw==
X-Gm-Message-State: AOJu0Yzcsgq4TWxeWipeZFNcylENLZSxZgpRg/tjFBY3oDOZAd2r2WA9
 RGvfvX6Qm4ENON41vZxpF7xpI5czOfjcCohZgqybTfo1RHi7pVoeaA4USKbg1kTEjH+3iho4FLe
 oP6emcXA=
X-Gm-Gg: AeBDievzuwnPXyGnSi9C84HV4ChsGC64mMDFhRf6zC9UUzAnGvMC0zQA7Oe6daKrPUZ
 S3dycf508nI9/MZGzLV3uuOlDKoaBu2U/8/r4aPjUrawYYuRkEw6lPEml3r6yjmbS5ZFDwYSlV6
 YVq8QHak5zPyCs57pgBAvHbWSEVMXqUDkS9TawGVkHbmmkKug1uAb+5zmt/IgVy4PiJgyfiDAjV
 A2O30DS4GGznGWxS501a6w6fUh3JAPBDBeb50fSWw4+fo+CCwON8hD41ZbKs1eEMHOAHcgglUdB
 ZeVXFjOJBNv1l7e7C1TXu4wp1LdwmSSRg4ybPs+CD+vpCEf8H+vF2VDufjbfDdYGrPYdUlkiFte
 FVlYp5hdW2r5vlU1iohu+8HIC1KSv7HQo1H9C70wrxgrGA9fEP2iIqC68SjNS2AlTYE+UlRKwcR
 gRWtJEQedxW59anLAk
X-Received: by 2002:a5d:5f48:0:b0:43c:f40f:6c91 with SMTP id
 ffacd0b85a97d-43d29285606mr3733612f8f.10.1775207788343; 
 Fri, 03 Apr 2026 02:16:28 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c5468sm14800860f8f.13.2026.04.03.02.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 02:16:27 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  3 Apr 2026 11:16:27 +0200
Message-ID: <20260403091627.57341-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403084221.35659-1-thomas.perale@mind.be>
References: <20260403084221.35659-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775207788; x=1775812588; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2RYCQ/hcrz5acXo2ZN+cJqyKdbnaqFFEdCn26LzRdK0=;
 b=YOHMUea335/FkaEprDjMz916FO0dcapp/GAwmEOpqAdhaX1wVpwdJeZENItHOG/uFr
 terSN2i0d/9zSDbzHoGUUOK4wyWvsb9pFKUEdcwlR+vAneVHMOsUrC9MPHdHy8uUra5n
 cIEo9KecpzHQqc4jLIBXBEF3RHmlpohTdUlm5k/OpjevGqrbLAtWoByfEPzfQYwGih85
 1PORGgZU5Wnfp+gqRs52b0cEa5EzAGfQHVU4xgZ0I6/jfIFfYwN2NlPqyJBm3eagavhO
 z1MoyJf81b+KTTsPm551WN7t64lLQzkvhsMJIMmfRcl3Cfz/ZRSKtOE9QRVAARza6jjS
 TFeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YOHMUea3
Subject: Re: [Buildroot] [PATCH 1/1] package/nghttp2: patch CVE-2026-27135
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

Only for 2025.02.x & 2026.02.x. Removed on patchwork and resent.

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2026-27135:
>     nghttp2 is an implementation of the Hypertext Transfer Protocol
>     version 2 in C. Prior to version 1.68.1, the nghttp2 library stops
>     reading the incoming data when user facing public API
>     `nghttp2_session_terminate_session` or
>     `nghttp2_session_terminate_session2` is called by the application.
>     They might be called internally by the library when it detects the
>     situation that is subject to connection error. Due to the missing
>     internal state validation, the library keeps reading the rest of the
>     data after one of those APIs is called. Then receiving a malformed
>     frame that causes FRAME_SIZE_ERROR causes assertion failure. nghttp2
>     v1.68.1 adds missing state validation to avoid assertion failure. No
>     known workarounds are available.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-27135
>   - https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

> ---
>  ...lidations-to-avoid-assertion-failure.patch | 105 ++++++++++++++++++
>  package/nghttp2/nghttp2.mk                    |   3 +
>  2 files changed, 108 insertions(+)
>  create mode 100644 package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
> 
> diff --git a/package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch b/package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
> new file mode 100644
> index 0000000000..ef8b9a5a5d
> --- /dev/null
> +++ b/package/nghttp2/0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
> @@ -0,0 +1,105 @@
> +From 5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1 Mon Sep 17 00:00:00 2001
> +From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
> +Date: Wed, 18 Feb 2026 18:04:30 +0900
> +Subject: [PATCH] Fix missing iframe->state validations to avoid assertion
> + failure
> +
> +CVE: CVE-2026-27135
> +Upstream: https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + lib/nghttp2_session.c | 32 ++++++++++++++++++++++++++++++++
> + 1 file changed, 32 insertions(+)
> +
> +diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
> +index bcea547343..0fbcc930b9 100644
> +--- a/lib/nghttp2_session.c
> ++++ b/lib/nghttp2_session.c
> +@@ -5573,6 +5573,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
> +           return rv;
> +         }
> + 
> ++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
> ++          return (nghttp2_ssize)inlen;
> ++        }
> ++
> +         on_begin_frame_called = 1;
> + 
> +         rv = session_process_headers_frame(session);
> +@@ -6041,6 +6045,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
> +           if (nghttp2_is_fatal(rv)) {
> +             return rv;
> +           }
> ++
> ++          if (iframe->state == NGHTTP2_IB_IGN_ALL) {
> ++            return (nghttp2_ssize)inlen;
> ++          }
> +         }
> +       }
> + 
> +@@ -6293,6 +6301,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
> +           return rv;
> +         }
> + 
> ++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
> ++          return (nghttp2_ssize)inlen;
> ++        }
> ++
> +         session_inbound_frame_reset(session);
> + 
> +         break;
> +@@ -6599,6 +6611,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
> +         if (nghttp2_is_fatal(rv)) {
> +           return rv;
> +         }
> ++
> ++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
> ++          return (nghttp2_ssize)inlen;
> ++        }
> +       } else {
> +         iframe->state = NGHTTP2_IB_IGN_HEADER_BLOCK;
> +       }
> +@@ -6775,6 +6791,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
> +             rv = session->callbacks.on_data_chunk_recv_callback(
> +               session, iframe->frame.hd.flags, iframe->frame.hd.stream_id,
> +               in - readlen, (size_t)data_readlen, session->user_data);
> ++            if (iframe->state == NGHTTP2_IB_IGN_ALL) {
> ++              return (nghttp2_ssize)inlen;
> ++            }
> ++
> +             if (rv == NGHTTP2_ERR_PAUSE) {
> +               return (nghttp2_ssize)(in - first);
> +             }
> +@@ -6861,6 +6881,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
> +           return rv;
> +         }
> + 
> ++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
> ++          return (nghttp2_ssize)inlen;
> ++        }
> ++
> +         if (rv != 0) {
> +           busy = 1;
> + 
> +@@ -6879,6 +6903,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
> +         return rv;
> +       }
> + 
> ++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
> ++        return (nghttp2_ssize)inlen;
> ++      }
> ++
> +       session_inbound_frame_reset(session);
> + 
> +       break;
> +@@ -6907,6 +6935,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
> +         return rv;
> +       }
> + 
> ++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
> ++        return (nghttp2_ssize)inlen;
> ++      }
> ++
> +       session_inbound_frame_reset(session);
> + 
> +       break;
> diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
> index 98f837e28e..9e051d24ed 100644
> --- a/package/nghttp2/nghttp2.mk
> +++ b/package/nghttp2/nghttp2.mk
> @@ -14,6 +14,9 @@ NGHTTP2_CPE_ID_VENDOR = nghttp2
>  NGHTTP2_DEPENDENCIES = host-pkgconf
>  NGHTTP2_CONF_OPTS = --enable-lib-only
>  
> +# 0001-Fix-missing-iframe-state-validations-to-avoid-assertion-failure.patch
> +NGHTTP2_IGNORE_CVES += CVE-2026-27135
> +
>  define NGHTTP2_INSTALL_CLEAN_HOOK
>  	# Remove fetch-ocsp-response script unused by library
>  	$(Q)$(RM) -rf $(TARGET_DIR)/usr/share/nghttp2
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
