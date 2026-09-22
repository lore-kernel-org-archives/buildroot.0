Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1719C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A381A80DF3;
	Tue, 22 Sep 2026 10:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pHtaXQEUFb8; Tue, 22 Sep 2026 10:33:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A756B80DE6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790073193;
	b=G+dZcM7JpHJ81xKqe8A7eNsFt/sDUuPjDqf1DHZLUIByxB7WopRylxLJT8bCr/LUU8o1
	 +gjSa/6BtzYerdh55bvbnF6xhrgTvRDFnEa+y7+AUQhHO4CVIw0OsiItd2t+rzwGfYYwZ
	 QmpV+ioXzZNqFqV7rAAAdEeIfU+vXlDWz2bX6BQFYnnjM7P4k6TYbN72VIYZNKvUBz9B7
	 lZpz32ytynnON6/2AX27S6O0mZ3wAzS1e2IuCeru/8H+BMe1KQHI+6mDJ40o6gs6ft5rE
	 KlZaArKfQ4EXxwszkec9UjD5zSdLsZuqSqnxO4oFQpzFZN6zDtwkO9idwea59ZO3z/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790073193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uiCW7V1Ahwm/ydYZ6Oz9V2nJXQQPih48zLY9paVXjL8=;
	b=ESnu2H96c+22/jJLweyb1TgOxn251XPzPChvLK7icjmo4UvrFLbR24EG7sKC5xmQsgqn
	 e2ZESouJmZGaGl+Gh1DA1VlwpOjaZKGpb8fKccqt4WmdIbc7r9C+QqOfzy1BSbr3vPFQj
	 i0Zj3V/XMa4TZ4pt+1ynIJRIdE0a2EuwAVg1kuEV2zV//JoDyK0KgQnZ4DBJfVbYknzof
	 6rWLK8v3Yhue9kDwa1rkhxLVlHXyjbASga0cXH3QIm1qJmFwII/9+qmrj/tCf30MqD/8z
	 z9Lq3ui2GOMoSTv7Cc3JoRGw5h8FB6hqiYgWqw1o41RGOOckhf678V7OVoMMeFHTctw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790073193;
	bh=uiCW7V1Ahwm/ydYZ6Oz9V2nJXQQPih48zLY9paVXjL8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n8YaciknQZRbqUAenSvbe4ATFqizpml4nhvj6Zu9LI1S8hc8ZW1xzbz2yni2HVcJi
	 BaxDIhKq6D9vd0F+DnYdLMb6PIIhnwjOkaViUryBAQrCnmMwtwCNte4SY3obIHV2Y7
	 D3BhscwO50dNFLXRPW2WaOhCUea6z+H2CSeN+kcFbpt3O7NDRWZpCt9SDmYBOkov60
	 BqIq/LJPoCBBf+3IB2AxJys9OR7wVdErlmXwOWqdH27BxjkhJDSkUCkc3+gRzpaeZl
	 AiWxU1O9npdORgf2sNUogC/x+SG1A/ZHE9XF/QYH/wGC6pUYAxXsWcGx8XUBNuuSjp
	 bLDTJ4h9++k/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A756B80DE6;
	Tue, 22 Sep 2026 10:33:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0AFB13B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D659080C3B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chPJe0dT1166 for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:33:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 730E180C0D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790073188;
 b=ZNS4UoYeKkBYc+YgV2YY9MrMqTz2OTJAzML7moJDF2iANm2yhiPY/F5QeykLpysG5NW+
 PoTpxKnEAWcd1Pgtrd9qJtRe6ZUmXhnqbjtueXv3F2Xo3lX4kkzUOMSejJxgJ+oaflxkG
 V2YPa13mfMPAQ1ADvJ33vkP1iC2SbrPcErdRDl6q8wnVF1hWv5Ahbcz6XTIY8dchYDjYC
 1Dx/ZaAmT9yCjvMcyIJZ81NKFPQxujl+a9xAevJcWFIaEK6Uk4K/HwPo7lnGqBVJMwWgw
 Swd+jjdqVOwZpNS90e/dh+7m7dYHy69yVLcQUB4M2qoJabpIWuvSjQVjLHfg9kKEmMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790073188;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=FI2wOusr4KfriR9vIS4jWs4mDmvr4TRruh2iZS6/rkA=;
 b=tAdnHz7jy/wMzlXin8iy+k2YlLIYOA5PMaCv4QFhffq7HWus2TZ/dPm184wBwz22oSzV
 zzmRPMXK+uWTq8XeJIhxCsmcXu24yNwAs96BL3ZeSBJtIEyMyguNGi+TNIcI6CAz3x5hI
 OH7rOXx3c4JbH45jD5e/o/mbyva43NQLSgCoe8WSR9wBnmRBDCToUfFQAZLVVZ8Vb0ITJ
 H2VDVnNuqWMMXWS9d6RTrdkp6r+hVO3do4D0Ttrs6DM3UH5kqROYMy3GiVRvB6Hqge5YX
 U9CYWl8aEdhvmn9jTtZs1ODakgEaPIWaofBYZbVY28Inxyy2NH9jTgIfbolPJ+1RkRw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=gjmbvq7S; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 730E180C0D
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MN5eX-1xRs6X3fNd-00TsXC; Tue, 22
 Sep 2026 12:33:05 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Tue, 22 Sep 2026 12:32:37 +0200
