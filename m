Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45A2CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65E128146D;
	Sat, 10 Oct 2026 08:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RT8M2PhsvQTu; Sat, 10 Oct 2026 08:34:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AA573813F6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621279;
	b=P+W5eRR9mZHC/h5yaqeqjBwHLtD95e6eqJu38hWKXywC5X7DL5rCi9o1iU0+48HOKQqB
	 ioED6aEYOyNQjrVZLF9VTq3poX4sZyY5CbA7Ag63mZRDE1PptMpj3JtcgH5IyfPBp5tcq
	 cDOx65jnwexVMt+cmpP+OBEsPmmVuRz/WjXRLk98S8bEwVRQh3gPx9zq4Ubbx7GiVWbxM
	 +LG+TAamBKB31V/hACgPVqveQ6vbVTrruS8p0FSydeRS7ao9UmYtPxOXgfSpL1rQVBkk2
	 QnMfgfegakAcM+i7ZOuwWX2FfrKylAvHY2MMK2Rfsck5+0D79bX59s2Rfla/FVoIG4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=l69MlctnCFjPIHAoK8iccvY3C4jQiWiKmi/mMpuYBpo=;
	b=qbnQ7T+60K3poSM41mp1f68iVQz+4e7UkSIfAn/Y5YvT8Z6Aw/BvYZlIN/mFUgg88I43
	 0cMWl47axHxvewbWIPoSRrR7Ks2n6EbxVaHWZa/NaIDXL4aPNg9bwNoKLtToMkzSVcw47
	 QTBPKNf1oNBDZy2dlhMkVRIN2p252zR7s3QjhPnJwgbWEjoMUYar7ISYbl4fap7proRu1
	 o6fsVZYnYkWGvTqjUNnHcGjgZAuo7wrDYrxe8174rvnrfqQ3dxOPS7NS8kigoV+IqwK/k
	 XZGNKudv0Kpk2RgNfQjUZry4+M/7w+/I+Su/YYMd8HLJdqZ4/IDiGgRqtk3J+2KbeIg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621279;
	bh=l69MlctnCFjPIHAoK8iccvY3C4jQiWiKmi/mMpuYBpo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pHavzC5XSLociz1YvtGo7rqfNRy0MKs2smhDCfChL5O2fV5nT2E/aL/H8n/WhNU0p
	 GtpCwCS40Imqta4mNvV9CU7h+KKj5OMnu/VHjm7LZeHn6+J9RnB54OOe5qK8S+rDFW
	 01ddM4RjlFD8SS57Drlv1xfwLI3KZD2bJtB1kq6z/Va8CBTkSfVVCtBL0Ju8p75pE5
	 Ocx8WcveRU+gn1/6Eh9eUpu/m1c+ZGcCtv/abheF40zBLW+9Px2TSBbMVeNuHMANGt
	 6UZXknUauEj7XgwiJ/TLCcxQYj58I6XjOC9zzBnICNY/tmyFzF1GMKKYUkXSDy5IDj
	 vqrkeTn39P+Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA573813F6;
	Sat, 10 Oct 2026 08:34:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77B7F111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DBF960670
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7bCjUXO5Txc for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:34:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7BE636066F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621277;
 b=j/ysSRaCivkwuM2XVrTE9Q02V/P5Q3HEFQqhmWSHvtlVbm7U9H3GKBXkK9z2MqbpGKh6
 0xW8/xZrY71TgPReZk+7TbW7fq0D0efgbqW28fp+hOYUyyHgi8+lKt1iEdwE+v5aZR8OD
 XKZCINQdx0xtHq1TBv2CyKNt4+vab4AOVvqmm+LUSRHrm62lnZjPow3sYm5D2UN+xZy93
 didX32JA7FljWWfSwMX1FI5m3+U5g9dhxa2iGfGNuV8kFk1ocVrnHuNspnrl1xVI5ttGU
 T+r4pQAMaEMvGP2UuiTC9R0iY45D29GTYeownZqkkpeyC/640lnFZ6GavMSKZllc8bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621277;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=AoNmSIxxQPY5I7Dm4eLe93Dl7gjwo+z1ws1QbZFDkE0=;
 b=hDD30e2c0mXTIWfDA4Yz4Oo8ELWE73yE9hyqyuf36BFaFlO/puWO6WcK8M0BvucfJeUN
 Bl2iqRmgJxcCYc74DAw9VxBftECiLYIbJZ6mk8iLf02nKM7vM7oAfxjRLpKUft3VaphiP
 uVW71U4gr5GUOllkyWVSiGmz1XSG2KThXFp7KLpptjS1chS8WIfBCPtUlNXAbwpYXJAa2
 2OR9QRMHvlCzHysjl3CbxIXM/1uQnR2qR5RaaunDyM/uocD0FRnjyjEaVMxf28G+0NPVB
 LRkMd6cokFyqjG5YgxJAR8EnzzDfIlW3ohyuoEcICSU1M3nFXWs+sYy7G09RmDE96xA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DHWM+Blr; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BE636066F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:34:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EFBE14E411BB;
 Sat, 10 Oct 2026 08:34:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BEF2B6075C;
 Sat, 10 Oct 2026 08:34:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5720911D70211; 
 Sat, 10 Oct 2026 10:34:33 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:34:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, David GOUARIN <dgouarin@gmail.com>
Message-ID: <asn4lB2spMFq7RZh@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-31-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-31-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 30/84] package/freeradius-server: Add
 support for OpenSSL 4.0.0
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

On Tue, Oct 06, 2026 at 06:20:11PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: David GOUARIN <dgouarin@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
