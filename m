Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A775EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D978661290;
	Thu, 20 Jul 2023 21:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D978661290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5M0D-kJ4e0Oa; Thu, 20 Jul 2023 21:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3419160A64;
	Thu, 20 Jul 2023 21:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3419160A64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6A21BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8DB560A64
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8DB560A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26FuX0eTdp6H for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:17:23 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79DFF607A4
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79DFF607A4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AEDEE0002;
 Thu, 20 Jul 2023 21:17:20 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:17:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720231717.33ed6806@windsurf>
In-Reply-To: <20230720185445.1375987-1-bernd@kuhls.net>
References: <20230720185445.1375987-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689887840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vw0+gGSnNyWz2kjgknB6IA9ucCmbtdtJL5S8JTfeKGI=;
 b=m9jTfrDOShOZDlrpzupeZTfDsjWM8c0PLMc6Q5bcq69GOwsmjWTlwyFii6ZNSyHetJ9sWN
 dJhKSipdHr9DMSugY8+kBAqaes0uL9Niak2XaTNYrS8LMIW7j8NJMbdyAg5d9PJU7jMaC8
 BOR3rHzZrEqRtBJInN3+LOO/ZfP9SSxPXld8SwZbFrzmOfhsY/94SO4euMdZX0B3gbGZeA
 1zG5HEC2v+j8vszXN1fmmudhjr6fzlmrtd3Mt5xvJ8D6jg+jYNdaPhUJxcAZNyCqfH0SG6
 RVShF4IO5iBK/cCmEkJcaqXKwokgQh25QEzCt6Rq5/3zcE4sj5eZIOAbDtz6VA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m9jTfrDO
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: link with -latomic if
 needed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Jul 2023 20:54:45 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/fb4/fb4c6a97ac666a3a75345229a320769df6c0a909/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/opensc/opensc.mk | 4 ++++
>  1 file changed, 4 insertions(+)

I continue to think this is not the right way of handling this issue.
opensc is using pkg-config to detect openssl, so it is the openssl .pc
files that should have -latomic. This will fix the issue once for all
for all users of openssl, without chasing them down one by one.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
