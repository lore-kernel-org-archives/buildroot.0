Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7A5CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 12:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B29F81323;
	Fri, 16 Oct 2026 12:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SlKI7YZ17DO; Fri, 16 Oct 2026 12:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6C59D8142A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792152411;
	b=L4Y321RxC6xjJ2qTFNPwUPTbU3xBPhFfbJprwjSg8NC7SwYeBOMC8uIgtOKsCNTcT4Sf
	 zm/9V3S7dxVu6cFFbms2rIneSMq1npmdXB0S0eYQykWodXJcPwjNa8Q53g7d9Tcs5fD3b
	 ROqa8ksPdtE6qZRBHrcQcdla40ELAg5535u+xnJnrRC96OLgifQwTnknofsD8CJz4orYg
	 rccxxVBTDumg325gE8lSTmdDtstVKC3XWseFIJLWXJwNYbR+NZ4Rr731UmyZvj69ETFNJ
	 +yoLLvFgyACjASsdNga1geIkIW+JT46ejA/g0lYKeBYCPZKUTTlmUH8m1I53TBKLm8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792152411;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=uWuGuX86xkBARpk5wzZEaNN0e3hRyINrZDFTbppESBc=;
	b=K+PCSmVVWjId1O1IMHXKz6WrSApgMwsVG9DhR/pA0DZZRH8FJvz7Zgjepz7MpzzaWHCH
	 +gvMtVWN1L6aJ5pzChEhI7sFnXp9xbeaq8OjYOaN4Zb3OayUE3+0Up8wb3+aFdj8KFD1q
	 tRDA77j+TdHIilLcRo/Ks4ZKo7+xPfKYelg7vpk+wGc2mw7icXtUgJJdRRQNsqdH+FiN0
	 oypqkFZ0OR7+xfzTtH/FOeVHkJlo8bprkTxWYBU/c6zQvnFIu6FHl/Q3gg+JcTDvbN1TE
	 Zie57GGq8fjNKertyW637GKnXWAO+4isqM24YQf3q2Pq8A74ESGYbjuGGD56OMrR7vg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792152411;
	bh=uWuGuX86xkBARpk5wzZEaNN0e3hRyINrZDFTbppESBc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gMXalWHqOJruiRd6Si7IqKGBmhRMANxQX2QU/kG1HaAAKpm+tN+EaMYmtn9ZFXQwZ
	 rpRaGjHqFi2Gh272B0EKRnN72degoNYMAcZmiRdl1AjP/hue2S11qRh26s11KDsJLG
	 A/ioOfgOV0cCR8M0b817A9TcmRfkG05AzERyP5kVBqx0YF3sTDCBMGhTawxvd9JWij
	 ZAhbeTNGsuqg1yl5IeFqNXpwMRghzE0VZnsK30y62oqZSMZTfdDNd6ze+RCzA3EqKF
	 aWRjhX2sCWHoGBx9KrSiQqSn3y+P9emfZU9xJGBCWCyOE8D9euX3joSCoOES4zvVoW
	 pmoZRDwgrUL5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C59D8142A;
	Fri, 16 Oct 2026 12:06:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CACE75
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E7864046E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wc0JX-iWtER6 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 12:06:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 534864016B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792152409;
 b=tJDBjyrMjOeViPgiHjL66PKDIJob7Ik+rwsL/yWrnpafg4DDsPWGBPTiZneIgHm1/Nue
 et78MD5fbD7edIY6qudHvWoaXV/OT+uEQDH7x++f7zSfqu331DhMWqa3jOB+JaTskiM+0
 QPv7paVfqKhalhBtnKdfI6aP5dhQDgaiMYC2Ck6lmLO6fkyA77hvduS923puYArcyBpwj
 iBfeUs4GBi/DLjjd1CwLlhYC43yvam2Ei5CfcwPletLUK3M36qWzlkEWimWuHKLCrtieD
 YJwnAV13hS34GGLB6Fs28zlJPsrSNiiFAevUXcH6nHIDbIkg4fkkZZwJZiCtUbn+SzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792152409;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding;
 bh=rR7TdBXiKEVicRYpdxovakPPjqPQHFotCMfy8aSMbqA=;
 b=FerNVcdf8xJLYlDOYqhCc+5u2TkpKicAw9pInLOm+FGBI/TNUFlCIlFhWV0T8XU29afi
 MUc/sXQs03HLqZI/UpkXbORBL0dimwW59rD3AXPV4QEvTsbTlDmfcaS4egztIgDTyH/Td
 B1mdcgptj8bDg8E8Ek40niJpuK2IyXThCBJWCtBESa5rbzR27qG1bAO5aAIDfS5NsZWOA
 2jjMoU1/I33jIYfB5q8XpWV5dPxp64QQ/nGhHLwn4Q5aAl5TbMlSgvRaQkx/zMHrqXIik
 YEY2THbCxqoKlH3z8B5EIQqykUHU4UVvqgaCnpbQ46wa7T5khjfQPtF6AlBIBahxMgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kEwQKy2l; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=kEwQKy2l
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 534864016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:06:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49ff680331aso34167295e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792152407; x=1792757207; darn=buildroot.org;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rR7TdBXiKEVicRYpdxovakPPjqPQHFotCMfy8aSMbqA=;
 b=kEwQKy2lGzpj8zhrJ/7VxVM1SHld5NEhQzFxsCaf9VocRyDOznJJl+FF6zbUVGupDe
 E51fNtHsxtyUmro5SIwaqJijuJe8DnTbzpncB7+Kk9K3lPGuFACZMcAtrto5otRQU9Q0
 FJW5NJzj9qM2JyKp7uFgnuNrhKphC58qkMW+oPOvZOFbbrISoe6OCndmdoumxsca1/LS
 afyAEwF7n7YxQkryvjBIcrm9Uyn/Vqo9NMu+dM+GgteoeJNPzA4Uf7QpBrhxL8s1/TbR
 DeeSwAbxVf++CIXGofEoOLhb1UseolHdlZuNYgp9wAS/IXOu1JBr+2qnpOiTj/GMRZvq
 UHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792152407; x=1792757207;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rR7TdBXiKEVicRYpdxovakPPjqPQHFotCMfy8aSMbqA=;
 b=LXcEmqPNIaB7McpxcNTBponMeX1JL11g8w7ffYgWwtMHE3wLrdIhz11NUmyxh0tjYq
 /nNxmpqH0zEVgKW+BUNynmwq4qqnokiPFokRfI22ow+urwkG8bAmJsggE1ymFnKzV7oq
 FzM0dSSTHPT25daSsWf8Re6TzSU9pt3yCINdu2OO39V959YpbbdQDi14mTP89lTxk6iY
 aVMnl1OkwTDVrStNI+YUWJeyjy1O7m6Lf3z2aA56J/fK5ybhDKrp54aqgeYSM77og5ld
 MfbhbhiqSjqouqhEdLOfhEJtkVVadT0Uz1oBKitydGozG3VkX/Y4mMNBr9Jw16Kc9Zi8
 iasQ==
