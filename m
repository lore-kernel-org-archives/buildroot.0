Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552BAEC0495
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 10:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04FA882977;
	Tue,  3 Mar 2026 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8Wjl4q7ZXND; Tue,  3 Mar 2026 10:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 410478297F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772532783;
	bh=s85dFTWgDq/fo49Z2IxIQqoC5qs6UmjpI+SE5bbkH54=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Z4FhFsi1bVL3cVQHBx384fQshhZw9zuWYwLNGjuCuY9/NTxH5bGq952l2f3nSqjpP
	 JDhG3RBJgKDbOnWVWysVAZtpd4553VzgrzcQqJCP/l9ebtBurfaiNVMlLnaRzEAkCI
	 EgYuMC6xWy4bI31FrZRDb84MFF8bcS9DAXOTzICP4OxFoPBglKibUqnX8L85yCubzv
	 mzIWOGYrB/BtxN0d10GBCsh+xUkY01ojavmZItQsDFLEz/k46WW5jv9RXTBPSmJpWI
	 vJOp3KCt8GZE1vXcALEX5vh/Zku0RGrSomPnT/rr+HTig5ySRjEO693Q2ge+jp0/vk
	 XN0b7LfaAW1mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 410478297F;
	Tue,  3 Mar 2026 10:13:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1827231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B4D76137E
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qA_CcXGoZNNQ for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 10:12:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A0E061374
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A0E061374
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A0E061374
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:12:58 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43991064db8so5622920f8f.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 02:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772532776; x=1773137576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0SfCJt++YwSfCbiEf2+vO9Iz1pEIwu8QoyM9Epxow1M=;
 b=s4gS0qAk3uG422VQ0iLng/esi1/P+L7UsCmzB19FwiB9mTRRV+/82HcQzbdnNgmhUM
 Nt6+Bvt5risIlGut8iB/FjWhX5dRlbdxhERD4T1lcbisxBpEH2RcvgtlW+JhrhnyjLTh
 JmIN2IkiKFcx5JXPJr2n6wVGIeEMV4lb8/Itc66r8tDgkmgPYL237uZJD/NYw5f7z82j
 /UEKyPhY9F9o+R2qV5Q/finnTF8iqqJq79vzgkliPzbhHQqYyM3pRCYceXK9eJrliCLu
 uJe7TM6FoAA7RN3Unn1ZvkGBy4LOIEbP2mU2/xf+Xr1JgN0fFQmiNevLnmU1UED30CAo
 iRVg==
X-Gm-Message-State: AOJu0YwOof9VGnQIIePjCn5VXGwcO26uPly/r8I+/Mbdd5sRk6z1Gf6t
 skhcqBYTI+gCFkk+kx0bv5zAnBLl0Yoc1yQtQOYzesduGC1cs09YbIQjJzRpwCBoyLBKOmTw5DW
 Pfo6n
X-Gm-Gg: ATEYQzxMU3MzcaHv/XmhLyssSrOcwWjrprTt8S825hE39m9SK0twUoPgUK25fagOuJp
 /ACxTZh2WWnpGXMk7Xvm0k7OkTTuOoXlPePcPmbVqB3qOtlO4asKtZKbDT59qY5oTxVP5JnP08n
 k6SvfcS+QJ31mn6XswhL9FQc/CEhVp97tLftgxS26lEBv0w80TVb43vqK0ZZ2HnoAemD3JhO+CE
 kt27btBpZb0uzxMJ71pJd2SS78yR4hlrrogSogqdnixZCVp4KxTVd/NTOANQn0A2hnPWndmmFLg
 0Voe6+S87mHZNHiLWTfMg1/WfdXz+ug4rnTYdvVVJmCPH3fzTii8NjVhM8axkH6DfQEmYhgPpvo
 hL1zdu5BjzMiqI7UjS+S3kYrjYVrsT0sBXrlNcWUe8azw+lWYgoPXdePJ84bTOgk8nzVUUAF2OK
 hM+cz5unY5n933C7w=
X-Received: by 2002:a05:6000:1846:b0:439:acc3:b681 with SMTP id
 ffacd0b85a97d-439acc3b779mr18583214f8f.49.1772532775826; 
 Tue, 03 Mar 2026 02:12:55 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm32917418f8f.31.2026.03.03.02.12.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 02:12:55 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 11:12:52 +0100
Message-ID: <20260303101254.192225-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303101254.192225-1-thomas.perale@mind.be>
References: <20260303101254.192225-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772532776; x=1773137576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0SfCJt++YwSfCbiEf2+vO9Iz1pEIwu8QoyM9Epxow1M=;
 b=UGNddFyJbUlDull3WMZiPvnyW9sZquygTjHEKRZvPnhx8oRGU4qyuZRDB0BmjZl5LU
 BZmarf9eolnmxWgj/goXdt3G7AmbJliFxZGLyo/3PveqiWlmOZgrhYPQeBPKsXpW6fV8
 Va81PW3xBVTjK5uQfWyMHtWYE0pq+8+JZ3iwamwILaNslkArJHzx4vFe6KVNjt7Ifp71
 2/zFMrrbfJFrGmTf7QxHARi2SbiS55yk3x0EndKfUogC16sJs0K0VKEXfuArxe0O49iC
 jA+yWdrupZt731/EvGHhXJMjwas7H7fbsgswg7MizwQNQgeODzYaE6FpyE29sOYQnYTM
 V6KQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UGNddFyJ
Subject: [Buildroot] [PATCH 2/4] package/freerdp: add CVE-2024-32662 to
 IGNORE_CVES
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

The CVE-2024-32662 was Introduced in v3.0.0-beta1.
For more information see [1].

[1] https://security-tracker.debian.org/tracker/CVE-2024-32662

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 6929c73683..889c6035f3 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,6 +13,10 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
+# Introduced in v3.0.0-beta1
+# https://security-tracker.debian.org/tracker/CVE-2024-32662
+FREERDP_IGNORE_CVES += CVE-2024-32662
+
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
