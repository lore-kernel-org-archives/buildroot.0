Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62C8EE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9520660B44;
	Tue, 30 Dec 2025 18:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCntumFZWYda; Tue, 30 Dec 2025 18:15:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110E96077D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118555;
	bh=NrA7XdAefT8eyBwWPcSH8X8Ahr2gavSzPptMnCJkIs0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eL2k+ZixPs0rWYCe45MS9OeWMviJJu/ucRVUGePVMGtTLd2hpsuD4B7A2NeQInsno
	 f1koeyb/GfuH6cfvRdtlSiYtrIUrYILpUcOjQMAgTL36k2cVxM+sU9mI2Kt2K/qKhX
	 znkXCa9zWJt5mbnsT1CZsa6Er+HD/ZM9BPjJ8Gm5lTBXXiWAzdn11DAFAvqLCMoT+8
	 FrvhPgUS8KtmuzVDkgbkvDN5B3RVqeLbgKsd7c6evM1BLlvpQGJZ9/VRYPabS5Yk17
	 LUPSnT2IQ2C3niscjkNw7EqaHQsaIu4VmWnMZlWtMRIAL/RzdBsHGQ4ANapXKONRM1
	 UHW0SJOKW6OZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 110E96077D;
	Tue, 30 Dec 2025 18:15:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80A49177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D7916077D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbKqFwW3-bLu for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94BC760600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94BC760600
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94BC760600
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:15:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AD3E21A2544;
 Tue, 30 Dec 2025 18:15:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 850336072C;
 Tue, 30 Dec 2025 18:15:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B1D16113B05B3; Tue, 30 Dec 2025 19:15:48 +0100 (CET)
Date: Tue, 30 Dec 2025 19:15:46 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, Angelo
 Compagnucci <angelo.compagnucci@gmail.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Matt Flax <flatmax@flatmax.org>, Romain Naour
 <romain.naour@gmail.com>, Simon Dawson <spdawson@gmail.com>, Woodrow
 Douglass <wdouglass@carnegierobotics.com>
Message-ID: <20251230191546.696b3893@windsurf>
In-Reply-To: <20251230114545.2236640-11-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
 <20251230114545.2236640-11-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767118549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FrJJSoME9HN0Rj2ccFAAAust9PgJBLjXY+qn5S7TGtc=;
 b=iA2PMseGfa5CeC1BdI5AQdB0hAoV9+KY+CoMUvqORVVxFY3JxSLAV8MVPLfxq1iO00qubf
 YjjLUHlfUAM9fW3odKzpyiKI4UxKj+7UrtugP77k45HSElYReXbOmwpCeun9g8otZpvxgk
 WweSJ0+pPdJB2oG70Ck0UZp5KP8eCQ+4lG0niiF0HW1ODAh02cLkKC27cguzW0KeltxLmC
 iBQnd2Rsj/Gzb0zMGlKzXfiFaDsuHfUDBBtFyaeEDDVUdDWYyj4j4wCjeoPAeb3wVdoieO
 qPRPMLqMJ5fkbiAXNOpWhOHwUilMfT3pM6n3OWZ0n09MFeQtE4hmPzkQemaBHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=iA2PMseG
Subject: Re: [Buildroot] [PATCH v9 10/19] package/cppdb: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 30 Dec 2025 12:45:31 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Analysis of https://sourceforge.net/projects/cppcms/files/cppdb:
> last release: Jun 2012
> last bug report: 2015
> last patch: 2022
> 
> The package is broken with cmake 4 and no other package depends on it.
> 
> There are no known autobuilder failures for this issue.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  package/Config.in                             |  1 -
>  package/cppdb/0001-mysql-library-suffix.patch | 23 --------------
>  package/cppdb/Config.in                       | 20 ------------
>  package/cppdb/cppdb.hash                      |  6 ----
>  package/cppdb/cppdb.mk                        | 31 -------------------
>  6 files changed, 82 deletions(-)

Config.in.legacy entry was missing in this one, so I added it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
