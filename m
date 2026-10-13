Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB0CCC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BE1E607EF;
	Tue, 13 Oct 2026 21:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-L---Xqi2Kc; Tue, 13 Oct 2026 21:01:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 42C75607A9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925265;
	b=LAw80XvoAEXw87uay/Ql7iXRvpaK3gfRwmHLwpoZDnQNrMie3cpv1H8Iwb9ITmZu3V55
	 iQvgB/d1xV7UxA7kzN8g52K5NS08gwkULLspst2oKXrafpDLBru1kgiaceH7TvdrYF8Sk
	 DaV0weyfP0f8UMvBilHuD56EcQ9jaQiGO1z6MPhW7HzoK4hUXUJGS3o5bdPdS4lrevgHw
	 2ravSgcg3wuvsSdhTyDqnXmdg0q459O8cK4Sj5SuTBcL/dsfegSTIrRuo+2a61ErSiYAk
	 yJbrsCE0+7LiW5hIu02aZBmj/fCUKHU0mhFw2QHMy/DfNNq5HtOJ5E7lJvJ6X+hSawg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925265;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=A5ZXxDirnixrA1dW6+G0bdFmA3MKvOrgJRyHSJK7VvI=;
	b=n4WJzobsmSb769lCJKPLUvtGJ7eTzAgSnQe8Zi6zJmBGTN26nHoy8LLFThc9HFkgHODc
	 bYyBicnZEVL4P1ahw5U2cnjjJiKPOzzd7xg59B/DitUGyLRCy4MOfan4TCAbpqJc+458F
	 GDMLPazgTzYZI67tMcp7vfYxqrDhR3jppJPZZB+Z5mziJx2Qn6u+mVywC4D6RXexZKqEn
	 ElpEsim+H4spJe+48VkbA+eqioTtsDjU3aOPBKgwTdf6mqAD93ir1mKxMLB/YnRLX1qaF
	 FU1GRlEMnzRqmErMsU53fmNxa5umkCn27Mu3LrYfgOCUJzRtleuPZvmlQWF+GlRYs+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925265;
	bh=A5ZXxDirnixrA1dW6+G0bdFmA3MKvOrgJRyHSJK7VvI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YTsb3jxr+yjGrxTFPZfisKS643e4cN2lL4ghBRQdKlQJ9QtmNidzjVqGA4UtG/mFH
	 b8Hu6xD6Aa+CES7N/qnh7paYzRBhkMIWh528gLMshiJfIgo+9YezsMbCUTgs1HwYZI
	 +7UWoOrOSQNw84zYmoBjQ4nPY1kFsa0mt2HtvUbR+6nyrt/xM/Nsrgq0rGz+IShL7v
	 BpVRqcGHqbKJutd2j09qNsiIAPbfGLGuOQ/SYsl7idANjCllTc7lkCVqrgZe7fiGMm
	 MDYfqMNj7MlPsveV7ynPmBESy7UwUeBBRQnvw5cu0GYIYp7X0U8u2GOJrLzAelddd6
	 8MgotmbP/jjTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C75607A9;
	Tue, 13 Oct 2026 21:01:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2473A2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F18406E1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZuqX_uZ4JIL for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:01:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 61BCF406DF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925262;
 b=rWTYYCNk1CdM0ba7Kbufdx8yutyHPZvnXDVaa1W7p2RoiDGsvl8V3I4xa94piHA7Q1AV
 J4wib0pJpBFmNsxama0if7ytPywMfWVy9QDHYr8WQpvIWs/Jc6HVzL2+ZpITDrKnOYaUx
 vcrXcIc4qI2U8+6qcGx9vKSgO5HCn2/Rze6jbgRGjZZKwbsQmN3sRRDOnJ/hPcvU88yu7
 t6v5Uk6AdtlyOfb5LrakclSoAKIUN+7ojVkVp4IC/ZVXqu9VePNbsFpUFgBl9LPOB8OCZ
 XuIe3iY/RKgNYw64xarJQyPuifyqCnP6LFa+SEEaPgrxqolIdsa1JTFKTyOtnDRcX8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925262;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=/lGFWYMe8cNGQDqJdLoeAAv3Bx6SndVBTxZGeHiiDaE=;
 b=gbmRLR4s//i1HCPYwz6sYB8XWAH/X0gA/kXPO1P38wt8XTMMu6xzrycTWylcv5huQ+1J
 9wu4QvoXDDld1U42Rk/QSjOblLhz/+XNmvjoCdon13xIHYL2xgbUKnMhL77fSG25Wnq9/
 lzw4Lm5sxaX5OBQIXuWxvhLaHMDD3bFRQdl9VQEXgPgu+8NSpC5GI4M+6xnZLeHPduDmF
 o6t3Vwiy5TvIRUqVZjWaHmyP3MyWdH4sQ7YKmvj+f+tuxvxeqYSdvs5r3bu3bnRsekl8C
 lm/sYQtwjrAvx4nqtUtuQqd6WF959Tw4QS56j9QovOkwGWdrvLvWdw3k9V6A0GjycdA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oIMdZ5Gg; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61BCF406DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:01:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A96F54E41217
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:00:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 791A460362;
 Tue, 13 Oct 2026 21:00:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AEAAD11D71954; 
 Tue, 13 Oct 2026 23:00:54 +0200 (CEST)
Date: Tue, 13 Oct 2026 23:00:53 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <as6brHVo_vpwIey9@windsurf>
References: <20261013164254.1476592-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013164254.1476592-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-aiohttp: bump to version
 3.14.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue, Oct 13, 2026 at 10:41:47AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I have applied a whole bunch of patches from you, too many to reply