X-Gm-Message-State: AFq9FYJhEu/eHO/x1Hs8MbhnvRgEsBZh/s79IK3U4uzm7pwDPy172XqQ
 TaOOMX7ptWceaj0IFSF5RHf2XDOdczrmbNxEbV6yjjHp3B83XjKCeGygNpS1GXCo
X-Gm-Gg: AYBFou3INIK5BzanJgUX5G5YXOr7Rda3BJtQrBUU+u6RAck13JlfzA24WCRtlQwuliq
 bf3NabYV6ijS1n7pd5F7P4IszoAiKpBMmqMQ51n4HOReBDYq/LEKJXAwm2YmBS9odGrGKr+ZDHR
 4DA4r+UVUB1Pu8BRaJYI7ublkGbO20pvRiz7QAoGeZ2GWXo9PLVHUktB2FvX4Cid7n262N8Dxkq
 m0iDi2PwlZm2/GGhLLylWw/qShOu7FRd4dFGmR3ZBodkj/BWP12/HofP2pRcCG2jW2Lg1Wgbn1i
 2zg6SJ941hEJp2yJfsQdo2rHchzsp2Cw++XtSw9+guEMnV8l64S6vaBCXeu3zrvLCm4jGH3NMMw
 eksPWolOPljLNKWk5xt2xIQDDVoZus4oUapoG1iCtE+suXklWFiRo2mMZnnUX7JmUwUyH7kBwM9
 cbfXmg+Voj5Z1nvAa1oA94yGdrPJ6vosDeWW4Ud9uNy8+GCVEehfrafSj7vALBPrRooYrOGEqdo
 /d/7xSO5+phvxWk3dWPRKck3/gouLRp68B0YfV/nsKAg8VjYUCs6QufLO4JhJHKbWL5a3g/c1BP
 0QZ93Hb70XJho7ifHtFMfCU=
