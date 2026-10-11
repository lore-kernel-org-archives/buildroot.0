Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB298CA9ECF
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 18:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D2680D13;
	Sun, 11 Oct 2026 18:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4f4YZ52NcpWB; Sun, 11 Oct 2026 18:24:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3EC5780D02
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791743099;
	b=Hg09cqHqbAsxZEZ+TLy6l9P+Q6UVn1f1Ui8mD0BmzG1+/WO7Ita0mP+oYnHpBSS3vVwL
	 fCM7bGSfqwm43nvtK5hhXf907ZbT1S7JPB89z0lKbDg3JaQrHpPrKhEtW38zaLTS1Ur8c
	 MXfjwU16KrCBD6zCvDmrdxfoXYkwkZQhGz9MXf4DS77DEV5BK7oMmIIgKGi+Xa+fmA6io
	 3T4vrM9Dwb0LPQFES4xdr/y9JSxlVLJlGb3sc4M5nsAMrHhEbLn1xKq/+Abcnrs0HMvZa
	 ybMwhVgVRQG2yXFIjssgDB70A/1m/8rbSn0HK91MfYXzQWiWroyqUxs5Qb6sXLc9XWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791743099;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:Message-Id:Date:MIME-Version:X-Mailer:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=UYvhHk1+GV9xmpHnEMT9wLbJ5ykMn9JxHRyoifbu4IY=;
	b=LOAxvMzpT9QUW3RAKYjz3Q7rbZDxXc7zKwekmfwP1Pp2pr7oWs8SZsBIn/j8SFlpNPPl
	 rCdl/KH/+EG4TfUBzVn5km1JgBC0buxWGC4JXmBD2mqqBIqjs2LDs914rGDwdKjiDtpVS
	 dYOUHjbzxVYWS6qwfmN1Gg/m0N425AOGnM6im0vPICylTGrHCnbznjRpWWZXwFBgWXmKA
	 2JujB3i2XKRJaKS2tlyYOZhVyDI2Z3GgxqjMndW7QxY1RCmcTzhVoPV3DwskXRkX4T+1f
	 /WkWfz/RfF0elvHb5Ugm14qaWFxykmS41tmMp+qKmYLnO0VdEKVx57Ne0auAMjBa0/w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791743099;
	bh=UYvhHk1+GV9xmpHnEMT9wLbJ5ykMn9JxHRyoifbu4IY=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GYwd/9rlVWqAvuWdOfs7/aC+r3Gy6wTlz4Fq/hLyhJbr0uJr0TOwq5wkyLk3wbqQS
	 0A6ddDQZd1u05WEUBjT7no657t15viJDuBNevTifW4ilvD3ripklUz0UjwXhOvcYna
	 Ze2ox5iBvXQEQq1jvIP2sPJBK890rNeMgvPCL78UmH1G6Gy9t7aO3iFBKuZL0R6TMT
	 MjWRmECMk+1poKe5+ItIUbtY0JJibhkBEgDtq20FQNtf/eo7r4lFl3JHNqvsjuErQI
	 qnKg8kwHaQboZjeVCNBOjjTkQk3gPDJcY/tIMzzDJ+kTFom1+rIFdGX9dbd20bhryM
	 uthmaCpqhmwOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC5780D02;
	Sun, 11 Oct 2026 18:24:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CDEAA380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 18:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8B0560614
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 18:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mq37siqNosxP for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 18:24:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D27CE60606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791743096;
 b=KTpp3UNAR6apcCm649iKEwlLJaOoT8JDF0EdHBZptBNrpIcKdvts0d7k25gryQh1ohB+
 c6xapjyu9+fOxeOBkrLlfL0ahWdG4Ai8IUXIUvCd9ft2I/7MADJaoco76cfc/6GSR7HSu
 qckSn8/g4OVMfloHdz6RMhRgoXZ5vq+kZPmqfC4eYjC6zuY+HkAqJuFVWM2dQrdRuSeT+
 aG92W8GqZrpFesTcZd/cmKi0zqgTeJTeidew2Nl5mnmFSBD42zKwPBTgtAv6nNbhEFD0a
 m24NCpcKtb2wqkgNoaoyqVDmzZBpy+bxExjkWXdBBN7nDjAWvlwTgbtlZp5EYZyzMog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791743096;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:In-Reply-To:
 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Mailer:X-Last-TLS-Session-Version;
 bh=Ryf/BlfUB+WtwIc9HSFaQv5lkJY300K+2QgVssVje7w=;
 b=O+vZebVcob2nv9JgoEVLGQaAHMZ7usCjTyBvrGhYbINBe5hH61cYwBDUFVBKu8EuzlD4
 Jg9yCbAcEqXOq5mdp8xNfFfAG1AlswGVsrbjhd2A95Q4b7QvIf9HmA8sd0njLGYOraHj+
 m6M+ikQmxnJc84nzxQsoM29jxr+XlxBBeyeZQmwMQmUJCxpOysU3J7YTeMQgPobt3fMZ0
 J2ORmDXDDnxJUMdI/rtDa3Lci8wu1TBj+dUyDUwQ3n5QFEQogADkyUMg8Mqs7g2ROayZI
 azpFsknK+T8GbbOsxzQ1U6HtFwHRhAYixDlDOn6cGasuTdbSRDOtAoe0hfL8JNcSpqQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Q9qv2wIK; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D27CE60606
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 18:24:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5C1AB97A156; Sun, 11 Oct 2026 20:24:51 +0200 (CEST)
To: buildroot@buildroot.org, yann.morin@orange.com
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 =?utf-8?q?J_=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <8402ba3c5551505159a155c5cf0fc5b58c6a3614.1723543467.git.yann.morin@orange.com>
References: <8402ba3c5551505159a155c5cf0fc5b58c6a3614.1723543467.git.yann.morin@orange.com>
Message-Id: <179174309017.220171.17735084818179421470.b4-ty@b4>
Date: Sun, 11 Oct 2026 20:24:50 +0200
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] toolchain/wrapper: move -ztext from
 LDFLAGS to toolchain wrapper
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Aug 2024 12:04:31 +0200, yann.morin@orange.com wrote:
${quote_head}

 Applied to master, thanks!

 Regards,
 Arnout
${quote_tail}

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
