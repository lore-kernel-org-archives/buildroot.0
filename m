Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CE3C0219F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F7C40791;
	Sat, 14 Sep 2024 14:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BcJhvewB9AMj; Sat, 14 Sep 2024 14:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D592A4079C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D592A4079C;
	Sat, 14 Sep 2024 14:44:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7876D1BF28C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6634B407AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBCWvFUPbVXK for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 197EC40791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 197EC40791
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 197EC40791
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:44:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7B3E20003;
 Sat, 14 Sep 2024 14:44:34 +0000 (UTC)
Date: Sat, 14 Sep 2024 16:44:33 +0200
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20240914164433.099cc252@windsurf>
In-Reply-To: <20240912090246.618903-1-christian@klarinett.li>
References: <20240911140214.2479977-1-christian@klarinett.li>
 <20240912090246.618903-1-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726325075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbTAjpNbtRifUqs61yMWKAgFwdlhIqaYTcMH0TlGYYI=;
 b=CA7XmUeML7qFZAJPmF0htkJcHYEptD7APuT42dR6tiKay8zy5oHxdn0Bxiic7ytD4Rp3Xh
 PjjiI+TOB0OpHaSpt5g+3BPghOOplCycmJasLIdj1iA6xcYFPsv/kvbnPHpw+i0x6GFsU2
 0Z8EmqwarLC8dq+9ehTAcjwk9SUYD7E5dTjurUGGJAFEN/4sGIok/wZbEroQDGPe6PQynA
 ir/SFGxHvf7vJwJiqlbcxe2rKXXTJkIzLNZy6o/zp/Lsf8s9wlLcDXVxdy2NXiToOiDwj/
 nb/ixOtiOgPabEvpRUW3RxCAFEhNxsQjnFo+JFn04ccGWdsKLc2HpcYFZswWGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CA7XmUeM
Subject: Re: [Buildroot] [PATCH v3] package/qt6/qt6scxml: new package
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
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Jesse Van Gavere <jesseevg@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Thu, 12 Sep 2024 11:02:46 +0200
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Cross-compiling requires the host variant of the same package.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
> Changes v2 -> v3:
>   - mention StateMaching and Scxml modules in help text
>   - fix typo in QT6SCXML_SOURCE
>   - add host-qt6declarative dependency to host package
>   - add BSD-3-Clause for buildsystem, examples and QML files
> Changes v1 -> v2:
>   - make dependency on qt6declarative optional
> ---
>  package/qt6/Config.in              |  1 +
>  package/qt6/qt6scxml/Config.in     | 14 +++++++++
>  package/qt6/qt6scxml/qt6scxml.hash | 11 +++++++
>  package/qt6/qt6scxml/qt6scxml.mk   | 48 ++++++++++++++++++++++++++++++
>  4 files changed, 74 insertions(+)
>  create mode 100644 package/qt6/qt6scxml/Config.in
>  create mode 100644 package/qt6/qt6scxml/qt6scxml.hash
>  create mode 100644 package/qt6/qt6scxml/qt6scxml.mk

I've applied, after:

- Adding an entry in the DEVELOPERS file
- Taking into account the comments from Roy

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