individual to each of them. Here are the patches that have been
applied. One of them needed tweaking: the python-pyudev bump. You
added an Upstream: tag in it, but forgot to drop the
.checkpackageignore entry. You may want to add a round of "make
check-package", or directly running check-package on the modified
files, to your verification/validation process.

Applied patches:

4131ccbdd08aa47b2376ad28d91e8936fd2bc958 package/python-aiohttp: bump to version 3.14.5
7e0b4b6368dd3bbdbd53e3d0dda2259a9330b0f0 package/python-bitarray: bump to version 3.12.1
82e3d29d352b8ddce0d55a8f41be5a16b0a47b30 package/python-cachetools: bump to version 7.2.1
9b15f3804dcad33e9b1ed1e4f72c1708d2def38e package/python-cchardet: bump to version 2.4.0
6f8c9fa81dd39d1e426aade20ebbf11f2677d161 package/python-contourpy: bump to version 1.4.0
14cab37f94a34ae6cd1ead0896872699d954cfca package/python-cramjam: bump to version 2.14.0
dbf237d4b5c55c249bbda61e425d0381966f7dfb package/python-cssselect: bump to version 1.6.0
1872f6de96fcf1ea0fee4f5a7cec4b339b271c37 package/python-executing: bump to version 2.3.0
b75d5857d8aaf40e0187f33616fb332d8cb64c71 package/python-fastapi: bump to version 0.143.0
c4e596db61a3a28572b8aba14483098fe3e5e4bd package/python-filelock: bump to version 4.1.1
2045e55fac6e401dfe64956d5feeff82c21de3b9 package/python-gobject: bump to version 3.58.1
d6344b3992595059b77a28ae7d143df11749682c package/python-google-api-core: bump to version 2.42.0
a2f910ab31a22805354281ecf4fb9fcd4519270c package/python-google-auth: bump to version 2.62.0
ba1434dfc3334eda2d858931dde2faf82b11dfe1 package/python-iniconfig: bump to version 2.3.1
cd3948ae7aa4ef0f50108a287d2e7667c769b4a1 package/python-ipy: bump to version 1.2
dc57e6aa8ef34390c19b90b0ac0563b470cf4c0c package/python-multidict: bump to version 7.1.0
23d83ada473dca86b1c53542f3e5ac439b90c211 package/python-opcua-asyncio: bump to version 2.1.0
60bf7245b53d0acb942ea8e118f76b3d0d63ae51 package/python-opentelemetry-api: bump to version 1.45.1
cf8d3648ee35d2c7620464ad616478c8bf357ae8 package/python-orjson: bump to version 3.13.0
c642f13b1d5e3a7816cb83ab6a518fbe0728f173 package/python-pbr: bump to version 7.1.3
73b26ce87e19b24e73ba87e5e912faf3440bde75 package/python-platformdirs: bump to version 4.13.0
1e38e780d3f2439213e521f1090a51f153c27d49 package/python-pycparser: bump to version 3.11
30fb24f7c00cd6ab742a54aa4b2fee2235480786 package/python-pycairo: bump to version 1.29.2
97efb2bb5c6a6a439750ef3158fbd5fc05b175bf package/python-pycares: bump to version 5.1.0
b2cadc26be6259b0c874446290544da76d9a683e package/python-pycryptodomex: bump to version 3.24.1
a22a140461b1c72695847be61308d67a4ebcfe61 package/python-pyspnego: bump to version 0.12.4
a96edd9e453c547facfba48abc0d8789212b747f package/python-pymodbus: bump to version 3.16.1
7482d76e17166e6ecf3bf58b6812858806fea9c7 package/python-rtoml: bump to version 0.14.0
8252f69992a0e70e9f85ac9d9f0e57a4c8a88488 package/python-selenium: bump to version 4.51.0
bd71152b32c39338a17fa9b46530f2914d795fab package/python-servestatic: bump to version 4.4.0
76785a3f6c7baa5689a2fc691a9ceb2e0914e964 package/python-sqlalchemy: bump to version 2.1.4
8c01db167d2ad84ddd74a55472b1f5c3f957dbf4 package/python-soupsieve: bump to version 3.0.3
2505e109f0e06406b8ff4c50989ff3938a2e5d1f package/python-tomli: bump to version 2.5.0
52da0bb32dcd9c184a2ede84c93da8d7fb4711ec package/python-validators: bump to version 0.36.0
5c0905f096ff0bb705da1eeb84b7dd78982509e0 package/python-wcwidth: bump to version 0.9.2
a5f741c8e8fd96315cf1226bffe99b4ac000a785 package/python-async-lru: bump to version 2.4.0
5ccbe9fdf4c0a85ffce7e0605da2b87063a9916f package/python-botocore: bump to version 1.43.112
696e2c4c5ab163b9091c28aad97377cd0fefcec4 package/python-installer: bump to version 1.1.0
65db6968c110bd9af42226b71519052a8e05d546 package/python-jedi: bump to version 0.20.1
39093c7ee42f0b97b33ae7a350567491a26af9c8 package/python-librt: bump to version 0.16.0
dec44147586a55867131723080768dd57b181ca3 package/python-pyudev: bump to version 0.24.5
b4b3da6de31b7fbdf7b94087523c8effa026c178 package/python-sentry-sdk: bump to version 2.72.0
efcd03cf457dca3991d5c49732f20224924c2b09 package/python-serialx: bump to version 1.12.0
cd4991bfe8d4bab0c194c7f31357fde36ebc24d6 package/python-starlette: bump to version 1.8.0
464c445a4d7f401cbc2fcc48a5698029998c16b1 package/python-texttable: bump to version 1.7.1
86cf0d32ddbfab7ed066df3bcf6d72eca2a43afd package/python-truststore: bump to version 0.10.5

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
