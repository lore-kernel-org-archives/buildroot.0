Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D109C98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 19:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A80180892;
	Tue, 22 Sep 2026 19:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXsRHaGttCPi; Tue, 22 Sep 2026 19:22:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CA56F80E87
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790104931;
	b=Dks3OPVzYad0xengfdc8m6U4vz5b5/poEndKh1l1vOn/9HgdMKc41ZAlTmP4XCq4cxJF
	 MsshZpWS2E3kzl7tZCo0BcARgpwx7gsXUD/2wJ7KOseAUCNYIUbLypmJAOUEG2wQlb8pQ
	 Lr03eKqUZHAIgUOQwPNJGEMx9Xvi3H+iwjq2l6SC3D+S8YUguebSdABWyiwGOqapoIsr/
	 sAZLw8lMWsr0W3HALdEmnOMebKOAPE0YiuFvyUoms6YOgLNXMP7lY1aYMj9tLDLDp14G8
	 2FprkR8fvHqA3ZntlZGpVM325YIv05n7kfCFdL4x0SeIjCegdlWZhuoF+zzdFFZatyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790104931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=vFWTKeImHrCf25FHRDwy6djlNW7l+RRAicDJhqRoGU0=;
	b=py2NfnjB/r1DNLIHVrNdN8uqqyzOnXj/BZuImS8wXC/7vebRQdageAQhwxtzp2HJcmzt
	 DTo0pdVJuXSdCOHTKRoFPjYtrRmJg50xeZ17CT59ARdtArBGBAhiyq/KHv+XmtnWEGcXG
	 4F0npHfLoF5NMJQ2a6c5KCliT4t6yuP6EPLeJNpBhVnwhtJhnnju5DWc+Wgge9rziuJ+Q
	 wZ9IyPq9kwlCYt9dWyEuxhItBP/prsxBtv1p+14nEnM+17Wp/1fXnk/PVDZy9BJW68tDg
	 Iji1rzQs9361GosF/3MZKZIhuUv06O2eV+Zc2zyVYJHd9CxCs8vadvAYYD1Tpgg6CSQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790104931;
	bh=vFWTKeImHrCf25FHRDwy6djlNW7l+RRAicDJhqRoGU0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rckUsLDXVIMRT8IfnbtaYov2FNmju48ZoCjjntgs5rrLykwc8+ZdPuB99DrLmHSuz
	 Kk4iINxyw2RLo+cpLQluVGjjp9vPyTyOhq1Is5iMsafqTGe56GoI8Y6x6osRzQ6JIx
	 kX7dGSfPkOjl57+5+/wPbAMhVO/j01YEua2edKa12wa7sV/weAIW1Idok5tEkQPJ+g
	 E90+8HMPBn9jqx+OlMZa+xmlRtnkQb41V5Xov6caTaqpNgEOPJx/2sJCRS7GTdLJJG
	 8Oi9lA0554n78W5xSYvZe7F69izZIzQnjpBQfTX6aIvLkKj5iSOCM3wsHdM/1GPB0a
	 51wUZHx6Jm6aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA56F80E87;
	Tue, 22 Sep 2026 19:22:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A452912C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 19:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9600240116
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 19:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCurui2oOBRC for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 19:22:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 058414004A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790104929;
 b=A191IAUfWKz5CbNPxZcAeBOW35o9uFOvDpFRL+OVK/757wdydF4I6xWOT43jcSq7nO3T
 zjN5LBDiDoX4JlsePOD1bc6qASUBcM27nX28bGfOjK78NOKvhFZhcQrMYeXb1m+vqdbCI
 xACtIKY9HD7o5enQZ6AyD7TfBwchxnCTw4x+4wrG5zMOcPf7d93lmOvi0f7JFH2gEvm+4
 YjdV4tlZa9Zcd5dYn2eC6KEWgkPfSo6jRTso/TgAJWkC68vA+34agIyJuRoznOf9DjpL3
 BIYThQMdEunK5kwxznkPmD6U5CoXcGNScCmAxG2+a6BnjU3OmNfPigDQluVLW7J6MCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790104929;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=3YjbvJKNDa0jhCo32zc5qHezg2RTBxHtIfrjUKOXUp4=;
 b=J/3Hu48wYGA6H4YiKJzsy0kbDaAxH1i4/aR8eWwE6PxsupXkQkmiORrBUHggC2brPGJn
 UsrV/wEG5JhrUlXsyeTKPmxsqqDxmKBBIXtQUyNEJ18MAhsVRwjLL+q5oUqTna91qhOWE
 dN5piFuDMPAtTx+L0dnw3iSgPcBQx5jXqcLizjDi5+ykTVPtdgyvdM6lRl4zIthOJR2gj
 G/QCGX7emQcsjb6Gmb8yivlmX14eYIhbcRpSDsiGP5UcY3vBtAyaqj5i+EyJvyPc4v+63
 2Us0SLT39OZYz3d7JwB36zlifC1KNWFljOD1yOtIlQBhpWL4q8ssglu4a/ocPKznXUg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aSAzkBNv; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 058414004A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 19:22:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3E6757804FD;
 Tue, 22 Sep 2026 21:22:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 21:22:04 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 21:22:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
In-Reply-To: <20260908080651.35258-1-bernd@kuhls.net>
References: <20260908080651.35258-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <96cdcf1de326540d2949a0fb0e91eef8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl3: fix X11 dependencies
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

Hi Bernd,

Thanks for the patch.

On 08/09/2026 10:06, Bernd Kuhls wrote:
> Add handling for optional X11 dependencies to fix configure errors:
> 
> CMake Error at cmake/macros.cmake:433 (message):
>   Couldn't find dependency package for XCURSOR.  Please install the 
> needed
>   packages or configure with -DSDL_X11_XCURSOR=OFF
> 
> CMake Error at cmake/macros.cmake:433 (message):
>   Couldn't find dependency package for XINPUT.  Please install the 
> needed
>   packages or configure with -DSDL_X11_XINPUT=OFF
> 
> CMake Error at cmake/macros.cmake:433 (message):
>   Couldn't find dependency package for XSCRNSAVER.  Please install the 
> needed
>   packages or configure with -DSDL_X11_XSCRNSAVER=OFF
> 
> CMake Error at cmake/macros.cmake:433 (message):
>   Couldn't find dependency package for XTEST.  Please install the 
> needed
>   packages or configure with -DSDL_X11_XTEST=OFF

While trying this patch with the following commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_SDL3=y
BR2_PACKAGE_SDL3_X11=y
BR2_PACKAGE_XORG7=y
EOF
make olddefconfig
make sdl3

I had the following error:

CMake Error at cmake/macros.cmake:433 (message):
   Couldn't find dependency package for XFIXES.  Please install the 
needed
   packages or configure with -DSDL_X11_XFIXES=OFF

Could you have a look, please?

I did not checked if there is other instances of those dependency 
checks.

> Please note that SDL3 only checks for these dependencies when X11
> support is enabled so we do not need to add =OFF options to the else-
> clause -DSDL_X11=OFF:
> https://github.com/libsdl-org/SDL/blob/release-3.4.12/cmake/sdlchecks.cmake#L325
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
