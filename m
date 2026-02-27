Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE4FFD7F6F
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 10:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3F928061D;
	Fri, 27 Feb 2026 10:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwlIMXZfH8Yg; Fri, 27 Feb 2026 10:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DEF880323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772188298;
	bh=iH27Wp07cXTouX2MOv/Jx30AuT//49ojvWWy6X0ukzM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XOeZPIMKVasfEo7BjWpgMmbFU4RWrcRWRR/ARpALVZ+H+1v1v1uQbGMWvE8frWhLv
	 WzdPsrNEP4gytnewKyBq5VJII4cZYF/Z3RscWMIngvra8fzmCa81EENH4sjg7Z6Jq2
	 eVUrwvWbOAt31wnjhJrJXveLyvL6tpXvODFgHEfYJS8/yUrIU7RsiFwptVSL+cej9v
	 uCXzjtABJOk+CW6SkA86CKR16DOsf1A9q5BzBB+iWPVZkIQd74YxbDUpe1LjsJr7X9
	 3+Hmhn2YiwR0AFjrcJVF3HIusG6PHs/DTnswiMILfaSJitAnrU5rBDATgUrMoEd47o
	 TwUyiXTHrBJtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DEF880323;
	Fri, 27 Feb 2026 10:31:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FD381F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 10:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45EEF40A0A
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 10:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIV7sT-OtCuN for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 10:31:35 +0000 (UTC)
X-Greylist: delayed 1202 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 27 Feb 2026 10:31:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E53E409F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E53E409F5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.35.92;
 helo=smtpout3.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
Received: from smtpout3.mo533.mail-out.ovh.net
 (smtpout3.mo533.mail-out.ovh.net [46.105.35.92])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E53E409F5
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 10:31:34 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net
 (director4.derp.mail-out.ovh.net [79.137.60.37])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4fMkFH2XfCz5yHZ;
 Fri, 27 Feb 2026 09:54:27 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net
 (director4.derp.mail-out.ovh.net. [127.0.0.1])
 by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <thomas.petazzoni@bootlin.com>; Fri, 27 Feb 2026 09:54:27 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.58.64])
 by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4fMkFH1PfXz1xxb;
 Fri, 27 Feb 2026 09:54:27 +0000 (UTC)
Received: from mailstore13.priv.ovhmail-u1.ea.mail.ovh.net (unknown
 [10.1.8.13])
 by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTP id 8CFFA9413D7;
 Fri, 27 Feb 2026 09:54:26 +0000 (UTC)
Date: Fri, 27 Feb 2026 09:54:26 +0000 (UTC)
From: Vincent Cruz <mooz@blockos.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Jardin <vjardin@free.fr>, buildroot <buildroot@buildroot.org>, 
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Message-ID: <693104517.1118565.1772186066394.JavaMail.zimbra@blockos.org>
In-Reply-To: <aZ20SDo5Dxnta4be@windsurf>
References: <20260218124726.120001-1-mooz@blockos.org>
 <aZ1Cc77UDKkaGWsM@L30177.local> <aZ20SDo5Dxnta4be@windsurf>
MIME-Version: 1.0
X-Originating-IP: [213.36.7.12]
X-Authenticated-User: mooz@blockos.org
Thread-Topic: package/sysrepo: fix build on riscv32
Thread-Index: Y3HQGbVfB8nuuryoJ1o9k1b9UptMVw==
x-ovh-tracer-id: 7625438594112080747
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGGJZa1+tegd8YwQtJmozVqZawaA4ssJ73CWHWuNCnBYjFmGKOwndoGWi6snGWSuOmnfNCPh0OOrTTBCl+72jpHRrUjP9ni613ForRiUGz5nNR3tJGee9zsXiyM9aBP6YLfSI1iXMEH9GoU0pCG1RbgBMdnak3aFSeiR0wu0gywg3JBM9UhrOp2vfq0FSVOAkTgwcctImrUKLE2dtb9xKHBg4YHyulkEFOQXr51JNr3aIWUoJ0j5wYefftVLcRZo4Hu8hyKdH/uBRGq596M3jfMPJn67XybEAt4iWl0QMqgvipV9330vbK6SE8xVxx/IshTCS7Q0bEOexKnOuX8Gzp/AkXKkSfjLyGDzdssSqouHiYNRjaMSlMnO3fu51WYV96B0S8wpQxntPD1QkBsKTaz3v46p0mlPjG9CcQO+7BqG/QnDeRh6qXfcKEVWcjSfHqpSdTAhRnD4GjgcYmrAbciwLoBzxEyFLKHHwJoDK5GHxftS9f3B+s8s3b5Q9epq3SjSsT9NboeLLEf+zx7ShzWzw7MEl1V1ZhLF6J/2reeWA/f3w3QJd2zN7wGkpIQqD5GaeLNsYUukPc0vpRKEESxfEK+9k+xLFCmmlgbC7WvaA7U2gHz+84WGX62kYnQ0POhfk+PWSVSRkfTFX/RNyZem0DpRROKOjubmbSCUzamUQ
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
Subject: Re: [Buildroot] [PATCH] package/sysrepo: fix build on riscv32
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

Hello Thomas,

----- On Feb 24, 2026, at 3:23 PM, Thomas Petazzoni thomas.petazzoni@bootlin.com wrote:

> Absolutely! Could you send an updated Buildroot patch, which
> integrates this upstream sysrepo patch?

Do you mean dropping the patch file and making the package use the devel branch?

Regards,
Vincent Cruz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
