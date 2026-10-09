Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD54CA5FED
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 03:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3807860658;
	Fri,  9 Oct 2026 03:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWy8bAh44IJ4; Fri,  9 Oct 2026 03:27:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 199B26066D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791516461;
	b=U852cPJkIOGOL2wT4Be2FkqNacdo13b6VnrKNuMA+7RBYgD9stAmUMccKmh3QnV9rFVh
	 cNKNg/frZs9OkZtCam3F9wCNK1l3aJHZF7vP1eFQCIPm3pmwObU56Xp3ZCylT2YYiirlB
	 kH1Yf1YgvMOi7Ic4TMSN8mbzbGfk0CQpzXj1VasbZg9YMAatT8a3admefg/fZYdD0CmdU
	 jYyFUPZ2LIcyjHYcUsRn0HyfmwJCaOwMoFxZ9CXXZk2VzhQp3MKSQ7ic5KYXF3nY+LR2e
	 DsrI0ZYWiQicvGx9J6iX87pFiT840wb41oWPRJ2bY09z0alv0sw2Jw8FL91KhQvBk6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791516461;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C6J8mfVOmlTUydRP9M2UpBqqsVsC7Owy950G9qllhJU=;
	b=CIA/+sXFN+GoJkKf5IkNLj1UsZ1Pbn0rMaFoeLDIPR9qfPXmKZjWARhx6PtfNTzqqzHJ
	 2Fs4IxiWuP7hf/iFfNlvf1beZ5u5oyw1Ef4A4V19e61iLA5VtSzs4xb9VyXegRq5soaZa
	 KKVPYnDerOhPVl1U6F72L+SboKH17B/Oeuzrdzy91sb3WuNJTABgHJftAznKvHhUPvvri
	 hQmy6F17o1Hac4pM3WKrm4dJl+RdynVdHk5D280SeB6SWYNsVzptW6AQGCOHN/9MqoGdp
	 nVCRxYQWGvBJbNJWnCtij3L6gRW+tVBX1fyS4RAkAZ6x3fUWj4b9UT3/IUtBC0+y0WQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791516461;
	bh=C6J8mfVOmlTUydRP9M2UpBqqsVsC7Owy950G9qllhJU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=brYapEKbhB5mmT+LEqnk0d3JP1Y2pPfwA6i1iHMNgCbBb6/vYepIzbqyhxLzz3i5/
	 OHxf1K+NBsVZJwxu5+lbvENoP36g1PRS8zksfqO9OtJHnBW7a+CbvnIf1ldZPDYBAr
	 3rv9ONQPZtnNjLpzDQZJfAM8OKtWLJLLlIjsAFeIaFLxQQxKU+2uR/fqIGlQJmj9aK
	 fcNKEFIv9IUctTk4TiQHCabISNxnIK+7TYb5HeoakjpxvA97JSPfAQsLdFgUgxTpar
	 6i2qPwQ5ClemgnOGk0jfp+VJAHNROgznXIKO3so+mojssjyJ6JHYhH9CaofIFokgoi
	 VYV/mVSJhUN1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 199B26066D;
	Fri,  9 Oct 2026 03:27:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1A62E0
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 03:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 858AA4006F
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 03:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id om4C0YWriYm3 for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 03:27:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 16B7240061
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791516456;
 b=kB2hnH56vIBsyw5oj5882VSSyEDooTTB34NI7cLPiZ0cXxQqz4CFt91z5CJC3ZMKlTS8
 tE7HHGUP7p7npUlzYEbdNApZ4puPT1XxGCsPbYnwifB8Ris5AMGQ2t81LRc7poMulbLB2
 vwwpME40FhNHOWNM4hAsfB1JUs2A/zZYpcCuqpinyMEwlG65Zlp6rwRKEK6N1mVMWFo4E
 hQbwcL6tSadCL97XSda5PGY6ADqcLe7m8byMKtSzkwPGxiMv25UwqNtMCiWHuwx66BjKn
 nRlviatxVAL+Bsxx7NflsDTTQHLHYLudF/1gK35SG8VjHwXxfypXKBMy+jYCK6lN9FQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791516456;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=DQ3ml652KZLqjiWKr6msCDvKl9r9WG9l+KZ7/yKdNLo=;
 b=qnH/dDd5bE63f9U5Dln59litVgZej5iiO6EPiGyk4bC1zP89X++D580efk9FPBwObFB4
 Xz91dzPnUzGluqtCa1Y7Ul0jei1yzrFOoMOuirEDvH1BnBcvzXQgLcTy5bw1N52qsQCBX
 WTs3ukLROs75yNzv8bWNj2O3IMox1051G30EY1w8duYIvXya94cJZczPI5YtSbr4FCmQL
 HJGuxFMlfPEAoFkhguP8QValzBFECs5jrywNGN/CFHpw65fbjZBRbW3+ouHPL8PT31QKp
 91ByEG5DdUhxOf2l9hgVH5gcVpHBA4Ef12TqG1khf4JCPHV583CWq092b6NYeXvSS0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WhDhexoC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WhDhexoC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16B7240061
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 03:27:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso7853075e9.0
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 20:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791516454; x=1792121254; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DQ3ml652KZLqjiWKr6msCDvKl9r9WG9l+KZ7/yKdNLo=;
 b=WhDhexoCgdJf/Ztm36TsZI7bVjA4SvEjo717TlCrF60PYhLro+DBpYsitlBrXYPVNV
 1IsVKBv6bURQL2gXma8tK7vpiBwSmE75Rj3Byu3J1xV4xUePuTXZMhpabjzp5srWBsTr
 QrhA8OT6cPu1xMZbxhoCBg4epIIXNKf7QXiSABkhzLCFmv6MHeVwYnZxojxuPsdBOv6n
 pxNsXjWa65liNkUu7wix5DdGwBdMu+kzKGBTU/pTYzLM0JvJIPfvIu3KcrXjJnakXJt9
 8Somf5g7DBcSQufAfRzJc/WBlayzhYSUprI5tiVKZxKEzTILfSYVTIh1bQeAZUWw5ZgL
 +Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791516454; x=1792121254;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DQ3ml652KZLqjiWKr6msCDvKl9r9WG9l+KZ7/yKdNLo=;
 b=gu3pcJ2r3p9h2ACptK8YJMnl46TJG1Kizi/Qa+9Mqn2PC8sKJvaw60ofkiw2olDRrq
 NZJ0XhRY18aggeagxYgusuJWuXnCJkZ3I3FbTXxkh/PsuNhXqO+PRYkcHkLvxiIfzWT0
 bFGrzCvJOHv+QoL3DQCVWctr0YFY30G1xQNrkwkQwSjv+wl7HjbgvQKrmRWWJUwzEwWF
 /KmnaE2dVj5Yz0gI4W6P7Q7UjFzodplo1ATOFAXrdBgqO39bzuo6eXH1IvHZj+P0dkCg
 h4NCuei7oGjGdpIERp3s0BPsszk9UCzHBGRBFHJTaU4qC3Bi9VnVPe2aqd5Da92VSjNh
 hxPQ==
