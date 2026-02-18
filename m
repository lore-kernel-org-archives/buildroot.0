Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7C8E9A03B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 01:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4555406C2;
	Wed, 18 Feb 2026 01:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ws10oNvQKMoQ; Wed, 18 Feb 2026 01:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D234060F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771377732;
	bh=LFAL6F43MrdLoT84NN0x7nWP8q2EhYScURw2iAeQ9mY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mPQdlDVKCCbfqhYwFTLH1YechwoOldCUoakwQCYqocs2/lRH0VOLBX+KWaDepf8Jm
	 DPd8uZDZA8ub6nPS05wrBg9YL9NklZ961V/RuWNHyo/0/eJKabfzYH2xzuNg5Do/bi
	 gi4VSfZVX9i4XCbHikbRKQW12hlUp3WyCKDsKUBpJih+OcVQnj82cHW2NjZyFAWaxw
	 28oG0P821vLEul4GEvur6kqjHDhJHqXwVWZ3OI9IjlLFJHuxRwdFFV7mIlpSQjHTdX
	 p/1GsY5Usl93e5rXepBVdChvkWJEvqNguyv/gMTwrsZXCfl9SVveVp2m7ivbH798sQ
	 M145yPeEgC0ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D234060F;
	Wed, 18 Feb 2026 01:22:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0AF8270
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 01:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6149606EF
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 01:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ionLhfYUIJ6g for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 01:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0931E605C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0931E605C4
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0931E605C4
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 01:22:10 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7d4be94eeacso3981825a34.2
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 17:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771377730; x=1771982530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyHg6ZsbOIGKbYuG/+/f93uV9kD8Ap/YVVOwFDMeyFo=;
 b=PQhfBIAA+8W9VV/ws2YIpAUx+iJZaEybrGEz6yP2dJ5caRUlwIH/hvqrraI/YzyeD7
 XCMI43pTZUWYXQANZn8YJaPqmnmMRaIy8pAVWcrlDfLIHC9olwZ1FGSgM2vswQclenP3
 OIo2eeUN4GC7FpUZRMEsj8UJndWQV0gLcb+lvlBb+c6rDgh+iwL2B8e83acbpOHgXvgq
 lNwMa8tuj/oaUP2J6CqxMLxgdrQaelfLGk1UNBpjzLoybV1Xd+PU87f0s+CQqiLiFpcX
 pTvKgNzBisxeTqfQ0yzPlEe5vAIBVg4jaXJ4/Gy4BamLaZNziyuqCt7dJMcMdeO58kEV
 xSfw==
X-Gm-Message-State: AOJu0YyU3/ibBCFyw85JHYQItSLDfo8q/iqqtztJmjOQ5o06f0f7Dd9T
 hawhlpjucod50zk360PFuOt6tnY6eQVsD9iVUzXRvESm5CztnvTtVOYAMLshClDh
X-Gm-Gg: AZuq6aJ/jedJ0P15kpaR5Gg0E8y9PIHHeO4smtI/fE1sggLkifZ8kaogKcQLR02qBR9
 ZPZ3fPbSzYN8+29o1cf5IWuTpoEaiOHHXpC55+c96nbC3q5V6TvHYNeaFyD7v//iAsrf7KsDg/+
 G9NpogFV1dqBz3E4iUfRF5CduWDFtORrTxx02gteR1PFE/d39cNF5ZPB+clETu9ZTQSRSvM7enM
 zhnt7LjfmEXlfY2V10nipM6jAf2PiB7X5YN+ykDxM6pMth/AHPlWQniJk1uyBEgHxQJ1KDbIfc8
 ld2jAsTki8v5YnIoUdqwsuviYxQ7Qde9baK9N81hcQeTHEDUwZtvwbayL+c+lYf61H3/fa/vB8F
 Uvefj61+4tJz7i3zcK20cFcUL4e1dlotX25V4UyqFPRPNSB8k26mWazgTGTCqx4SS5tPuzdAmq7
 z6BWomzdAn1qcOqNHx3YP6eJSpK6WJ1tNa7HM0U+gw3n+z4ozKEPj7EFKOP0CPuRxN41fiENmOm
 btx+/RmVCeXNQxqiJfNmfprTiyFC72L8skwkJfmmPXdEu5I8AkMNeYP4kVf+2s=
X-Received: by 2002:a05:6830:2641:b0:7cb:125d:2a47 with SMTP id
 46e09a7af769-7d505da9c5bmr309214a34.1.1771377729484; 
 Tue, 17 Feb 2026 17:22:09 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net.
 [71.218.105.26]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d4a76f96b8sm16350017a34.21.2026.02.17.17.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 17:22:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 18:21:59 -0700
Message-ID: <20260218012159.1555509-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771377730; x=1771982530; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qyHg6ZsbOIGKbYuG/+/f93uV9kD8Ap/YVVOwFDMeyFo=;
 b=TkxkUVwRkasUt0vhXe8DMuF5qSJziy++hJOoria8+BsUh0LyGeo3FRLEwczieb8foH
 k+0mmISCn1//RQZuhFUEf8UvjWDdySHzgphXuzkJh7i1Vsb0mWVyb7Q8dKuCipImzAsV
 mVCi7KSY8JJw2fz9SEUsOgROYY/bLExwyOoIMxmm/hyl3fFEgDJ+ulvYE8CJUKB1jrv+
 3JqFaL7IMxZrTnTjugVulnTjoZ6wPTQjMiX+ZEgWB5cVN+6+ykHTLb8PvShI3lS5VX68
 eE1lTfQrAyehsIgADj+9gl/0TkfdvTkURN+K9NiVNfDTbl6IRjSpxag6v6I0yguDNsmi
 /9Tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TkxkUVwR
Subject: [Buildroot] [PATCH 1/1] package/ruby: bump to version 4.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 95d968e8e2..bd64f97339 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released/
-sha256  a72bacee9de07283ebc19baa4ac243b193129f21aa4e168c7186fb1fe7d07fe1  ruby-4.0.0.tar.xz
+# https://www.ruby-lang.org/en/news/2026/01/13/ruby-4-0-1-released/
+sha256  0531fe57dfdb56bf591620d2450642ea0e0964f3512a6ebee7dc9305de69395f  ruby-4.0.1.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 76ad9cc73f..a9668e36f1 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
-RUBY_VERSION_EXT = 4.0.0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION_EXT = 4.0.1
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