Message-ID: <20260922103237.712596-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922103237.712596-1-fiona.klute@gmx.de>
References: <20260922103237.712596-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:iH2k8h4vy7j0GedqZExf2ozfNJppOhFUCbi/Uzlc7rURQiySKGf
 064/cxXzYBn3SHcVhG8GwzCJYZyzZaNXua+F2mMKpTe/jXpfdwi8RBLSswxwXav0nVST3kG
 /C0qL+y/kszUwaUMz5HIl1LtH55mluVy9GfTkTwUoWFkgGrPA3J7Jbuyyz0IVe2jDA9G/PD
 ppFNKt0Joyg7il3MsRefA==
UI-OutboundReport: notjunk:1;M01:P0:Patyo8d1ZF0=;926ZHbggUUpAnbIyTM0VaqcwHhK
 kWfgQUugZLJfaYKNdEIeSesTFbG4yGyDoRoK7RSU4A8lLRO8aOjNl8S7wZdTsHbvS+V4EWzqP
 6wHiTyDXe/qKFAWlbQRfwMsCY6PcLDiWecZABc6j2V/bY7EwJ1Hcf/+dGV8+iOjpK9JnxRc+P
 x/e90vAO7+t6WdBVOc9yckX5ryQ/fpDB/dNcL1JHDQEAF/7ABQd6NTgiODRC7WihM6bEE2VAI
 YZobjOHt8NJ8ZheGqpRzm512/bFtreKE3Aqot3+aM1MIQLOAD628dY9hifoQjgFeW9voBJ/HW
 gEUGruPANPa3EhAxcF3n1slK6FzA2IXm3+q3+pmR4uX/miRyHwS4HdCAD97REvsxwVkLyhuir
 DckK/a8aa1RJNKFrQTRyVFJxbUSxYRgDY6IQo/X2pXgb8yLyWhxOzT6204xCyG87Jxsnt4my4
 pb7mTJ8rZq6le19toESt79/DH8PMSXpA681PkUkEmBZkU+SL0pxZzmkoWnUXvq+fbSKYNfU+8
 DGdMz1/iVrPGkEplKh3WYwidx22M3Nx80J+PzLw4iHwAbzrNW/Cu8sVGtKDbk03he6P95VaNq
 iO/AFMSidsSjIypwo4Wk9GT0CR9i0Fe64eBtAFjp58melWtmG3u9dGpZj09Zy+nn6tOo0nPAe
 ASbMjk90sGDP2z5LODWPvYCcKIRxkumox/gb+1KlWGCSZTieR8ttIhdD7K/hElSq8S4M8QwRx
 WomaoCch0Zw3ETVs0kj6+KxBNykOx6/sEtMrMN+mmQA4gVLieeyvIdfrYkfuczZLD1Qz8tQp7
 l124NBJU3cdImGgWTQcExFm6TinBKzkfNM01heJm5LBaQDkpNbTTe7UtOHXjjf/ApvdhL/xW8
 LRMOYz9QRTszma/A/e8t2pfRpC3p1XrkalsI0/nhfxinLxE2qxBh68aQo48Z/NtBSayGUCTJV
 yWPAg5TkLNy59N28pB2EXEm3YUr9lDR4useiexB4xQnfKa5G5z8z9RXOvYyTf9t9/oGzdSxr/
 bRcRL2S/epmzxIb0O6Y8HGn+vmsGrCtPsbNPy9G/KlVLslSsIR/UrVOehY76X6RpA4NHnXiKB
 bZVF9KyaahrBjSlNarxhnC0oRJ1alD96M9Xc3ADLCaKyfGt0ULsdG7r5KFZQ1B3T0SJF1tSTs
 sR3V3Mj5n6jVwBtQHXS4kNZQYJUyS7bjOOyCdsEczYURpaYTSZjV6vj4jUx8RTVmiEGLGQDx8
 NlnKkyGjBI5M7l0jFZ4muOZ0aiMazVkSchuAD8FqMGiHS8OQFuUIpq9YSpzLPh/RQ6Ydp03wq
 Ai+tH02S0EttpHKsAKURTIjAOJ+7aI+ViU4RYwcTU5Rey2Kg2RbfJiSLtQKkHHfx9Rhats2t0
 FVEFM1LXHB+d6ics8DJWZQ26t3n31Sh2I7zJ+k6qux61AnXK7CFLWHy2KIacyYkLmM9vegOGh
 Inf1gtwtj01Be2wJVHGcKmj6mohzMgjRDFc5m5u7QmBX+cJE7pfnEfxK+Np8jN+pjwJASJq1U
 oJLGVvt8aA1aDrZV1uLafjz/Qg2wriYhTfXziiI7iro/MrUj4vnh1Y5tfOTJ90AMtysctV44O
 +G7VZLn2YVdams/Hyud9pkn8dPJFYFUbqkB6L8zTz+77RpL26pAGIF1p7u0jRmkKDB7BUwxtK
 +wLGdBDQw5tU/fPaTKVqSiswdJrr17xjIOlu+un4I5AeXMzDISg+YJmGDpDhXL29uPlajgt69
 KR0GqImnOq8ONN2o6w3RJXqH5ON/Qp2o5Z9D0KyzFpiA7l67FdwT1cTI5AtmFM2puJPKV6uo9
 lEXun48PE70YYvsB64DBz0CiMX1e47mrG0svgL593z5Lthd3c+g7zRuWBcIl8KuZR9EvCeq+j
 8Wh8vAQKLmYkYV8F1Patk95Zryp89pakVnaBhu87cTIYxCqWEDvZ0bh17pSEE5p3wxK2b+XtB
 wQSIsLKpZBsiX6fHSgnyCPobvLNf06UY6tX/vC3WxkMIxbTKuF0qh64Abd7DBd8nXuj3hv46b
 8o7XDVYqfNWi7Elt1tbVSvJ2xJh2btkOeTWuK/4ym9YWTkhd5tymZRxQNHrNvpZYy2GqhQMWZ
 uNyK/r4LAussk0Qm1RTKCM9LanDfGjsYvmUP2Jsp5dr7Y6v23X+Ao2NvWPpbaGdh2MvLFwExt
 E4hFr1HkxZVxnwwqjUmcVKs1DoUR2Jtxh/orFojkdd+hTecO3+S2Ot72SE3q2fywm3YHfFtek
 x/vhTF36o3JuX8K7DMpSSgpdsj02HaoJvRDj5VKeKK70KYX8DJmpwdcmDAYrMG1fIf27v8tWn
 pfUgRfg6iJ4Rot3lXuXpHGX2IYAf+ez0lnAQONj+g6O5r7rZvCEQ85rdg87SSuhf1Dj7DWJNB
 1JjTK3OL4dzXcX9o8yoAE1NuFCEMoXYcwM7xtgCA0BCgej/FfJI7HhPKzdieKyavKbVJUKDK5
 ErHsZMRj2xjGyW8I62g1Owkw0xb6dLTSqG1ofBPZePi5xKf3fUWab9frLVyeYuxN+PGniYfyN
 ff5slkx7OlOvBvvbp2zymqj9dO9yTiKvmkE+NgcJNXD873tpeDcF8zCGIUac97AJvpb6x56iH
 n4x1gy4yf3sLif/JaB6+qrQ/lUtBlMvIoGAcCgHFqrAXo81Gd+gX33HEREyuDPfgpZfhDPlyP
 I+FOMy6L5+8nV0gOok7J3Hhub7baoCK1+6ZSvTRx7844ErKEcath5IhRaGQQrTKcYvtxQ7jKd
 QxMbvScCzxViO6ipn8KlQAyuOj0TKaiut1RPnr7ggmvX8pMOWsb+oq/aPB6M8rpTjwImnnHRp
 20kqPpUpzo/unQvwZ0r37cSlfzvPsHXZTu9d6fH7e4mlq9s/Z7l23mDInrO63BYbIHpq+OS1O
 bI9w8KoGansc3QptoyMCrRJ7qV5eacR1y9NSWOKwREM1+HG9IajP5EXQ9zGsxaU+cfjp4Vcb9
 Z91sQWlSFg8Y1P7/G4sCtBZ5OmWKIv5b2J3Pcs6Ny74IONWW+gSrV+V6C7NekIIk3f1WqSwJv
 QHR5gzT9adJu9gLbzYQ4u/yJvKvxSzJNnUj7rO0N1KtoKU3M7jsKB3V2W6bI66XJJRvxNnj8R
 hdN00M+CVOB4/PeABXGmlmTX4Bj/+kVS7llwGf5mgg3EeNMCW11fqMa93QSut6MP20wJT1xYq
 GRiKwWmd9jlBFMvEj3hLbMpma7FmzpHQaM8d8BJjCL5Zx+aLLhEc2zvLnwxIioNfC4xgGT8On
 oUydqwrIOAkL8aoYdyQruexT0ZTwjA4V9pyTItyKn9JnWDx2X82djuuh/ndR6uLSkuU0rI7Jt
 z+u8xjMwt11jA0rmP/XnRIWibiuFT6yPad5VjTGpWWrBfjhc4JXrau/m66eu4hRGTEMN92RRx
 OfdC0yJsi0L+++LdmrdnPUDS+WLc46+2g6HCNUQ2G9DOn0U68l/lIyulc/DUNcvv8WMqhXjuh
 oGETdxi3fpIQhiXPVKU98yvh1NlE5JLdl1NCNosy1EU2bo8esP/kBJlvzvfgTToq7COhuvs9E
 3Jvl/AmFgzQ02TF+JXZxa63SvibdGAEH2X6tXARZya1499zpzOfKk/UP0uJHtgnZ/Wglet9g5
 DMljHTZKFaQb7VQBv1DBCLwvHeNzONj8dA+G/aW3I3rH375lMJwlJM8qi8pRq5o2UvfBV1GpM
 zTyRuCCUUs7qtp4kl+EIVqOJGcm4/g5MfC6zKtiX093pqArEiiN8L53jfLxOGSa8ypqBRbBWF
 ZW7QjtOx7udUcFU89BBQsTopIyVLBAXVUNEx88XbuBD8xxIGV1TLqkdyI2HiLmT1vIILs2OL6
 j+cu5hhJ6a19mBggl7Mx2xVlEswmcqikFuWtrR5riQrp4sNKUd4N5kU3ozWzQeHi3mDO0Dgs1
 BqAYxw8gKOGWvjVyv2Tm6lmCbQKszqPeJ+UN17H7tPwfQthRDN3J7AvrE4yTxTWGys4rMWQ+2
 q8jQuKzO7j9SV5N6Ql6TKfquyMap7mDp7XVdt9GuhynEo0dGbRewzNJq9mZHDkMa+YVOV/qke
 N2pJTUTrSBsRz/SgPsc38zn2VdORdVtkzX+VLzmMcryFRxPtCgdQ7fcxm/xfi6Vm85Aflybrr
 fl4Rp29Q4H9y+vxY2Ln66TIiG5thIivf4DoZ5UasflItPXwzo/jNIpayg3vRUmCRSpQSIUHsz
 dkecCPhH+6Cpvn4j+YX1zPxRYkRUoIFmyi+xVo2N/1/eAG+gI+Np5qW7UwhWzS617UjWot0O9
 zE9SDt8h+uxPH1XoFOPXbomrL3Vw80D2poouJZC+Yst68PF83JrQJnknszRlSJsUk9LTcfKZa
 LCZCQGgsrX6OqEUfSBdNKwgupyoO4KuCKaj6uJZRGcAx/UnIeCEUrBDQabMxqUlUWqLkxUKed
 Sy3+hmHl+hMGPZtlh8EeVNHZPPGNCosnpWhntdQ8MoK12XGYDW7XVPDnljZe06+IyLj14bUI6
 tN2pwbI7e7/A3QQpWF9Cj39MLKk3IvcXeZkLtqQhqYAcRRwbtgpCzielOkUfMLmV3ws13BpBR
 IJWnT63vVqd2Wlv3AHn57nw46jZZgrQYTRBk9pZBD4zkDsA/yGJW0EANgV8ujLTH1LeUZkDT7
 wind24/wrO0hH3mphKlwEROLUO13kZS/bQscc0jui8BXPuG1sQqGYuy78destIwcbLdmX2sgU
 Lu1OyDBoTRw61NbduW7dFCnI9/PUVRSH4FcgoC1yHSbb4QFmP/ZCjqup6CC/j8TM4UHyO3ojj
 nk5JSJ6VsWuMHQ2p7tBfUaRtohes8YuwkyyC9J0Hza2eJW6CwLWT4WX79XkXANJDpGlxcHiaf
 4yvoPExq8nc7y+i3Kv/cv8RPSYNm1f39wJ/xjleD/qc4MCfA/jjms9+CynZx9Y5WU+SYpnqzc
 fukuQEtL4CshTLj6hDiDD90vigqQBglzXM2fNo0O7Ta/Jo9QmpyjS40HJay4L4K0h7iX+F1TR
 LQOmOd3bbK6BCUm0iw5FSBZMxHUe4tLDGaG0HDvaJ/XNKSHH6sf/pkLmTbPL99R2t8Jek8UY2
 AxqytixBgKFYhJ37+r2mX/AtJj83BF6JNKeKdt+xNSjZMhJmDVhxRmLd9P/DHHn49JhoqLalM
 xBW77AIxwCayp2gSHBPvjyvMV7W2BIvYClGeM+hP1xiAEE7dF0rGWcOAOC/J+MiWi/OdWVpG+
 VmgXmDpWziBc4HJvMUrQZfYUMAndQj4OFobAeMhSRkGegMJVVyxwqSs0zuAfNM3Fcve7F7H53
 FGJKTyibwTM3a5rAD3xoNluIqP4IC+M6Br56RRL6pFoz485XPuzKk2V4G3d60ZyczWhmOjb1I
 TWV4y9QXgvIGQ8pUWG86/Dh9vjgkXIvSvEL2BzuYtyKxs5h4Sccv6vg1JlmwspM36jYFkEud1
 ir1UaH1ME8Q0t3XN25c8MgU71SEputuG17R+RLC3S513UzaFmcJImMZxxS2kMBp3lisDBcb/4
 KeE7tG72vNxopK+iq4BQBdPUknVfk763iPs9XcU6w63JhWsQkff0H3bbNgKkE9cQU4520bnPu
 wOTMcLoCT+Ffvg++CPSYb+hsFYfKg3V7FCuuI99L8WGPVr6lRu7zOGyGP/qOpfegb7C0WyoGj
 IebImjbznxyJ2S0PV3tOq1L3ibnvEAlmYlllgZxLkVp6oJxFnsAq2F0eAgpfdJyaohcClRUR4
 M2rC1bVDfp6kLXfsPvtjP3mggVvLSUUPfj2qgKXGJUAdamJ0+f/t7p2Fq+7T//i1VmL9eiO83
 n6Z3UocNgN97rNO8QZ4OouqX27DVrDfHBbOm1i6sBHft3+uk2/WDhblUEcyrcFJsVp4T7SZiT
 Oc985a/9We2wuAr53/ozrHF8FmvECf1rKpUEKrHuW2GiqzNiEF0V89IP7yAhx9TvtQUf80G4d
 PDqJAYnw7XM2njsCBP6xh0Wzx6yD54OTUjODb8tCN5ZNhFdoqgywGn1xc8PNXY4ynI8NnZ950
 9iAkaB/+iMSRWB0w+nfIbmr8A8eJANS/dtzwZcHTpQSI7MSjcsSBP8VmaNMQzVFgYsvSiHpLX
 j/0kTaBozTpy9AYlpT+Oza/MCwk40vaszp3+nMi0BK3PEX/D+1BZYLQT7BtBMNBj6JuKjlNoh
 PKg/a4nDou7gjwdgJG8OEDPFpA9y/zung/GYkHQX3WoNKY3SIA+YcwQjBC8f0E0YtrinExOeG
 NweDX3D/Z1mnU1oU07nGbGJ6+3g938tHYd/STTIoWmO1Zrzms+GHijlhC0hQ0gcJw1mdpRKnO
 +MWYjgZHsYtsxGKuMP3NEoDqSVVClG+pv9jWZfcr9OnyzX+FmcfrgenUZN1pgmI0Op7w22uSv
 NGp1pozAzhK8pFEk6/n1QAP7he7eLCjGnc9RqlyTWEyjB222tv3ExiEg=
