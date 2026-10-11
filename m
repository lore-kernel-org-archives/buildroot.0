Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E192FCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 03:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48CF580D86;
	Sun, 11 Oct 2026 03:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-EyenUsCx8T; Sun, 11 Oct 2026 03:23:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C42A080D88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791689010;
	b=ZZVK4Vj4Ev5Gv95vViaP4RYCmKYGN4KfTSIBukjRYpNDgd80fsfA9Vuq22j24TEiNbnu
	 PzBS07V1LJbmL5tjE1ZBUNL1870BA+URJeBy6Za+o+M4NhRkB0YdT1GYi2G+CQcQd8ebg
	 zIp4MgS/YcOYwmyWF2QFIE9LEywcE6/6Nj2bn/FWxBIkhqOlR5iMmjqOTGuxtoO4tsiwR
	 NehUKV5Vt1IYr0MHBxO+Y2WP+BD9jf2/TZafOWlRDRtWECvdJi1y91WcMIitTeA62/Xam
	 M9PM64euhx9bMyeQKVBkFbvLEngT0tymWvh5T3ycOLQdpqAbMaLIgcdnaUAneMVOtWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791689010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HuJ5yK4XX4FNfUneOxnDAIL/wyDIW5oykuMBGbur8ZY=;
	b=oaMs7jzZLnPYDrq0QU9txmH5H+UQk5o48XVFGg6og5KZTGO8yG2ZqQynsfQzlG3ivePn
	 imjN0rJ5I1Q0CI4HUaMXO595g+Qhjub02Qj3+WmMuS1B9bCCg/gj/EHxMuIHwAaLhSiLS
	 guc1FuYguxfeM+UlyGFK6CxixcO9ccNPuV5Gu6gJGbfcwjCGYMM1R1KBi9RgoWNWDSbgB
	 8Y/pyDres8VlWLmpLpeCIinwJWv96Mkz4xOhFu4AJG5hs3AdQx9O42+rUem/kyBEcWTKf
	 GzkP8jIY/zxsJ57TEF0gBzEggb/alo4ILw9SbxfjATqa2qkGwkM4NwocHhDPULWDSOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791689010;
	bh=HuJ5yK4XX4FNfUneOxnDAIL/wyDIW5oykuMBGbur8ZY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jHlIkBd9uiPv9BfBWzafLzd4yYherl92ecrrMx4l+Zb6SgnNMgf0IDVyESDYJpnkA
	 zNWzFuHXsWYJcLzMTYbW1gbLeEya+wsUV1qBlX3ERdx/hvJVFXinDLa4uyMTUxu/KB
	 xOMd5AO56z2IkpbpSCYTjzScol43FsnB+/wr9x81I/DoewZwHCUOzwOez9QO4bdGXh
	 uKi57oXgZXx2PMW+jwjsC/NYBG1OqQnFxa3aHE7+VwLqp5uIa/8GMd9T2QOUJgd/XD
	 mnl49hkRCQv2W3gZz/uJ9JKK2l3ZV2dvbG4hLXcJ4vRL2nSDkeBKhY2+Ze8IM/93VN
	 iY4SeHZ/pJDIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C42A080D88;
	Sun, 11 Oct 2026 03:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63DF922B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 03:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53FF4400A8
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 03:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LF4slxnzo0YW for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 03:23:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 940CB4002B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791689008;
 b=BrBfw/PEraa/n8lH7KGxmfHnq/f8yJa4NInNAa/k50EaUJqALV6fWmELW3UBrUONL+j/
 W9n8c7B5jWttiv/ZTyCY/EsJ4x7MHAavrXUpTClYTBDaZXKG6Lc5qi7nKL5r8ySL+JZQN
 s+qd1evLJiounv6ysMPhD+Ok68WNqmHVhOTzkLFdcjb5JfnY5CPRUdm/AKPSiHv22Hz95
 bPAAGE3muagIi4fzL8YzqEKYtQqJNBi61JabLwct6vjtRQb+sQlNHzOpAT59Y14h+yJJo
 mZXDGvFGLxSknmyysa0uhURoP56TmikUR8B7/EzCdHRhan3nVJIeCzZ2qGw6nuvjUDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791689008;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=ZWBpq1oN9Hg4ml89g++O4+zLBxs+CcaVOePzvH9va3E=;
 b=LcWtE+v8X6rJLrSzo+6Uyy+Ara8WSlMBHLAxsI1VxiNcekfZKsAgYr0WQBb2ndDzMlzz
 qABqSAarfu/MaPtgx2w3pZNi/+ylTYV/2ycEEb/r3Y5Mwu374rs7+8G4TZD62MuC8KTji
 SW7hDkOAMj2Pa37b7XeugiTYoK0vetC2oLdt1vxXaYWybWCuMiqkATTfMK7+ESDfzTQ3z
 fCqGGQbu9nsybwTwlV4RyBRiCdxHDZwZaw+dXkKZSVJ9OzOuDWREfMHjj2ytKwpijBHzt
 NUN6z9+SexHvZOU9SN9rYksKfdTW1FyQCTnaj6wkhgIZZinkdD2hJZCKHPcbeqW3lBw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bgyhPAsC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bgyhPAsC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 940CB4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 03:23:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso5549515e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791689005; x=1792293805; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ZWBpq1oN9Hg4ml89g++O4+zLBxs+CcaVOePzvH9va3E=;
 b=bgyhPAsCFuzax3peDwpNK39bNfFS7+prqpf/pr4M3uegCJzungE7qONsgcVbofehlR
 kFQQgHTwQsga3iRQF4VJNAL7uWksacJScnAfO7Q/vpKrdZ6imhEkI0m6XAfZHvbQVhlH
 0JU4xH6vaOGEdd3tdKtINTZuaarvl4lmBSNcJnyBEIAIWYW6lp63jSGVbwrJQw1WFVkE
 8Dx5PHXH/vHc23JoS+oOwItXOYgcp2FxSt8lRtmQ6xR14bFUW296wViBlog5i91uTNb0
 Ozv6rNG3cFQGTGzHNMNLL3V/IQszb/zDiekQ4h3IcEMYhn/4vtIORMp4Gqj2bsbcvic9
 cc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791689005; x=1792293805;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ZWBpq1oN9Hg4ml89g++O4+zLBxs+CcaVOePzvH9va3E=;
 b=Q9z5yBFH2pLo6EJKZXT8j5XtEuOAxTrSPnKqPDoK3CiXKRzLJRAa6AQ0w8o5I72n4o
 3+XYaVcvZ0MziNqGPc+BC41Y94l5OJ+ioJ3koVc3fRjhkESwGyOWR0JO/Nmew/8puh+Z
 okI1W9tXREexQut890s62rCDlLMOtJlnKMaG1WLgLavzckXIW5jF1QdhVZR1Z80sgxLK
 FD9MPpHmjBXdKXL9mil72yNEcVRUzPw589udxXFfCO/Nzmjz4V1PiBnVGY1QCm5+ubkG
 yLJI2nAZ1wizEn6zRhQebM37Q/ohqQr8wNwpQmoSuV35ytf6R4/PTo8Fbz6VyuEuf8kL
 xS0Q==
