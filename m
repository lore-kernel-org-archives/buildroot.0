Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE628CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 03:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A0C580E73;
	Sat,  3 Oct 2026 03:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SZ5tJCjzB23; Sat,  3 Oct 2026 03:30:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7AB5280E59
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790998199;
	b=B3KRXL+xAIovgiKRG/oiZ75u/WxYrzC/patE8TnX8G5UqWz/jcZidzb6IaP0TTRFViNp
	 uFw7UPz3agMMSJwVs2c7kL9e5QrvseCPyc8T7KN6vBGoLb9ussqqNS/mI/R7JOkPU1ga8
	 55sEPN6NxwuuHQyToYoSSFOFkxywzOQBRADKryaILsDgQZkmnYC3wc2XKe+5ru9XGlwFh
	 m5S5WCjx9zaOS9SVIyYONhl//NfYOcZ+pYUjhXEKv3RxHnl5TFi9hU6v0mp3JUuV44SNE
	 h+g39qO0FuQRf2vqIZB+GsVhd1+DeL0eiVlzBcnSkB4SK1C0mRlZTJTcQFdrX09h+ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790998199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KW/NmNYF1INDMaOXxnsLdl1/AxjLdwl3zEYJgTetov0=;
	b=UNPbbEZLUhflK6H6LXw7hNnmL71mhJAMc6QaDwKpe4gy5KmA+FTBEdt44FjuY0ljdEXo
	 V7fctdvki5WhvhsTsTIw/F4wJpKSgQNYt4d9SPwkwQbtWksLiq9rCzUw74bk3qNuhCiE4
	 h7+2nCuMqamfegBfmLcYsrQSwyJQYaBycvbE2HXB6VfiR84xPhXnrBVLUfpF+5BM3r6LX
	 okj5ClH+SCUembOkykm8P+tn4JunqmQZ5KfcNETPr1Fk9I2q6yimHsEIlViICOjBOY3/c
	 IpgWWjiwOahnj+pKAGEdTdoXoRLZyixgtH4mxQl4+FSOI+Q8x6y6Pin1W1+THMY3x+Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790998199;
	bh=KW/NmNYF1INDMaOXxnsLdl1/AxjLdwl3zEYJgTetov0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U5VKypNYYe9DA+lGVdQaMdY7vOcqc1JRr5q+C6CHwu+VE2lhcVeraQNhBTP9ZZbNp
	 f9IPTuDyM9v+ngjnckrdriDH9tgM9d9BvQbEBBngNiBAM7DH9TWELsxgwi2eMJ1Y40
	 X4Zc4vptmQdIdI8OytWvdpHcfwN0y/TBLZDtskyc/LnJEUcYEiLv/rkzgS+e8zlrIS
	 2W98Fa6c6FtwUHcoJlkyJr/X3ORiazUI0Z7lS/0UBsg8yQJoSJACBxNtURL5GKBrZy
	 eK59HkTsL0aktyboUETTCq2HqnSRsrt07nEaUPD53jyEd8HhVoRdHcrtAlfGRJ1oKv
	 T+q/3/V5Lx/Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB5280E59;
	Sat,  3 Oct 2026 03:29:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F7A34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F32FC60643
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XLhYvaRtcF5 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 03:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A78C760642
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790998197;
 b=Pk0T1V4MqJwkAGcEkJuSDIEM9CbnD/p+GChND5R+rMFjwH3Mfwu1ugybBYR1dFTIckPb
 kHX7xLBSx56HfxCtg25H9+GPCwq8TMsD7ZzHdvbQ4bE440+ot2xS3QC/GJtWlZzrgYC/n
 X6oikFLag/EzRHtJwHqhwGqsvLi0WnGhY88KXLuN2rmEwIXoEBMXPBuToCxCtvz5V5SQW
 EGFdc0IDFO4bVHXfn/n9diAmOM4HGwqgHoE0+nlSKlAcPa3yOfkAy8+MbByY+S9bvrhg0
 6mmSQBzCbpd3Iely8PnH3qniIwaqfwT/Fne47R3XqJl08QsmjtFhZi15Ren4o2dQv7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790998197;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=+kBuFOGr/jJjt4/vSpZHCwpPU76XAhByNQ79xPlnxxA=;
 b=NvVUzXoVSRyVUzmpRFg01LDNEy4jCWZcsQO96/bbDbaSbv5BrFR7yd4YaR6no4C5m4kP
 Wb2ngNYYu1UuAkzeCtnffEryobM2prTyUDaeVXih3esnvXLJo7z42UqYs9sm0u9RyXkWB
 VX2KKRUbJZPh2Jcfo4OrsXsjwbKy+L4Vh7ibR2mynMGu9W13SJTQB7sKZV9KXgGvrXLHa
 4k66W0NsS/OvTyNqJKKrqfxgAchIxMukuYFrjS0xjJVUcGYgExStrNBoGNIkJq5QfMbtr
 2YjbvGGOEWi917vmF4Uh3qjS7e0T80o7YDx0dknU56TqyJHhL+JUo3FOfUzXzxAuEQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=adUd8B5x; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=adUd8B5x
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A78C760642
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:29:56 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso3236235e9.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 20:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790998194; x=1791602994; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+kBuFOGr/jJjt4/vSpZHCwpPU76XAhByNQ79xPlnxxA=;
 b=adUd8B5x1mVfCGogAwxxlVFYjJFgoYDexJ+Qsw5cXOsoiePC0UhEpjz60tKxFmMFKx
 yU9yuXM7CaRQyBfdnRoTzApIcGTRUn30weXcCk3QUu6o+cOAnfh2II5XrfDOv/FtBZm5
 df8MBZmNiwgXkABCfQxMDBZiF5a+4GU2aD8KGdYaE8phDUGgqRAI0a6RDIVch0OcV3qK
 eIlBRjR244b9HfKlpRrdjFNF/GHT4uKpGPOZt6Njq+gcoE6PMPqTr3ODIuO37fYDMoO2
 3f04TsCGuPqsGNhSVbr+SJQgz/ee07s89of2t3Bt9/05UOKBbdSAo9iAHok78z4Xnkh/
 6Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790998194; x=1791602994;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=+kBuFOGr/jJjt4/vSpZHCwpPU76XAhByNQ79xPlnxxA=;
 b=x5a+M9vka1DvPMIAFhHtNk8WKFnJlhkTai9RDb0XWhDz/SHgdNQCeBh+yaenT7vVXZ
 qRDOrwa+d0se9rWoSWu+U0TtRs7LbrERdNkJxoyHfgLFXTLXrWOkcCpTG5NqnCwV3aZE
 k5GOmToi2N/o8SJR+BP9KUGjCWCtnvTOSJw8TPGU6rF11jlJQ6HXQS7c5j3ZjnG5AQ1e
 ZyIhaxEZbdelE6fUQrOtAmiO6JKscFkWfIWMsZRiZTxpgdCNSRoic46RzVBXfnJ3m5+m
 nKXws3cJ6VyZSapJyRKhJNHMLc/WxT/QZgTP47uT/0dRPMyHRFkvX9ygJTK6AuBZqucg
 ppUA==