X-Gm-Message-State: AFuF++kElxNTThL6MiNLwc5uYauim/3f9D9tlUm2TPs5wNEhUOtls7OQ
 PI3QEweIXMCC0MtRHhW/Tuehc2jYmLlJ0fPgc7tOm2LGF5cejgqTMlSoYwrL26H/
X-Gm-Gg: AYBFou32VHefoSd4RrlhCP2Qag7G4oaGMHgW6cp8Y2Q9BaoLLQJ/v7zlmsDkoavCmk0
 EaOP0xCwOZzcZDbEpXTb/Bdec0bKWDeHa7c3oXVU9R6MJOpUeZQuygIi47EK+FzUrQmkiiUKdFQ
 lJ5RuAkl37i/d8joVVct+ozOM+g9uUHyJjTufUoDg9U3ZgHawFiJQp67odlYS+gtiF9eXjvq2Fb
 HZh2AmmGjrvyJBWib1BSBiwNb3kCNsSKlPb6gfoRrGrP3Iu6QBpEnQOAWKmFbAzgE/1vl5/e5or
 llooB8Z/zL3qssEu4KY26UqkBPgS3GPhs1Y3FeOAnWjRGEZvE+HulNZhunY5RoBZM9kxXHbo9GF
 DYtEbDW4hrnCA58tMfmsY5Og8tjQaStOswjxLQyiTvFR8i1Zx/mn8CcC3TOqbkvUn2SJ2xBv0/O
 CQBdifWYRNCIPYgipPWZzPVxDcrZbOV0kCZgPu25zO+a9SaXJNTaAtnqVvmKo/Mn0a9Pgy53wzq
 g==
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id
 5b1f17b1804b1-4a18e49ad83mr8800365e9.11.1791516453286; 
 Thu, 08 Oct 2026 20:27:33 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf4979fsm26078925e9.15.2026.10.08.20.27.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 20:27:32 -0700 (PDT)
