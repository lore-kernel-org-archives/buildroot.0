Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25847F9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF9DD42B53;
	Tue, 14 Apr 2026 15:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NN6yP5eWxZV2; Tue, 14 Apr 2026 15:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC74240FE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181572;
	bh=9J4AHFEXaTO/HuCAL0I0v2t6cxtGgvcRYGtGNWX92Fo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DS8UbLjylLHIIqyKVy/zZ9qeyO8J6K7l7SjipW6DRx3532NnVEGdiOhimhxcQQ2Zt
	 WYieSUoOY8u8YDMv2dhq+VAjajc5XP5YzuZV6SfzOfAHyw9IAwWf9h3/8uWLa8vNmH
	 d5M1+YSbakBpdz+LNmWHUvWcBu+HJJdqW72GLcP87o2+EmEoU2RFOKDJgTYVclY1JN
	 uGAql0uF6VNx2EWh3UlIWApzlNnVJPiShxfUthNgM0ilW/d59mJ1cKbEZSpySkCrHe
	 F8hifvctnYJrfaZSmrxMfhLC+U8PPZuAZkrMArfcoBRXBQkj5T2Z3Ir7Xbx+z7YMNT
	 WEMBtxfo/Rpzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC74240FE9;
	Tue, 14 Apr 2026 15:46:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C20283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E92BE61C48
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ET5YsxcfJNCJ for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C63DE606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C63DE606D9
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C63DE606D9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso67271615e9.3
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181567; x=1776786367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ynAPqi7Tk47PMD70aJ5o7KTjsvUzqltsXsGb0MZ0L3E=;
 b=KghRBPR9nR7uOp0EXTG/sweanvSib/oKUFSqR4dnrtzu4J9CyFzj+iyswwnK5sRKj/
 jbrP1bom3hsJgA8jO7Hx5lLQ7KxsVVpBOwYeAkndUYy7YV7maWk2I3hoBLS0msACu15r
 M4ml0swgopHmhS0hwHV9b2aKhL8HdbUU6hMf+joZ9FUwmbSC7Fn3x98VHyzs5h9C9X0C
 Bk/tSYxrwJeIIxqj9QjaMlwlmSOikp2ymPF2qVI4et5rV8hM2N2o3DyA8Dj4dAJPt8yd
 XX4sz7HRw1aw/vxz7oMaLpwhmulYQV03+LovEvXDOdHOh7tIq9nq8erCpJ6KgbtPnDTn
 0Uvg==
X-Gm-Message-State: AOJu0YzQyP/ZGbVKCm3QUpedkbZROcx0sZPqzvDccsJ5/13tR0dFod72
 lyROxHxI6FO/L3FL7tt5FoLd57xJdQioFGcGVQ7/SpigUSBhMSlaqdDexz/qtyo3ouwf+vxw1a6
 1FaWU
X-Gm-Gg: AeBDiesT/9T1N6I2fCjv1XabGkvfQg2gW/kyDpwyVky9bGWH905TtUYE1CAGkX8f95p
 iANQsUGheRNlBY1fWAixuodfUCBlYxy2uzwdHNUuM2YdafRCGMnmo0kmPKKm5+7LgcU3c74BXRj
 SRFFh3aa4tIWxCkgHcImVQheY8Ljsjc7ncOD3dNAZHV38s3vyQaM9mAUn9s/NzjiAilzMRaGcwt
 nGO0/hHPM/NQF1hvolcPZGCV9Tfco8TDZNLg01aEhr0VbNYVej6gECwIPYqe/8emC/kGvaH5VqF
 Q6lVca8pU4Eo0VROl7gjZHmHOV5ymQVTD4dx4bebzRc3kFm66spOuY5kByMZC+DmBmb707RmWwF
 sr/po5QJVSzQ+kPXueJNeKGpc4l5XPE1+WGJeH/vXCPE3GwT6NqFsEP3tl0KGSqEGBGuX6CElFc
 rEHI0wkm9IFrLkcQUM
X-Received: by 2002:a05:600c:a109:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-488d68431ebmr180338905e9.14.1776181566561; 
 Tue, 14 Apr 2026 08:46:06 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede24eb0sm64363405e9.8.2026.04.14.08.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:46:06 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:46:05 +0200
Message-ID: <20260414154605.335850-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403084250.36050-1-thomas.perale@mind.be>
References: <20260403084250.36050-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181567; x=1776786367; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ynAPqi7Tk47PMD70aJ5o7KTjsvUzqltsXsGb0MZ0L3E=;
 b=HmCjuj5PgAHZ5e3SmxLS7PeJdaXKxLMp/KDpumAa+lAzR4aOrK1MCLOhmbQIr96pu8
 r3XYYdonYrH3P/akdf+dfOyXC/XkXTdAU/8d0B2KGOqDUH9XblEQyAwS1aoWSabPOqgh
 A9jAkrBVYXMTsL/R0opAkOkU9uRqe07rga3vdMWKYq6bB5gkHCmG8s4I9R4cIHB25f0F
 bos8Yi8clIKqdiXcY6UB4qYOVDlXzww7rnWjViFzqIgwDNuQuVAkgKfYimqxrMQGaHUS
 JVBGXTLmo4vUJGw9MBY9yd57qSvoMbcgXZFvx8ol0vFqoP7jWVd5OYefBRllJvOjNl70
 EaaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HmCjuj5P
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] package/nghttp2: patch CVE-2026-27135
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

Applied to 2025.02.x & 2026.02.x. Thanks

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
