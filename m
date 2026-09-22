Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C9AC982DF
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 03:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BBBA40779;
	Tue, 22 Sep 2026 03:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Beob2qL6H1LB; Tue, 22 Sep 2026 03:31:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 472A84077F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790047905;
	b=YK1DbwnhE+5p9yC/sHhSn5SqS6TuZHLPlZCBkRb6wfFYLUFee3DStXhE8qIMzq87dpx8
	 tpKA+268hh/AMcFstUSn/r5YNk+ccoOHmw/p87G2JQj44pC8Z4Wq0LDSvrjHUb4vMn5ct
	 ldpW3wolKkX74GL8f14ReLJlWm9ZlSySJeMExoCJWP/Q/oiNDJ10PeIHnhOt3cQOgS/Ex
	 NYVChp9INWIFBrmHo3n+mIjcZdP08PnWp148C4Oxmw5z50e0dbQ/zQ2dc4VSqlwFh15/9
	 y7EUC28V+vNUVzRSRbBIscVS/iKhYKOQivhg/oSSCn6NVuRjP5AEPzj2d//I07YlYdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790047905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kQYkpegpZIHcsRUsx/3XmcnCcrG0y02giiJ4gmNAt4Q=;
	b=e6dhodghKNJ9tuhN0d6nqDC9o0kGmtto3iQXu1HNjgGSYzOeTrqAfpO9bA6sC6ze19YN
	 qEWUlHH4qfIJpjiswudjmhscX3J5HCfpWGpcbp8/FpOJEiVGF2DzCVN58pONr10Voeh/A
	 CK6TxPYLRFSaPn3fDUD2H3I/ujMnSUlgAXPdDKfwghJ5EX2pVuytK1xKCqlBiTUjHKTvo
	 pTBLdfBuILrbl3gUPasihv6wdLmK4BQXDeaQYNQwPGOu+7ndKGxn9jebOvOcAzqMIp21b
	 pAY8359rf7JRK3CZZMExXCM8tVhcmvOuGNHToiMpiUPvAS/EyodSNlyR82B/xrZ6E0w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Z2GMC/DE";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790047905;
	bh=kQYkpegpZIHcsRUsx/3XmcnCcrG0y02giiJ4gmNAt4Q=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qEwOnfSRPuM32RwqhOf6x7ATxlN/t9yFYJd+rQG2VGaG/KfynxmnhcEkL8hHvNkJP
	 iCIJAsnUzc9FEPOGozZxwDPS9fXQXaSuMlACRtsPmkon4VHoqHSnovYWFUV+OIkAEJ
	 3Gpoc79H8H4j+MmRNKsLMRIAkkEOTf/n5jE1ZKHz0tHf3FQtpkHqrH2G6yu4YlBuGF
	 lQ55ur/KFp7uHhGCTEWesHAMT8LGxSFO1Vs643RDHgFP8er3/JOLPCJQg2A0dbod99
	 mFH0dP/5+f/DGPM9PSr+yGyS/CFiIQUZF4/M5YvpgjDmesIqTT7WTrqKM92+fqmTqy
	 CvyjFrqKaj6Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472A84077F;
	Tue, 22 Sep 2026 03:31:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA90472
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 03:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D1D94077F
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 03:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETP0LrEZyCIY for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 03:31:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D792C40779
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790047903;
 b=MVFHWmCgV2uXrpPZh3N+8/A7eet+ewBJ4ptDXJJLD3CPIKAHNl1P1JXckOyef63Nmhc+
 BMca81h9AVD+nQ5Zir1/cUma0rry/Tc9gcdN2aQwaDvXU4FF2triSmGNbldyMqY/bv8Hw
 k7xihoofu4+uRiDSV5gQecYmVfeZCUAcWoYpY+sD/szQc53Ho13C2mAz1Gy+q1pIaiKlw
 FhCkoy4Jnr9bdoOXN8GWfZdjnGS20RazOyeoUKJ3fyGRNcljRRWPQSzbgChsaiWgz42dq
 gZGJey4EIMbKkQjRz6jgabaqpY9U0qfKKD+ZZeu4JlqmPNSqClGhbyH9JHutI2Asblg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790047903;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=aEPrFNsJBcUE724BUr365tPrbfAOC63g0a17Wao1Tsk=;
 b=YWp8xWNd/UoVi8GKn7VomHVATsB0hU/dgI7cmYvEehPUwE+5xRy/afc5Cw/UEDi5jTev
 on5KzN+i8wkwGCg9pijlchvzTB900XsGhqv+q/9WoGQ0fQVd356e2ibibXr26phwH//VY
 jbKj+ygWH6zGfeN0bJ55YCZ1a22Hd2gp0fKUTbgfOENsL6jpztg7OO7flrba8uXoa1c0H
 YL0lJNT916jUY5XxxbN1yAJf6vJE6hmNxYhEYMrrxmiYNVygzNyjG/PetY7gENGHjd9Xq
 C2BNwuMrbnOJlM00gURRqxdl3uzflGZYcl3HtrWYn8qdbk0sB9kkMuRZMldZyNxqNuA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="Z2GMC/DE"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Z2GMC/DE
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D792C40779
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 03:31:42 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e66390995so19475365e9.2
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 20:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790047900; x=1790652700; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=aEPrFNsJBcUE724BUr365tPrbfAOC63g0a17Wao1Tsk=;
 b=Z2GMC/DE4cYOFSMCUHWLOvWIsb7HSrJePTB4R26GtRAFPPCqYXACfX78BRTN69Ye6H
 YE5Y7vIy07FYyAPeV2RsQIt2eJmWGX1We9I/xQg94oKMkIVFXNpBHYjSKb+MS0u97iZW
 AQxRi0l1P9tSNhNWB4nuIUA8zpadVNgGnnsUXewwJ9yoDtSnQ+AvQ7EyxbLXp+HLZaa4
 HgxlAPfZO5zLIDuqdItqIynGD+B3MGzyURbO20aQJJ93QN317oy/eyLu9btMdcD8wz/s
 fnBKsjrQG1uyI5yWif3GasOp0nOzgtAZUYK+a6w8V6AVJBKiDob3rXchrc1D0XUe8qbO
 pVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790047900; x=1790652700;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=aEPrFNsJBcUE724BUr365tPrbfAOC63g0a17Wao1Tsk=;
 b=qh3gEqPLOq8gIuvY/UspYQXFrPLmn019wKREJIYOeqsqYW8GXII26J0wM7lTLJgDQ1
 XLB+hDOba6noEeUxGmEqWmoFMCaiZqtDrpbu21rlJfLu8SSFCT9fWEGmV4sSgG0NF/nJ
 om6pVoKX/vczjx0jOMLoJxoJC4YAfIG1W6N28cY+0WjUdlzbu1NNYZw3snfRp0OwA4hg
 R7zeeOe5BJSMBDL3rXAZa7wr/OHIb+nkSghxs9PtyicJs/2DH1KX++cRJUbPvVmI/qD3
 F4kyWFF2gXthB98ggKE0jjkxizD+/XzWSDswxKOTnyJjalwY9rV5bZ2iwP9zqo16n+IN
 HEaw==
