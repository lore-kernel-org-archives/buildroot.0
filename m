Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF26CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8A0640AC1;
	Fri, 16 Oct 2026 15:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcKED6EJBxbF; Fri, 16 Oct 2026 15:28:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0DCFF40A9B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792164518;
	b=cEt1+um+DLKG2nPBpvqlaxAPZkZKGZXwCK4f5vSWE6YJA/lEUpmomULdVERvtdTrrsUZ
	 v1TB45HCSvPuvA7RZXWkgw5fw45RU++cRk3r6Bcj4oy9cXfHoSj5frcJRbMc/XVK4tqE6
	 no+QjBJ8rPZ03sZyMAyX6Liwv3/3XUQZ1TbX2BTcAgGQfkQkTXkzt2BHCV8zPgsnfWwnT
	 OPgGBVtHh9GSUaxdB7XQhi/Zq2nTcrLMy5peHca6TzPWM/1k50uvktAXSgYRlaSC8O9a7
	 N+iIlkCC+SZ3mMuzPF6xlxqoNvsdv2ikzCb2YNUSDPiY18Pzna4e417umddK240uorA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792164518;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3T61w0pMkxNUE70PWba+MoWvQml4L/3Dc0jpYHwD9JA=;
	b=dlF3UgZwW+HSD5zzwNrM14jjq4Mc52AwIglSywV1jDddxJJPzqUTwkMw9QZETuMFXNKS
	 quZttqzZl3wlkqFC5Oc3jicXzxkb09xJXyabFfB2QJLCtvvDm2jDIGoKIF49IHa3kA8hh
	 lRh25aWpqi+fZpERvr+brFEZKVIb3/lT518sCON41zSZD89L4/R356itQmMpwFRfugoQE
	 47uudvo27gz2Kqu8u945fQjIOvIem0LYywKLRI/GIyjTgLY65zHuPmS/td3BSmwZq2Cpn
	 dYbJBPIGdHEDqhjXfsNv/1FqISeyxA80IKiiXx8G96GiTxuercg21P7Amex2iUPaiHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792164518;
	bh=3T61w0pMkxNUE70PWba+MoWvQml4L/3Dc0jpYHwD9JA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W6TOZ6/MTI8PWuprFT9Lz4Dve6xJ5FLXiVwYWbkYu/cLEKGO7oRs+MwbYweoHX2oY
	 6zFIyxWP38UehRqD0ZBOUkOcyl1V8Jbc27CQx2l/uYJjstCcSjw5RXoKki5hRqbTrs
	 ircS7N1FNoYmEyqbUIiDykNWsOC66XiVOOi70yLgtIGnjQLCLPUszvqWzSWjbJOCi5
	 PWvfzC+t1es4alpsaEN6UR368DiYht3/K4lSssW4LkGBqkBOk0IiZZeNQVhdc/pAmv
	 w0x0c5BUo7hRBUG3pUbK5ovATyDDibjJCl3djmsCghggncA+vxDphhh3kMF+13+sXs
	 iwwgmZg7yMBRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DCFF40A9B;
	Fri, 16 Oct 2026 15:28:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD9FE769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE1F340A99
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVtcH5zZMgtB for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:28:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90C3440A9B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792164513;
 b=EjXRECER9EOxofS2J5IMiOXtcezGrWCdZj30r61+2yZOK521nLSnHBjZcLtfEOHg6ngO
 3xIBRT7c1BYcxU+Eiqr36CQUobR8lsx22h1WDWADJCuVj0bBMdyjJYRumoc6F+vxui0ec
 md5pN6Xy9t1TzZdth5Iba1vr+Uku1To9YvpYWFjl7PGo3BU23CgXtnQxSOcBMb+ftCzMm
 LR4epDCzFCuRRKVJCFykk6cqTcmDu4kXnLWO1iguRaskYqCsiUyijWpAf7pTdHTchtQc7
 /fP/6n1oDveSZHhAqG2jph82npWEP8ZTyCoKLuaOIhu36Lj9EObbd54a7qFpMEk3fsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792164513;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=/2HkPA71mYMESLDzi9NYzNSpQh8w1ppx8VcdIpOtL8U=;
 b=q1m/4Im+0JW2KPWzGulUggSxUI/HxsEKmVrgkiF8CD2U/FOdxxN8fmgEGdWZ9z4NisIm
 83KA+uCVkRFmUuHnmbDJuvYctOMSSfoIXcY0590MWZmHVp4/JDUvo2R6VKW4hawTBn0Eh
 zsL/hXcWL/yOXKYoZiRSBsbvBngjnLIMGCA4/13dbN7f39BOWScXwrVXbOX/kHZ+NQanc
 Axvw0BzxDaE2LCXbmCtCH5WrvsCpQwFPngwD9KMi+iXLFFJb/12ca26GWG25oClEEuu3O
 9oNNBTaoW276Z8YClCRajZ48OaAmoYIUTNRTf6zkfFSVv6glWUPTjyN7Q4viks1V3Rg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=bv6ciNGR; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90C3440A9B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMofc-1x1AwN27sa-00LJEQ; Fri, 16
 Oct 2026 17:28:23 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 16 Oct 2026 17:28:09 +0200
Message-ID: <20261016152811.2817446-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016152811.2817446-1-fiona.klute@gmx.de>
References: <20261016152811.2817446-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vnQAsVR7q/PbLBLe9LFbduDlYgIokLh6Y2c02os5z6YqKXvLyzE
 uYQkDtR7AdPw/8XpcfZ8j7esKD5JKJ4nkZ+T/3+FXRcPFMHBWTfjHNvvLzSfm0iQXUSE4Im
 TxTAFHLgF+QIeetetHA+z9eOpF+j88jxPE8Vhz03L/H+3nShv+qfS8pL0gFxenkOIm6wMhi
 OxrbQ6aqWMadNIiLwmWxw==
UI-OutboundReport: notjunk:1;M01:P0:Hzmz6iH+5mY=;m2sZ71FfGu29YKJVwOZXEGZ8Rou
 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
Subject: [Buildroot] [PATCH 2/4]
 support/testing/tests/package/test_uboot_tools.py: fix typos
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 support/testing/tests/package/test_uboot_tools.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
index 8cff6fda21..13f77c3379 100644
--- a/support/testing/tests/package/test_uboot_tools.py
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -96,7 +96,7 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
         keydir = Path(self.builddir) / "keys"
         keydir.mkdir(exist_ok=True)
 
-        # We generate a prublic/private key pair to sign the image.
+        # We generate a public/private key pair to sign the image.
         cmd = [
             "host/bin/openssl", "req", "-batch", "-new", "-x509", "-nodes",
             "-newkey", "rsa:2048", "-keyout", str(keydir / "dev.key"),
@@ -150,7 +150,7 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
         ]
         infra.run_cmd_on_host(self.builddir, cmd)
 
-        # We check again the siganute, and expect a failure.
+        # We check again the signature, and expect a failure.
         cmd = [
             "host/bin/fit_check_sign", "-f", "signed.fit",
             "-k", "test-key.dtb",
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
