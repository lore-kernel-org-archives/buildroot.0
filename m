Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D14C4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 11:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FEA4079C;
	Fri, 19 Apr 2024 11:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PpHl5jjqhe0; Fri, 19 Apr 2024 11:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D21B4407B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D21B4407B6;
	Fri, 19 Apr 2024 11:35:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D09651BF3B9
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 11:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC73A821B6
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 11:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25852hqbu0Bi for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 11:35:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=andreynech@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B43382023
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B43382023
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B43382023
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 11:35:00 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-23333dddd8aso1293619fac.1
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 04:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713526499; x=1714131299;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZSblagJBYV7eBXNW2RDmbJblJuIg2wYAAgNZ2itA54w=;
 b=xIm9csseyil6caockuDLZzjpq7ub5Op0eP1RO4ff3p35V3gV0elJ9oxOav6ItEmodn
 1C+fQ7mGGZ51Sk7QW+L8AyuMrInYVQZU8Gmb9+VntGhZEWz5V46KG5SwOcUJ5hvlC6SU
 V6pPCCCdDSXwvxNQoahGnSsX2Kp+6qDkjgj4uLtyIsJO6kq/W+ZA2gF9qbmywoRgt1hm
 9blVjii57ckTz3bH2czWSq9gf0Qj1VnFkYl2maczKMA/FKszq16jqUv7u1DuUgcVyFhd
 4A/pZPhaZicdAdY3QIVN2V8Q/ZOtwssAAeQIwpq2RngwyAX3sxcQRnb8u8gpkF6qJdgu
 EBqQ==
X-Gm-Message-State: AOJu0YxZBuM3KeFyYJpTEph0UqKx9AV1l+tukIwAHvD5INuT8bGvFI1f
 D1lLpaOkKMvjzkbOsMNipnsjbFHSNZ3a4rHPJ61mQybK+dNmu6/NGZf+HAd97q4fdiUeDwr+XFU
 AxzUmLWvDQ9nVQRFAmMtDf01nIl4tXFt9
X-Google-Smtp-Source: AGHT+IGujLZoalczxHcUwkKXVI1nMuqzJ2ZXyjGI3KSU46YmaGYj9YukD8wtDU45n7Rls4SQ5d1geTK7np8lG1ohZ6o=
X-Received: by 2002:a05:6871:203:b0:222:90a1:596f with SMTP id
 t3-20020a056871020300b0022290a1596fmr2104384oad.49.1713526499548; Fri, 19 Apr
 2024 04:34:59 -0700 (PDT)
MIME-Version: 1.0
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Fri, 19 Apr 2024 13:34:48 +0200
Message-ID: <CAOiXNkDTjbvmeyAAqtc+Bj=QKxdHLxXS8EtR1rFi_vs9A6Dn=A@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713526499; x=1714131299; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZSblagJBYV7eBXNW2RDmbJblJuIg2wYAAgNZ2itA54w=;
 b=RRwRnwB1vvsRTJwYAoGl2baXc2cJeqa83NDvfTxYXWPVX2Rb3tqkDRyGkNBYDDrOw2
 A/x/XdwIMfc+09NsDRHU0fY+zV5+F6LVRgnOzEQqXnhOlj6RhQFe6YQt582suMVAhoCy
 fLL0M33m4YeRBgpyEb4QtUaeAp9mQnDEAiwG2wPfrBQWtlye4sW3s+wImNb08jkdjIEs
 +l5Epn44RwiOT+GrmgsEZtRzRd/cnAyl3Pcm4migLPv9Ybh6B7JWVlmLAqjeOwBoxQc/
 Xu6EZQvTrONdoQ0QZ6JnhNFAC65aBY7mq+hyy78iWQjCZO7QUY8r7gmA/yrxioPOsjQw
 hu0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RRwRnwB1
Subject: [Buildroot] Growing rootfs.cpio after each make
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Buildrooters,

I have BR2_TARGET_ROOTFS_CPIO enabled and just realized that every
time I run make in the build directory, the images/rootfs.cpio file is
growing. Even deleting the file before make still results in an ever
growing file.

So I am wondering why it is happening and if there is any way to
prevent this without running make clean all or similar? Maybe some
kind of pre- or post-build scripts?

Thank you,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
