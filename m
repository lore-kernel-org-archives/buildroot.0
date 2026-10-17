Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C21CC6B2A
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 03:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C629D409DB;
	Sat, 17 Oct 2026 03:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5XIWc73tXtD; Sat, 17 Oct 2026 03:27:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BC7B0409D8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792207663;
	b=l8qoRwSHNwInFDwNO1j+6w3QY5FKzNnMmWn4HBr+6/msqye69mfg5yAFrFF2Kf2+d6vH
	 YsF8Gs0VBFto3Gx94J5wWXAgSScseAp5ljko0lfUU8SuzczqkwPB/u2D0t2XXK8gaYQXF
	 gIBJD0gq0wEEDNrojCplbR6a+UPaY7lr83533JIKR2plrpBoqV0cmM+ChsAVWWTNQi13D
	 UChMyyucD4hClEVoq1RI8xn06GwDgVVRaNx3TfVVosKjSawCpy4aNTsWOsWVOdUUy29TY
	 LTsR0D3lNiBOd/DPH7+mbTth0vg1P4+2WTe7nMTM8XNcb2zim3FVgMluCkUTElbHUiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792207663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pqya/0Zvi2+gbCOrSMepgMfhOFR7PfYwNm1eko/dik8=;
	b=VWGvtlt1qk9575FzFdUJ1CIwSBNLB7swMd4k+x8d2hahHCL6HSflmCszlBJhtH0YV5mg
	 Uc1XiY1pgrkStUI/7qGhrj29cGy2EmWfQq55ks4NTxU/9jOKMcXXpVFLvXxnsk2PLnSsH
	 5zsz/igDmUk48l3FdKnp3hEiVPtcshdxjgSv4QcsM/uMoTdXP4D1LH7dus+q7eQDqJX9W
	 TigW8yF+TT3VlRS7E6MNhzP7McxbWc8zlzfFjJ3Q1if4ZSsd7y+0oGFTmb6hQJ7aJiQpF
	 J3CEypG4UuP7er4fv1l3b2xEpuezxRBgY0236akFidPhCp4NplEokdmtnFSHlsj2vKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792207663;
	bh=pqya/0Zvi2+gbCOrSMepgMfhOFR7PfYwNm1eko/dik8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NQ57ut+xSntEsfarcfFKYfz78kWOxZbtm1BDwYvJG1Btf1Sq7GUbqn0xwlhQxQCgr
	 pTi0JX5XULsQFga1D5pAipX0ITZkSEeFFHiEZ2GRlULiU2hlfRN86zCD3iKNg3Q6Xj
	 JhP7OjchQEYINzF2B1oujg3L27xaO5ZEmmRrYaV+ZEvNLhFesKHy1g3W/0VuTFKoUw
	 2o7NBrmX+NRj2/J+zM//JWFxI2QiFsfIBgeR2+yjPdj2KYpOzeuBRsCzlkVCoV4zFn
	 noSRLN9VcghudvXr9aIsDHp7moj4YbhStxi/McuWHmNysAEJbzR1oGnC4Mkjk48JOv
	 n1zQ0gHJQhjzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC7B0409D8;
	Sat, 17 Oct 2026 03:27:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2F6F79D
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 03:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4D0F400DC
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 03:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEsTgImti2-r for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 03:27:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5A61440075
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792207660;
 b=Xa2FsMZdx8wAVfkTFsySoBLQqBWTj9zf5ar8QzQVFC3d95lOFur9A6cBb6JjVoNA0N1B
 IUOHqiVjNZPaLE6oaSdvVA+Pf15pk38YHrMGk3QN4lMHkcwqgxaMElRGANPmzb8LYuVwY
 RMAAprBZ8OcRYqIeka45bNWMsGvddTEEJJStJpLVkoNxSLOMz/EtWV+AUkq70FOENI9kT
 DDM3dh0yR2ivVrfE0LC/EuIuLp5ev+bvCsbN66BtkBRT+DdfyPEd5rAcYFej/yqT8DWvx
 +Jxpy6Xxid9bCuksNZkq1LbCR5jbBlXHJYOEc6x09z/I9qPEPyOJA/g8XLNhfZT1aOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792207660;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=c5roHc4NZoTPn6ndryO82t8+5SEfn5FOXOntMdsbg1I=;
 b=PUIB9kQgBBAvUgkpkEGVlp7/EPX0M9AAH8iruO8EpPwtNVwJoDVRNGE5xlZO/UtNCvLT
 TFnH0qkxQwboxZ2hBWu1cFXnJaRoK9yblNSJycCM9WnhJJqEQYUfUfZgOcifq3LO0Yia3
 mS8lDeHoKPVHBkLFuGll84j7oL5VIPEYS7sLa3g0+a2O+8i53JRuvurroeB27KvLIml7Z
 Vn0CehEzR6evdiM65LvtEJXvoPXlPQdr/31RWXmyok0WBaFOhD1CstqWlCux5Ah+GI/q7
 FIGkYDIxqcg71Atug7yoR0g3GMH5HDbksZstFAOq9MPQMZXWVgCvhYWSLVEGwWWTceA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IIpWNDr2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IIpWNDr2
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A61440075
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 03:27:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso345530f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 20:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792207657; x=1792812457; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=c5roHc4NZoTPn6ndryO82t8+5SEfn5FOXOntMdsbg1I=;
 b=IIpWNDr2xseVLjkByGcieg0w6qFKBMCcwlM57sseCMZo66m8nzgIcjYJ98X0hbVLiU
 lcXXsvD9Ch/y6Nf1ooz2fU/xwPtEYxmklTNOnhJSN2mGlUAH3QA1u+ZANi1QywFOmZkp
 Y7IuEVkEfpVj9swTzau3+yfJwcjFApQ7wKzdFIiz7Zww3dOKQHR3Zn0B9RF74J0I9kK7
 xNa++Kq3OtVvwK5558zRtM6z8IhiAlCQDEK3qpGrUuUaN5Qn9O5w7r5w94nqnn5Tckb5
 SlyEknsgDKktkJZSYYT4UV73eNHDk70CEFE2JAo3sWeFq20Afy8sOoZx0NeYVT8tYNiW
 o4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792207657; x=1792812457;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=c5roHc4NZoTPn6ndryO82t8+5SEfn5FOXOntMdsbg1I=;
 b=2Cqt7F1jtet5/nsDhb9Z9Eo8HounWyILRHBiWDsCWE6exWG0b8l+d6x+j/W+p/eJfi
 zuh9rBcTtQkJExFSVv6ikpTAu3Eqp88JXVJ0EuV+/NCnDPsnyqV4yAvrqfnZYsZa/uOw
 xxdJfe8wSfuv/OyEZ2wjv3u7VBo3oVxaso24DrmxwrIAoCDc2er+VeSM+B1OIGtRn36X
 jLm6M1XIH1XUZlzMzvgIVNbazKNR5bATo/GCC15ejXeLmnzHbK9s2mZYTBdL+7udwnpJ
 JMSgAHmFc63YotjgrU4CmGDyJb9iS0a0ItTXHPXNGz/YtU+GP0kI68Aeo/2aQgywXqBn
 SlKQ==
