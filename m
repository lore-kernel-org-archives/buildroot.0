Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA7ACA5FD9
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 07:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA82811CB;
	Fri,  2 Oct 2026 07:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wPE_EME643s; Fri,  2 Oct 2026 07:59:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 313EB811B6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790927977;
	b=eDUjh5PITevTZRU3OWy7JT4PlaW77X4WZ8FM31+5dE69MTT0AjfNJ29QRRA85j4LnpEs
	 y1g0ICeNk0xoqe3MuSh04sIm9cUkxUdApWX2FUXsoeHnuXoCeDgkZ1GJn82UfoTzq4rl+
	 EF3m0RT+iyt+V/fvq3vwVUh+dZvKoXrQ+mBW+VGcIo8CpSi2QE+WQiS4bzHjVPpcKLW2R
	 q+Z0s7Ei7Rl9rdy9+AfLWb/4BIb+dFj7Trv4XGQPEqEMcRWTepbyzVKCkTsYn3AqpwjlU
	 5DKxP99BYpAo2UaoROrmSFh/BeuDdkPUsws/eNc2FOonnkJgCE7cTGm5XRSE8g8wBIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790927977;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=GzqLeDvBHrHFf1FGDD5DarPcXqBxexKSxsyMVL69hbA=;
	b=pXU9m9FKbryucDAw23AnE2Fk1ss3dVdggHzv+xXkZGcYXscnOrUhhNBQKbrA97PPna5G
	 p8UwQAcHTUzLb61QKIxI6C4BGKe+abyPK0ZSzIPouogNSo+COkoEshtjfPpEeZri8HD8C
	 tX2CjqxCQdSnRSIfFK0vx7cSt6YHSjjkXTLjWF0S6+arW66CJkOztCDWKuPcl5qfVG/M0
	 a/BiHBTFBUZkcZwivhHv/BHW5N5+Yg7uQUqLnx9JtEAbIJDwB4cc775O77wayNfMQ2T5z
	 fUsdHXUS/QJY5RTBw7z8pn9jzbZoDYuaPhhp8WMKwiawN86lWFt0l4B8FZvzERGMBRQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790927977;
	bh=GzqLeDvBHrHFf1FGDD5DarPcXqBxexKSxsyMVL69hbA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=jGVoICwbzrK44Fs/01qOB6vamZa7IlFJx3ZdUrnmDtM0k0DcsCXIdaav7fTqNC3Dw
	 cW6DCj/iheKHI9qB/6j6hLqpllJT8kwf8x3yvMjrJ+EMRntZFD0rDZetUGuB++WCYy
	 RWlwbDS+Tj/pQ0cLuFGLSPyb7IIYogSW3kX08j7E2ukOC+cbqxPo0oPTPSOcPb57sz
	 HYH66Sn8+U+/H4NPznTdxI/KmuoTRW7UoEIHbP2qEgl7J1+ZbkaXnAS/L1cjzULkDf
	 HHk2SM64WB03OdEfnRr0p8YrPdRNg57VwERf9NaTXg8/EUbjbncdZAALMJ4i2dFIwt
	 JzcWikJ8s85HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 313EB811B6;
	Fri,  2 Oct 2026 07:59:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A23F32F
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2646360828
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuA9_cD841xC for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 07:59:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 36DFB60873
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790927974;
 b=JQ7KSaeKNmVT3ibOYKoaXHMfDrskyh+k0/kBz+UhLbA9ni9oVcZicI4uH7Ah0b+GF39o
 fGaVPTJhB0/1vaJwFgyuJvfEnYxCEeupjfa94mrhtruevsZE+sc7y/MHQgdAhOeC0pJ5w
 nPGftoG3doez4mpuUJfM2LuQlImwKGYnLSXna510hNzMLF6ayM++ovc7KF/RUjJ7WNjyg
 wGQkYmjh5Oyjf0lVV9zX0CC0XR4IrSvRQ1CqG89Vso6FcNn7ANOJj9JXErGLZN5v8jjzm
 7mXcH5eR+G2Iv0e0qL444tPjL6uj607Y0WEZ7cxN48RGMG/wtVkmJ8YGiaBFbFzF2GA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790927974;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=48evOzN2c8GEe9++fpIAkCInOdZRR8WXCvPi92Y9TM8=;
 b=RZmqS6OyWIk5Pu2qxnod1Re9VNvkhJqoVnIbzqs54G6CN6C8dlMHFI5v9He2ID2hvc9k
 kH9vb/r+inixhjEZYbT4NOK5DEAR9nCV4naxn+2n+qgUQF5HuRVmmeB4kt4n6Kps0IJed
 cYlGWVVZ1xccCQuDhTObujiBi+7JW5yGf5ht0exNjwW93j+VrFNC7Q8kQ7w/YinNZnRGP
 bv7cYBAUs+342db0ngfe5GrCKVbN2yrgCWuPV9te9qPjW83u54ESM72jrhhfC/SKRzO5A
 SFi+fOzoh8H0ojLCwfo3v3fccBjKOGpgqxtIrsYJIRbJFFBJtUoKzSpbl4b4RUGG/XA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=sFI5rFMF; 
 arc=none smtp.remote-ip=195.201.24.99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36DFB60873
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8EBD1814BC; Fri, 02 Oct 2026 09:59:31 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 09:56:31 +0200
Message-ID: <20261002075640.2350126-3-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002075640.2350126-2-buildroot@heine.tech>
References: <20261002075640.2350126-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 2/4] package/sqlitecpp: disable
 stack_protection
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SQLiteCpp has an internal setting for stack protection which
defaults to "on".
Since Buildroot passes this options itself this is not needed.

Fixes:
br-test-pkg/bootlin-x86-i686-musl
https://gitlab.com/heinemml/buildroot/-/jobs/16865965418

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/sqlitecpp/sqlitecpp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 95ddc953cb..418860fc6d 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -14,6 +14,7 @@ SQLITECPP_INSTALL_STAGING = YES
 SQLITECPP_CONF_OPTS = \
 	-DSQLITECPP_INTERNAL_SQLITE=OFF \
 	-DSQLITECPP_RUN_CPPLINT=OFF \
-	-DSQLITECPP_RUN_CPPCHECK=OFF
+	-DSQLITECPP_RUN_CPPCHECK=OFF \
+	-DSQLITECPP_USE_STACK_PROTECTION=OFF
 
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
