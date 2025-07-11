Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5632AC83F22
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A33F61485;
	Fri, 11 Jul 2025 10:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEeUea-1XLXG; Fri, 11 Jul 2025 10:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C051161478
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C051161478;
	Fri, 11 Jul 2025 10:44:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6663D199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 620F76142D
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmbCP_eDv8Xz for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A84E0610A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A84E0610A8
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A84E0610A8
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453647147c6so17738655e9.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230681; x=1752835481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aUaDDMSpLZ43MD+3bOlETAAS6+vihuZOV6v5t1zQNEM=;
 b=qqSNkoBbLq35Z81g2C7sgfWVQVfUv6msK2gNSSbQV6CnB8iLrJoX+69MqB6I0/Rfej
 E8rqM92ZvnmtTjn8KaaR2UOUXtuB3pY/flZfTdtNi+RTkvcyqtMJwo6Xb8JrHc9UXq8D
 LIa3PwzwJ2oeqkMvXx4EAf4Hc73BseQ8uNx1vqaNBG7Rqmo5SFD0K0pqR8t7ASkrv1HD
 mVw3bPFTQMB9q9ZeV3GiZF9JSBXLJaUhKMXGnBaqK++I/86L9TLwXuwfo3tKLVGFgeuk
 Q9OPb41ct4JLzq47iTJm06EjF8d0nGnFsMYxaGuSi3PgTR5wB8FTuqulWR9V2nN/J6e2
 lbig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaixUXDAZ09dSXIFcSqKIWx4j/18wcUtZY94AWoPAUgGfDyIE95A4IXERXr9q6Qc/tc6sunAytYOg=@buildroot.org
X-Gm-Message-State: AOJu0YxBcXh6sIlqyuChuH+OeboORLLrKyYI6y0JUpDSiqEXAJZqQ65e
 /lZqCHJXsClMX53iUoiD+M+Q8pKU8fuXpVlvL8HcyGAqcRZAljeZYAw9zRG2V/x64fmwo6t4CN5
 it/gS
X-Gm-Gg: ASbGnct2pEvir3UltP9FwJZmks485dbjL4T20JfIkuOmWWXk0nFdrwF2s1VahuADjty
 wfrcWg9qSWWaL2xxd7bJdbeA6xgdPA1bljOtDYNHufPe4ES0pcZa9OcAP7i65NZEn1rRXec+XDs
 eozW0ygFvLit8UTtprxE2nKGmhh4Tk+acIsDSBdHq/zyR4jNdGjhH48mGkFsAAbV32ef2HjEu6O
 RBMFU0KR05iPY8UfRXRvGyTOzxS/RmSaFblPWFoLxl46bjOmuQpZ+FVnaVGyP3FLtbXNQNi7NRg
 1iZGnD+4hU7z7sDKO5Nc7VU3oQmsV/qdfOfs5eYkzJ4weRkNbU8Z9beZvkIpzTRn9EZ+Efei2pU
 kD0XqiHlLw6HrWQ==
X-Google-Smtp-Source: AGHT+IHKN8U+3Sagdi8g6EXLDNgRrs8g8+0nfHmJIXdXHEgJPhYjPPjOuuzH33Cd+xK+FUAC45xNKA==
X-Received: by 2002:a05:600c:8b71:b0:455:f59e:fdaa with SMTP id
 5b1f17b1804b1-455f59f090bmr1984435e9.21.1752230680714; 
 Fri, 11 Jul 2025 03:44:40 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc22a8sm4238297f8f.34.2025.07.11.03.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:40 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:39 +0200
Message-ID: <20250711104439.823544-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <bcbd271754126b79b0b42df3ca88aedf99d9a600.1751378952.git.yann.morin@orange.com>
References: <bcbd271754126b79b0b42df3ca88aedf99d9a600.1751378952.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230681; x=1752835481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUaDDMSpLZ43MD+3bOlETAAS6+vihuZOV6v5t1zQNEM=;
 b=JsxDuDLJKaEna8cvgP4DKe3l3cGgcoe2a+PvLyJ7pUE5iqM6xOUM0q3mvXEDzavvOR
 RaG8z4OO4gphOqgmiA36CA6nSftVs0JcUtmF7duFuvChc4M+pFeC0mWBoKrSlnHX4vhX
 8clwKkft4gjSdf9BDYUh7qd1a8/Cfkw79epABSN6YeEZchoo9FzJ7jTXDrU8LCljgHoA
 UZxPDN2feRbS0PaaIdACBnn0Vl8SVIZmU0/dipPyDzrSnQM5lW86I6v2tygaJrawSSEb
 4ktE7l/eTK+pnVEcLoFIVMTnympUwR3gI0WaJgg7C67Jdw9qA+nAbd/siaz9zLff61ZY
 xTUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JsxDuDLJ
Subject: Re: [Buildroot] [PATCH] support/testing: enable lpxelinux for
 syslinux runtime test
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
> The syslinux runtime test (which is in fact a build-only test) ensures
> that syslinux does get build at least once a week (via the gitlab-CI
> weekly pipeline). Runtime testing would need much more work, though, but
> nothing in syslinux is currently runtime tested anyway.
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/boot/test_syslinux.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
> index 41152cde7e..17fe904263 100644
> --- a/support/testing/tests/boot/test_syslinux.py
> +++ b/support/testing/tests/boot/test_syslinux.py
> @@ -21,6 +21,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
>          """
>          BR2_TARGET_SYSLINUX=y
>          BR2_TARGET_SYSLINUX_ISOLINUX=y
> +        BR2_TARGET_SYSLINUX_LPXELINUX=y
>          BR2_TARGET_SYSLINUX_PXELINUX=y
>          BR2_TARGET_SYSLINUX_MBR=y
>          """
> -- 
> 2.34.1
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
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
