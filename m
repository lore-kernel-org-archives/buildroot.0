Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB551CA6004
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9684440670;
	Tue,  6 Oct 2026 16:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQjBb-v8pSlG; Tue,  6 Oct 2026 16:31:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A97DD40692
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304298;
	b=Poqo8Cq4q6vGJfsg2EZDN5c3J/1FvrNQyDF1PMqlkBDXz1rEfzkqbdlyX8pJr9uGLTUw
	 dANbeQBRMntv9cGpBnvtAI+iTWunIlA16//2/baMZNInin1HpFPxAehuenSoeSsSSfGOi
	 4CwX1t+No36vKt9MputEMTaZBHvYc5UB5WioIF+hiaQAI4l2VXFZ/EgVIPPAvWlbYa9Gc
	 mF88eeyR+hjSJaLYJX+YsmC+G3AD1oAswN+egCWFubXAymyO1jSA+6WhG3oyYhS3zkZcS
	 si0G3vCRgwxVCwS198eNh0nnQbnvC3NLXtTjJKnsP1UcwJLjOZfewukJ7g1hJN9BdVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	b=XT5jCIvIRqa4IBsKvB4Z8UoIj8D6s0uhki1AXU8jBO9udPwnJGMsuZsrym3d1cu7TQcF
	 fQk1mZ2PR27LFGCDTK0/Wib400yY1ev2qSM+y3sMfFDsP9Ce9E+0LTX/i98T9pFbE1DSM
	 CF0O3zvzyOY/xfLs7c5Mkp2cx11yx0wR3b4oKWOX/CRkbHO7vuJSBg6gMEC8qXj35yZun
	 iilXo5HQRhks3A2bg+AR2cyi1w7FLZHq7pG+4qKoEb0lyJSm02ZEJ3KLqinOuX2hmcMGo
	 pm7a9Y8VHu21PHnA3BoEHTdTolmoafdTcsNpvVz2T/48i0K6KLYfWZbptUGUHQJ4oeA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304298;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pFrILu2MzBXl0pCo0q4zZnUdQFucWNmmLIIRp9kskhe8oa0rZ9uClAPe00XbREpRT
	 kqasYkliG0uWCSOcDiHYb+sWdCqC3rY9y94F9+ODaJsmcccykezaBFR9Np4T4gTtd/
	 HQGG02ervTRBk+HJr0GL1XarQdkIftUrOKNxio4yd01+vnkrlZG6LQ+V6UykIDTHea
	 +Kyx+Z1GjA5pvqRXhhxneqAWeePuEZwubdcYohapGJYdBCUDMMAnP0K5yaILoFxO9r
	 PKpZ34YK13/yqC+mIuIsERikD9xfyDH1c1nSMWS+JgpRKPha808wmrcnGZbOl8EewS
	 cmLkolmiAWBXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A97DD40692;
	Tue,  6 Oct 2026 16:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 999BF341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 801EF40274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tt5dyEoDS328 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:29:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 88C864009F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304188;
 b=MwxRDe7NpGc1063J+70KSSb0XcfQW57DsYx9Pf/W7GLplhrHJGsEiA59wEEGVYINqSLt
 PZ9O9H0xZI9nGzdcRx9Lt5wpQNVzGTfO+kQlBzOyNTK2CTkk9HosFE2s3Joi0ubQnUVeN
 5Ptu7bOxSK1Jqh2WVaDVLwJIbiLcMlGwck6TdvWKSaum3BPBSgDOWr2jVGbsqr/vyfI6H
 oWWCjVA1mzgBbL+mVrMrKVzQ/grTbol/Wv9kEmQyaUVp5QZr9zcfARIx+PFDaCS1Hkiim
 uIMZGhVyLQ69L+P/qPQkpFJbWy3pGSM+TOaa/GGmz5yVAoCwDz+0thqrjeb2HmUEoyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304188;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=396Yd0cDXtHL5UJquEEANIDjZ5YaL973TXF94IgAf08=;
 b=sAIoBaRes1rzE8OlsrMKceYcPYjIvPXXinJ2iLKQbkSUE59MN40d0KgAOITYj1J0S06k
 lJ2P7Ei8HGvmPoNnr+W7qo4fwVj163swR4YGSLApb0QcpGb1xHw6GrNfMoK5v/eEyalqB
 uXDoWqkLeKHKKtk29rWy+lDWtnfcEC+jDFLiEUyEXh9h7l2SPYEzyFQ7L2CJY1XNYCLDt
 CtBptp1OM+WpSmZTKLr5E1k+Te5vOdmgjIqWnXY3+GL2y0ykPpXeBr9A+yU6+4YxHOd9E
 ADZHvTJCW4L6uhqaITW8TcgE1UpGbewtCFUoxq34AFKGE4lAkzEBY2va8/RTHUkscfw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W98joFvr; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88C864009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7059D2003C6;
 Tue,  6 Oct 2026 18:29:45 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:41332])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 18:29:45 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:29:45 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004201853.915471-5-james.hilliard1@gmail.com>
References: <20261004201853.915471-5-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <95085aad3901b56e257fbde001af8fd3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version
 2026.5
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

On 04/10/2026 22:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