Message-ID: <6ac85f24.1ef92a82.eb5aa.0cb7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 09 Oct 2026 03:27:32 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-08
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

Autobuild statistics for 2026-10-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  3  |  0  |  6  |
  2026.05.x  |  0  |  2  |  0  |  2  |
  2026.08.x  |  1  |  2  |  0  |  3  |
    master   | 24  | 45  |  0  | 69  |

Classification of failures by reason for master
-----------------------------------------------

              execline-2.9.6.1 | 3 
                   perl-5.42.3 | 3 
                       unknown | 3 
                   atop-2.13.0 | 2 
            18xx-ti-utils-R8.8 | 1 
                    attr-2.6.0 | 1 
                   bird-2.15.1 | 1 
                  broot-1.60.1 | 1 
                   ccrypt-1.11 | 1 
                cifs-utils-7.8 | 1 
              cryptsetup-2.8.8 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                    emlog-0.70 | 1 
              erlang-26.2.5.21 | 1 
firmware-utils-c42a3bc53da8... | 1 
            gdk-pixbuf-2.42.12 | 1 
               gocryptfs-2.3.2 | 1 
            host-go-src-1.27.0 | 1 
          host-xfsprogs-6.19.0 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
                iproute2-7.1.0 | 1 
                 libclc-23.1.2 | 1 
libfutils-c326ce0cc2a735438... | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-7.2.9 | 1 
        ltp-testsuite-20260529 | 1 
                    lua-ev-1.5 | 1 
python-types-python-dateuti... | 1 
rtl8189fs-876e627a5b6a80217... | 1 
                 rtl_433-25.02 | 1 
              shellinabox-2.20 | 1 
             sigsum-go-v0.14.1 | 1 
              skalibs-2.14.3.0 | 1 
                    szip-2.1.1 | 1 
                tinifier-4.1.0 | 1 
                tpm2-tss-4.1.3 | 1 
           virglrenderer-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/6ab09ea33433e39996b1b3930b8ffbbd347d6b0c |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/a21492baf5c50e3c0448db49f27bc692ad3cda6c |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/00f512bbf3bdb9215a848b405dbfd41a8c95253b |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/3a639b922984e0e5bdb09415b73b76415bb641e1 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/35ed0250a7d1f93e73906530273c9cfd04a02195 |     
    i586     |          broot-1.60.1          | NOK | https://autobuild.buildroot.org/results/60e6628bd838cac9bde575449511cf5cc9db84ce |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/de09f7acaf32ac86232d858676d1092aeed4f95a | ORPH
    i686     |         cifs-utils-7.8         | NOK | https://autobuild.buildroot.org/results/e34ec12c234725a9f9a38d309f08b968bf9bb812 |     
  aarch64    |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/96ee2927a6c30ecfbaa5b39957d752a9286dc5c6 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a36fe61a3e51e071a30ceba0f5b40d1e4372af5e | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a53a3b7f29fa84618e2a2c82c1ce4fbf37a5fc3c | ORPH
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/59ed03cb715e10732fd9c06bce11fbb6ee5dda08 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/0781a4665f5fe3706982caae34d2451826345f53 |     
    i686     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/70b179607c87d6fb6119b693732442053b845cbc |     
    i686     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/5789070c7d4b2387b83fd2632b0e15a64da750e9 |     