X-Gm-Message-State: AFq9FYKInbP5k9l7IfNc+2/HPPjvV1iVC1Te8VC568MF0T1qhxd8HgTa
 1l89c3DwcYiAJlFkWLFVWC7Ble2tCLWl92A98u68bmTHctJjrGvcXEZ1GqKSSXM0
X-Gm-Gg: AYBFou39m2BhksA7jGZfeW3yWWf3GVWxmAjr1R6SBzbU84Nc5n7YysX1bCpEPEUEY8a
 SQ9BqiGTZRDERhH3oN3iKLLVlZsMI/W1vpvMs+qVimdB9WlMi4JHnthM8cZb7hyiNDVSljYduf9
 CnR4pID8bCXGN8dtGhNzgIlkUkklhZmlNMCVpbtlLZw3s6jrq+MecispMoECmOTKKAhtDCoVpR9
 lIFYUlBEeR5MFwVPbIMzVV2kAu7zRZlU/5OM/bcNJ/bz9eF7tTTTNuIWxuacyQ/Skc4saBEixaZ
 j8NFfG05ZF0mEFGSkjoLwvzomOzjOEKz5hURiXJu9mkBHsk/VsrItfhDEeDv36fvS06kTO/kPIP
 KgP+GguljDtfZvCystMjC+i4DuAhfWDupAZW6G0Oo5uXabAVZFBSfvN/4yILPVCur+JcYcEX/xc
 MbRhNXuDsYxN1yMza6anaVQSkkTlHeWoSxA+sD2UeUhnuVA8BCgIw6XmQWZsF1TkacpiaEDJnTM
 Q==
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id
 5b1f17b1804b1-4a18e4f2221mr85379665e9.32.1791689004563; 
 Sat, 10 Oct 2026 20:23:24 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c1e33d2sm240810705e9.0.2026.10.10.20.23.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 20:23:24 -0700 (PDT)
