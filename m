Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390EBCA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 048C4817D3;
	Sat,  3 Oct 2026 13:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMWgGkQ4kXHb; Sat,  3 Oct 2026 13:58:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E2DD7817E4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035889;
	b=H+2t9tHd8JrDOJu6AdT3FySiq6RSjvuIr3Uk6NHH/FCqaxmXw6Mvg4FHVu/jDoZuSNk1
	 FYr5vqbgvYWpkMyG34ueHmciQ/gQiyk8GU39fwsiZxZ1ebiaqR0RlvhpETQed36cahOcF
	 MJ7ti7AtKfA8MkcuNux2hlUfNoMVlrWBc4Rz1ktGFZ/aBEOZNP3CzxD/VCqsFMF0pSwD3
	 HMrZ2OrKlq9H/RHkS6MiOrH2iRKA7VVGJr7mviE7+9gkvbBh5HRgxGgonpFcz30IliiUf
	 TAlV5qU2hFZhJBNioszstttoHuEIiHKtMa+rT83rCQc+9eF+cV4B7m6r30gBhzv8UMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035889;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=H5Xj29UST79IEw7jHLaPq1SifynZ112Fc6/lcsIasOE=;
	b=sKe3yoT6CVudbp1CW6aTQDkde3Huq9u1bxaTAhV1l2ZuASIo6WqM2Bv6hRx6cE4Q/BmK
	 v9E8msuaQpVy5s7HLE9JBYIPbqsd8etLV9f5gt2Ee6eeJXd0hkpIsl2pcdol8rZNJtY2r
	 GCCLf8EpuNdhMG86OGxrbCDHLRdPjs4THcr6vZM14+3lqr/DNZFmii9v8hHbSgHDK67tk
	 OPR2sBUjVKLP6/9rskoywVrTnSLFMOkxjEVHAp3WF7Sh8JYFVO8dWnQSQZ3qK+V42BMWr
	 KShPSiuRSOCi1hE0g6MN50o5ghFOpfdvNeMgz9UNs1Mj8YCH4mSDqr9Widzbnamxx1g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035889;
	bh=H5Xj29UST79IEw7jHLaPq1SifynZ112Fc6/lcsIasOE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RGk8W51IctaN/UgTR+JoKjZWBz39FjfhVs5PPy68RZd73mr7pUdNuQR++T1jq4yKq
	 9P539QHL9FpKBsnaTDR/KHLJ8/BPlsgDxdkCiRYsQV5jjegOQwzGlcYzS6bweVTqcH
	 VzKje5/WnCBI8MUW5ighQgoGz1GpfONb0blpF7Ke+PDNtjnYb7roa+ZmfMcbXQ/pEw
	 EY1quPQuoSoUmVIPFt7KsoO2A3sf+12X0Q+xoC3JwHWPP+U6LA88lLgkkIbMf3p8fZ
	 URPxaoT9YsJSfe4NEo40EzjYcMjIZR5mL7sXZkp37IQcnYhW85GMVxcJKIiJYGND5Y
	 8iNVbWZMTUOlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2DD7817E4;
	Sat,  3 Oct 2026 13:58:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50DE132F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42DAB816F1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XD85Dhj8_upQ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:57:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6C576816E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035866;
 b=oNsmFamHNw9bHujCboBUDNyotwFcCnGS77qF/LrntVxMgBi8kVDg3A9zI5/MpRb7TIl9
 ALccnqy9iLJ0GgY4/Aa7bpHy/wiglg7ILUM4TqeJoOi9dSXvrZ/DtEecsxPePLOO9ADqE
 R7MlMTKuAOUBJrJfdoDtZ089VxU/XB8K/IhLF+woXxhDBx/cvOg/uX1fDL1J+H+rqdCmZ
 jDMSh+AnzNx872INMyJfm+xvtzos15+HL13aGkHT3ZVYLQDBNc1kdMTm1q9uSg8b8fceU
 yUWOFFaaXac9aamhxQM5I7raiiKhb4eqwW7ISjTmzkrTOb7pgmuYeKSry3Ocl9ZnzRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035866;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=lKkqUZfkSYe3MPC0iOyiwvFL85mLAYlC4K8O7iAC2dE=;
 b=XEvlHCDXWPlmNCCsSP1JLzrgkN5/ZkfRuBlIS0wQCgxnSd5dSkkvvv6qDsyYa400FSKy
 bTgC6x2x/QlnMFXFlSwCZuTHy8+/DVv+ckzbbYDg5yOL8pwMTUGTt6VKYZvPfYqztvLV3
 5vzra3AZHr+9N8MxGsWFsL+AROaaLjO1j0K0ydf/Dwe6uQh0bPvRzOR9ProvSsiQtaAm0
 upeodhkOHKEvSONhlc87h+7+wOFGaglO/ReBkfoDklVr/B6GdXTI1DFEJqZnIZc5uywvj
 FEo/8vUoJ9BCOlBWa6hfHkfvrJINK3gHXF2zxM7r2eni5mc7cqWHdF2yiMKfHkyhuuw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BR2cyOZn; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C576816E3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:57:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3D8D41A1101
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:57:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 09C50604FF;
 Sat,  3 Oct 2026 13:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 123071032827F; 
 Sat,  3 Oct 2026 15:57:40 +0200 (CEST)
