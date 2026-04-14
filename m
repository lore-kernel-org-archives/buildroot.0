Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A46BF9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 006BD81E15;
	Tue, 14 Apr 2026 17:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7TSa7a35N8H; Tue, 14 Apr 2026 17:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD9780629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189316;
	bh=r2WeTZET2Xfn9SXe6IZ30t0C0PEzzzN1YF763aMDtc0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NilLsCnFqzDWMUVwyRGeoAnpMQe7H4Y+QeiNgAFapbcCvV9mthO6UiduWl0ygr/IF
	 HkZhhKj3zpF495u2S/Wojnz5HY+YsY1Rz+HII7doyeJNNGHL3eoNiDdhwWjHyQXZB0
	 JLKgyzaEsCgBaiacmDHaOTfHiAQjWM81iRfr9llu0iks8U43zlDTUCX2khy5o76nix
	 gQuOLWiDoue8V09XVXiDBKlVJe4kdrPeLvcOFXUuRmry5Mn8rwFXjoy85f9LgQgFzH
	 2AQILN8u3YmgB100b49J3qPHu2HnKk8I8hYRUaaVmgp+6QJf96PPg+ZQPmrtS2GEuu
	 WfVvzF1AmiLRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD9780629;
	Tue, 14 Apr 2026 17:55:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D46B4283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9A1D607AA
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulwjE0epMpEp for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DFAC0606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFAC0606FD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFAC0606FD
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:55:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CEA005FFB7;
 Tue, 14 Apr 2026 19:55:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 19:55:10 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 19:55:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260408085443.1641719-1-bernd@kuhls.net>
References: <20260408085443.1641719-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <d3ff9884177b4ddfa1b2c2738a207a1e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776189312;
 bh=jPnPognKQLdvCWwS7kmGxp8SIzBnlrJJXnQCWHbbapw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OWghQFid4ano2Ih6Gt+wYWbO6QpGyKIFo9/XwDtJRs0I0uqokYauwmfY+fUO0+mUY
 eI5gIXEkjFVbnEvTuVTwXA7+AraXWAjqjEvefIOWurxdVhrcHTgm5jLN0ZRcRC+Ksv
 /mgw3bT3x9G1wSGwn8QtEHp/fasYmyrqOvjnjHMdNf6OUlzeMmQC8NUpA7olSBWOKs
 YeiOvMQK5KpzncwLKap7S4OReizu1fqSznGI68xBTqlp2U3RbZZIUOn8+Ac5WGO6R4
 RfeE7b7dE9N6swKSmi4YQRQset1/iaVsGPfHH+f1dBuXZSttMSnYIijuu65WMhemab
 VALm4gDL8QWRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OWghQFid
Subject: Re: [Buildroot] [PATCH 1/1] package/jsoncpp: bump version to 1.9.7
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

On 08/04/2026 10:54, Bernd Kuhls wrote:
> https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.7
> 
> Added patch from upstream PR to fix a build error with C++17 seen with
> gerbera.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
