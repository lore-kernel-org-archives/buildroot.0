Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72609CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 05:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F72140534;
	Tue,  6 Oct 2026 05:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJVxNqFCDwtw; Tue,  6 Oct 2026 05:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 334FB40536
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791266211;
	b=MVoWh8K/GKuB2REAsOka6uYiCbAzggJlL29cP+Atgg2YMxZukYeq1S8L9pmxSpoG/NvI
	 ic7t6QORnRj1x+wy0ImVKFLQFKPAvCHWP72Sh2ybWJal06ExvRrgRdoTBBAFGDIGgxjMd
	 yKWoI1s5G6WVV6Ww10kRlYHjDtcbxMwQe9S6SEAGEjznjl4sqQtdBCJyy+LrIAGsR9ts0
	 T5m96fPIW1gXVTy+iPq31jqQ/eSruJAQc5FBcqwe2fYMYwXUPAheBTF8vPTFG+/570xJM
	 5g0ljGzH1Yq307eSLrWruHHYuhz8a+id8f9dCvBxDQHtROYdGzKgLJUVlcXfWHE8BwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791266211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:From:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Date:To:CC:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=u7NeG4YJzVKUFbLGVpPp0VKNzRt/wbvPLltzsQDXojM=;
	b=YHhdqZfxRVAjrWljFLn4fbW2+uySh2EHffi/rDO2pKUVUMwfDP00SVh35Y1GKva9RjZf
	 PgBknkgFK3PWhB9rLxhL1ZdFrfy7a6vL3bD+3cpvMFuO15cQm8okPDpTpGsKJnSpTuUC4
	 QlpcVsTLGtHYj05Vuaq5TBLGv7vOAsegOXM8iR1zHhGZIPndfDOIA0HwbJmLhg0Wb2SR4
	 bXUTwrhoUmI8eCLcV9vNcy4NG5Oe89ychhqyxzB/rD6SvtvHdFzmAQbS1GOMgvxF+D0Pa
	 3JZWBAxlFZjIVWTBa5PDgS4bp+vqXQbfryrxhW0EjPWLqQqhSA237BYPAM+UsgBjPHQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791266211;
	bh=u7NeG4YJzVKUFbLGVpPp0VKNzRt/wbvPLltzsQDXojM=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rA3Z0A94WALAu75xFgD/xVGF50S074iYrc97Vt8gnXY08VQPFhJT4mlx5/u8uiitW
	 AgKf1ETxQgfSTg/YedeI9mdqhhbkzDFCQDPFF1qnh6C36zLfiSNVK6NDsC0pYw9Q3p
	 VCiFESF6Bg5yvFSygUL73q38+HqdcBYViYXczqD5O/WnFgUBngNOzlxocMf740+g4b
	 lHxR5sTCD+9d1ukwUKRQT/u1z8EBlvCaOodP2NHgy76kaDg12rVlMO2lOtF5QnAX7g
	 0XHVQrAqm1UAMpJKBtjw1ALumLfuFuFIPu49LqhC0XrzL0sEj3x+h2Wuc9rBBZlezu
	 PWeHMygGCdm1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334FB40536;
	Tue,  6 Oct 2026 05:56:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94A6034E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 05:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9266E400D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 05:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id An2jWyxqthkV for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 05:18:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4C4FE4009D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=80.12.126.238
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791263906;
 b=JuQLZOMtMG/53hNOSQwbRGSHZAA57CGAmYjdV0nDHD6a6Er6oRQUJX3CjWYKHKFgChmM
 4MJracJNXUlOMpOATRAEdQD8XqTnPkzXRIn2igFsNm0xaLjS1gAVqSZfBi3OwapFnTX57
 052osubt3UEQibjDFcI/sDNiBdM3lxVcaHeHFHNr9qnBrIWcxor+OVHcYVydoOoSDTFW9
 XA4jI332+0wDU/aVoEjqqhK0i/NsHSdtC7WpOHLZjHIX95cwVeyyqC6k503JZ4/A2UZhM
 qQqKeSGtzNiHVDs9aQA91rQjvw21O4onxjT8d+lVHXBNR9Nov9tE0E2qojVIEBTpsTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791263906;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:From:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:Date:To:CC:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
 Content-Transfer-Encoding;
 bh=jUxc+5KZePn9HGwDMfAn7xrD+5oQ2blu7/+vBDmIB20=;
 b=XjXu+KNXagRFNGsDX58pl/oBrFszl/gq8/M8565RQGotnbp4R0kRWpOp+iNYvWw5MkeO
 AjClLQ3UD5yI0Kd7J5HrWrt1UjZmmAqi/MFvp+veDDVOlxKD/ARannngc5hZkOjc4p9dM
 q6WHFS/LB2DwVeGu6ZRjIlC9hml10A58pe7ipt1lKIQv+3nZ9jbq582GDG0r87SdnWI9n
 R+2N0ZlhOXggc5+bGVLhtjuxPqFlT6LIhyaxT8gl8JbpFpQLmIZbpCbVu75tX8W1PpnsI
 srA3xJRweOdUUL6YFo3nHl91mUCXqlOLnlEY+rVux1esG17leGuw4qo33HnZ2qOcVyA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=bZhnUzja; 
 arc=none smtp.remote-ip=80.12.126.238
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=bZhnUzja
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C4FE4009D
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 05:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1791263905; x=1822799905;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=jUxc+5KZePn9HGwDMfAn7xrD+5oQ2blu7/+vBDmIB20=;
 b=bZhnUzjaXhmEaMcX6bD0JyimfX8uD3pWL6JeivFAA2hHgxMzHOQUxG7x
 N5SfmNkvpnu3cXesvT73gD2XY+/ZK8r59lCQrZU8wot5EcuDPhZSUwVyq
 gRb5IZZKm9IfNvlaE5c/Cl4rAvwSOdRw72P5gB7rTmSZMW/xa+eXKWI01
 kQFMV45ZAv6Kh7k4sQuS52a4LihTAggqvOEgB0fuufr8rFmPzkOlPX2E/
 iRjWFEDbXEDz5axss4rmHteheu5WXHgPQ7TltPZjofRUTq9QopS0LDv2v
 Lza6a880DXdX4WhF72sEptXtKXmTM4zFPstDwjQTqB0iFQW9apdGWRryb Q==;
