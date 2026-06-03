Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10CDCD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 811E061B14;
	Wed,  3 Jun 2026 18:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WjS_eubhYvK; Wed,  3 Jun 2026 18:51:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DC0161AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512714;
	bh=1WIWbMIfd1RRiQuIMgkoE+yyxfIiKXVFIODnHEUm0NQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kta08UMPEQ/Q7wGpN9T8qsumnJlhMVaN8THBNHcIEePLqvFMpC545+OIJwKLRL7Ft
	 GOdMaEB2VKZZ/S1kIe110ZLyW843j7T6mFiNQ3G02IodCIDYOKUNaFdWuykKyDzIuS
	 HprIDN6wR6J4dFYlSfCusLEsuA/6yBk/IF5Ama8lpbiAkajFc2PDLvcBF9u6urYYYl
	 7x6ySAJZDNAIWOlcxEmDm97RYxYvh/oyRVwynEH7tr1EjfTJKrMP5mUiJqYoS0WsrF
	 zaJXlnbgKkr7i2+t8k3zt+H6+rWPh1/jhIKUD0dfaJ/xzLNHKy6H/ZE2UUUJ3gspO1
	 c168p3Sfiv3qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DC0161AE9;
	Wed,  3 Jun 2026 18:51:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80539192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 665CF8457C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8lXk9sMha_6 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:51:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80E7F8457B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E7F8457B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80E7F8457B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:51:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2142312431; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:51:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqgp-0000000CgH9-1OTP;
 Wed, 03 Jun 2026 20:51:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260602184427.1707888-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 2 Jun 2026 20:44:27 +0200")
References: <20260602184427.1707888-1-bernd@kuhls.net>
 <20260602184427.1707888-2-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 20:51:43 +0200
Message-ID: <87tsrjmp8g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=u0RSL41RZ2VHrSBymzkzDutaQFDzA06Pge4V16IGD93EW3kK7CHS3SmhZIaxfLkEyndVPGngTQ0Zzdp/1Uw2pOCv4Iu1uawMX8IMbE4PcR/aXxEakqe+Bbx1vMyhLitj1J4P2aIf4iSrdmFo79qDn3Qv02paGK/gIwWrB/iM6RGX2tN4Grh1qshSeDESoijBp4ChGYRLgN3pii2BmwZaecbemD9jTdiD/+qhwmlkyv2sDiQ04oLtzOC/F1cREduEZbQ5SiaZf2Q11jcGztUecn/bNJNG/VywvO3xt+lC26Ex4jbsKRNGOQ2J0hf+uvG1FnAmY+8TVSIbj2oymtErMg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=UorCLkqnEfVWQmHrQHcde4VbTON0Tee077kQ1A6aUAY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=u0RSL41R
Subject: Re: [Buildroot] [PATCH/next 2/2] package/alsa-utils: bump version
 to 1.2.16
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

 > https://www.alsa-project.org/wiki/Changes_v1.2.15.3_v1.2.16#alsa-utils
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
