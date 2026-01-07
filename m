Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B38D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2040340A14;
	Wed,  7 Jan 2026 17:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWRSdRz5ylu2; Wed,  7 Jan 2026 17:51:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D3940E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808268;
	bh=w7bT4w1HkwGk3uWHZ7mHWKB15zDo9Mb+76getiduYp4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A1sVmsg2j1fD5SgMQytsNzmQFuAuJnowGbCPv/TmWukEEoDAz6ZWTAJmMSm5JhHhR
	 smo4MxeMupi8hzuAUL2snUApQQeX6BBkR32Bryf++FfK5+PdyH9WKnVMuL+EaeCt68
	 fwMM6nDAFdanLGDN/dhyl2cXcmi+ROQ6YhECX2/CurAsd9iVVhoFYGS7r7Ma0vXwQz
	 fXZuTLJ7hHfAiN0c0S81DPDbalCXyneUBxRfnfowXg4VjWNAQBHjbWr/CpUgmjNINc
	 zaebwju12gAjG2NfF/oIuvs6oMrD5ledbVaurbkHksaD6Y/q/nedAR3LfvbG0MuZgM
	 cIRuCw8WwgJ5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D3940E91;
	Wed,  7 Jan 2026 17:51:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C689ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 148846062A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZ9siFXr6SBu for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07892605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07892605D8
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07892605D8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BD8DB97A596; Wed,  7 Jan 2026 18:51:04 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:03 +0100
Message-ID: <20260107175103.227356-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224195935.4089179-2-giulio.benetti@benettiengineering.com>
References: <20251224195935.4089179-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808264; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=kY+eakxAdc66Z5fgPKzfjuhLb0K9bebBQFx2t8cL89k=;
 b=V4mTETXljDVKvKhwxRlSQvallj8AyTiDC6aFBkmb3yk6LOJ+Jn//0ZF8svz7E+DG0Wwy3m
 OvFNCbGqoRiSMwTC52bqbJL59o0felOqxqz7OVnUJ+I3+tgTMPky6JoSPtd8BBCHWqPocB
 TvnHLkFSUecP7CXW1hE5awrBo7qrcp686anA7dya1w2jPoQayZF4sN+11mEPgNSYg2Y0sP
 uJ1abAYgqhR5mSfGawXTbJ1rh238cZZ+njfd01/RVV2H+Jrk4cElxDbNuGobw5HHwFrya0
 uhHOs1cw+66BC+v5JZV6mHfentmT1QC/eiuxDg6lMLKcwARRuWe8L8uCw8RiLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=V4mTETXl
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package
 util-linux
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

In reply of:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d576fe9c61..d39e8ab30f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1334,6 +1334,7 @@ F:	package/swugenerator/
>  F:	package/swupdate/
>  F:	package/trace-cmd/
>  F:	package/udisks/
> +F:	package/util-linux/
>  F:	package/vim/
>  F:	package/wilc-driver/
>  F:	package/zlib-ng/
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
