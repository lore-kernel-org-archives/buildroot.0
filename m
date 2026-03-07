Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E237FC9ED5
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 12:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6243B83E8F;
	Sat,  7 Mar 2026 12:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5iuL0mko2vf; Sat,  7 Mar 2026 12:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DC8E83E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772888061;
	bh=uZYd4qjk9Roj8Ia8if2XmmyYNsj9GD55pNQiHHwpDV0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iVGOEY/gYVwai4oPomFdI1yNjXqjpEi1mphglIljtZkOx9/nRrpkSP+GQIkhbnl4r
	 pQL/ODfgGyiiEfanm6vB85vPdn+TPxcSMiYaIYjRB4npT3eSyizqRjbsKOYgolSERL
	 uzO/7wRmKTAz3xJBsFZXeJosRdhAmsST061Q17fUHjN/mMc0/aU9CNJ6bMjjh9/9r/
	 wk8LiZwNrl6vcymHvNHQZF/ZNOzk8Ag2j6sN7UGofe9GNz3oyvUM3mWvpYqwwF/oTE
	 kQMPWZo0AEx0I9JzuHDZH1+jE8WKQVhTaebU9grcXCD/mP0I1xLxOZhBHIJuXKQeHL
	 Fw9GqUhZpsMyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC8E83E7B;
	Sat,  7 Mar 2026 12:54:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 772AF169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 12:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68C1C41A2D
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 12:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93tPkTYTfWjJ for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 12:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92F1D41A7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92F1D41A7A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92F1D41A7A
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 12:54:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 86994780503;
 Sat,  7 Mar 2026 13:54:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 13:54:16 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 13:54:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260306224203.121328-1-bernd@kuhls.net>
References: <20260306224203.121328-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <829698911658362744982ffb892edc69@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772888057;
 bh=C1MeJS1h56+LYZxIOl7fTpyGt5y7FeNZshrq8SK/fE8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A2oMlOzXrdvtyZV9/mr1zjA34o4N3/uRApCdf44tqBaErNawYSY52onDCN50SVzA2
 qi1dGH+37rDFhaTUt4x68NZQOU+iIcc7kYdAGS85H0SPFEIsDYJ6+r7fjhIemjTjvR
 mZg3VbIQVGWjly8uPY6Y1MMghOe7JrY8KeiW/qtss8RDW+woB9K4aBiwuYBrM0vVab
 rbkBgWhtxlnoOIY2twXgzmVbJYxYWmZWsR9pvarTyvng74bdk8KkuVVuWTiCPhAoMf
 ZTRAmbVeJ4ksKt9AYfiA4hchRlSOyoAsymaRWbXlcJaE0ZB0Il8ffxeRqzqYGF2moo
 arVh0hRXgOn2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A2oMlOzX
Subject: Re: [Buildroot] [PATCH 1/1] package/faketime: fix host build with
 glibc 2.43
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

On 06/03/2026 23:42, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/911/9112933e2560b155a9c61f321874ec245b62b2a5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