X-CSE-ConnectionGUID: IiZH3LIsTfexOrJRZF0b3Q==
X-CSE-MsgGUID: MiXGInGAQx+0rQDQ2icRSg==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 06 Oct 2026 07:18:22 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 07:18:21 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Tue, 6 Oct 2026 07:18:20 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 06 Oct 2026 07:18:19 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: fc2W0c1zRoWIbjZOWEWqeA==
X-CSE-MsgGUID: DIp9nax9SuWS+yTYxlXKRg==
X-IronPort-AV: E=Sophos;i="6.27,143,1787004000"; d="scan'208";a="484847002"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Tue, 6 Oct 2026 07:18:19 +0200
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <asSEm-AbL_83omFH@yd-6wlzhs3>
References: <245d803e1ed4a6146dbd00789edc02d982bd6329.1791178950.git.yann.morin@orange.com>
 <c17edf604de1363f28dbbdd62ea5e3f0@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c17edf604de1363f28dbbdd62ea5e3f0@free.fr>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [PATCH] package/gpsd: backport security fixes for
 CVE-2026-58459
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

Julien, All,

On 2026-10-05 17:45 +0200, Julien Olivain spake thusly:
> On 05/10/2026 07:42, yann.morin@orange.com wrote:
[--SNIP--]
> The command "utils/docker-run make check-package" reports 7 warnings
> with this patch.

Dang, that really looks like what I could have written myself a few
years back... ;-)

Thanks, v2 in the pipe!

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
