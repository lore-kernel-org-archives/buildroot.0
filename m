Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF93EFCE2A
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 18:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377D381099;
	Wed,  4 Mar 2026 18:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1yavI6QAvtp; Wed,  4 Mar 2026 18:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D0E4810D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772647613;
	bh=8G/uyt+Y8R2o4laAe0l1F31+Y5AMmM2jp8HjW23lvfg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h1imxklb5Psx4XTIJcUvmldV/TVAvUietUzyRMDq3hMEuUsejIl+MsnfWkQbxlZ+I
	 JzFL6ePbKOfoipUxJzd92RXcyIlEjUAhrgNMGJVV2y/2svgmDUi4gcT7Y3Yp9ysRC2
	 dMv10Rytfv85KkuZbHIGdgSHCyq2Qu5e1ccEEVb6xA7VBNNIFNtEhmJJBOlerKQlGg
	 EaaZzPtmDqzVlQQNuEm5nJqUK2kM+aSsb3FS+S1QaKnPxD+cMpLMJgNAxx+Z1J01JV
	 UK5y8jykGx+EXFsoJuXnY/afWWD28ighZ6Fo4o6yGG6CVbbzwRZnNSMeujgHChG/CL
	 9vAzhweFcaTXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D0E4810D5;
	Wed,  4 Mar 2026 18:06:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EE72F6
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 350C140A38
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RoR8AIoSf5I for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 18:06:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14EAF40742
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14EAF40742
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14EAF40742
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:06:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 978551A2CB5
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:06:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6F7115FF5C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:06:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 96D2C103686F7; Wed,  4 Mar 2026 19:06:47 +0100 (CET)
Date: Wed, 4 Mar 2026 19:06:46 +0100
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aah0iZBpGbIiu6wG@windsurf>
References: <20260304-openscap_nptl_threads-v1-0-9dff92cc37e0@bootlin.com>
 <20260304-openscap_nptl_threads-v1-2-9dff92cc37e0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-openscap_nptl_threads-v1-2-9dff92cc37e0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772647608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=r9Tho4k1ryDTmDx3MgbhH6iao5GpCLW/SdtBICx66P8=;
 b=PAYlveB9ET23j9pRQVe0nMjIrWajJuqzd9f82iIT9Rgw5gIKhZltgVT8WWCLz6SO31TezF
 aynNXSKeGhWj37ppLK6ZxMnJVUmJXEtKH3HKBHsPAuIZojTCduRsIU7RNuRc8iWWAqCWtr
 nESoZOmuW7iTCN4xFEOvqpvDGw7biljw/3OKbgpfIiggGgmonbsCtdpD48EtEzY+nEQU1c
 dMz7MAkCsFSlop8MNqkR+ui0FQrGn9buTUkWIYhkE7bfnU3VpCzzMsWPLWMcP+9f2xQjRN
 EdvcPdh2xE+HW0KadnpwH1XbTt8n0NcCkeIYY4AQnb4PHr+5cg/fTr/TO7BgDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=PAYlveB9
Subject: Re: [Buildroot] [PATCH 2/2] package/openscap: add dependency on
 NPTL threads
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Mar 04, 2026 at 09:22:40AM +0100, Alexis Lothor=E9 wrote:
> +comment "openscap needs libgpg-error and a toolchain w/ dynamic library =
and NPTL threads"

Should be just "toolchain w/ dynamic library, NPTL"

(and of course rebased without PATCH 1/2, as it is not correct)

Other than that, looks good to me, thanks!

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
