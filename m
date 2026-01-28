Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01FFD35692
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 08:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DFB81E50;
	Wed, 28 Jan 2026 08:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qvQzwDCms_c; Wed, 28 Jan 2026 08:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2DA481AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769590366;
	bh=DU7qxDYJ36WopJP3qX8+yuEaODphuDhjPvbxPDS3cFY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eq6VYPRTNCqVQ63Book623v30k6Q8dj2F9m5MIhxd5cIfDNOtssB2NWGoRBjgafs4
	 UHUymUp176GOyTOBVLpLPxNrgIiIqcghdW8CepVYhbXlFzeLIJD9+jHAZQzUmZ5mFO
	 8mAWTU9jsuaRJfzPAx5mxcBSORztIGbO488FcQRalY9uLhIiDd+NMkQ0uzmglI8y+L
	 x5MH12dunhOfUdLXY5b0k1vM63y8xQnNBGhxDJ13RPcTSv34+nEr4zzmg1HaFaRpZD
	 2/s62TfxB3yocOn9c6Uzxgeeqng5zq9UHbzx5qKtVC0AM90cRSVm6lMMb8TpQ+KoZO
	 IirXooqG94Ouw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2DA481AD7;
	Wed, 28 Jan 2026 08:52:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9323D160
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 08:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8378C606FF
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 08:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kmeR1zstxjD for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 08:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3ED1606BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3ED1606BF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3ED1606BF
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 08:52:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1199863859; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Jan 2026 08:52:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vl1Hx-0000000454u-4369;
 Wed, 28 Jan 2026 09:52:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260127213112.1668038-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Tue, 27 Jan 2026 22:31:12 +0100")
References: <20260127213112.1668038-1-giulio.benetti@benettiengineering.com>
Date: Wed, 28 Jan 2026 09:52:37 +0100
Message-ID: <875x8m15m2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fboYrFdTh9aCeUdyM3jWsvWuLPhPJWqJ0XHLo6kBqA9xhIdYbgkxONIzGhyOUIcegzvjk+e2wJRw71aItPqVZZQhzuWNvo5s9HuAaO0ry8aMLpJXAvlpWjtpMGL9kdPwYbQNlzRjg0hve2rdkH+rlt/FCzk3sEGsJUkN+RASrqFhUcAb1D3w/mmpgNloKrXHVKuk+Izsi8ZnC3EF+2ea0lLEDuPzW6YezjSSR35YTiV21K7fkmjyYj6vMagfFIvFqbREG4NNxd6/i5/3DuoIHI6EtHt7kMXkWkG8pCAhEvF5mshp/xCEYeJR/+8EcV0OiVVgIMaFh3HE3g6kRpoE4g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=FGO/Dn9A/MieULf9X5tPODAeWI79Bcu1A+HFmAsQ+H4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=fboYrFdT
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.4
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > For release note, see:
 > https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.4/docs/v2.8.4-ReleaseNotes

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
