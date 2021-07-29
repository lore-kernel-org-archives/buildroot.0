Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1282CC4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 05:23:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE8861052
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 05:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CE8861052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D681A402CB;
	Thu, 29 Jul 2021 05:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJVAdG-iRVmA; Thu, 29 Jul 2021 05:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED53D400EB;
	Thu, 29 Jul 2021 05:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EFA21BF947
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 05:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65560400EB
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 05:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8aG5GDUbXRd for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 05:23:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp29.i.mail.ru (smtp29.i.mail.ru [94.100.177.89])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 397F9400B9
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 05:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=RSsue3thjB4llo1Kmv3OPNduYRmc/NBMEGDp0/mfoeY=; 
 t=1627536207;x=1628141607; 
 b=LSpyurDiemvzbikkAbQkT69apa6i/a2qh94nfCLVTWDTHST5gqJw5PC3tgleIhsb0aFb+C6q50kGbLvDSFE+4/DGLUkKbe6yaJIxwIetjlsQsERJvg0MSaoIt8nWiPZq1pgPUsyS2muStoAb3VmR9bLiFcx5MHvtKxFJLl6wiDg=;
Received: by smtp29.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m8yVw-0000aY-1c; Thu, 29 Jul 2021 08:23:24 +0300
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 08:25:30 +0300
Message-Id: <20210729052530.21111-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: smtp29.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C351B198F4576AC7B21928AAE70459C21B182A05F53808504007AD65FAD7021B34C7ECC2F8227C51578A0B1AA14F1BA19B35E9F6646C52B2E4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C6068CE86C2B75F5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372094AD700861FA748638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85B9B43EDDE88E3FC6EE0EBF1A71448506F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77A825AB47F0FC8649FA2833FD35BB23D9E625A9149C048EE26055571C92BF10F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B5FC25ED3FCEC3375A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC96906CA750616A123AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063755005259B6E2CF39D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FB26E97DCB74E6252C6EABA9B74D0DA47B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C7BEA09003D200E0869284ADC9DEA30D05E21D059B44250DD9C2B6934AE262D3EE7EAB7254005DCED5EFA11C3473D072F9510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D23D4379F09C64C7393EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D344FDECC3B9E4D57D4DC7C6CC5BC1787851FEE066ACE8F0E11BFECC407F9D685BDEE7C423A01F229AE1D7E09C32AA3244C8BDA7CA7B15F770EB782576C743E3DD9A8CE788DE683120583B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojPp/mPgZxawGFl0Run4keCw==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB248E81AE77813A1CC8CCCC607FFD6C1586CB83A82A306BA1DAEE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: [Buildroot] [PATCH] package/xml-security-c: Fix syntax error
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@busybox.net>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: matthew.weber@rockwellcollins.com, Maxim Kochetkov <fido_max@inbox.ru>,
 thomas.petazzoni@bootlin.com, chris.simons@rockwellcollins.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add missed backslash to fix such error:
package/xml-security-c/Config.in:16: syntax error
package/xml-security-c/Config.in:15: invalid option
package/xml-security-c/Config.in:15:warning: ignoring unsupported character '!'
package/xml-security-c/Config.in:16: unknown option "BR2_TOOLCHAIN_GCC_AT_LEAST_4_7"

Fixes: bbda38afbbfa ("package/xml-security-c: new package")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/xml-security-c/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
index 4c01855292..81d945f23d 100644
--- a/package/xml-security-c/Config.in
+++ b/package/xml-security-c/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_XML_SECURITY_C
 	  https://santuario.apache.org/cindex.html
 
 comment "xml-security-c needs a toolchain w/ C++, wchar, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR ||
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