X-Gm-Message-State: AFuF++n0uppPIDhOuDOey6QibSCiqIgcLQ8/8G+F4q/9M8MTiqAiXhI0
 Y0KC44eRwhejCfW4oVHTABb70BAinb5SlEiXz1GrtOhovq9wsW0DRYH5n9J0g6IF
X-Gm-Gg: AYBFou35WiGX+kSgWDo7YEV2hscfglmujVYQ3ycXxKO2rReIo4Z4cKscswqIRPrlX5d
 D7dasdnFNKuLMv7PAiOl8IVCBW+1PGLV/sfjET8wsR/JappK5T7R3oUR0+Y9ms0BNVTu2MPZieW
 tqL47ktupv40W55rm+gpBA7kvwWlo0f6TINAy8PcWwq5o66OmTvMxNSJm6AC+7JB987uJJqlKNs
 WMO3y+vb6cGC6MoG8tE4KOM2TF7R6AZqQ2CznDB5zNvsKkuFan8huC1OsNKzVXEQ7DNTCUGly2e
 DuDZrjLGHHLy+K5SYaeJY6dfH2eqQ+t8M8FadMd9jMaVoGkD3fV1yXB+2uviRrZ/cPWf38dyMCH
 XqCBA1qoFykr61wQOUYNzY2W+KOmnmK7Sv0HU1SD++GJDy0FGtionSi+F+ob0UI5pj3TtaIJ8Lm
 fJU47z7u1uMtHM81dh61s45YX3jzzH3fHx6YC2CQd9d5BlQe+lKt9MQMiQHMDxINgxbDo3+Sf3X
 8U7IH5zLIVM
X-Received: by 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id
 5b1f17b1804b1-49fc5714d14mr183223105e9.11.1790047899903; 
 Mon, 21 Sep 2026 20:31:39 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdad2a3e0sm20323445e9.5.2026.09.21.20.31.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 20:31:39 -0700 (PDT)
Message-ID: <6ab1f69b.90c7066a.12a5ee.a8b2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 22 Sep 2026 03:31:39 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-21
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-09-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2026.08.x  |  2  |  0  |  0  |  2  |
    master   | 27  | 39  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

                 libclc-23.1.0 | 8 
                   atop-2.13.0 | 3 
                    attr-2.6.0 | 3 
                       unknown | 3 
                 haproxy-3.4.4 | 2 
                   dante-1.4.4 | 1 
        edk2-edk2-stable202602 | 1 
      freeradius-server-3.2.10 | 1 
            igd2-for-linux-2.2 | 1 
                iproute2-7.1.0 | 1 
              libopenssl-3.6.4 | 1 
               liboping-1.10.0 | 1 
               linux-pam-1.7.2 | 1 
                  mender-3.5.3 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.42.3 | 1 
   python-pydantic-core-2.46.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
            qpid-proton-0.40.0 | 1 