Subject: [Buildroot] [PATCH v2 4/4] package/systemd: add option to build
 host systemd-measure
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

The host package already installs ukify, systemd-measure is required
if you want ukify to calculate, sign, or show expected PCR values. To
get systemd-measure, the "blkid", "openssl", and "tpm2" features must
be enabled [1].

[1] https://github.com/systemd/systemd/blob/v258.7/src/measure/meson.build

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* rephrase help and commit messages to clarify systemd-measure is not
  only needed to show expected PCR values, but to get them at all (in
  particular, to create signed PCR policies).

 package/systemd/Config.in.host | 17 +++++++++++++++--
 package/systemd/systemd.mk     | 17 ++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
index eff71d0d1c..1356af4173 100644
--- a/package/systemd/Config.in.host
+++ b/package/systemd/Config.in.host
@@ -1,5 +1,18 @@
-# Select this if you need host systemd tools (e.g. systemctl)
 config BR2_PACKAGE_HOST_SYSTEMD
-	bool
+	bool "host systemd"
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_UTIL_LINUX
+	help
+	  Select this if you need host systemd tools (e.g. systemctl)
+
+if BR2_PACKAGE_HOST_SYSTEMD
+
+config BR2_PACKAGE_HOST_SYSTEMD_MEASURE
+	bool "systemd-measure"
+	help
+	  Build host-systemd with the systemd-measure tool. The
+	  host-systemd package installs ukify, systemd-measure is
+	  required if you want ukify to calculate, sign, or show
+	  expected PCR values.
+
+endif # BR2_PACKAGE_HOST_SYSTEMD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3223915d40..290c2f1307 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -902,7 +902,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
-	-Dtpm2=disabled \
 	-Dldconfig=false \
 	-Dresolve=false \
 	-Dbootloader=disabled \
@@ -953,7 +952,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhtml=disabled \
 	-Dsmack=false \
 	-Dpolkit=disabled \
-	-Dblkid=disabled \
 	-Didn=false \
 	-Dadm-group=false \
 	-Dwheel-group=false \
@@ -1000,7 +998,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dlibcurl=disabled \
 	-Dgcrypt=disabled \
 	-Dgnutls=disabled \
-	-Dopenssl=disabled \
 	-Dp11kit=disabled \
 	-Dlibfido2=disabled \
 	-Dpcre2=disabled \
@@ -1018,6 +1015,20 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-python-jinja2 \
 	host-python-pefile
 
+ifeq ($(BR2_PACKAGE_HOST_SYSTEMD_MEASURE),y)
+# host-util-linux (for blkid) is an unconditional dependency
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=enabled \
+	-Dblkid=enabled \
+	-Dopenssl=enabled
+HOST_SYSTEMD_DEPENDENCIES += host-openssl host-tpm2-tss
+else
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=disabled \
+	-Dblkid=disabled \
+	-Dopenssl=disabled
+endif
+
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
 # Fix RPATH After installation
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