X-Received: by 2002:a05:600c:699b:b0:4a0:4a8:d444 with SMTP id
 5b1f17b1804b1-4a18e4af334mr479218915e9.33.1792152406645; 
 Fri, 16 Oct 2026 05:06:46 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ad6245sm59619945e9.3.2026.10.16.05.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 05:06:46 -0700 (PDT)
Date: Fri, 16 Oct 2026 14:06:44 +0200
From: =?iso-8859-1?B?TOlv?= Denieul <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: maxime@leroys.fr, olteanv@gmail.com, vjardin@free.fr
Message-ID: <atITVOsM6wltVHct@leo-ThinkPad-P16s-Gen-4-AMD>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v6 0/3] board/lx2160ardb new platform
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This series adds support for the NXP LX2160A-RDB board. It is a
repost of Maxime Leroy's v5 [1].

Changes v5 -> v6:
  - patches 1/3 and 2/3: unchanged
  - patch 3/3: increase BR2_TARGET_ROOTFS_EXT2_SIZE from 130M to
    256M, the rootfs no longer fits in 130M on current master (it
    needs about 148M: Linux ~100M, eudev/hwdb ~25M)

Build-tested on current master.

[1] https://patchwork.buildroot.org/project/buildroot/list/?series=3D366

Best regards,
L=E9o DENIEUL

Maxime Leroy (2):
  package/qoriq-restool: add runtime dependencies
  package/qoriq-restool: bump to lf-6.12.34-2.1.0

Vladimir Oltean (1):
  board/lx2160ardb: new platform

 board/freescale/common/env-dpaa2.txt          |   7 +
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
 board/freescale/lx2160ardb/extlinux.conf      |   4 +
 board/freescale/lx2160ardb/genimage.cfg       |  47 +++++++
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../lx2160ardb/patches/linux/linux.hash       |   2 +
 .../lx2160ardb/patches/uboot/uboot.hash       |   2 +
 board/freescale/lx2160ardb/post-build.sh      |  11 ++
 .../rcw_2200_750_3200_19_5_2_sd.rcw           |  67 +++++++++
 board/freescale/lx2160ardb/readme.txt         | 129 ++++++++++++++++++
 board/freescale/lx2160ardb/uboot-env.txt      |  11 ++
 board/freescale/lx2160ardb/uboot.config       |   2 +
 configs/lx2160ardb_defconfig                  |  59 ++++++++
 package/qoriq-restool/Config.in               |   9 ++
 package/qoriq-restool/qoriq-restool.hash      |   2 +-
 package/qoriq-restool/qoriq-restool.mk        |   2 +-
 17 files changed, 384 insertions(+), 2 deletions(-)
 create mode 100644 board/freescale/common/env-dpaa2.txt
 create mode 100644 board/freescale/common/rootfs_overlay/etc/udev/rules.d/=
74-dpaa2-networking.rules
 create mode 100644 board/freescale/lx2160ardb/extlinux.conf
 create mode 100644 board/freescale/lx2160ardb/genimage.cfg
 create mode 100644 board/freescale/lx2160ardb/patches/arm-trusted-firmware=
/arm-trusted-firmware.hash
 create mode 120000 board/freescale/lx2160ardb/patches/linux-headers/linux-=
headers.hash
 create mode 100644 board/freescale/lx2160ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160ardb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160ardb/post-build.sh
 create mode 100644 board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.=
rcw
 create mode 100644 board/freescale/lx2160ardb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/uboot-env.txt
 create mode 100644 board/freescale/lx2160ardb/uboot.config
 create mode 100644 configs/lx2160ardb_defconfig

-- =

2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