Message-ID: <6acb012c.e9321e8c.26011e.944a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 11 Oct 2026 03:23:24 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-10
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

Autobuild statistics for 2026-10-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  8  |  0  | 15  |
  2026.05.x  |  0  |  3  |  0  |  3  |
  2026.08.x  |  1  |  3  |  0  |  4  |
    master   | 31  | 68  |  0  | 99  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 4 
              libmodbus-3.1.12 | 4 
               linux-pam-1.7.2 | 3 
             alsa-lib-1.2.16.1 | 2 
            dt-utils-2023.11.0 | 2 
host-gobject-introspection-... | 2 
host-python-types-psutil-7.... | 2 
                 libclc-23.1.3 | 2 
   openvmtools-13.1.0-25218885 | 2 
              skalibs-2.14.3.0 | 2 
                       unknown | 2 
                   atop-2.13.0 | 1 
                    attr-2.6.0 | 1 
                    ccid-1.5.2 | 1 
                   dante-1.4.4 | 1 
                  delve-1.22.1 | 1 
      docker-cli-buildx-0.25.0 | 1 
              erlang-26.2.5.21 | 1 
                  ffmpeg-6.1.5 | 1 
firmware-utils-c42a3bc53da8... | 1 
                flannel-0.26.0 | 1 
      freeradius-server-3.2.10 | 1 
                   fwupd-2.0.4 | 1 
                  gnupg-1.4.23 | 1 
host-am335x-pru-package-5f3... | 1 
            host-gauche-0.9.12 | 1 
            host-go-src-1.27.2 | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
