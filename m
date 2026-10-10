Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC14CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B34D6064A;
	Sat, 10 Oct 2026 16:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQi-cd7oq2BM; Sat, 10 Oct 2026 16:17:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8567060638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649027;
	b=G2DujAZQdGLXI5s1DLb1JriREZSd/zilgk7ogNSj1CNDUR7QHmpICe2dqB2AJwMmY2s0
	 GkB6zZtmOEICZYT3a4S7nmKF2XLw0ijrGGEMhoRwlBVKWqO5JKFYrJCazt/0tUR7ReisO
	 tGfiRJBpw+LzsP/G4lQUwOwcbBRpk4YFnBDUPQCWBSEtwYChg6Tkm0vt+zzUY/nLNCNBu
	 w3W7CWUSwBNjTcbHb7dTve9JxCthZaCT01ICjTmb/7gCyAmoiH/yMEt++3z+FLzTBpuS3
	 hQWdFps6Ft89LK5kzahGy3TJtqbxEsyNNb5Si21W1gw0m2/sXPibdazHW/wxPBWy0zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649027;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fnuX/33XKkNzf8xt2RFTjCuUeh4oJBhwsWBq6AwD/Do=;
	b=rVTDRo03rspM1vg0TTBjs8v8OwLClF/TsGLxgbMFROH4pAlQnD/UHEyDnbNEpk+/HZyC
	 5mgucfXYNY0c244uMmbEQ8O96xBW2yb0FaF1TjMHVpt2O5KBxcBn2cVh8y8Y50uQgKwt3
	 zCJlwsed1BXn3gSIPXPUP/cUcCPAOR7K9gIcpvoGuXvWxHzsmrTmlZ0blcZtjxq2SkDjc
	 razgKb638R5nilRpeJiFBITTXUJPQiua4/ynWb7f1A6VCIgBsJRNEl6XLXjyNYE7HOpXc
	 zVEHao4n6K4MGPClOt56K8RslZM9pbvXFjCgTFUp0G8OmjrEkTIg02FQeMPk7twRGrw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=Of3BNEcm;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649027;
	bh=fnuX/33XKkNzf8xt2RFTjCuUeh4oJBhwsWBq6AwD/Do=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWoSS+bzUo2f/t4vM18r9F/geZ6Ke7OribXQyiZSdMWURFDep/jRWuIfrofD7Gu1+
	 lnm9zO6FxruFZYP+R3ILlmK7DHoG2QS7Nmr24UQ540A0YUX3XrORzFWX4HQQ1CSqz9
	 JXVSLp9oPWkmP3Uf2QtLMDcAifWmZ2kqrJnSZgJDx+m9VF3MgnnzCNJzunTv0DEcjF
	 tecH0X4G4hsjXuUwjx9Xq6QIekedDfFkSatX1z/8wBav6mK2jev1Qh8Icyqgr3VWIu
	 Gcx+wv+M2vS9PuUo3SBVyW47GNk7/sNCNxAQX/DBwJ/LmtD+SQ8ntiCIMtSJ8TkPQc
	 HTP2Z7gtuzzxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8567060638;
	Sat, 10 Oct 2026 16:17:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5E96235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB78060639
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zus1DYy6FxCA for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:17:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A79CA60632
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649024;
 b=O4kwnnvlUU9fK2qZApvh+uED4mdBL5bxXFBydl3ecRb6wKT/2UvYZAhHMOQL7wHWUtAP
 ylNdKKLZBJKCDXybJL8SuOrO38Moc6aHfUjAiyFZC5CzGLB2loBX99VIL8jcIxsbwrNIu
 n3V9U18CUlKbVZlcavrsvrlnbMhRmfetnMUMuK9stGY0EJpJixRjMMoWTtATceD+3vNF3
 MFh2hXxeXv1NbmV3XcpAhZSOVQdRgb/gKXThHNONy2lI4MFnYpmAfARIY38ftbzq0nIJV
 pkFiBJwVLfq4Oo3N1xuBr5akwQO7Px4MW9p8LG+5Bd7HtNomYJ5gNsZVnv+AHge6s0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649024;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=YQ3l/59zM93Cuo3v+HzbJYWqeAeNULPhBMa5HstSSO8=;
 b=d6+LWZmunRsNRKllYmzrtzDCs5SfihwOOOEqVEFHuzOJQG+JYmKWaaUvGqzvcBTQytn8
 I90QlZlqXQS97DvfMaChGK9cuyZ+RnGPI2O2e4AA5PneHO3kUErqdtQ8NpGfVo+pMATfa
 HnR6RmgEya9ueQJo39C/5y2ueunR+iBor2sZ8U70ScUiA6Fa+9NXZZzRzhuwwalZJXW/Y
 k4fpKtEfDSW9fB+xAL6PEfnHHIelIVER4pNeK6+4r7yEKceYZUdtV2mz+k3l+yqbspYaJ
 JpQmE+Mi9l5GoqG1/jaL93XnAs5Gt/zbwhcsyA3Tz1AuvxFzycYcY5C/utt36brIbzA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=Of3BNEcm; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Of3BNEcm
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A79CA60632
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:17:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Of3BNEcmAEbab166aJV4ojiS9i7ZatcDbB8DW7KjlOkYp2xWNvXgzY9SIw+yGUUyYqVBlTQr2V17lGxcsLLs+qi9C9ABnBFPqTKkMZg2ZpxB0SHr9HGQaigqBke1Mcv6LJij/J/aFCuJja+j0XI7enxmYzIhqZcVS+tbUrF+j2HSEzm07i8r+GT1AA4ZD7PkRMCKsWNRaGnxa+o7WOuihB2ml3WKY95dS/oQE2vNYutUURz8uTN/WL9L88MTjEr7s5MUi1z8X3H3dTiQ86P1edzmkbvBgk3r+ArvF//C8ydxjPbnVzuiwPT6zU7Hn5ON83RYCt/XTnmlv97hkebPKg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=5Dzzg8y2vzZGWb0g2lO5yVPzbakNxb4ZPjsljSTxc9E=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1646814515; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 16:16:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFZkm-00000001uVb-3Ogs;
 Sat, 10 Oct 2026 18:16:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261006162106.3439373-67-bernd@kuhls.net> (Bernd Kuhls's
 message of "Tue, 6 Oct 2026 18:20:47 +0200")
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-67-bernd@kuhls.net>
Date: Sat, 10 Oct 2026 18:16:56 +0200
Message-ID: <87o6d1fs3r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v8 66/84] package/libcec: bump version to
 8.1.7
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/Pulse-Eight/libcec/blob/libcec-8.1.7/debian/changelog.in
 > Removed patches which are included in this release.

 > Removed dependency to libplatform due to upstream commit:
 > https://github.com/Pulse-Eight/libcec/commit/332bca975a71d8e876b66dc6a7fca938b49b1831

 > Updated license hash due to upstream commits:
 > https://github.com/Pulse-Eight/libcec/commits/libcec-8.1.7/LICENSE.md

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
