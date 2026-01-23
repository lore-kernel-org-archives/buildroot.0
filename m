Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6C3D778AF
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 20:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D8D360892;
	Fri, 23 Jan 2026 20:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oc9LiLw0Js6T; Fri, 23 Jan 2026 20:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB5A60893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769199907;
	bh=gx/Ni7Ab+GiMXh9aIr6ZveklXPUkNpaLNk2s1RhVsAA=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iMiXJcMcvgGZHLFXFvK8CxhKZPfGh4oXZh7GtuqnoXZ7VUOrIqwGdPrtpTul5n/Xe
	 MPdHNQtj19A9vVEJWN9V1mF89x4TaDkHlHoNR+WE+xvG3LU4oSVGYpSAthTErGGMdw
	 kiduZZADipXvz/JylorYe7XEUFf/0uFBZlleQCDhYaThOB1uuI5tMSDTqqpz5E0aQK
	 KtIeBlMsEy8OAb4BcECYwN9dkTjjdOCnJS8DiIw2thk+g5h/fCLFLZ2KNWbp9Fe9AH
	 HXnEdxu0KStj4bAk2CwkKiPTcLLgd5K+MeSWjG2rfNPah4rbinnum0QuPEq5RVKdqd
	 vZDpzVuiEdFxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB5A60893;
	Fri, 23 Jan 2026 20:25:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C866122
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 20:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46D2A81214
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 20:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sntuikygyCt5 for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 20:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B71FA8121E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B71FA8121E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B71FA8121E
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 20:25:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9390FC1F1F9
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 20:25:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16CC16070A
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 20:25:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 720E7119A8625
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 21:24:58 +0100 (CET)
Date: Fri, 23 Jan 2026 21:24:57 +0100
To: buildroot@buildroot.org
Message-ID: <aXPWpVcNYnWxpg-A@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1769199899; h=from:subject:date:message-id:to:mime-version:content-type;
 bh=ed42Dt4y/SNLotZEAd4B+SltwsVJbROczttoBb2czFs=;
 b=fXl0QGUOQhpyXwv16z8FPDfk1DMpUBfNY5dOx4YN501/xh9Bs6DwGkN5ZOGU6g3aITGh9+
 y6yoo1VWPz3MAgxZZbYovRNFbE6cWCy14FWgMimec5cRODAmhhac0iqGvDGYUY4/WzG96Y
 fG3qx5uU5qL5DemE/gczCWhnXUIQn3JUHlPWYJaCuiKEaXEjsB3ZNGu2M9qWxhgXIrClCF
 1sNZelro4Z9q9fZhIuSbM6/fS566n27L1ruvzYaB6YJQqD+umMhpaf8yIi7C9XOmtIe/FT
 P8AFlB26hrrjuAYTNYyJ+ViZpox+dVVvzZsxXqzw72RNZ5tjTPYoartl8db2lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fXl0QGUO
Subject: [Buildroot] =?utf-8?q?Buildroot_Association_General_Assembly_/_A?=
 =?utf-8?q?ssembl=C3=A9e_G=C3=A9n=C3=A9rale_Association_Buildroot?=
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

Dear Buildroot users, contributors and developers,

"Buildroot Association" is a not for profit organization, registered
as a French "Association Loi 1901" whose purpose is to support the
development of the Buildroot project.

The "Buildroot Association" funds the rental of the buildroot.org
server, the domain name, but also covers expenses related to the
organization of the Buildroot Developers Meetings.

We will organize the General Assembly of the Buildroot Association on
February 2, 2026 at 4 PM UTC+1, at The Nestwork, located Avenue de
Broqueville, 12, 1150 Bruxelles. This General Assembly will be
organized as part of the broader Buildroot Developer Days that
immediately follow the FOSDEM conference in Brussels:

  https://elinux.org/Buildroot:DeveloperDaysFOSDEM2026

The agenda of the General Assembly is as follows:

1. Presentation of the 2025 moral report, and approval of the moral
   report by the members

2. Presentation of the 2025 financial report, and approval of the
   financial report by the members

3. Election of the Buildroot Association board

4. Misc questions and discussion topics brought by the members.

It will be possible to attend the General Assembly remotely, we will
be setting up a video call at:

  https://meet.google.com/ipc-yfqf-dbn

The members of the association are entitled to vote. Membership to the
association is valid from Jan 1 to Dec 31 every year. To become a
member and support the association, see:

  https://buildroot.org/association.html

Don't hesitate to get back to me if you have any question about the
Buildroot Association.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
