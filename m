Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E39AC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B881960D90;
	Fri, 18 Sep 2026 13:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mk2fSbsz6XZW; Fri, 18 Sep 2026 13:05:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DACAC60D74
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736754;
	b=q3E+VKtOsqaAeWhJ+di47E1Uapo3yxUXFifdrbNw3AX/ijVufWGrbV/yNnTZReF5A1wd
	 BSB4CoEwyTowNhq5dPFWhzrmrVV+eJJ6DkYXkdhoAu/LLqWM00hkSpxE0UovMpZ/5tsKJ
	 6B8WIoPpR8NGcXSnbe6EwWh2ftOoy4UBZ52Xviyh8fEhf3/rFhWZjONyEjUx1iWpHgfh+
	 5BR+LO174oUoxsqC5BAc3At0nYcJojjPnV5QZh/SP5nRE1hSRnnXbCzH7yINyIctv7IMj
	 KgrDAMv9EEMtZYQmdDdoXP23W+A42sHUU+o4/5vqKm8AF+RgUjmlLdVg0iLlxBKCqEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RxeV1LlMLU0/xJKVe62tcUw1TPSZnXVbFb4ZLFygOOI=;
	b=GJDPpq2HpgVqtq6Z3Qoi1ThdT29FP9SjKn8M7HnGbH7C5cxLzRSzXiCLLWtU5dTe1922
	 GmyEMy9V19GO7N2Cm9qgnhgm+xauhZSMX7wXjmGEjjUk3wESB7DkqR7KHItymKUbyqZ9C
	 XHzm7YrhAcUYG87Z2h/A3Wc+O71i54Sr57mST/tHOPoVn2iVzybF2ymOZsz+2G0kT/81W
	 2E8W9PqZbfjxV0Z1rMBU5rzJpQYvEwHaiXL/3f5YkMsyIpdTBjoGIZi6dPtig4HOEFFFK
	 i3j9MKdulEQBjUKVE5NjvENUM4NOl1LZAP2D67YsaGDyL0tOhH2AUGScj2Uwbfll0IQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736753;
	bh=RxeV1LlMLU0/xJKVe62tcUw1TPSZnXVbFb4ZLFygOOI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i+pMalfQVSQYRFYAtOyokbwVCcyb9ASdA7T1QZBjHis5Dk5VCgqqzlaqUfhlNAon9
	 ThN8HlEmAAKOMjcB1FY2ZlKEz/jgAVxG3Rygju5hgmLtyOFrIswByVn/8BwnGi72or
	 RytCHXb1YHFO/f1zvQBKFivFioEVPV6oFURovw6ulWXGspmcHWlb5y4lm6iD+Ob+sc
	 yrW7UqZ+rCSLjsqFGV6HxEI1ukxj9COXHjYEL7JTI45cdBDRN8j41vk1Tyi8CVGfIg
	 E+yf78F3RmYnMgcykW0BFRPGas7NDY8+vqrxu0R0DeQ5zViHk9hq50omwQAJJvo9gb
	 zitvf/ugHtc6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACAC60D74;
	Fri, 18 Sep 2026 13:05:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EE0142D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F90C40524
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUaJ0h4nLSFG for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2DC8D400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=e5pD7Mdg2HJzuzybNOcsS4Sg8ccH9ps1H1Yq6jCHllq61ahAY+/RKt1+wkBsfrHsVuFv
 wkY5LigMpN5sgqmG41B61JZfDMuwUMnJtgE1XU2uXSCs0qjUO2ZuTTEErezwz/YblCJKX
 DGOYpNks0hXxlCNnTwGhxXmofZDFKa/V/qViDpauJX69vNMvfNELkqVATJZLbPSTdxy6W
 9FXUgV4UVMm7KYmYPPkazrnNlHFiIm2pIIyoTB9GDAhvk4ntVHSk4EKPCmvgQvct/va7t
 HbVmZ4eg1W+8IbaKNHdx1dFTmXSNBAuFfLCg4R0PdKuAY5fEi5B2IazcahYvFpJ5Xsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SchJW9XV9+AQeH9L0IYu7z6TTd2fquKawFYaoZS6dmI=;
 b=ePaG0WQxJzAxqAX/MtDalpsPFZc3g60gWpHL5CxeZihyfPBghlHKahqk9xDcuEMw3gC3
 Hms8R0cfk7DWRcEuCvMM4lTNFKReK8yuIaDKqMZw8hOe6fgdusneT6RULPnOcTREACuYY
 67igT025IL23guHrw3+fPtZngW0N7d5f1XWVwqO4tUevu8I1XRTic48zehJPo7O1ckY1u
 1xue8PxWCmktOdbH7ETiydiHYj7El+ajXi0eEvlpklFgSjEm8kHmu72jjCY0kVvBMn2L0
 dIbh0UQzZbQ7Qk1CkReTa4gsR2DKpVK6M+erCw2+ki2IdqhjY39Vbd4ugLfcswFpg4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DC8D400B4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D84D297698; Fri, 18 Sep 2026 13:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 10:25:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 09fb13df0c58ef507daa671cd13b9e93592494ca
X-Git-Newrev: a9b3d724c874fe4fa75c024bdb4878c72d574da8
X-Patchwork-Hint: ignore
Message-Id: <20260918130439.D84D297698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/i2pd: needs
 chacha support in libopenssl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9b3d724c874fe4fa75c024bdb4878c72d574da8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

/home/thomas/autobuild/instance-2/output-1/build/i2pd-2.59.0/libi2pd/Crypto.cpp:661:49:
 error: 'EVP_chacha20_poly1305' was not declared in this scope; did you
 mean 'SN_chacha20_poly1305'?

The code was added upstream in 2018:
https://github.com/PurpleI2P/i2pd/commit/58c92b8405f5da687734c1b0d6f7ec63dbb2d3b0

The build error could be reproduced with i2pd version 2.22.0 added to
buildroot with commit 1035e80aaa7492fec12cbc2fc5faa9bf32ef1cf3 so a
backport to LTS branches should be considered.

Fixes:
https://autobuild.buildroot.net/results/bd8/bd8616f04df2e1b9e18d1e16921979a852bd566f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b076d3755ffc9865806bdf19efa99c5e70d3b03)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/i2pd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
index c1ba08ef75..8f7ec8b689 100644
--- a/package/i2pd/Config.in
+++ b/package/i2pd/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_I2PD
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  i2pd (I2P Daemon) is a full-featured C++ implementation of I2P
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
