Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66012C021A9
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3660A81E02;
	Sat, 14 Sep 2024 18:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwjvIlKv_Wjp; Sat, 14 Sep 2024 18:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D2B381E41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D2B381E41;
	Sat, 14 Sep 2024 18:39:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EDAC1BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ABB2400D1
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11KrQ2hZKPix for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:38:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B31FF400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B31FF400B8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B31FF400B8
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:38:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EA5CFF802;
 Sat, 14 Sep 2024 18:38:53 +0000 (UTC)
Date: Sat, 14 Sep 2024 20:38:51 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20240914203851.7c7323d6@windsurf>
In-Reply-To: <87a5gwuexb.fsf@tarshish>
References: <Zs+99wYrw042nBi/@waldemar-brodkorb.de> <87a5gwuexb.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726339135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8JpfoA/AILvZrQ026m7u0iA/5KTvcDu7HIB10IYREM=;
 b=Tk18xMbPGvjB7Lgg5dREX+/6zrr8m1ojPHid73AwkUbHWKJDNnrd5sFLQa3pAKq7HB7+0o
 XRhUIPPWudLXvbORuIdHPjV1OhRixTW9WOUdls+z6I0fqgO7xVFkT5mHvjZXLr29TOUP8D
 KK0nGuM3xz1PnGv+q10z/9N3N27BCWEPIijbBCb2T9ssveS0pRb0gSIvtppH1lcJFpTvCl
 ItpEuQ3g/E4/atf1lgzn7DKHIfDo8HQl5Jbo5XdxavKbjnuHMrEGlVGlaq0twWRAj+ll+h
 6gIF8d3aIjHHX/frzadbOVyD7Vo+Ow/MyUlCrNPY/lXL8SvkxkMBG+A/EEkSpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tk18xMbP
Subject: Re: [Buildroot] [PATCH next] package/zabbix: update to 7.0.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hello Baruch,

On Thu, 29 Aug 2024 07:32:48 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Try
> 
>   select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

Yes when openssl is selected, but here it's an optional dependency.
I've not seen other packages where we do:

select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if BR2_PACKAGE_OPENSSL

so instead, I've used

ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)

in zabbix.mk to decide whether to enable OpenSSL support or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
