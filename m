Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D737E68143
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 08:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A0F782410;
	Tue, 17 Feb 2026 08:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmMY6iSCWB1z; Tue, 17 Feb 2026 08:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47CB382393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771318384;
	bh=wtGAMHgCext9FQ6y30Dqq903YhExZEzwISyWBAPnFk8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WHxZT8m/aM+vdSHiAzdfbrxAjmNkH4KKV0nzmyAHwE5Clja68B49RnaCIc+Uj/157
	 kiWZzeO6WJYBlP8wJwcX68DRCt8lnStMvnQKFrQYX6T2iWeA23AMrECr8/A7wL/Pid
	 eNhWYicE4WKPY6LaKs+RiYmUM5QjtfTYyiCldzHduM7FRr3aOXZvtMBKPN+s/fO/Es
	 rjH6VAoP8Gxp42S2AaXZS8Y8rET0QKGq+X2axVG7k6jNi6aNCfESFyzOmXBlvgkXAK
	 pt2SwcD4ojbyN/KtWZ9JT0VwhTDXaJFjNOBIsir9TJ3oNeB4NPVEpjWUdYm0ngfCM8
	 iJ9g6jO4PUHgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47CB382393;
	Tue, 17 Feb 2026 08:53:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A9E7206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8853D40904
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZrTXjXSmYZI for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 08:53:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69C4E400ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69C4E400ED
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69C4E400ED
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:53:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -125314262; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 17 Feb 2026 08:52:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vsGpD-0000000BW6X-0VDz;
 Tue, 17 Feb 2026 09:52:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Martin Bachmann <martin.bachmann@designwerk.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <ZR0P278MB08694E5A8B50C3217342254E8B6DA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
 (Martin Bachmann's message of "Tue, 17 Feb 2026 07:49:50 +0000")
References: <ZR0P278MB0869C77817F0EDA8220929F88B6CA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
 <ZR0P278MB08694E5A8B50C3217342254E8B6DA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Date: Tue, 17 Feb 2026 09:52:55 +0100
Message-ID: <87pl63iwew.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VUfE5zdmgyKzoHPNniqKSSrn2SMELU12LmRM0G6zKyFkeFyXcpitdB/MW0rbvtemTtnToM9M8QgpkEY+6clbbSaYJMCkN1ShCQX1SJCdjd1P0OCFMU8/ES4MB7j2b0ChmegpMFDAPzbmdgkqit1eHTw/4bYT/Eh86u35uA7HdQRrQ+5AefSYkYVY8C7aKgPPuqJE7kREgMvYCnEuQhxC5xNqteYbJl1bCGd/O7Z1jMNFMtpio1BWmAPZluMfgvIM7jkCh7H7FEB1MxVObJw0m/agoHzB9MhBpgTL5iaALbcnrTHC6zM+btFHLT1FbkkPD5Tb0kMMe+rQYrNmB1u36Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=swWVZYi5V5Mu69WjIkeRZJUEvgRAuq5Sn4GhUsuAM50=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=VUfE5zdm
Subject: Re: [Buildroot] [PATCH v2 1/1] package/util-linux: correct missing
 comma in license
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

>>>>> "Martin" == Martin Bachmann <martin.bachmann@designwerk.com> writes:

 > Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>

 > ---
 >  package/util-linux/util-linux.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
 > index af6044af32..7617041a46 100644
 > --- a/package/util-linux/util-linux.mk
 > +++ b/package/util-linux/util-linux.mk
 > @@ -21,7 +21,7 @@ UTIL_LINUX_LICENSE = \
 >  	LGPL-2.1+ (libblkid, libfdisk, libmount), \
 >  	BSD-3-Clause (libuuid), \
 >  	BSD-2-Clause (xxhash), \
 > -	ISC (rfkill) \
 > +	ISC (rfkill), \

Thanks, but as I mentioned yesterday I have applied your original patch
already:

https://gitlab.com/buildroot.org/buildroot/-/commit/53445ca6418779bd5fe27d3ca84e11116259e548

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
