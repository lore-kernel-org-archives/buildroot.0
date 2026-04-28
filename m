Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EE2FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D073540E52;
	Tue, 28 Apr 2026 18:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkZytTa4I8uk; Tue, 28 Apr 2026 18:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED0AD40E58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401463;
	bh=mck22uDH9AZEENLKEE/omEhRURoPP1/DIbGX3Oe4zg8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ej2OAo2AmYHkjND6MphI6Q1RK88QQ9ii1gfpnB4klxGAM2Ie8eoOYrq7J/R+1vhnl
	 GSSVGnD9Jm51zDiRvCf4TCzUHpopCWPbWV9sibgia909v4L7tvxy6vuJZ+kHURFZDK
	 tvufrDKNXcJTzAYG9rPYIainrUhXxSiE+RqwCiBa6wc3EfS5Ci2Y7ZlqiHxZCVLV9F
	 46elbhgsvz7ddM4KVPeF1w5+qvBYyeVoNTSSrv9j5jHKI7OuvI53Kozx3/wSIVSEod
	 TZE9gijlW+1RjOLh+nekgNlpnWcp4KEXPWVPWMtZrD04I49inZNnA/owTQLDnpIOa8
	 ddSOyB85p5U+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED0AD40E58;
	Tue, 28 Apr 2026 18:37:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C91E1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F3D040E58
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JTwNJIWyChQ for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:37:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54AF640E52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54AF640E52
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54AF640E52
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:37:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3957213F8BA;
 Tue, 28 Apr 2026 20:37:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:37:38 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:37:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260426102845.3104064-1-bernd@kuhls.net>
References: <20260426102845.3104064-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <ba42e4a6fa20f4eabb2276c2cc112421@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777401459;
 bh=nKaOj/dVhoIDJpfoECKpm5qb8J2dmkxhXAqzerIsViM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AhFP23JJgcJT75oBTVVNEB+aKRu1BJsrF/fJzwnXdMKZVU03fB2xK4nNmueqO8oMf
 rAOeRr4Oes8cA2z6Lsla1A9cfUZFFn1OcWgmwzAxjYIrTSoMOzYbbojdb5Hz9JWLGS
 xPi0Fza0kk/nRw40EHXdJxog8dUGULhsukniosWTvERjvLMpHyLfgG9lgQfGei6ZQT
 EuGV/GWFhqu7Ml3GaNjx2wg7g1czOzVcRgkVaNSX4yq3wWu93kTWLi/ziPt000Bwo3
 gqKuEq2Js7z4gwW2UJV5ywjksq7bGp9SLLKPndn0KFdoidzgDEaU+SED0KXrRv67Dm
 bE1a8fn/PRK5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AhFP23JJ
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version
 to 21.3.6
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

On 26/04/2026 12:28, Bernd Kuhls wrote:
> https://github.com/janbar/pvr.mythtv/blob/21.3.6-Omega/pvr.mythtv/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
