Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E276D10F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD5E282331;
	Fri, 27 Mar 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwXYnEHgnw8m; Fri, 27 Mar 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC636835DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774645126;
	bh=1m4gpHspWyeACD8SjzUuFt/GoKHlXbOBDy3L72dqg34=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=awzw/Sj7tvvjKT20txPP/kW2yGFqtEE8iO5YGsIjSW7QklcJePG+oV3whqwJaU39g
	 vOqslYQBtw7nFYwU0JtnKcVQwm7jbNKU1wDbLO4VzbJ8kCMQ8J7bwzz0/VKeN83+cG
	 krIJU8d6hcmCjgoa7kvsT4WG8kQc1s2q1/Ihc+zOFdjx/S5HG0nWwjr6Zej5Vthoxr
	 6OzHp0CffV7V0pfKuvju2iO5rwOPFkOy79NbK7RBbv7bU5uRNpckRV6/JyuRe2PMDU
	 aKNu4zjYkkJVvEv+SIIdymo82qFix1HfAx9ziGjlzXOapMsv5HX0EGHtmRf9Li9hCy
	 77LPuzBh7EOnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC636835DF;
	Fri, 27 Mar 2026 20:58:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 131322AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED7604012D
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FC9qfWWXbTB0 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:58:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3151440029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3151440029
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3151440029
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:58:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D691B13F86E;
 Fri, 27 Mar 2026 21:58:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 21:58:41 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 21:58:41 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260327145307.3834669-1-shirokovalexs@gmail.com>
References: <20260327145307.3834669-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <e451efaca1178241dfee928f17201413@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774645123;
 bh=XTMigfBgnAGBjsnZJ8BGBIj7GUxzHz4GjKYkKYtpCpE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M2JmyR15QzRIMVSa5cS3VjmfUxc9t5OglN9tfzkJzPlHsK0U7eR2rXLSwIWJHHuz/
 9yCGiq3L3RcHOTKggIA2ilSDeDv0fwMVJ6/yLFZomTuyoCICzNU6nLH1YqS7bp4zDh
 fr4tmilNFHFzDncx0PcRE0VtPy0qzSf6kcB4m3m8CY2ThfqLGluuQOGehYDpPEJmx9
 uazMFL1vzqbCwcQ/wkwk4nHYRSQ16Gf+mW8RPjgv6oRUc7U1OP2Hc/PpUllp7bY0B0
 MPAuhX7g24HRbAyUKa8J/29lvhC5NU23PPE0u4sbGCesdcNm9VNPMfubQE4tkGpIY0
 sUJ4cGFzYYu4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M2JmyR15
Subject: Re: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.56.2
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

On 27/03/2026 15:52, Alexander Shirokov wrote:
> Changelog: https://github.com/Canop/broot/blob/v1.56.2/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