rtl8723ds-122a574f780da32bb... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
        s6-linux-utils-2.6.2.1 | 1 
                    szip-2.1.1 | 1 
               tcf-agent-1.8.0 | 1 
                 wolfssl-5.9.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/3231c225c7af6d13dd0f98aa56737e5e8dbf49af |     
  mips64el   |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/3c1b760312ce86c29b708855c288a39e9bbef848 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/85a6e569533cd244fe158e8209e6c6f57c898419 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/fc19bd21b85caa442c34018873cfb946f7f49eac |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/63a715f9eec37659788f93c9ccf713a6aff1512c |     
   mipsel    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4c48902e8cadf8176a7d3d492ed47b03bb0a547c |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/4845082e50f37d0c6183e13393dff470cc1427cf | ORPH
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c958becdaa430360d6893f61daab35b1c38e6f45 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/7763960c3c76ebaac7710a931dfca94f62e18f77 |     
  mips64el   |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/1335b2a3a421be4bc78b5adea2e078733f10a93b |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/66e14f8831e4f9ff87e691f5e1444e3aee2bb02c |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b4af07cdae9f5d2d3c072e74155ce7d8f59739af |     
 aarch64_be  |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/390b7ed00da20c2349fe069ade4a65404834a484 |     
    i686     |         libclc-23.1.0          | NOK | https://autobuild.buildroot.org/results/541ca6917bb19bf33fbc1f33a7ba05ac67d2c606 |     
    i586     |         libclc-23.1.0          | NOK | https://autobuild.buildroot.org/results/3ddcf636b1987d151d82a0b591cc5c6547d573e6 |     
    i686     |         libclc-23.1.0          | NOK | https://autobuild.buildroot.org/results/51f9a2cbc14ecfdf558e09799154db7a7c3076f1 |     
    i686     |         libclc-23.1.0          | NOK | https://autobuild.buildroot.org/results/a19d60fee57365fd7d626a9e0e2c5f8fb717ebd9 |     
    i686     |         libclc-23.1.0          | NOK | https://autobuild.buildroot.org/results/ed1891787da184db43cbce6ab61b7d684165fea1 |     
    i686     |         libclc-23.1.0          | NOK | https://autobuild.buildroot.org/results/ba521764d83b3402bdf310e8edd5ad3e64a68bb6 |     
    i586     |         libclc-23.1.0          | NOK | https://autobuild.buildroot.org/results/e87ff1e9ca169a23c460bea4e77c9e0b539cae97 |     
    i686     |         libclc-23.1.0          | NOK | https://autobuild.buildroot.org/results/ec86d57f74e4dd1b15f43d2ee4d1a84dbb0580b2 |     
  riscv64    |        libopenssl-3.6.4        | NOK | https://autobuild.buildroot.org/results/7a2e559c209718f2e8e0b0440aad0806b4926ed1 | ORPH
    i686     |        liboping-1.10.0         | NOK | https://autobuild.buildroot.org/results/49f470fdcd0012395830c744fda11f4c37f75eed |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8aa87f67c1d3ca27b598242a0bc55a5686e44415 | ORPH
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/859bee48c936b265a8d63c873504cfecd723997b |     
   mipsel    |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/fd0cd044c49db0e7d8ed7e38f133033ea90c7916 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/28e76dfcf404dd7490fba6d98c92b924fe585c4a |     
    i586     |  python-pydantic-core-2.46.3   | NOK | https://autobuild.buildroot.org/results/a3deca2a9ed5a4949b7e80e518019930f85030d8 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/24e376e0ae9582b52e2744406a19e2e86f77d076 |     
    i686     |       qpid-proton-0.40.0       | NOK | https://autobuild.buildroot.org/results/5e2eabb0d8a3cc45b327d7a17379654a00c2c3ab |     
  mips64el   | rtl8723ds-122a574f780da32bb... | NOK | https://autobuild.buildroot.org/results/0a1bbe829597238107d3aa0bbecd33f051be665c |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/7d3d03c9a952813d8bc4abe511494f11cabe8e36 |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/6b81a5fccb3247b5fbc6fda42ca7595e6de36ce5 |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/8ea66a08896f88fdfd7d88c73fc22ccafdd2b413 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4c5a98edcfdb09cf294710944ace8aa4efadd79b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/43d86290c58e64c7c47d46714aa05c9c328d934a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5d8275eb52e252eb53fde4644eff4367398da809 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4beed8f12f73277788632bb3d939851999c0ea4a |     
  mips64el   |         wolfssl-5.9.2          | NOK | https://autobuild.buildroot.org/results/f1ff674d6d6c243c1961c230b976ffe636761167 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 3 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/ef1a547681fc683c68edeeb5197d9b144107d7dd |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/5c551beb7dc6ef51bfd5bbc26860f1a73ed7d2d8 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/2ae07797b2918ad25e3decaabd45f4dd06304a2b |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/0f670d05e7a964f4c3f0a0bbc3b9fbbf6da78299 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
