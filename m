Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD997C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96C264048C;
	Thu, 27 Jul 2023 10:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96C264048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqo1eCkqRkr1; Thu, 27 Jul 2023 10:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9752409E7;
	Thu, 27 Jul 2023 10:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9752409E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24E251BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4D1C403CA
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4D1C403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HMEItz2GbRE for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:32:38 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D69644025D
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D69644025D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EC23E000E;
 Thu, 27 Jul 2023 10:32:34 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:32:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727123233.732963b9@windsurf>
In-Reply-To: <20230726200244.1699373-1-bernd@kuhls.net>
References: <20230726200244.1699373-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690453955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiwXYJ8sqnroyfC/Zh32SQaKxnL3PSPHmJ8pAzdKjzI=;
 b=CbaUIojE6roTlEjiXLJ0kXL+WfPSqdS2boDLrJWEPEGqvJr9Gl1+zK/VRAd4coLDKgsOZ2
 h3RXKdi3p4CuYSIiWoQC+I7Gc6GZOSflCXtaGTyLXG/Jqq7fnxi+BUGG3JNmudtdcuEKUJ
 Ej2tu6kFvwQbF2IeeEH3eh2p52zYX7bYABmstZ/cFHm0j2bXbtF4rdUF9EijwCNH0TU/ty
 0Vncx4ZsWyVIYi1ukJ0sTcUDN1md4N0blEANw5BKNOIZASbJuydHKDVnCIlZhIhVRaPqeF
 2df+oQQBZ3WYDN0qfVqVTzZMyOCtNpZON5svp6rpZFVXOsmJLVUwaWsatXHjBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CbaUIojE
Subject: Re: [Buildroot] [PATCH 1/1] package/optee-client: needs MMU
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
Cc: Etienne Carriere <etienne.carriere@foss.st.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 22:02:44 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream added fork() with commit
> https://github.com/OP-TEE/optee_client/commit/492410dcb78f07677524e1d932c86260180ea72c
> in version 3.19.0 which was added to buildroot with commit
> 917a961d9c77d5f1aaa47206add9b9ff80e74a82.
> 
> Fixes:
> - version 3.21.0:
>   http://autobuild.buildroot.net/results/f81/f819828f11330d928df1a236bc8f83193a8a6315/
> - version 3.19.0:
>   http://autobuild.buildroot.net/results/e7b/e7b5c6f16083435a2e76bce00de718cf9d8c6a5b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/optee-client/Config.in   | 2 ++
>  package/optee-examples/Config.in | 2 ++
>  package/optee-test/Config.in     | 2 ++
>  3 files changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
