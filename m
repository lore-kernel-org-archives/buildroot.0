Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99DCC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 19:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3766980E69;
	Wed,  7 Aug 2024 19:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RM9e5sPTDIig; Wed,  7 Aug 2024 19:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DF918136B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DF918136B;
	Wed,  7 Aug 2024 19:36:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 145FE1BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00F7B406BF
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeqPod_xLClH for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 19:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E639406B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E639406B0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E639406B0
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 19:36:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1E79FF802;
 Wed,  7 Aug 2024 19:35:59 +0000 (UTC)
Date: Wed, 7 Aug 2024 21:35:58 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240807213558.4abc7e85@windsurf>
In-Reply-To: <bad5f692bff295e22fdebc46c043a661@free.fr>
References: <20240615091612.9579-1-ju.o@free.fr> <Zm3Y7Fd-Zpga_LAv@landeda>
 <bad5f692bff295e22fdebc46c043a661@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723059360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNWFj83XukvzdVTcqyT2OhBQB2azl0aKmD+1IM/P2+s=;
 b=VD19KO+V9aqyAtGMF1lHY+qZWy3fV4sGb5t/F8J+cA6qG6cLGhHyRNWSRx8TLfyjYrF1AS
 tXJElki/x9Rsq7Kw910MKu7JFR+YH5p4PWDkiYxOi8J2TggUyrQYVj9fb2wEW3Emfm3eHO
 lpkLkS8gUKgL4pRW0Qi3JaUoMLSQz3cgwc96bQfsSKjikwDWvsroorYuUVExNG4HHpJ6yA
 KDQGB+tq3fT8Pt+cqPniVKZAcXFhv/K+6nzE/+91duDlx+OjxDRO8f+/Ss0BMe68WhiuWK
 QIfRjcQ4vxyUvFFVko5ZR4h71i5B+TZHYcp7zoHXL7qWUgB5ey6q5GtTScLdKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VD19KO+V
Subject: Re: [Buildroot] [PATCH 1/2] support/testing:
 test_audio_codec_base.py: new helper class
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Fri, 21 Jun 2024 14:40:20 +0000
Julien Olivain <ju.o@free.fr> wrote:

> Renaming the "test_audio_codec_base.py" file to "audio_codec_base.py",
> and the "TestAudioCodecBase" class to "AudioCodecBase" will not
> prevent the test to be discovered by Nose2. This will prevent the file
> and class to be selected at first. But if "__test__ = False" is not
> present, it will still be indirectly loaded from the TestLame
> import. This can be seen by adding "--log-level debug" in nose2
> arguments.
> 
> While I do agree we could rename the file and class to better show the
> intent this is an "abstract" class which does not include a test, I
> think the "__test__ = False" needs to stay here to really prevent it
> being loaded.

Apparently, not. Look at:

  https://patchwork.ozlabs.org/project/buildroot/patch/f57167b1488b3c5ad76362dd8bca1b12d281aa19.1696522656.git.yann.morin.1998@free.fr/

proposed by Yann. The abstract class doesn't start with Test, it
doesn't have __test__ = false, and it isn't considered as a test by
nose2.

Now, look at:

  https://patchwork.ozlabs.org/project/buildroot/patch/33ee4b08c20f9c4566cfe82c648f01599cab70b5.1696522656.git.yann.morin.1998@free.fr/

which uses multiple inheritance, doesn't defined __test__ = true, and
is properly considered by nose2.

Could you have a look as to why this pattern wouldn't work for your
audio codec situation?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