libdill-32d0e8b733416208e04... | 1 
libfutils-c326ce0cc2a735438... | 1 
              libopenssl-3.6.5 | 1 
                libressl-3.9.2 | 1 
                libsoup3-3.7.3 | 1 
                 libv4l-1.32.0 | 1 
             lirc-tools-0.10.2 | 1 
                    lua-ev-1.5 | 1 
                  ndisc6-1.0.7 | 1 
                 pixman-0.46.4 | 1 
          pkcs11-helper-1.31.0 | 1 
            qbee-agent-2026.27 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                   rsync-3.5.1 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
                 systemd-258.7 | 1 
           uboot-tools-2026.07 | 1 
                 uclibc-1.0.59 | 1 
                    which-2.23 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/211cd65cc0819a3db0bc2757afd2036c58089d10 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/71e88d235775e59802f71c3df31f46e04a122ecc |     
   x86_64    |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/7829834e779b16988b9048f65855edc749b4b5c6 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/ff0245d0dbb5f4bb4900ff9156dd6bae66e2f778 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/dd413cf1dfffb9e0c9b1658e36ac0f4f8c9aab7f | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d778ce64c7c1b10aca26d47f5e7144420e8c9d06 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/774495b189ba02cc5299d325fb60f9946df2b20c | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e5617d4049c7905e4225fbec6b841e3d915c7e58 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d8d61be0acad0389e0d8345b07a4ee86aeace96d | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/64bff9189b6d96920ed6c4c330fc7812701d4d76 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/9023431e521078cad06c85d862d5957a3d5802f1 |     
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/21b4b80c4ed4b675c9cae2c578656f1c23ab8b74 | ORPH
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/a55878e5342178d4d355b866af2978da1306766a |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/4c30f534b7e5027382f5d15a1dfd8aba48cd93bf |     
    i586     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/5981cd6a1238975b5fbdbd1bbd74675db67ebfb9 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/b03d1862f04dcb54fd3452901da6afda672b86fd |     
  riscv64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/64a10b5e23e1890304def04eee852037c130ed56 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/4ed2a772adc810f529fa4380f700de52d2462297 |     
   x86_64    |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/4bd12b73da2690afb9408c1037c1b1186d77ad14 |     
    i686     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/9fff7bbcf662295b9afecf4acdf8971a53975776 |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/4a59803eea6e4a3201566b5dab055a0c8c3c9350 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5345bc1d53c2ec7f4c9cf61363aa6e30a4373e58 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/d8da8a3c39d8ed94efb284e9146ab0c82a61ddab |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/511c4c3d1c0fee5f24a6f384a97740a32cd3228b |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f4ce191657beb1e19b40d4b8330c0d6aa1fa3dc4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4e220e1fb27818fe8cfa12629fb3fa4ae54d4e95 | ORPH
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/9c342e57fa080ac0be06b303f88378d081657860 |     
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/b7c0bc784f61d3184ba89b2f23d1e7d79972c35b |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/776632f6d99959e67ad0e81ef849b8e209efe185 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/202523cefe5c52670a1430d5228e3bce9704fb33 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/823947abd68762d9d2f306e91069be3a9daac1d4 |     
   x86_64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/5d994d232e7ada2af9c2b2f9a42ecc0c10b743a4 |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/aa07f629e0ed6e31aadf6edba97fa70f3ee55f95 |     
 aarch64_be  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/7d02dad85e25136b346a82576f1f242eb377c6d1 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a125197114fb6614fa3e0930dfc43ef2ecf371ba |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9e349672a68b89de92a05745ac54765da7dabb22 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/b8e4c1580da94d765c1580c815b0a5d87b2b299e |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/82174f0f043a5ba47c89daae9eeefdbf5eff8c3a |     
  riscv64    |        libopenssl-3.6.5        | NOK | https://autobuild.buildroot.org/results/6b055d982075e75ca8a770ef43c9d6f4623ca78f | ORPH
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/557277b4c5973a3b656ebcf893aa04c2d75c73fe | ORPH
    i586     |         libsoup3-3.7.3         | NOK | https://autobuild.buildroot.org/results/e1b58e6aa09e1982f72a34b707481ee93fd16338 |     
    i686     |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/89f69f8b73c9945c1a4f159bbdf227782c3a2808 |     
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8ba9a2d0f46581a2b08d0d00bf1f1c8255c2a038 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/18a9125f85181365b5c98cd5cbedc18cdb087607 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/d736512e089e435b6343dfac2076b44fb1b41f7c | ORPH
    i686     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/a31f91da55cf71aa52eac0ed6cf1892f01cc4fda | ORPH
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/1503d93ce7dbad441c187ec2f9edec90893f38a5 |     
  riscv64    |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/07a75834f2751328a8c00643dd4b9219126b47b4 | ORPH
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/4d805b9459a0d05adec3ba99bf0237dc27d581e6 |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/e68aa394287017ece799c16ab26760f5e490499e |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/ec43196c2f10bd3e94b187e535b064cc1ff98212 | ORPH
   x86_64    |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/6f64e83a02f4fafa289c41f72a51c50ca6e2476a | ORPH
    i686     |       qbee-agent-2026.27       | NOK | https://autobuild.buildroot.org/results/998d38b28d24a3320e33ccba06ed40cb965cb464 |     
    arm      | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/f84667fa554bc03ae3e83092614ee1f882e7972f |     
   x86_64    |          rsync-3.5.1           | NOK | https://autobuild.buildroot.org/results/d33d5cb0bcf29375991563d086479558d6d0b72c |     
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/91e125eb21c3c8c40496af3ffaaeee50c764a0e3 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/279c8d52356de6467bc3c1c700ff0bfe9e1d997d | ORPH
   x86_64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/caf97d980924f3859a715b6012d3f5030bfb0974 |     
    i686     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/66c949f62ebe87cd0f8eabb8d2a9e78dcb7353ac |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/0ee8bbfea2291ef3d54cb3dcc5e783036b53e2cf |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/11e410fca983eee3af1f111c2a6807554efb0540 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/9690222b21ed74d85646aecbc3703ebb18d0396a |     