X-Gm-Message-State: AFq9FYI5qAxPbUjFdWFaTV+Xdi76JZTiBu3G13/E2c3stCmfA0944IPz
 4H30wPkjuTA0/zCGIVqy6TkNwpMitYs0uionecx1AecMaJi/K2et2+sJ8DQhj6Tl
X-Gm-Gg: AYBFou0BUZCYwi8OH9HiIG9lo8jRypJiYcv7yJw+a5FEbg2nPXZRmuO0MChAyZKEACq
 vrvnLCpMC2OygIjHV3SZWwTXUkvKNy+34SDqs5/yOk7aBMvRoB11CsglALdcVZGBDTGA/UWte6v
 JZn4lFZsxJCU3jHY+5YmEJjRxQ/DiTQhxHWijRy0JI+TOp+MtE5ep2XUoowSl5maZRqFu9dT9c9
 KRmb40MboJtpmvciFPW0mcB928q2LqDEuItL1ex9TELrgKn0eM908UiVzP8VVVHccAx5850QdTz
 vL55kzufbj5DsrObQZ3V0nU2qPe7sJBAHO/c4Jq8nRbKhu4SFpfQwinndR1ORzKMusb4pxk6Hav
 Ngno64G9Il+S3EgRqa02CPrZEZ2TR9rdk825b1iY+44Z+kHRqxx5l4aHnan+BFm5YVK8kHU8Ma8
 6Bvzpeg9AxZHrvWOjvhh7yJIaIuOJh169SgjAoYkc8i/L/umciCkxXZnDZ1bW+MQKwrKzOHLc2H
 rS0QurZ896H
