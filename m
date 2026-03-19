Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB531090234
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 15:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085D541038;
	Thu, 19 Mar 2026 15:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7tuaFkQ-eEJ; Thu, 19 Mar 2026 15:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E3114174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773932576;
	bh=5O8AKlYMc0Q5rTypKWSRz8SNYzvSLtO/cVc/Y3dRDoY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ds356gPqS2p9jqAD0O3vxxmifrXqTMEMxg26Y2IDTl0Qio9BoolO653csoNxbYMBC
	 9dzP2dha6DJMt7uKDvDV53Gm71jd9aktxGL7j0u+F6YorauW/DKOFnCEbQpsBT1Ubk
	 ZsMt281AaIq94Oi/mqpMdDSRC/8Q+WRe6xyVC7vGWCekuenFmgKU6zNxAGr9xMcEJq
	 VzoTAsxivsmyqwhZK0UVEykTedGQUdqeuiOjnhiObUQJY8NwGEoa6WwdE/PAIhE70U
	 GBOaCPR+44ggEf1qfXljiJGMysq7xm7oZ/XTh9QB6uqDliouFn7ohT1lPZgTbRulfq
	 5FoKM3Ki+feZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E3114174A;
	Thu, 19 Mar 2026 15:02:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4889D1AD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39E80401D7
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDkyU5BSyjWO for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 15:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2278400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2278400F9
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2278400F9
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso783391f8f.2
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 08:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773932570; x=1774537370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Oe11xG6VyOuO6WSuRsxEsKBCCOmacIE02Iv+uvE+pA8=;
 b=h9Mp+F2pBYIyCO6ckwPK7Dc9pubF8U1OXaBBS/TPfWaLbWHpf+zqX/NwA3tMeQ/fef
 iPyTVADHo8WFf+9pHz7vYFJm9kKfeWTLUK3FYHlWGhya/M+lnO9l4nvI4nqlng7kHjLJ
 wRdnFnEU904Aerkf/+TqLlhrTIeIWqMJRV1F78sM57c4Ly4ZYjvvdxZBFIxbn0G2bkwi
 Xkzcv5cDgUnHIGbwRVOPGz22YOc37CtiIcUgpitFlxCLNaVHToyASMD0IxzMy+qwD9IQ
 fND9pkPIls7tX0ZmCRTEEMj5/XWxyQmzH0GO06lg4qFx+J41tJJQDcfEc707mSVVIDV9
 hajQ==
X-Gm-Message-State: AOJu0Yxi2PJ5kI66h1LqsL9YJU2mNgAzIH2UlGldZop52KNkE76Wx986
 jjw0k7SlHs9c5qyfSgYABbEb6ZUkQr5HRGkkBi3Uq6vfsUNSzlKGAlP0hJDLOkpS0XuWdP9DCYx
 5DwXHM/g=
X-Gm-Gg: ATEYQzxZKxtdyxqKhfqzZlAlcI7J5rpBMprXyMsYz1ztfp7GLjb+ry7csEM3yi8Pun/
 sqg9UxBwpkDCUhIQXubv21PQtbIiLOCD9Jw5ky8NRIP1WbnZxWyzhfjZx/0/Mafs/s/TOPCZCiL
 0Ud3kszw9pMbUM+fdX9XHjOWDXFd2ZbzbjK8gpA1DTMeNj9mwkNVmKzHxrpFp5L2wYKopB7U9vb
 2W3iL6rDxMaMSY6nDYvvl+aToKU5s5uc+rJLTAp9aW5HSjCs0zSvFDT+/vGzbS5CthaIG9/xEtz
 coXaAjPXtMQ38cRaoC8g7sW/QSF4aKfRHcBQnPtXgMJo/gA2rmWk7YofsVZca4kyJd7zn5f9N3I
 5Vz2BpRsRxru0yev0193w38KSbI/2tzh4JZS2qoLZ9FYdUghCQL3cQ+qlC7vXdDxgOWpG558FsO
 9I/ZPsxwbFVh+xT2wMW9E=
X-Received: by 2002:a05:600c:a20e:b0:485:4394:b0e with SMTP id
 5b1f17b1804b1-486f4429e11mr86674135e9.12.1773932569897; 
 Thu, 19 Mar 2026 08:02:49 -0700 (PDT)
Received: from mindpad ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fc3b98f2sm33411105e9.14.2026.03.19.08.02.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 08:02:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 16:02:42 +0100
Message-ID: <20260319150246.10937-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319150246.10937-1-thomas.perale@mind.be>
References: <20260319150246.10937-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773932570; x=1774537370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oe11xG6VyOuO6WSuRsxEsKBCCOmacIE02Iv+uvE+pA8=;
 b=BtEaedOAwMcgnnmFs2p6r5rkWLnhbNYPvAj1LWjS5rGQdRE8yrtd1UohnB0RnvVHoO
 1jHw+XZN0mIU+6SDbPYGy9op/OQHcLZdi/9xtdbjOEh4pvBEoFolsiuImRzY3qrNC50o
 WY1ckxDGfpcqoNKtzvCicEcSnZ4wYr2HaIrH0CO6XF4Vaauj5wqGQ5cWewr5Jl2+vAmn
 jUfh1oBh/iPLSjEGSmDa0gOvSGHqexchAF8/J/pd9iak1TkEk9+u8VXADBCs8sBjcB4s
 eYW2HXnPQAqa8DAy3pQHRP/lLLGu8wffhEKWdZy4k2x6Lx7mYdha9+AjkTUkPaIz6Wkd
 jqMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BtEaedOA
Subject: [Buildroot] [PATCH 2/6] website/sponsors.html: add IPComm as a
 silver sponsor
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

IPCOMM GmbH is a German company that develop industrial gateways and
inter-network communication solutions.

They agreed to sponsor the LTS maintenance for 2026. We thanks them for
their contribution.

 - https://www.ipcomm.de/
 - https://www.ipcomm.de/article/AboutUs/en/sheet.html

For more informations about the LTS sponsorship, see:

 - https://buildroot.org/lts.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/images/ipcomm-logo.png | Bin 0 -> 4241 bytes
 docs/website/sponsors.html          |  20 ++++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 docs/website/images/ipcomm-logo.png

diff --git a/docs/website/images/ipcomm-logo.png b/docs/website/images/ipcomm-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..376f4160ef671ebd43e0481f3b71ea5e195cdd15
GIT binary patch
literal 4241
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

literal 0
HcmV?d00001

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 63f580f062..b9fa9f4292 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -46,6 +46,26 @@
     </div>
     </div>
 
+    <div class="panel-body">
+      <h3>Silver Sponsors</h3>
+
+        <div class="col-sm-4">
+          <div class="panel panel-default panel-lts-sponsor">
+            <div class="panel-body">
+              <div class="col-sm-12" style="height: 150px;">
+                <a href="https://www.ipcomm.de">
+                  <img class="img-responsive center-block" style="height: 100%;" src="images/ipcomm-logo.png"/>
+                </a>
+              </div>
+              <div class="col-sm-12">
+                <a href="https://www.ipcomm.de">IPComm</a>
+              </div>
+            </div>
+          </div>
+        </div>
+    </div>
+    </div>
+
     <div class="panel panel-primary">
     <div class="panel-heading">Current sponsors</div>
     <div class="panel-body">
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