X-Gm-Message-State: AFuF++m3ntBymjPGc0SrQuhsyl0CQtfeLmKjwhtANXF+b22tOfvWfy0S
 hOLfFLV3l6GlT5Hkoi1yHEVzsmtCnBUCdAF5XwhQrfxZp2KPVahPD0dIxzxgD886
X-Gm-Gg: AYBFou0v86Z7P8yCPnsyh1zR1u11ZKysN52JKst6ZM6wzaT59lM7T6BIppR8aVf4oHc
 NdLtKHVal+Ch9vt4712yULH4uSd1ePU3Ka4gfOXSuOenhvl2spF5UzLA96UKbuEnTxZr83JTfFO
 yY8XzAFsI8JeTSFCOc+vMrk6q3TxjeTYKEHIWBW5wLuqCVNkBVFXOMCKyIp1x0/leW3L1UpPsd7
 ZRKzC8IAsX/61Osj+eOMwFUuxETsRRzNsd5XeqT1Ye2JilYnQjLcE4gZ/KHNOVIbCO/ldBva6JO
 hCPJvjcdnkZ9EsegHPTnxRv18Jo8/kAjvPAEPv7hkKs1b39Gq+/3vEF6Ishe9uyEqOWcvDoH8+K
 kJG8zrHQzar2VR30x8SspFKafxGh8cRQJt/YnUmeKaU+SERA5VBNWPRkx1pKt5uH7bbVYFssn0g
 KortppOi6BS36C+c2rdCV3HxLrl1xJ6Iq5pcavTgx2+IsgDZWocWKXfDZQgmoBI2u63pk0buYCm
 OE=
X-Received: by 2002:a05:600c:2187:b0:4a0:1c10:1372 with SMTP id
 5b1f17b1804b1-4a02769a83amr52968005e9.27.1790998193766; 
 Fri, 02 Oct 2026 20:29:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280dc6e7sm176892545e9.15.2026.10.02.20.29.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 20:29:53 -0700 (PDT)
Message-ID: <6ac076b1.7652a824.36e3d7.8ed8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 03 Oct 2026 03:29:53 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-02
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

Autobuild statistics for 2026-10-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
  2026.05.x  |  1  |  1  |  0  |  2  |
  2026.08.x  |  1  |  1  |  0  |  2  |
    master   | 19  | 45  |  0  | 64  |

Classification of failures by reason for master
-----------------------------------------------

       host-gcc-initial-15.3.0 | 5 
                       unknown | 5 
                 libclc-23.1.2 | 4 
              cryptsetup-2.8.8 | 2 
        ltp-testsuite-20260529 | 2 
                    lua-ev-1.5 | 2 
            18xx-ti-utils-R8.8 | 1 
                    attr-2.6.0 | 1 
                  bcusdk-0.0.5 | 1 
                   dante-1.4.4 | 1 
        edk2-edk2-stable202602 | 1 
               gocryptfs-2.3.2 | 1 
           gumbo-parser-0.13.2 | 1 
          host-binutils-2.46.1 | 1 
       host-gcc-initial-14.4.0 | 1 
