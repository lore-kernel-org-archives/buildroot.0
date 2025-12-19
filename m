Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C3AE668A5
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE4674098D;
	Fri, 19 Dec 2025 22:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4vK-giIew7K; Fri, 19 Dec 2025 22:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 858124088B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766185128;
	bh=fkdGDzTiTZ73I+25opMPD+V3Vs1FBbBKoz82TKNZSVw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Twf1/ccLoWia1exuPKTRtTJe3RUU0whLJC7hfkv1NQ8MDMRsBH28SHORLmW8sIcga
	 M+gQLqjGqBXV3jKxGAT5G3XdKVCgUy2/vTkqGcqI20Na7dCUFOYDbp51OPsBYK1pHp
	 w7wSvce7yKBe7XtE46pmLDdEMWSY8hWkrNfw9EES2VqSakv3OZ9DBkFdmxlSaroKRM
	 fcOuKANo/HsFIQqu0axd9AvY2g4SI/JddmSYUJ8xu0niJDibqDzS6dv1RSaFSUqx7K
	 HyB0gwQ9FBp2sVaAq6ZMngyKX73AsR2YH51WlkjJ4PPOSlJi8+2rlQ7QJ/Jioyn33k
	 3V1CwkLQiFPhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 858124088B;
	Fri, 19 Dec 2025 22:58:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76BB3119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CC5360D89
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uh2eL21F3eFz for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:58:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8ACFE60BEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ACFE60BEB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8ACFE60BEB
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:58:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 891DE13F89A;
 Fri, 19 Dec 2025 23:58:42 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 23:58:42 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 23:58:42 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251215201128.2334659-1-bernd@kuhls.net>
References: <20251215201128.2334659-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <3f83e8f86b82a5b231eeeaec9654a022@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766185123;
 bh=LxEjzBNaE3KZnMThT63xVn96hzvbIhyqk/IRTpwhHIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CcJryl11140tHC6r5nO7fHZX0TCGtihRMAZNbSrM0ByYQbtRc2+MyLR929NT0Io/M
 LFKYZOwtG7QJQ+HUds+PO8bHubmE/GQ4QpXqOJ1QGA1BsRpQWCyIjJsV3Il4RS6rg5
 iiqvi5VXSYb5GA7JwV6+/UkxXRqB8ChaIGqSLkl4N+nzHE9AHAAOITq5C/PSFKR3OL
 cRTepznhTykofy6f/+O2RvQJqPATwy4ru1B32gsm3CIBStQffM3BPPjJDRMjnqZl81
 DFStNag/9c8LCY2eg3fQPr7pchIJalvNQu0CNZqwcpCSH5P0FWPAvxoZtRe1CsWdt7
 7PoWfkcCyotKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CcJryl11
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: bump version to
 1.58
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

On 15/12/2025 21:11, Bernd Kuhls wrote:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=NEWS;h=c60ad85d84da2a1721e6bb8c4ae95e645be1b201;hb=e880193c55f0321bbefc16be3194fdbb7a48078f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
