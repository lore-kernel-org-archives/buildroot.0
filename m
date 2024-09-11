Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2F1EE57D7
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 21:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB5F9608E8;
	Wed, 11 Sep 2024 21:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhnkkPBC8Qmy; Wed, 11 Sep 2024 21:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30DB66065D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30DB66065D;
	Wed, 11 Sep 2024 21:19:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56CF01BF2CC
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 21:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 458ED40156
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 21:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLLEHPRUOJ4Z for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 21:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B53340151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B53340151
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B53340151
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 21:19:00 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-717849c0dcaso203964b3a.3
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 14:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726089540; x=1726694340;
 h=cc:to:subject:message-id:date:mime-version:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VvwVzhMNHhhseD2jIZUrCLedv0qgWwhoWCb4VmF67C4=;
 b=rNnXwbwAjejJIklwduzR2eCip3SA9Vw4rqkkXWjwFfeiBu3OLpTvKhiXrH4mU1j9rD
 7cLxavvouLCaytjMTlZ4cEcWUVVvj6Eemx3s6OE0+TlKMN7Kq5NBymLx3EukACnXK0RB
 sQuwuns5qqbS6ckWdJ9yfk9/Dz38XgYUzOaRT36XRiWUg4A9acLXVYzL3Fq0CavWrhLf
 30wnhuUlfDqdZu8XosLxwjKYA/Lg9iFYZ25cTiDU2q2Hm4ABaZX4WNRt3HOh3DSS6pKv
 kkZqfrJeQUYEkarMrCsfcBRvK54RSYkFMttgRo9sMAyuBSCLuoPdTyB5YukimJfYPqKF
 yEIg==
X-Gm-Message-State: AOJu0YwlkTJbTk4jJGJ+JspLfurvuFlouO7LAjS2WhUH+9F7CRqEApnw
 Xn13bnr6qnQYOC0sCTQp8esbQ0y0cyxL3mPwdyCvcqxe5PAe3lktdS26bz0meBLM/zHVFUu58Oa
 Sa78si5UsmTfCm8cYK7HJ0kHOm8JZ0gUP3gT5oE6uPPJF5DaE0U+J2g==
X-Google-Smtp-Source: AGHT+IGdvcVd6tKhogRUmFK6FFeYTvTqG04reYvPufw0a06bWsngpnVBJ4jyju1f7MX6ud0ZLCJQP94dUUBxgxDe5WA=
X-Received: by 2002:a05:6a00:3e23:b0:717:8f0d:ec37 with SMTP id
 d2e1a72fcca58-71926206e36mr830593b3a.25.1726089539395; Wed, 11 Sep 2024
 14:18:59 -0700 (PDT)
Received: from 432080191184 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Sep 2024 21:18:58 +0000
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Date: Wed, 11 Sep 2024 21:18:58 +0000
Message-ID: <CAEpB38MKaFVyTLAwjsT6uGEU+w7L9MpUg31Oftqb9oaP2DNPiA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1726089540; x=1726694340; darn=buildroot.org;
 h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VvwVzhMNHhhseD2jIZUrCLedv0qgWwhoWCb4VmF67C4=;
 b=fMDKI82aeXrqTpND7bCxgo5g4NH+1ATydQ6vVk20BoSbIjuYfJ2RNB38DE0L81ibFn
 hC+1dV0bI5izgzNG4+p0Rgx/wVRzfXNYdsUTRFqQ3Fqt/iaegCh3UlV02VQYUxUZbOPy
 73cCcKuCiBBvBXuOQhn1WDj0PdCVuxI+hvgRlMLPwj4kH1smHQI7sUZOaPrRxQmziRUi
 foyz4prF5k3356bF0/ZHG69NIzuNttcqEKJFqu7b9CiOLD042Q0xoKVOnKppm2W0Ixgo
 vXvVM73veanTJd4MAXpmXQTx9UEyF99PgX5HKW3usxHVTvWRcqKbxcF66ge9UALyrP6r
 p2HA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=fMDKI82a
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 go1.22.7
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVEs:

CVE-2024-34155: go/parser: stack exhaustion in all Parse* functions
CVE-2024-34156: encoding/gob: stack exhaustion in Decoder.Decode
CVE-2024-34158: go/build/constraint: stack exhaustion in Parse

https://go.dev/doc/devel/release#go1.22.7

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go-src/go-src.hash | 2 +-
 package/go/go.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index d300f6e2c9..f5727390f7 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  ac9c723f224969aee624bc34fd34c9e13f2a212d75c71c807de644bb46e112f6
 go1.22.5.src.tar.gz
+sha256  66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f
 go1.22.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067
 LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 4c56660651..8b9651d7a1 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-GO_VERSION = 1.22.5
+GO_VERSION = 1.22.7

 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
