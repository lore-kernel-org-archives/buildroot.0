Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C273DC88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 10:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72F8780DCC;
	Sat, 12 Sep 2026 10:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81sJxSNnfRqt; Sat, 12 Sep 2026 10:50:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9060180E76
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789210208;
	b=kra+giQCLatqwar0eBM2JXdXRaT+HFHMhZQ2rmMUx9oMcuhc3lWSdyr4v6hrKgFZQRpR
	 qfyIXpgQSg1+yPqe398qRRyDpW9HjE9nkZoN4B+B4OAaFY+s9ErVtjK6Iqmt2UL6H4qgi
	 SydA3BG3yoRQS6zI3Zp7zUiefn6kd13ejIhTWE2cOUJVjakaOYfNq+uJZkRnNnl8whbxc
	 BdNvpbJ+72Ltmn+nyUImlT6LkYhZ7adzidjXph/IDx+aq9AMyD1x8o8MGo3+Jw1oUKVqt
	 jYYq6c2FDJXdZ5QxM5XXaJlbJJ+vnfEhy9gcSIW+NWdq2NBX8dJcm4MdpEu1j4yb7+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789210208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8mAiLo42LMHMG7U0CEVp4C5kgwoix+ouIqhzTSXsIKM=;
	b=jCurzMN2WFWb1xl0+ebDONorGFTbtJhG5NgTKqkSGqZ7YZjfofxMC0JjWPaXh9lP1F6d
	 yOVzduRZJxzR6W14DDu3MeHh1Nic/A1ScU0CB0NF6fqEtQz8IRp8ZGpRcQGIL0g2md+21
	 F4t3EoBNK0Y1h/FeXAb0EH70GKm1s5NSnGDaLDMKzwzLwiSoE+oKus1zn79W+HumEAkMV
	 3qGf/1LX+vJsTYYrm/VFtLYmMBRsKameITPcp/BcDMnaI9D/eNHVulHdq6AyvghA/dIct
	 BJUo9D5/6Rx6ND28g76l446TtGj6GIfNrCxTF2pBzbaGURRMV3l6w1Qb/5iSQppA73Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789210208;
	bh=8mAiLo42LMHMG7U0CEVp4C5kgwoix+ouIqhzTSXsIKM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MJvnzr3Zb2Wfk1DUlaP8iOvk5th/WBke0TQOa0quzHNO4Y5WofCJKSaAVURZDs+8z
	 S9e1KBO6orgLxTKIwcx5eWK+Nug+8d5hoiymilOCF1cri7wPzWVVl3ec3qoA1LDpq2
	 lz8aFNnLzLNGM3P2XYKZM8EPgiPA/Yx35ACPtnAaoUkxYiPGrK1vhNPD74642y8aAu
	 nZo6JzHP0EQNx7b8Z5OBlRQwlT2aUxL1peIqbm9caMChuxPFmc4i16CeCaViFvD6zU
	 GooY8KphNx4/LNtHScI9QBqUbVAyVcNfxzpyAsLCLGMOuA/7Z8nAhyH9Bu11YuKyBX
	 7TnhfKvE6t33w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9060180E76;
	Sat, 12 Sep 2026 10:50:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62B642D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F0ED80E76
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDVjUcDb8djm for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 10:50:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E369C80DCC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789210206;
 b=J0J5I7Eq0IBYs68U7e4R1EMf+x1WukygoQFtmHGA3Uf8mYf/pXBIOX9kcLU+D/hGu4dG
 XFkz8+8m802i9AHQH2OhGZf5b+qfdgeluw93KzMCgf9alWb3hnxh8Rh75zrRhFq5rgqxd
 3wpviJgkkvrYwEQeIz+ePU9YQFIEiT+K1SKpCNBNuX2zQM1P42YBpUCthfSGrNK6yG0By
 9SyuXpEAD6a9JZk0I75V37vW84dObWr3Jlzl9qJPR8rmjfj4jWiWKxfjDYT4qKayD0RKL
 /cn+Q6oBMQN8qy87pYq+yQ7gRra6hyaibZrtM1X6Ew1s48s6StaCwgVkRtHsAO5NGzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789210206;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=HQ2EBwGCSM3CuNFZzC3CGn468vI+prVdnbIWPHVOFhM=;
 b=gIItCgkBGzactmKSMs9hg1HTXrWXMDiRh38R2qlpbAYkDy3zVv2dPnoKlFeg6FHUTikG
 2xvRm5olYS+kJJJDB1329D4VZb3Jk+dwUDJIDofo6blfHVUoq4dPi/WrIIazGNTtjFmGx
 LGVOX+8ztRETKiz6VDDtVbe/ShdN5K2B0KbLxR6YGrM8kCWAo5RUp9AdF7jjlI8SVwGAE
 8rvsmOI1PRJtTPZOYKWvICKTpFc9sATmiV05tLOBnwq6tH6aza05EyMO8YsEVIG+RyjTa
 KDt9yQaqo1q9sUrHFSfaTmkMAl4VtkzmD+Xh5ID7Nl91KYLcWCVHQQaLBs0EhGWOLUg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hpsLY+5x; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E369C80DCC
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:50:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4F2CC19F72F;
 Sat, 12 Sep 2026 12:50:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 12:50:00 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 12:50:00 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
In-Reply-To: <20260903072446.554946-1-buildroot@heine.tech>
References: <20260903072446.554946-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.19
Message-ID: <79d8a9cb5c46ba1c7918216ac84cc650@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 36.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/09/2026 09:24, Michael Nosthoff via buildroot wrote:
> changelog:
> https://github.com/protocolbuffers/protobuf/releases/tag/v36.1
> https://github.com/protocolbuffers/protobuf/releases/tag/v36.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