powerpc64le  |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/3f5b03d91a4070d78708b4886f1a9837bcfccdf3 |     
  riscv64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/f65c330d8705a1b65a91790ffe928c74854860fa |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4b2acf001494b393300ed8e1e2b89bd86804b40a | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/002cfdd72c765a6347b75536af551cae60d664dc |     
    i686     |       host-go-src-1.27.0       | NOK | https://autobuild.buildroot.org/results/40e7d394ab52caf0fa4cfe12c0ea83cfe86ae7b5 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/722d19a2588f677290002048bbf49419ea5cb56c | ORPH
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/366d062a1a478c6bf25bff4264092d1cdba2fee5 |     
    i686     |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/0330a3fb44c1234a03dc36121025be49798cfb4f |     
  riscv64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/cd85502b9d02b17a513617b6035a3bfb30b7625c |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/4a9248bcdb9b4a28b472464fb5ed1c0ef91af429 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/e90c620b81e6577f6c69b5a065a515b30ef1818d | ORPH
    i686     |          linux-7.2.9           | NOK | https://autobuild.buildroot.org/results/c8c99652813dff12213ae7a7836e2eb0f399c36e | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/8ee622f77d1958a13b3b31ace427b1c0536a0835 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/9056fb4565e099b96200d426b904e6ed999c3469 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/b0698acd4ba11d2a77093cd43d74230b2d664daf |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/2b2d99173b882de546d9420907eab727322dc19f |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/9b2028a67ae4da8472d872a4abb25a934bb310c1 |     
    i686     | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/1ce798157bff8a423ca8c7c9f0e82620890ec3b3 |     
    i686     | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/970f38a0dba506e35d0a85df1f98f29e5fc989be |     
loongarch64  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/f22d4b345d515f26a9fb789f93dca26ce0cfcdf5 |     
    arm      |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/c91ad404dbcf517741991af27e5f2f4478595cbd |     
  riscv64    |       sigsum-go-v0.14.1        | NOK | https://autobuild.buildroot.org/results/746f862a7d88661dd5855722e0f8da3b14b476ee |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/ffa060a217a990c1e5698711ea2f120ebaa089a9 |     
    i586     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/2ae39e53c27ed8bd35183e151da8d523be5f3d40 |     
    i686     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/f5b67736792ec8eb5ae8dc8f3d156b6a0818dcfe |     
   x86_64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/0c23d0225e82019f36ce58394f853890d6400f18 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a946a2d80a3eb9825b6bd08e1f4d430990c7d14f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/45a7ecac76f3df86fa67f1324fbeff4644ed7134 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/79467c5ee050b29a12a029d05633923db283e24f |     
   sh4eb     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/c0b3e778341c1e11db5ece54ee9bcbc8fc65f0ce |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

               linux-pam-1.7.2 | 1 
                tpm2-tss-4.1.3 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/406e57c824bc91a18d7eff052a85683d7d3701bb | ORPH
   x86_64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/8c4929de005309aa14737b6e528355442ddc1b55 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                  boinc-8.2.11 | 1 
            jpeg-turbo-3.1.4.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/96e54204b872be23501b5634d9141cf68ef28c78 |     
   x86_64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/473af5bcdf151c4d317096e7c9743f29298aa383 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
                  liburing-2.6 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/ca19254f0963f20894d597f5f4714dc1c6ca141e |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/f20356d335f1e9002083f662f8336e0abeefe26d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8a34dac563a61866b5098f22109d5dab012c9064 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