Date: Sat, 3 Oct 2026 15:57:39 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asEJscisl3c4Hwb2@windsurf>
References: <20261003013304.400979-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003013304.400979-2-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohappyeyeballs: bump
 to version 2.7.1
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

On Fri, Oct 02, 2026 at 07:32:02PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash | 4 ++--
>  package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

I won't reply to each individual patch as there are too many, but I've
applied:

9dc679ed9f7008340f8027169faa1b224c2bc4a2 package/python-aiodns: bump to version 4.0.4
ef9480086c372ac43ca74f5c142e322d2b1b4893 package/python-wheel: bump to version 0.48.0
76d891b48389ce06d7330798b840774245a6e753 package/python-multipart: bump to version 0.0.32
e3abb7f05a47f425cd1d2ec26cfb027f8d02ff54 package/python-multidict: bump to version 7.0.0
5764b6893677086932ca6fa7595f413d3ac17b8f package/python-mako: bump to version 1.4.3
3bb3557f667b756f9eed14a161679d0f9306170d package/python-lxml: bump to version 6.1.3
caf8356f76c5bdea2b9888f732b22032a9a0c5f6 package/python-hatchling: bump to version 1.32.4
08904d2a3d56f5b96035b681146eaf8b7bf6b422 package/python-dictdiffer: bump to version 0.10.0
dd673499e1def085fa1cdcf9c0ed092a40e8cb24 package/python-cbor2: bump to version 6.1.5
b5ea4614a2b110d50eb8bf2f28bbc73b31c3827d package/python-aiohttp: bump to version 3.14.3
cd61c7f16fca3ffa7b811ad697ed9840dbeb84fe package/python-yarl: bump to version 1.25.1
07c4b03cd4a50806aa0e09ab090173075bef9343 package/python-websockets: bump to version 17.1
c1fb56c12502e66637c3e174a8f85b9296bf12b2 package/python-uvicorn: bump to version 0.54.0
5cddc0d6ed9f6c53bf74379419932ff64d42cafe package/python-urllib3: bump to version 2.8.0
58ba800c62ce183eadfe216a25826d0efe3f2673 package/python-typing-inspection: bump to version 0.4.4
a199cf5594d67cd91fcfbb5408530bf7afaa2ee7 package/python-trove-classifiers: bump to version 2026.9.21.13
3eb9b971f077a376860d8836ab25b7fa51cf2af2 package/python-tortoise-orm: bump to version 1.1.8
827345fb5544e7aeb87addfcc003615a62342623 package/python-starlette: bump to version 1.7.0
16eae3c371499b2679388ba97fff9b4a9b44b0a7 package/python-setuptools-rust: bump to version 1.13.0
ed36bce744d66b6392adfed64f8e01c03b95ff48 package/python-sentry-sdk: bump to version 2.71.0
d2cada09f9a3a47e49d1bbdcc5775896b276dc13 package/python-semver: bump to version 3.1.0
42803538e946b14e402580300ea75f17af3f111e package/python-pyproject-hooks: bump to version 1.3.3
b942389570f38a81589504f753f5cd9b2ccc2acb package/python-pypa-build: bump to version 1.6.1
6cb474811953b3e69d9a338d92f613cfba7fec8c package/python-pymodbus: bump to version 3.15.0
48d92e556ac55fe6cc8540ca00498870b43c7c29 package/python-pyjwt: bump to version 2.15.1
6792e0671aa98585125ef3f9eb1f953887544f4d package/python-pyelftools: bump to version 0.33
f4335317229da13bdc6322b52e23bd91e56bb2f3 package/python-pydantic-settings: bump to version 2.15.0
388fbcebe0ca2871e95910ebf139ff8d233ac123 package/python-pyaml: bump to version 26.7.0
c0b216e6ff696b374416da25bfe20d142fbfb8ee package/python-propcache: bump to version 0.5.4
6bedb0de293ac88558d49bf3ea9c4d0ac14883da package/python-poetry-core: bump to version 2.5.0
42347117dc606fa4f825cb129254d8071cfe6fe2 package/python-pdm-backend: bump to version 2.5.0
d57d31302d1bc20ec88aef0cead79eec3e8bff07 package/python-packaging: bump to version 26.3
d64414c712dc6f871441fcfbdc51eb2662918fc0 package/meson: bump to version 1.12.1
db76d4ce8028656987298dd0dbb03e5087b1f3d1 package/python-installer: bump to version 1.0.1
e801ebe04f3a4fa7d7f9f53c4325319b6baf97ec package/python-dotenv: bump to version 1.2.4
7e73e8b7042eb58c4ad3f940736b588dd5ced85f package/python-distlib: bump to version 0.4.3
999c01f82949635a6f36a9914b8b2020126c5bdc package/python-click: bump to version 8.5.0
256b0dae741fed450fc629003f45a15de2352732 package/python-cffi: bump to version 2.1.1
fd66866c9a9bfdc8430298c3db33a1dd8319ce22 package/python-certifi: bump to version 2026.7.22
c3ea0f9c7480a1504a64d5f7674ddcc4b11e3397 package/python-asyncclick: bump to version 8.4.2.1
e606573180597b875161f07dbaf420103a705c9b package/python-annotated-types: bump to version 0.8.0
e825373a0a622098658e33a8b930677c2112ea5c package/python-aerich: bump to version 0.10.1
96cb3581c0f65945a4b5a4458737e250e5c55b83 package/python-aiohappyeyeballs: bump to version 2.7.1

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
