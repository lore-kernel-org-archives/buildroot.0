Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDCFCA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 19:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4766A608CE;
	Fri,  9 Oct 2026 19:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kSvNLdbHD-q; Fri,  9 Oct 2026 19:55:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 890FE608C9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791575722;
	b=NXiqxYkY8p6fuJ8ecVGyDLDWYeuOoOTjvhKG8Cer7Wt6VpHIXHBrzmK6ocQelboHqGP/
	 UAIXJW2F0Gk4mH5MggZpmSIa5qMxD1Cx5/bMc1ChRXKOq362+8IOzChFlW//KxX6UjvWV
	 Yu4AL5pOLcFLT8/zbYVM0ZDZC2wXL0oPwat6WzLvcIvM+5AawZWJsPER3nBglgJKgw63k
	 TzyM73ZcsSWZYm0c0bzZ2Iy1dIvyvkpx8B0RIq/cTYUX3CrC/+CJ2bW6EJkmSOHsS022m
	 pJF+sLQhUT6+Mu9nKsNsJIJNIflKJfULQ4wKdC/l3b5/2BeqtXy7O9ARgsy38nNTO9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791575722;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=o9BG6lJ/S7ieYjyvrvQtFbbLoBlWiwr+czhvmX3Y/So=;
	b=kfgJ05oP79G0bkHLLlIy1ULgD9FARst7DvGBlD6Ib9cUQZaAWbynZLu63GkxuQDku/0G
	 NZnc9hK3RZ3yMyZ9fQ1yUZsNGn5BpNK6TSmZn6ooYiJcYGjEmrAa8TYSm3s/AASAvF0C2
	 YvcDOinWIk7yOY1sr3xTeuypSK7OvBiBKFPOK/j4Yu4NV2Jr+7+Fhfr0ho4/RCCmmCRgn
	 Zx9QKYQcfYS3JMgzlCYnZtpYfUuTrdve0AbnTqT+nXgcxxVMLkq0LjKk4GRmyaVUdm+Jc
	 Mlhld3belBpGG0GJODEXbkKnTFnQRTiTIIHo+sT6aa3jxa9rgPLG4PtkwFI8LM7N81A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791575722;
	bh=o9BG6lJ/S7ieYjyvrvQtFbbLoBlWiwr+czhvmX3Y/So=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U2DscrG7HdNrvJRq9UrqDGbzvYjkvftW721AZ9JD7eR8wHc4zMrHD0EUfQDlckr94
	 pik9Ejbh8sOBOoj7rIamBVn0rc+9yEUToIKUFViFPBBQbnuxETKmDq0eqLqhUHO8kt
	 X/s/J+a/BHlWbPx8Iv20exQMRB5CO2GVzapUG2Cb7FjVa9kxxS8WvagPOz9sa6qgdM
	 2NrtC1UUHjR/WyD3RPNh+uGogldy5s/XLdD8oinuCGJB/j75WxnWO8RU6Ytysmo6jK
	 2A+DFeRFrwQ7e517Tefwloa9BvaxAzdxTaogjYx17s09UOidyp8XrLjgavzNLY9Lmg
	 sZDESGbn9utcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 890FE608C9;
	Fri,  9 Oct 2026 19:55:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27937380
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16DD0815CC
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hXlDb1H5WIp for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 19:55:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C1E088154B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791575704;
 b=faLPiu3uhUFasTC/xj3ZaO+LhmK0OPwoSBmV1Tg6BlvhuYnBDXKtYAAki0jEaEU9hX3G
 kC0XIwOqMbhKQqiDx1GYdQVtScsNci2jQjPBJVzejDrKA9FfPdH06FkuYEE8qcR9LhV03
 QKUmbaoX5asKNG3r9HbrmRFD71kD40CWWHmz7ER+4K63DjIjoBADq0KZcKsuhRqS0D2vf
 lflVFiVDjJO6wk2aGqu6TK4Pk/my/flNpb0gJDnBwSa8zrzOafLpg5b0lIb1M0+WC/FXM
 4NKDqzSwOJbCuafz3gbm1EoJv5kzsTcnB6cieeMYmdJQzqrrvg70MAuwu6s30PFRUGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791575704;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=n56NzsARVr9fvnMP65ECXP3Bfh7WhVnMe/ZD84y58k8=;
 b=DlTSdz8kCK1R4bE+UwIj8PRDfgxardPJfiLDrfZt/37PVsPRA0zWMG72pg5pVR/TlzJJ
 E8ySzq3fbtJNC7+F48eK1LH1FaMobJ7HPgYRS26mtApGvkuCrggcHafLAnLGVI1MnCpiy
 +ciUHANnXJbZ7DpMMe0Wsl75BqnRhr6Kw4Bxe97xH5T+zql/SZ67Jm4XocE5zavfYPHnl
 fM+oJ79T2AkyEvsG3pTvy3Xe8ikoGKPMuzkoXKGaI5kdKTynUpftu4IJmTnwFdyKVRGYf
 XW8xBk47oYl/chasa3Pnv+/Ua64Oe/no2x+PxAbx0QwO6rPt7iMjdTp2xsALZjO3vHA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZLASSqmO; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1E088154B
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:55:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C5123780371;
 Fri,  9 Oct 2026 21:55:00 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:53850])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Oct 2026 21:55:00 +0200
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 21:55:00 +0200
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261008214609.721718-1-mr.zoltan.gyarmati@gmail.com>
References: <20261008214609.721718-1-mr.zoltan.gyarmati@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <532a422004be32d34da5fff1801c0299@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/shapelib: bump to 1.6.3
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

On 08/10/2026 23:46, Zoltan Gyarmati wrote:
> Also removing the gcc-15 bool keyword patch as it's already in this
> release
> 
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