powerpc64le  |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/ee555330bbd9c601cd308d643be7b570556112e5 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/2d399972bccec706107cd7fcbe5c64990d5a26ff |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/65493d6b16d0b2c782b4908814fce9b2b8d87cf9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3d20d6753ffc4ea67b80951bbba79f8c9ffc4bee |     
    i686     |           which-2.23           | NOK | https://autobuild.buildroot.org/results/7ceb2508c552c2b264a6ad379a10320b2929a24f | ORPH
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/94b73e8cfb79b7f8befaba1a3835a9f17f38c11b |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

             alsa-lib-1.2.16.1 | 1 
                    ccid-1.5.2 | 1 
wilink-bt-firmware-43fca73c... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/1a3020d356f7a0b402034677144d6afd687b8aeb |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/089818115c2bf27d8314416e6a903389153e0c77 | ORPH
    i686     | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/a7bbb47638e4a21819668d46782f455fe7f2017c | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 
                  libgudev-238 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/82c35125e7cbfdb4f26239f8e488cab04cd827ae |     
    or1k     |          libgudev-238          | NOK | https://autobuild.buildroot.org/results/33a43700fd7cfcc54afae09591b554aaf2356c06 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ab9cadccf07f8178011d604e9d70e97d353621b7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            18xx-ti-utils-R8.8 | 1 
dtv-scan-tables-7098bdd2754... | 1 
            host-go-src-1.26.6 | 1 
        host-python-lxml-5.3.0 | 1 
            host-skopeo-1.18.0 | 1 
          imagemagick-7.1.2-26 | 1 
         libhdhomerun-20210624 | 1 
               pcsc-lite-2.1.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/2880e705f9835271b6fe1673c609e6346156d80a |     
  riscv64    | dtv-scan-tables-7098bdd2754... | NOK | https://autobuild.buildroot.org/results/f7e9677af471545e08c194589c72f2519ec1fa6d |     
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/61ec268ea22d374c1f2e24bbfec504d6e0e211b0 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/ddfbb92224fd19350e322344f6a3730948ff3f6b |     
    i686     |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/531d1947884f7456c76b8aae139061d44038d6dc |     
   arceb     |      imagemagick-7.1.2-26      | NOK | https://autobuild.buildroot.org/results/f0e6f794295fd860332d214832da96ea8ef125f5 | ORPH
    i686     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/adc5f24a03b1b165499bb044e6223f8d9084a6f9 |     
   x86_64    |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/53ed9084925c652cfd9a47f911a33711f15cc29f | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
