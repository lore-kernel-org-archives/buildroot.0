Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211D3CA5FFC
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 16:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D27E605B0;
	Wed,  7 Oct 2026 16:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KckIlS1VEdPq; Wed,  7 Oct 2026 16:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 79CF0606A6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791390134;
	b=m6iAhIJ+8xD5kLezPOpHPBAkRPlYd65/zcF+AcbbioZFjClTENiosScdt0TYQzMnxsRi
	 93mxWn91G9WGM2AIH5JkiOnwXZ79kLRXQ3dR0vKeyuW6cjZMNbtfhFNzNPn5TkneJzK1N
	 zvt/bUke6WLsmBueQGNahKfMzp3Ux3iiFKEOs+q+hIXMJdcFRYrDTkH/XrsgQqi4FM0Ea
	 kQCSoB2D2sy3Wi+mXdT1tSnq6WpuP/o2GqdexhoHQYPAmgXYHFOStRPXi+Z8Wf9SzELCH
	 RR9zcGeZmCSP3oJUpQfLN634YP18xGFGxQrBpLIwHHh/QicE/2ogbASLWDlssFe/BJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791390134;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5FWwt7W6z8PW2vFOQhR2xy+t7+6X+ufnX+iDN4f3Llg=;
	b=R2gqGmF0Eo1aWZmkwwlCQ3qf75rmIFkHtWRVgVWBPJVPePyv2CG9XQs+aR5THlueWppC
	 yzFpqq627Lk1GIaVt2C6EHQW2UYvBxsp5c85nsEorY8pg/olyNv1rJ83dumOHQNPBdzxd
	 chEqlwuxJcYCwTXgWWB0xkwEsUh3nJix/OCY+XY2/pUSR3zBEHwgBR4MZuAcRLLIqOesN
	 +D8V3kYNny6wWNkiA1MAEdy96Fk6+qv31uWIz6H0ro7KGNKdlYKOa917XRlt6KkxEcMOM
	 YNUNcPyYPz9SRsDzTQ8ZGVj/4egUNsTCTPDX1wG2fv5OVNj3BYw6x4ET5CAYeJ/t2bA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791390134;
	bh=5FWwt7W6z8PW2vFOQhR2xy+t7+6X+ufnX+iDN4f3Llg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3uKIiekvJoyDkWVGKEbSEtGoJw7t8rpTwpSr/W0TH87jP9LoG3xEuek6GkYOUGzO
	 x415/sgs8Oj1DoliPMIaiR6tRxcxCOKOF4k+YJXqD0PhWkYRfLa6eKpQg+jn3c5jNC
	 yOSVlV7UqAkt7uTePo6A953mueWOfgN1dHIEvpCWyMjpBvSBUftVaqd1oceb2krlKX
	 ZLYkuSfdVg/45FCZpMb+cK0CjkcKm94uhUankdubskj7hFSxn65MKRksllnBsuotKO
	 QUxhENO85o/Wyl8gerk27GWPQZw+ZtaVilAlRWsOZpMp/mvpGHmtzOmMP4vgyfSjvf
	 cdbZpUW7h6sig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79CF0606A6;
	Wed,  7 Oct 2026 16:22:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17E5A32F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0981C80ECD
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iz7INi7_NubR for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 15:34:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 40D0D80A53
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791387275;
 b=lOVSBUcUE1HVIdEUeQyjmJ3jtCjLpQEFFF91SrlRi07WzdLW66VS45q9fRTDIM0ez/VK
 L3tWQJyjsiYuCawD/Froc5KsUFjvxlkr8nfXldUNiQ3aUujY9MwgO3BrtQNQvroJ7w6f+
 nIj8JiLMpWlzaezOZhfTY13hjLkw6iJD24nKJnEAInIaD5MIk3uGN3nmQO/KS55ZGvnWh
 nJT+QGN5bhAQec4hWu0YKF/0ns/Md9IMFlTYdfz4W64+RWFVGNbLealzpyosW8yW1eVqK
 MtSmx1u4HIbnKUH13fD/EfCOJkDuwD0aANigKe4540VL9l7xsi7SLDv5HSOyqrzvazA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791387275;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=KeCemcWmkB4bQd7H4LuPjhST6aOtrWvCL3n6mEC2Oq8=;
 b=DWHfsktwZdlgUt3t1xTxPbAwRL4CC2OZMS5wqPkIwKpbqdBaqUmwSrSzugSI3qT12M+l
 rSHlAHEmcN4CNTaym9I6wdAv2uOWknVq3UlD70o40q5IqivBGrzh8oEGxBtHKMpCxeeEW
 s+qNpp73kUPA48FY2pdNXZJZy0MvtsQ09sieaxDqySDtET0knn9vU90mB5IOlO21LYQMm
 In0AOoQ1jRS/9s8jjwAR+7petimi9KPWfUmvPgi8baaZsk9dmCNDBaV2pNF8Poya8PKbq
 HMDyBto7w6UdjJwOSx1Mdhygf7zG9+l3BT5lzMJeGh2scK0FOZJof4F0eeWMOlmnBOw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=FKNVP+jf; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=FKNVP+jf
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40D0D80A53
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:34:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=FKNVP+jf2W44VrDH1HG6SVaCLchAxz12b4655zyO0v6NPql/8iD+32XrOtyNWymdn/eUivgSwtZNVr7igzYXVlx+n2rnYw752jOwiUCbpc2lQHjYpUCFW6IIxMkIKgMT0E3A6OCawqpg3sm7ufh9T0Cklne3TbOD2GRk99Tg7XpC5pmPdPS/bIjx6wpIFXPl7qNkqU7s0H3V0o7LiH7vf1OP+3PkASWWUimVRaQz83iFO93KIRuwQzq9VywB/1dU95bV/0XwVn/PWiwqbubWojwWri7CgD2YgD/juzgx2WpwGkR8oE0QlFJznFc3YHUAXN2/HxHezppGyrGpYnV1xQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Kmz+hOngAUUbpHdxhXJdIXUjBaPYR+6mGlUq6irGqOo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1009908672; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 15:34:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xETf2-0000000F8hv-0zbi;
 Wed, 07 Oct 2026 17:34:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org,  =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20261003232911.749403-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sat, 3 Oct 2026 17:29:10 -0600")
References: <20261003232911.749403-1-james.hilliard1@gmail.com>
Date: Wed, 07 Oct 2026 17:34:28 +0200
Message-ID: <87o6d5le2j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/python-botocore: bump to
 version 1.43.108
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
