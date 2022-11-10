Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06322C4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 14:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A88B8408D4;
	Thu, 10 Nov 2022 14:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A88B8408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQ0q3yNWtt6T; Thu, 10 Nov 2022 14:01:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C317440635;
	Thu, 10 Nov 2022 14:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C317440635
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDA711BF393
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 14:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9465813C4
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 14:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9465813C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHYJCk1wYVYE for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 14:01:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF823813A1
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF823813A1
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 14:01:26 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s24so1206809ljs.11
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 06:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4l3u16H/ue/ajCe3BWMljtSSf58ocNbG4ZyTCiWRZK0=;
 b=UPkAAYoM/aRYaogV30U8mJiJyOEZAHPnQDMe/EsB2BE/xYg76px5O8K8RervHW+77x
 xjPrgDI7a7FExwTxwzadDI9CaNNWuFgtLJ6m22J7b0tQMLSbMkVD1Cci91IXUlKzVL6r
 VqnJrU9YGMmqugrTAR74qY4CQISJYSGHdQGxoB1kkrZpuAfxA3ZazAUgu1Qd5s82O9W1
 QqKWeIokrdJ/1IxEtg8y+Kj/NuVowhn2kbbAuB7GSLsy7Rb/zpUV8ki5E6ZsHx/qfNTM
 LIdzTjBUqRGJx8bzKYVBMCKnnMXhuCN4yaGxdN4qcS2qk9rpQLBUc8wdP9hLuCJnGAd3
 JJRg==
X-Gm-Message-State: ACrzQf0BkVsszi73Uj8Du4xAAR8kdkJvndnlN44pcEYuPKmYhYzjoswq
 RvAUcjhER1ovdcD+FLgwVJrkiAHoZV+GjNkF
X-Google-Smtp-Source: AMsMyM7Je9t2jeEFUGhNDJH6T8RsiP1lxTequ3tIO4+HfKPUOcYQbsg1ow+JCDHbXlMPmmi64GUqeA==
X-Received: by 2002:a2e:9b11:0:b0:277:6fea:ac19 with SMTP id
 u17-20020a2e9b11000000b002776feaac19mr8363457lji.83.1668088880181; 
 Thu, 10 Nov 2022 06:01:20 -0800 (PST)
Received: from localhost.localdomain (dsl-129-78.bl27.telepac.pt.
 [176.79.129.78]) by smtp.googlemail.com with ESMTPSA id
 f27-20020a19381b000000b0049a6a9bc0dcsm2758603lfa.134.2022.11.10.06.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 06:01:19 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 10 Nov 2022 14:00:53 +0000
Message-Id: <20221110140054.252389-1-nunog@fr24.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4l3u16H/ue/ajCe3BWMljtSSf58ocNbG4ZyTCiWRZK0=;
 b=JktP5BvMNcUV4G6abjTcvGK2PiX+lhzlea3xUAGhA0HoCdCdPrykxpqsck4ZYNRnUy
 kP9d+4GAtO5ea6lILM9DGyunTcox+cKs1CCSwzEjp74YFdKi8xrw4DXqpzKQxNQ0IR8J
 FyQ+xPtX+zBshdtXPlt1uTNG3qA4d4lqck+DSlg8c3VCbpC/E+CP0sSXw+UBEoq8clLx
 mXA3BBOjffmac7TF3DFtt/HLw1FV1DDsaNnQPvBv7tbAm1EUAvIgVZp7sV/SJUUGyiZ3
 JCiod0wStoUgJR5xeD+BvllPFVVUCAh+z6mim8KP6jXyFQV3lfABm8A2zjOSzCMfz2Hk
 iLlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=fr24.com header.i=@fr24.com
 header.a=rsa-sha256 header.s=google header.b=JktP5BvM
Subject: [Buildroot] [PATCH 1/2] packages/sudo: explicitly set with-tzdir
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Nuno_Gon=C3=A7alves_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SWYgVFpEQVRBIGlzIGJ1aWx0IHRoZW4gdXNlIGFjdHVhbCB6b25laW5mbyBwYXRoLgoKT3RoZXJ3
aXNlIGV4cGxpY2l0bHkgZGlzYWJsZSBpdCB0byBhdm9pZCBpbmNsdWRpbmcgdGhlIGhvc3QgcGF0
aC4KClNpZ25lZC1vZmYtYnk6IE51bm8gR29uw6dhbHZlcyA8bnVub2dAZnIyNC5jb20+Ci0tLQog
cGFja2FnZS9zdWRvL3N1ZG8ubWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3Vkby9zdWRvLm1rIGIvcGFja2FnZS9zdWRvL3N1ZG8u
bWsKaW5kZXggMTgyNmY3MjAxNy4uMjhjZmNiYjFlMiAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdWRv
L3N1ZG8ubWsKKysrIGIvcGFja2FnZS9zdWRvL3N1ZG8ubWsKQEAgLTE2LDYgKzE2LDcgQEAgU1VE
T19TRUxJTlVYX01PRFVMRVMgPSBzdWRvCiAjIFRoaXMgaXMgdG8gYXZvaWQgc3VkbydzIG1ha2Ug
aW5zdGFsbCBmcm9tIGNob3duKClpbmcgZmlsZXMgd2hpY2ggZmFpbHMKIFNVRE9fSU5TVEFMTF9U
QVJHRVRfT1BUUyA9IElOU1RBTExfT1dORVI9IiIgREVTVERJUj0iJChUQVJHRVRfRElSKSIgaW5z
dGFsbAogU1VET19DT05GX09QVFMgPSBcCisJLS13aXRoLXR6ZGlyPSQoaWYgJChCUjJfUEFDS0FH
RV9UWkRBVEEpLC91c3Ivc2hhcmUvem9uZWluZm8sbm8pIFwKIAktLXdpdGhvdXQtbGVjdHVyZSBc
CiAJLS13aXRob3V0LXNlbmRtYWlsIFwKIAktLXdpdGhvdXQtdW1hc2sgXAotLSAKMi4zOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