X-Received: by 2002:a05:6000:2384:b0:48e:bf0:377 with SMTP id
 ffacd0b85a97d-48e0bf0089cmr336535f8f.7.1792207656782; 
 Fri, 16 Oct 2026 20:27:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f576asm9171420f8f.32.2026.10.16.20.27.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 20:27:36 -0700 (PDT)
Message-ID: <6ad2eb28.c70771d4.28752.982a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 17 Oct 2026 03:27:35 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-16
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

Autobuild statistics for 2026-10-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  5  |  0  |  6  |
  2026.05.x  |  2  |  4  |  0  |  6  |
  2026.08.x  |  4  |  1  |  0  |  5  |
    master   | 54  | 153 |  0  | 207 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 12
              libmodbus-3.1.12 | 11
                 libclc-23.1.3 | 6 
            igd2-for-linux-2.2 | 5 
               libepoxy-1.5.10 | 5 
host-google-breakpad-f49c2f... | 4 
              host-rust-1.98.1 | 4 
                   perl-5.42.3 | 4 
                rdma-core-62.0 | 4 
                       unknown | 4 
    host-mender-artifact-4.4.1 | 3 
                host-odb-2.4.0 | 3 
libfutils-c326ce0cc2a735438... | 3 
               linux-pam-1.7.2 | 3 
                    ne10-1.2.1 | 3 
       python-dbus-fast-5.0.14 | 3 
                 xenomai-3.2.5 | 3 
                   bird-2.15.1 | 2 
                   dante-1.4.4 | 2 
                  ffmpeg-6.1.5 | 2 
            gdk-pixbuf-2.42.12 | 2 
host-am335x-pru-package-5f3... | 2 
            host-gauche-0.9.12 | 2 
          libmicrohttpd-1.0.10 | 2 
        ltp-testsuite-20260529 | 2 
                  ndisc6-1.0.7 | 2 
   openvmtools-13.1.0-25218885 | 2 
       sp-oops-extract-0.0.7-1 | 2 
                 systemd-258.7 | 2 
azmq-v1.0.3-54-g819b24035cf... | 1 
                   ccrypt-1.11 | 1 
                cifs-utils-7.8 | 1 
             dahdi-linux-3.3.0 | 1 
             docker-cli-28.5.2 | 1 
                 dovecot-2.4.5 | 1 
                   duma-2.5.21 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.21 | 1 
falcosecurity-libs-e5c53d64... | 1 
                    frr-10.7.0 | 1 
             fswebcam-20200725 | 1 
                   fwupd-2.0.4 | 1 
               gocryptfs-2.3.2 | 1 
                 haproxy-3.4.4 | 1 
