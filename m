Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD05BC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 11:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98FA760AAD;
	Fri, 11 Jul 2025 11:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXa8ORHbZ7rq; Fri, 11 Jul 2025 11:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958F860B27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958F860B27;
	Fri, 11 Jul 2025 11:10:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26A4E1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CF0F408F4
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vjw8TMD17nV8 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 11:10:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFCF0405F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFCF0405F0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFCF0405F0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:10:26 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so1970648f8f.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 04:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752232225; x=1752837025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjaHmj2rXz5Nt+1lfik1xUZjsu/FOdez4ucDPelGMtQ=;
 b=PMY3LmolAD6NouYIRV69FmxXL/LANZe98y05RGzkehKyuibNyCpj/8Wfq1+rF51cW/
 ykqrSAaGtILonPITMiV78wi50t4Fqhqi1Mp8xC0rBNktUjoA9AUnvc+kwoCEwouJ387I
 s8SilN9xYdvG9HVTW80AJeDkjxcM9Ht5JYSSAdhF+LDd7hz7ptGNIZBnzjELyD8X3KO+
 B0fl2cwwpv7IWsJ18GjmEp8N1ZMaTelIy1nTXMmYSNaNnwEkzNQ6o59CpbL2rcj5XuG0
 lzTsHGOMtDWBq/F5BPFAa1qyJ+u2uNSaicuSerjfj0n6vGAcZRzznoWNet8hYNRvOl4o
 cJGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtywkL8TF7bLEk19s6gOLi5CLO5AqlWYmGoxdJrsvfXFKbcDHa6mpZo7lHPmHxwpZ1yru/jlTPyok=@buildroot.org
X-Gm-Message-State: AOJu0Yx87kc2R3nwT2X7n5FbUX8+Vde6lFh0gqCcfRM/nOwNzYXXCmAY
 jV07DCeuTB+cwp5ad2brF1t/YfSjYZU/+UjlrpNxvYTyYDkstj8+50ULeuWTSXudtPc=
X-Gm-Gg: ASbGncuxAzey9Otl4qYIeTHN+3DMhaZS+t9GYwDwnGS67PRrQfNfZ9D5o6W4WoYSxcb
 voTa6KXIwSIzW92WfFToPqKL3Hnady1U9HpWTO7OLbAnDkfBOMUcC8Q0dFTdn45DEhSqa315oAb
 JqCP0eMJKNhUUEDM/F3v9d/wT+/yRGsvQKrrVH89wPOBKOXEcothXKVoYLqS1H5mVE2SV0WcdtA
 m7UvvDWqCakQ+3Dc9YW2QzKBcRKwh0LPqDDisoJIvvdX1LssIuQG9xzxUoCsHjCleerusFbuYvp
 FUnjpkBME7zDaL/ZFdJunyPZHlmr6Xp81NcKiovwaZxF0XTBUQXKA/BfNR8oEAjUoU5q/HmvVfL
 LMZg/rWSfTLaCWfjBjK4zf6B4
X-Google-Smtp-Source: AGHT+IGRNmEk7zoXElnh/kSxsxyOr0xM8xb1PKQB8kxjCWwJe/wcmnODhmPoE74fapyjJsV1Almx5w==
X-Received: by 2002:a05:6000:250c:b0:3a4:cec5:b59c with SMTP id
 ffacd0b85a97d-3b5e7f3b047mr7363756f8f.25.1752232224932; 
 Fri, 11 Jul 2025 04:10:24 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5103082sm81316125e9.29.2025.07.11.04.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 04:10:24 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 13:10:23 +0200
Message-ID: <20250711111023.856708-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aHDraIU0IcOvOYkC@yd-6wlzhs3>
References: <aHDraIU0IcOvOYkC@yd-6wlzhs3>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752232225; x=1752837025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjaHmj2rXz5Nt+1lfik1xUZjsu/FOdez4ucDPelGMtQ=;
 b=ePIpf3OcLW1xUZ6F0XOzSoq/4OSOjsFxQtETUwnaZZtNjUurzn4VyifZyqlDD4CvvV
 X1JEPVjvuDsFxtCJrEPvPxSJnPL12em7BGiErpRQWNHINXNuKBJyz3Tso5khMFyJbWtN
 aaurwPjJPxOj3M5Hw/sVw9pDRlvaDmpfff3juVqArKBdJi8kVgMIq5QnX/hx+0YNalHq
 THXVSC9Cy74zVCOrrBaYscXtxyCXNQOzsC6C2rm5wUyrVRQOwwZf1s04I2LTHasK4dhG
 UYFsI7eIugDHXVNu5FDKsiRtLpXShFKkIitSHFfUtx4IFm2SF8LO3tWoIQvLuAMwRmfk
 pzOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ePIpf3Oc
Subject: Re: [Buildroot] [git commit branch/2025.05.x] support/testing:
 enable lpxelinux for syslinux runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Thomas, All,
> 
> On 2025-07-10 11:31 +0200, Thomas Perale via buildroot spake thusly:
> > commit: https://git.buildroot.net/buildroot/commit/?id=5d6d1da5e4da4c4184e16b06c6f8deab9eb8217b
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x
> > 
> > The syslinux runtime test (which is in fact a build-only test) ensures
> > that syslinux does get build at least once a week (via the gitlab-CI
> > weekly pipeline). Runtime testing would need much more work, though, but
> > nothing in syslinux is currently runtime tested anyway.
> > 
> > Reported-by: Julien Olivain <ju.o@free.fr>
> > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> > Signed-off-by: Julien Olivain <ju.o@free.fr>
> > (cherry picked from commit a6ddf2b91ddd037eaca947fdc99135f63fa0755c)
> > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> 
> Why was this patch backported to 2025.02.x and 2025.05.x?
> 
> Installing lpxelinux was only introduced in commit 48639f074c31
> (boot/syslinux: add option to install lpxelinux), which is only on
> master, and was not (and should not be) backported to any previous
> release.
> 
> Regards,
> Yann E. MORIN.

Hi Yann,

Thanks for the notice. This was indeed a mistake on our side.

Regards,
Thomas

> > ---
> >  support/testing/tests/boot/test_syslinux.py | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
> > index 41152cde7e..17fe904263 100644
> > --- a/support/testing/tests/boot/test_syslinux.py
> > +++ b/support/testing/tests/boot/test_syslinux.py
> > @@ -21,6 +21,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
> >          """
> >          BR2_TARGET_SYSLINUX=y
> >          BR2_TARGET_SYSLINUX_ISOLINUX=y
> > +        BR2_TARGET_SYSLINUX_LPXELINUX=y
> >          BR2_TARGET_SYSLINUX_PXELINUX=y
> >          BR2_TARGET_SYSLINUX_MBR=y
> >          """
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
>                                         ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> |                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> | yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
> '--------------------------------------:______/_____:------------------'
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
