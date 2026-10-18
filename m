Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167A6CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D78F160659;
	Sun, 18 Oct 2026 14:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niXAaWr85Hle; Sun, 18 Oct 2026 14:27:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0179B60601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333628;
	b=M1KqwTR3Es62YkXGI/AY91nct8za7oShXJfmb/9uLADr5cFyf3BKv0lxX08MSlFpkwJ+
	 B6GwDIiU2T+8XHC1MZdU72mNktpoEvIHdseDX4DGJqQsiO43hIovv+hDr91/Gn23RhFWL
	 2xSc1dI3GONevdOi8JUzAvSxwLYSPcMmJE6kWrimq1TDg025+FsnT8v07g1GBK0tlPWvz
	 YEB0H6mKlw9TQ10w7dAkwveCzheuAmt/jhVdBsbsBTUr9fPMj/OKfbUu91q+q/EicJXqQ
	 mDnZ6R/ODe/QrSuC9C6aJvrb9il8XHkAv2W8V5nd9cWX4b/GCarvhjyJV+d1092WUNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333628;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=L4dQs+174ZLKLQPi8wKIx6odXkCIZXq81pyOObEA1vZ0tOHwNgIYHhpe4Nyx+3enzvh7
	 ydG/DjYt7iJzHDZ5BwQL7COopOvZwSNY2m9FFgQYah5HxE+NaKfKR/stsgfw7ZbLVIDOK
	 EipNuLrO88O1Sc/luqmLc2qAEoUUL7mZvap93rZOO9fgsoFT4AeiOGtoBc7pjwbQq+CSL
	 j2pwk+9d0zR3nXR5vb9yr+iQ5+mg/cllYV/VW6za1DtZBl22MLCiDqjMaL8VqXACmDjEo
	 fOylU9VXu5dQ52nAOEg6C7urgo47JIH9VTl/v5Ubp0gKoHvAKo8NlOfzRFarvLZN+oA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333628;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i1xfZVqJ+BKzepsEz3NCJtypv+MZ3+bCyxiW8e14yKwkv/zfGNP/CZjpavAn4/IWe
	 wNBL4fiQ2mGWqCkf0CpVHbKvh04JEYLd4eK5x1G8LGqB0O0gfuX9Q2rMOt9agLi3rn
	 bVFzkdsEspR3lrY98XbAHPAbpHQNZAULMGkJ0HH87cYuHN3ztuqkyTLnAe81KSCwTI
	 Jo5rxIqjw/7Y5VwfNU/Qg5oR2FW6NYBf17vYRtnZWfRJlgWdrGBeNF91TvKbiXe//5
	 s3+Xs9mbQedpq+0ZsmPWcJFyVW7aKO9MHg6w09U68fJVyDPwjJioXdpbU90hg1iLhT
	 ED9s2h2e8xSiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0179B60601;
	Sun, 18 Oct 2026 14:27:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3291A2A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 192454075C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhP0yMLuBViv for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:27:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 77A8040758
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333625;
 b=JHuOW2iyXjK2C3wbvOMehzc0VUnoQKZxm5kBNHMUCMavfdgBFFt2vQ3rAFPE4Lc/XSL+
 Vkac2kVxdKpwUJn2qvXeVTZ6aYAZhAWOPjZWOZ3NYBzSX9KysPJIiPEB6bx9ccUZSCwab
 Zk3zOE/cz54bvTy60bSTcj+u13duSbjX20iaphgFPbHxS5uYnjzrkmbGzE4C0Y2k46Pf4
 mB6ruzek5gS4u2qYA44BKrUpr6nZuzzMTAiaCAVqiZndG/SepfzAVTwrXNhX2CyI6eDL+
 d4WXUzF0sdR2zsERKnhnqAELIgNHF7kl9bpc5yqRa35qVISrso7pRH1kKcyAzhdbCjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333625;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=gVynWFoux8W7czza8L4zSYTPHjGSHlV1PqkAevWnOKwnU3plMKUb+Ywa15lohABmFgmF
 wl/ZZ2Nu9u1iI7e0SrV852S1VwWLGCoZynFf9IojFGdqFdg+J2dp5XjdypsEYngSDrJh3
 lWrRmN56IwGhcZbq1b+YmBNFdzrPXxIZYpsqxAmTGvfA9adEtO4aUbvyUNaAsBcJ4l8vc
 XydpaM84YYmV5uLWSXvPA2Rnax4XVIyESQrCarTV9FpocDxgRflSRTrp2ASMKuDfjUB5A
 mGT2zmbJ0RtQCfJ0Uv4v+8ZuQzBbw3gjxC0CB+xEEzRbEDce3x8ITjCF5Z4+PgZMSvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LX6lfF7f; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77A8040758
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 359AE78034D;
 Sun, 18 Oct 2026 16:27:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:27:02 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:27:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-4-james.hilliard1@gmail.com>
References: <20261015215210.3426895-4-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <adfee21bd8c78ee866d303e569908689@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to version
 0.143.2
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