host-mxsldr-2793a657ab7a224... | 1 
       host-nodejs-src-22.23.2 | 1 
                 lcdproc-0.5.9 | 1 
                libaio-0.3.113 | 1 
                  libdex-1.0.0 | 1 
                 libpjsip-2.17 | 1 
             libucontext-1.3.3 | 1 
                 libzlib-1.3.2 | 1 
                linux-5.10.272 | 1 
                   linux-tools | 1 
          lua-cqueues-20261006 | 1 
               mosquitto-2.1.2 | 1 
        network-manager-1.58.1 | 1 
              ntfs-3g-2026.7.7 | 1 
                    olsr-0.9.8 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
            optee-client-4.9.0 | 1 
                    opus-1.6.1 | 1 
      passt-2026_07_28.f8df3f1 | 1 
    python-cryptography-50.0.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
            qbee-agent-2026.27 | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                  sysprof-49.0 | 1 
              tailscale-1.78.1 | 1 
               trousers-0.3.15 | 1 
           uboot-tools-2026.07 | 1 
uclibc-ng-test-132c6134d691... | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.41.5 | 1 
           virglrenderer-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/81b3b40f6f060d1a7df5e516a59850bb9cab243e |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/25fd8bf6e470c43ba71682490d565d9bf057866c |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a8f7d0df6540980355a0e97cbc9cca74d29925d6 |     
  riscv64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/2fc5b4caaece5dec835ec30e11ffe729008d3077 | ORPH
    i686     |         cifs-utils-7.8         | NOK | https://autobuild.buildroot.org/results/8dff5b4ff9bada4ca1b788d776dfa4877cff2c2e |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5c0fea3c57f09e74003ded51f2fab21366db5c2b | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8e3db8e4181aed0bc496b1b9ff349bd3bbcdc297 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/126efa3d84d5d3a52f95ba3c8e7429b9d48ed64e | ORPH
    i686     |       docker-cli-28.5.2        | NOK | https://autobuild.buildroot.org/results/b82ca9f4767e5b2ceb3baf3093275febe9b14a8a |     
  aarch64    |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/86eb75852c573401dc271839a7f0f619aeb3c4ca |     
  aarch64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/aef85f4532ae0dc5d4d0b8460365d40450464a4e | ORPH
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/d8addadf722339d3c94aa71ecc9206c65cbbc59e | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b724b026155e1c84b67a770b4ea70d89fd38d8f6 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/92f8394af9f019a1b2d4e8d51da8ab6e2cda9a74 |     
    i686     | falcosecurity-libs-e5c53d64... | NOK | https://autobuild.buildroot.org/results/0994562e0bdd992f28ab50d4b6db3193e567c96e |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/cd0438e1a6280d8917c9dc3ee5201b52f7e7c46c |     
    i586     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/a4a8b07e86f51f7322dac004e95479557df8759e |     
    arc      |           frr-10.7.0           | NOK | https://autobuild.buildroot.org/results/c108e1d5ea1c240cbdb3ee97bda562ecda6bcf5e |     
    i686     |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/655f2425f32698bba8283bbe9791e10de34b3a43 |     
    i686     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/166da6365b2a2f9560146bc236f58ff1718a9d90 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e0f117b832a463d919594e3c253d8459d250a40c | ORPH
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7da08f0dbbd54216178b1107b25752a284bd203d | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/c09b7b16c423c3a797d489d40c2872d97e02c198 |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/70f1660d240fa23b187a5db64f645d3a02acfc69 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f73fdc01725c5f30845ca9746d9b8cecf0bd23c9 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/6a620ca7cf3c36b2443252bc8f48d3ce0db22573 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/b3509ee82599eddb741fc9b9b5d4e0c073200c4f |     
   x86_64    |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/4a50a3c3a8c4a0055dfb31fa0433578734f0b6dc |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/17cf07ed8743862f7566a24db05653c508a1b114 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a7120e2615e4602cc210b380407a87d9ee3fc144 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eacc2ed4ba3441fd96eb2229a4cda52ab09fb9c0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bd401582249bb4849c126b30918ac57f861cba85 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a4d29d79e6c1de64b4cdb384000eccc37c21fc0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/263c72021dfb2713e5790792826cd884a9e0912a | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a86b1866fbba41cb42e9df7867cac78fd12188b3 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a51d0ae16bbba6e2f8c11860fe7a90fd7c4e5c8a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/65920cb82bfa7a4295e6c5e6e250f9ee32e51a33 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6f447fd4d21c498d1e34ace93f12e153ced8661d | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eab424a9f4f9efc3ba914a03b1ee42c0c8879d47 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d83f455d3a60c68cbb0c56a159289b8ea65ba32b | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/bb664c59dbbb8c1c27903afba778f32f3d4d33ce |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/da4598583c0e5911aa065638422612aa596f6730 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/143fbf9556c31f6cbba384c4d1c09a25909dffed |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/a0d3b3d1a5eaa18e144fe10d16f4ba87757362fc |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/c3308997e7004d8ace8b58f2d8ba8d9aefdc51d2 |     
   mips64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/981565f204c21fbbdeed49518a814f78a51fcec1 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/27b169c73e0204c3f62f73aa68e073c19791e66d |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/d1391b3c8f9d4290dda2169b9840ab7b51015465 |     
    i686     |    host-nodejs-src-22.23.2     | NOK | https://autobuild.buildroot.org/results/a3e6a5dee93315c8baed90cfa53194c8916f09cc |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/2f9f493ec2f0688f7cba953dfb024fa9abd372a8 | ORPH
    or1k     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3fc44b86ed7d4e27e5d92d6409f367d5e8b76a0f | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/66d07176c2da681a29ba7b898b41906a66de6278 | ORPH
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/1c6e0f2c51b4b568913e3cef50fa89ef3777c9ae |     
   armeb     |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/ed63ed23a73912c0e47a7e5b31e31d077b8ca475 |     
  riscv64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/9c88cc6d24c75244422736bd7f56cce24dc746b6 |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/e555ec7d3a17e020d68bd51abf1b038993b0acbc |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/791330673dd93df6a1925277a424403ddc99428f |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/289ca74de38aeead73690e2681772746928a2ed5 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/417743107692d95e625c5394e26c01b4a70dfc09 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/9f154641e7507788dbb3c505bc3e687158ccee33 |     
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/8c7f236935c371e2859befc85ea9e461de5ded45 |     
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/1818cc581fc7e8550bc4eb3ea3dfedfbae19251b | ORPH
    i686     |         libaio-0.3.113         | NOK | https://autobuild.buildroot.org/results/bf786208102fc0ed1820d0cdf36aa1843becb284 | ORPH
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/9875e3f5816e10a7937d744a3fb9e789839455cd |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/eaeb8334faf7af3171bd477457a78d3a6532103b |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/e9ed1ada623e262241271323280b72e0b746a895 |     
   x86_64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/a8ad610dd685a018c81ad0fd1958cdc2dc1ac376 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/1b7ba2b828e50e215e6c0c2393e962d2471ef8c3 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/df35989f2ed125631ea324917e2b14af3ac5ab92 |     
  mips64el   |          libdex-1.0.0          | NOK | https://autobuild.buildroot.org/results/c0471423ea449632cb8754e153fd68677ed371db |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/b7fdd83f6e7d6dc938327282a3a7839fcf4408b5 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/fcf2450b7dd0631dc7660247afbdce8a45d3ca3d |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/e36f90a67be1ab887bd2a4d0cdb5a0193e450308 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/cb8b8cb1dfb275b687dbe68fd8c0369bdbfed551 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/37a98033ef37961b55758d0c81c9a7e5ba5afb63 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/736d0a2ef447bf939b522df987cabe7ed3dbff23 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/59a48ce4454672d80132630c739c643efff43c7f |     
   x86_64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/4602d58b569518d58060f77d4b8bf9cde061e61b |     
  aarch64    |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/be2ca3976bed39d600b3b6e17c9d264cef613c55 |     
   armeb     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/7eebee68681e5773d0dd4e413df07dd6e5a6484d |     
    i586     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a9cc5feddd17fbd468fd04ed305a4038ccb44890 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/6b895b459425546417c9705907b7d91eda151291 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/472c0bd2df72e97050c2b7a0a4ea6fc2930bca4e |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/0ce741b9d66b6a1d970c23cfc9800dc024b2cb05 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/831c452c9189abd0d2ba4b6eb1f729c85f589d70 |     
 powerpc64   |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9b592c1e0008c1f9a41c14df4d219894736fc0e9 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/49a74ddab5cc32cb6ccaf784534817073ae5675e |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/bfcb8c1909d9eca168b2b57438bd19631f26f65b |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/c294fc8ef21ddea00c640d90a304ce7f511e3f20 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/e347c6eaf67d03ef2b2e6caf3a2a5e4336adec58 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/60aa674eb9aeb3e1246f6c5b24c1862403e7bd9b |     
    i686     |         libpjsip-2.17          | NOK | https://autobuild.buildroot.org/results/2e349fa38873e641d63ccd0f2a0dd7aa32eb93a1 |     
   sh4eb     |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/741b90cc907d2c4b7d72f0ad70ec398d4550dd37 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f4036aacfbe5f705cb9a558d0bcee59cc7a288a4 | ORPH
    i686     |         linux-5.10.272         | NOK | https://autobuild.buildroot.org/results/e340781bd8d248ee86a49da187455d78ef5952f2 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/dbba354d08390cae395cd84ae8e0a4fd8eea13b5 | ORPH
    arm      |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/eb5e9722d6e8a182e446dac34b89f3d1066e4abb | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/667e5c63fa6073503a6131e9d5b84de403ca4e1a | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/25993981dbe0589a869d8cede8f6b83d56fe0c5d | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/df27beb3ed0811ccf695514bbe98cc65353808eb |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/2961d6f0dc253723d6ae06c4a8162f87b0cd93ec |     
    i686     |      lua-cqueues-20261006      | NOK | https://autobuild.buildroot.org/results/243a96753ae3c90c371ec447819269a695969824 |     
    i686     |        mosquitto-2.1.2         | NOK | https://autobuild.buildroot.org/results/dd5ebc4822b80160f4e1bbda6a4e31025d53363b |     
    arm      |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/0c37d30f3113e4f045fdb509c355ebd3a36dbcfd | ORPH
    i686     |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/5ba1dfabc46c7b4b06907e5f2a274a060f32a738 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/006974dc41ae370eb5739212119b784864cda5af |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/919f1716e941fbd0e827d6ec49f0073e2b69a892 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/be7d4de7e561e8f67bc91f911756c65ac2e402b5 |     
    i686     |     network-manager-1.58.1     | NOK | https://autobuild.buildroot.org/results/104c0e15617d52ae73930fa1c439b7f426837e8d | ORPH
  powerpc    |        ntfs-3g-2026.7.7        | NOK | https://autobuild.buildroot.org/results/6d176b9133589b21daf4df99c8d018e2a9b5df87 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/27e6fc738abf7200f02338860469d40669189e73 | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/92a7cf0268f9fb803589238092c9b776b117301a | ORPH
  mips64el   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/bc34d9f04f27d43097b8f8a45ad0e487c780ac57 | ORPH
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/29ffa75696616dc016862d347735ac1fdbb24528 |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/2396d8e007728f9f072b3082e4d24da195d749ae |     
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/4929b5275dd8c0275be72b569f5d354284133f4f |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/f1546060ef290d8ab1f4b518a3742a1c662af13a |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/87e051b6f1ec3d59d8acffc5bdbae0b00c3bb0a5 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/161891bd8622bee69aa42ac102b46dbf00a6ac4e |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/5562a58b44acc38ff019021d768380c65e603438 |     
    or1k     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/ca34114370f651daac5a423f6b4b93460e6f881a |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/68439467e70ae3449b98c397da6c2c31a8b5e902 |     
    i686     |   python-cryptography-50.0.2   | NOK | https://autobuild.buildroot.org/results/a5867a916b5e4a5d9fb9b952d3bd48f24403a448 |     
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/ef3ddfb4cd35cdac48d1a1e79484999bd8cb83fd |     
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/6f7471f9fa0e3ae44e94565a14bc489152c4451a |     
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/7a2f047ad34f0cb9ecb957aeb25a533bb68a9fd8 |     
   x86_64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/ca4f27779500f532194970149f18fbeb7fbefda2 |     
    i686     |       qbee-agent-2026.27       | NOK | https://autobuild.buildroot.org/results/01499a188dae83f225ab94bed44b47b8fa9e33bb |     
    i586     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/3deaa56137d830e14265461b035c5a974cf83263 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/f32d06de6ec661cfef68b96290fd243e9951eba1 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/359e5692827a0a112b639dd8b0a6f31a06866073 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/e60e9f512f603fad0a6e913c731bf63eb49a970c |     
    i686     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/76b5f3a508b6e388d43fa287aa448cc41a9cc01b |     
  aarch64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/fc361bcd1ad4d5e571e474bbef428c51b391087d |     
    i586     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/bc4487b95380430539c8614328d420b2ad1a3792 |     
    i586     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/f72d54fbc64a968ae126b815c103f43ff74272ae |     
    i686     |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/f00d523aa13923c9eb73ae4e1b1f04f297512351 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/b965a9a1eb97e5df79f92c17bf4ba09b6fa3f137 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/df822419bab5c790cc26f4c02edea66982573b5e |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/eabf0f0d8722ee1ed00975ab445356c434112568 |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/716670c3b9f8eb9e3401132fc7983f37e9dc1e23 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/583d66023c715971b11debe234d14ccbd1130f1b | ORPH
    i586     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/dd4798cb165eea227572b5ccbbc4efa7794965fb |     
  mips64el   | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/40190b560855a8c41903dab9f3decf981df469be |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/120c216392a6d0b8446000821802154d9f2b8503 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/db256b06b6e73d35e22e589b2da1f9bc98121841 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/9b8f39a5b8a8b0f5971f5865b1bf7ff279a59fec |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0747c3521f7d10a0ab3e75bb026b260e31456ea4 |     
    i686     |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/72a09f056f7ae114926f5c0176f2a5b88a54dedf |     
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/4317c8ccee1fbb4a853b4d8f21c9443150535e17 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/bdf92fbd5f476d9f747a7670e6dd7d71d129b1ef |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/4274cd9f10efd4826ca3949480036b6c2fe2b0d5 |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/36f12570259d9924624d1d89468fc747a1133c86 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

           libplacebo-v7.360.1 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      libplacebo-v7.360.1       | NOK | https://autobuild.buildroot.org/results/344af8504a77ae96e4009d76a77572180cf49b14 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

         docker-compose-2.38.2 | 1 
            dt-utils-2023.11.0 | 1 
                    fcft-3.3.2 | 1 
             python-webpy-0.70 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     docker-compose-2.38.2      | NOK | https://autobuild.buildroot.org/results/b74ff23a3960f18d01e935a18fda66bcce8b4b0f |     
powerpc64le  |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/8bf6c0dbf5daa6a92f5118233831589dc50fe724 |     
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/5f9e534abd72f8ee1346b135864e2432ee502a7f | ORPH
  riscv64    |       python-webpy-0.70        | NOK | https://autobuild.buildroot.org/results/e8c519ecad98aafbf47a8bddc5660b2df424bf37 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  assimp-6.0.2 | 1 
                  ffmpeg-6.1.5 | 1 
                libaio-0.3.113 | 1 
                 logsurfer-1.8 | 1 
            minizip-zlib-1.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          assimp-6.0.2          | NOK | https://autobuild.buildroot.org/results/e5dfe993cdcb11b05396f0121d512d2d40a29c9a | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/3ae43d4e06351c88fd7499f2d78b4162e85861da |     
    arm      |         libaio-0.3.113         | NOK | https://autobuild.buildroot.org/results/058131cb709b66160fc9d3488e5d5f45f092103a | ORPH
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ca66db1afc61afe09c2b9b3d580d570c6c3d72cb |     
  powerpc    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/934c99e8eb1f0ada331841d5623542c0c1b27fbb |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
