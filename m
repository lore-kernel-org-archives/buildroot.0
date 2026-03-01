Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0F0FD0060
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 12:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E353560C10;
	Sun,  1 Mar 2026 12:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmOU3flKhai6; Sun,  1 Mar 2026 12:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0FBE60C0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772368753;
	bh=dXLVYqt/aVMc8XkZdshSO+tctFuhOiZk8bdkDunDylY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g0Kx7OzgI0vhuWKMWq0f1/pVW9W23p/C9IJIqpUlwygAHwYM2nD13TuutUvpNVu4n
	 o5sryh5NKKH6rxP8HzWpZPSoMWue8Y62ljs+SnoFncMrdPN1V8P9oxMWxAgOv2AbBm
	 5jPVLgMKQe+HittZOYwvn8cUIwevaPbG59/e+5QDYekivWJqR+LObWSft5ytSceXXZ
	 yTJSJHDSf4OlZ3ci2bNzAy0fQvTTjRgptUrh2n/rwRewnXyfHGnZ+ESpJGB8p0+LV6
	 LyB2LiRoiu+/SmiR6mKpcWz9LfzofadDsaywZSbMiMaHHRyMvr12qwN/2PEX0NFUny
	 d7fK2s/OJVOXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0FBE60C0F;
	Sun,  1 Mar 2026 12:39:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB0F24E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 147BA4178B
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GPkvEQwThLL for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 12:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1033340720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1033340720
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1033340720
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:39:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0B37519F5B2;
 Sun,  1 Mar 2026 13:39:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Mar 2026 13:39:07 +0100
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 13:39:07 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260228215636.3939665-1-bernd@kuhls.net>
References: <20260228215636.3939665-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <c7e8e9d506b6111063645edb9895e184@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772368749;
 bh=9V6GJSHF6lrHWSS7ks5jWeCYAFj0omSm+aJoLLzzshk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ITTcNsBiKT2Zt3V+t71bvwYsbgpkWNBoj2sCykn6ymsK8Y4wEt4mu8zFrKrQQ/iUx
 s89xZyMFXKYxdVe7VipwvnwOBOnCEHIxYWhWJQ1083DdlkzUkk/b+XMQx1BS0HTvPe
 odV+wljLHM2f8az+Z4cNzP7JSOX9G4M+6zSFplye7BCAR3UA+8eL5gN5s/so7Hf1iH
 W46a8J5g4EdQBA6pf0JkLJ6bSSH2eD8SMHpEHUW/w9GBrhjQ7dy/vtzxjHM4W+UeAR
 fGskYUOt8A+Y8ERy42bXe08g47xfmP4Jd6LJnRKSh3AKFLtovOnL25vIHz1mpjwHNg
 jmqj/VCq5RUDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ITTcNsBi
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: enable parallel build
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

On 28/02/2026 22:56, Bernd Kuhls wrote:
> Buildroot commit 126162b9159a185ac1897db1a9956f0379fc1428 disabled
> parallel builds in Jan 2017 due to a bug which was fixed upstream in
> Nov 2017:
> https://github.com/pocoproject/poco/commit/1724e8ba53d05ce688dcdb5176b128f116af2682#diff-76ed074a9305c04054cdebb9e9aad2d818052b07091de1f20cad0bbac34ffb52
> https://github.com/pocoproject/poco/commit/076dd9679bf2e77f1df219287f0eb42ea36b7371
> 
> Building with -j100 worked.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