host-google-breakpad-f49c2f... | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
               libgpiod2-2.3.1 | 1 
              libsodium-1.0.22 | 1 
               linux-pam-1.7.2 | 1 
                openocd-0.12.0 | 1 
      passt-2026_07_28.f8df3f1 | 1 
                   perl-5.42.3 | 1 
                  prboom-2.5.0 | 1 
                   rauc-1.15.2 | 1 
                   s6-2.13.1.0 | 1 
         s6-networking-2.7.0.4 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
                tinifier-4.1.0 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/eddb51a9b2a2a1184793a5594eb894f4221aca14 |     
  riscv64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/c6e26697838c0f8a283b510726f73114622ac52b |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8e3a0804780c79de5d5fc81b330c74a968d47ce2 |     
   mips64    |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/8b50e3d1e7e00c1c671b68b03eaa0293dca113ab |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/07cf76f107fdbcbf1559dbf79a37a04f4de0f11a |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6f5a9af6cca0bfd090a8714d2638e80c2d66bd16 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d8821e94ce22fd51a67b620ec23191de2144fa1b |     
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/c2f3766115f5558d0549a30d01c5320e0b26c3c2 |     
    i586     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/7e4e5d6f1ba4222306cd88944b39a75c730db771 |     
    i686     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/e7505b72e346b6822ac3add4d0af24f5c8b3649b |     
    i686     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/75541cc13c9cf75c50a76f4e78569c4da92f43ff |     
    arm      |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/01c9c9148a89e3c8565756ee7bb8a49fc0ce5ea8 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/c7f5fda151beee600eb42c96d9f35d2b7f4994b0 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/38bb48c7ecc845603aee6e78bd94c472bae40453 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/96d3a242a9998666face81b0c58fc048d4ba3180 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/d830684a1585e68c532fccc3be4fc6ef4b621b47 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/d31e4b236bb2d05544853d1a1b65f38a95837ea0 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/01b0d722ae9d1c0e754a1eefae00633f32c187b4 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/d0c38c66f681a4c6dddd31a2d0856ac70e8769c6 |     
  riscv64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/48368867c28b3f79c81732d28b6755b7a5bc07d1 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/9a9f8f24591504c12a98fb4995af1a3145ad5e66 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/ba2d960e96c66a75afa0864312bb9b4ab7685410 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/11b6610f74b54c85d47fb4521cd2416fe2765aab |     
    i686     |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/0a33ceaaf8258fbce9d246587318f9dc4120ee0e |     
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/70a2d02efc56475b83ea76132e56663076636d59 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/afc7d2f8e1216d4bebf5f939802c255b4313807b |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/365c2c43ee772a6d91167cff6bf1bf50ef1e10e0 |     
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b81129ee67191bad624b3fdeab684f9647016d8e |     
  powerpc    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/859649ebf6fe9666ab8e34608c84dc095a2554f2 |     
    i586     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/95e01c0765e0ae4c3b7b55bb21d8dbf3b79eb5ef | ORPH
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/1125d67c02a5f3f89334b96451f16140c0860ee5 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/920a55589387f6b65948ee541f6d0aeb89099694 |     
powerpc64le  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/f40c264f9a170cae6c40d1f6d5ad542e1006350a | ORPH
    i686     |          rauc-1.15.2           | NOK | https://autobuild.buildroot.org/results/00cd748b6a6a86f9e969795e3cdf6a9ff481e16d |     
powerpc64le  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/23653731ee0797adf055f8c390c4d09e98666878 |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/7d5d795a397f3d194d81c125c5f17c31bce7895b |     
  aarch64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/775f3c641ffc0be5384cfdc48f5c1e3fa2373070 |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/2f325945b7951c57b45c6836f54e3aa562d57f48 |     
    i686     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/695a1399b7770550bb9b0f3b49e8e89586514ac3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d7575dbd7db6b75457a4c1050fe9060cab3e9b98 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/551f09445db41b5bc2928e9b162872c77f0c9887 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6d5977702111cc2aa180cc746e57d37dd65c9238 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/555663732e2c97bb58051c1a5b3fe7c0eac9063c |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/3aaefb9d593ea2c39cacb52b827dd41ebf245788 |     
  aarch64    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/317d7e2a07e83a1044bb09be29e57d63de70c9cc |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

        edk2-edk2-stable202602 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/05b6b17b7e17d90d938bcc770c64bc456e7eb8c5 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/7c3d1dab0407a1a24bb97e17043d44a51b214a49 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 1 
package/linux-headers/linux... | 1 
            resiprocate-1.12.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/fa8393953b238dcd454ea7809b1a7a908725cb04 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/7af20ec0946fed7d02cc1937e84d69a37eaf23bc |     
  riscv64    |       resiprocate-1.12.0       | NOK | https://autobuild.buildroot.org/results/bcaa5bcf0e053037e7cfa5868bfd68fe4c6650d7 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
