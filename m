Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECCFE83056
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 06:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 902B4607E5;
	Tue,  3 Feb 2026 06:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxxKc-ktEVH1; Tue,  3 Feb 2026 06:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 650A7607AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770099448;
	bh=t1leQrrzd1gJ5ObO6KgasVTBfiuqtkunmzP6+KIgbyg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JvjMUMmMQGnPz7ly7bGpdwYV5Isbk+/8zFyNIu6/iWRHC11riLp1HYqxmIFFrV8+a
	 Jdx9DQsGOaeXjBLvj7XLZfZ7Ch4uzsVkJOcQsBHu6FJRcie8wgaAfAq6YEiG0Ner6q
	 anf0F7QHg94TSzBvjTqxLSaQ+bT/vCHpI9Fvgi8CQbADBIZFihf45egcak6g+uDyNR
	 JkR0n/9T2Sy7vM6z7QJ5qJm8dWu7y4FWGWjdJXRBz1LA1vHsac6prgMBdLbq6VJSQL
	 UZWvhgu2J/MqtKuJRdsOgrXp60FR9ZF9pEfJC2hy67RjjLkAY7O04+k89kUJlv0e/w
	 68ugIgo8BwYFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 650A7607AE;
	Tue,  3 Feb 2026 06:17:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A16771A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 06:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 838AE607AE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 06:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usBRd6_zIFrm for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 06:17:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32DE7607AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32DE7607AD
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32DE7607AD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 06:17:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b885a18f620so783322666b.3
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 22:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770099444; x=1770704244;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZ3qAwN4e4TOA8qHxRRWzyTlOaTn9SDpUuY3tqOB2Vk=;
 b=RVZbY+3HFux5nlF2cjcTU8yAq8sheV+PKEygLatib/H7744VYRSm+FyuggcaedQ4A9
 yGHbd/U6bOYXy7Zki0kvI53qzl838VB7RuXp6B70rag9+ljESAaxT+jaquPqntJR7fAq
 oIoN1W0Fv7Z21/hM0SAO/QObBDkQ/9djT/kvKqoMPhQG6T8QaPORHdTOZ0CfUTHcgCYE
 +DVClz3bI2ILTBqrM9ulg9h9I6b3/I75PeaQod/wU4849JcKrTbydQegWKFP/W7tAJ4j
 PgEp+4esF4Yzb+1Q3x4oEUoAX8LEGy3BmDerWrXOroDP7rWs8ggVEFxgl83JwJRtkk8e
 RJWQ==
X-Gm-Message-State: AOJu0Yx11dGTAZVDgtqkfotl7mSyEeNsQcb9IOc70j7LMtJjOI3R/10d
 A32vQ1LeVgCY0VWJU0JoTR8VMH+hEc4xUAIBsownXDPwlXFYzFWdSla2Y3ntig==
X-Gm-Gg: AZuq6aI5ggV2aya8kYf8EWC4lJBaTKjrZZ7QpmtodjhtCrXkCGKkeH6j9sb6hU8IEYG
 CEthnHX3Ns9WpF8+SgTF0s6gYlFH265X7uYiP02k2qQyfnZDn5BYkCXlb1E63De3brxZ3J7PoTI
 DarS+l6zybtcFe9mkQ86R8FXqktfOoc9/4yU1KKdu7XQcblyuqhZ3xb9IbvLNtYijNgPhffCwEU
 xz+g6oJLl9zlon5/uBebD65+3QZtdGXsB68L09xVYGbtEVrnbjgJtdRsG6AF6hV7hm33tG5AW7I
 P6j99VxpWlCToP8obXyaWA9izx9J09JOpaONy1IGSqVSsxJXkXRr4OyS036c8NRmEgF78v9J0F+
 OWBMOBHLIp+n7+c+iRkKfK8S+uanxXMJtzO4r+abWZ1b/iRBQy9ez/3oSNZHrzuCLP30+Qd+GrC
 W1JKCJufHoPOH3Xf18WA==
X-Received: by 2002:a05:600c:6088:b0:47e:e20e:bb9c with SMTP id
 5b1f17b1804b1-482db447950mr160600285e9.8.1770092424543; 
 Mon, 02 Feb 2026 20:20:24 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483051287cfsm55701165e9.6.2026.02.02.20.20.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 20:20:24 -0800 (PST)
Message-ID: <69817788.050a0220.35a51f.d1cf@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 03 Feb 2026 04:20:24 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770099444; x=1770704244; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pZ3qAwN4e4TOA8qHxRRWzyTlOaTn9SDpUuY3tqOB2Vk=;
 b=nO4i7wk1jYapnfCkpoPMYDRsPE6ajghiyk4zUWOIg8ywCjVsWypg9zXWVxiHI8exdf
 mAwU12I0lxfEfwBXih7Fh7A1fUqHEJ7ppNpKay7VK44n5xHhpCpDBIOJebXe+1A0Gygv
 VoCcdgzLJPBd0YrLS3zPbXhSaRVp9+M5WVCmjgdKtCKqVQUX7aCvswL8diCGNdjsd193
 btdqev7FfIjPPZlkfSJt2m6N39r396JLEmLaIPfugHabzMibcXcgqfvD/u8TNzxpDNu1
 RjeYZlSjhbfUws4ykYfNM2dOcmqqZFOqG443GAa3c5tXaXXRjZlEz6rjsZkSqIOM6q+q
 b6gA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nO4i7wk1
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-02
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

Autobuild statistics for 2026-02-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 12  |  0  | 15  |
  2025.11.x  |  3  |  2  |  0  |  5  |
    master   |  8  | 24  |  0  | 32  |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.42-51-gcbf39c26b258... | 2 
                  broot-1.54.0 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
                     crun-1.24 | 1 
  distribution-registry-v3.0.0 | 1 
                      gdb-15.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
               gocryptfs-2.3.2 | 1 
       host-gcc-initial-13.4.0 | 1 
            host-go-src-1.25.6 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                 jasper-2.0.33 | 1 
libfutils-c326ce0cc2a735438... | 1 
              libopenssl-3.6.1 | 1 
     libphidget-2.1.9.20190409 | 1 
               linux-pam-1.6.1 | 1 
                    lua-ev-1.5 | 1 
                    mpir-3.0.0 | 1 
                  nginx-1.28.1 | 1 
               openblas-0.3.30 | 1 
                       unknown | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |          broot-1.54.0          | NOK | https://autobuild.buildroot.org/results/c1fd374eb3ab3f0f6b19a1f8fa2d96791ce8a7f6 |     
   mipsel    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/bb30c88ae46a5ba465db02c702580bfd0e0e9583 | ORPH
microblazeel |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/984517e49b6f54aec7b66a5f177f3c6b8d4f462c |     
   x86_64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/09404508c78b93ba163ed1f729e92bd651054d4a | ORPH
    mips     |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/b856d382eae655ab0f052a22a2025deb27a7b41c | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0df483cbe9ddef645ec3bd18a8c073839a52e697 | ORPH
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/6aaf79ba9f2d898c41dfa46856ae4ceacb3a3d68 |     
    mips     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/a00b92d744564466fc9bab192b2f12a86fd53e40 |     
  riscv64    |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/199a9a720a0248a03c6b05cd36773d9a7f643f51 |     
    arm      |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/55af599931182801140642019fd8c551fa63b901 |     
    i686     |       host-go-src-1.25.6       | NOK | https://autobuild.buildroot.org/results/106690d677f201f4bc91c4bbbffd7ae910eb67f0 |     
    i586     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/5f1d40f8defea5d9010bc3567d2d151d3d0cf351 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0fed2f961e94d4d0bc7fd9b0950e221188b97509 |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/555af4ef12bfe40b639b1c07cc048c1fefef1130 |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/a97e9f4ea62450d65b934593a112e8206d2cfd3f |     
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/94a793f5f26e586e377fac9a633fbbd74ed46c8c | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f7326d5e98e099f388ec2bb55f9c2781573c2840 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d550fb8b442d289c0376cef00dfa637b3287ce57 | ORPH
 aarch64_be  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/e940d8384de7314a8e4d4def4ea25436b35c39b2 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/935b90112676158f2823dbd9edd9d25c6f884fd2 |     
   xtensa    |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/7b80540c457f50232c96683078059dc5e004a112 | ORPH
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/cd5e8030e9facd776d0f215e22786cb71c398fa7 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/cfa5f88440d31ef3fbed1b850354849dc2713175 |     
   mipsel    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/4197f01a0e5b34672b28c8c1045ed7efbd88406e | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

              e2fsprogs-1.47.3 | 1 
                    mpir-3.0.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/033246107110652769ce3db19e08653d111dcc7b | ORPH
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/099320bf0da5564debfbf67ec13cb041b9f6248c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 3 
                libselinux-3.7 | 2 
                       unknown | 2 
                   dante-1.4.4 | 1 
  gobject-introspection-1.82.0 | 1 
                 openssh-9.9p2 | 1 
                    sslh-2.0.1 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b9607350e834218e586fd6030e6feffd77ecff69 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e36628c20025f26a12c777adae0e786f4c371c70 | ORPH
   s390x     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/0a2a7f29827bab2561f039a79d973fd3052ab5a9 |     
microblazeel |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/0b7795d76f443811a5cc0cb392c47b8c38dc9247 |     
   s390x     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/67ea899fcaa40dddebba82be3d7ef48a85cefb28 |     
 powerpc64   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/efc1e6e68610da5c0880cdaf29afcd64298c5fd7 |     
   armeb     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/2fc38405abcd95bd7584ed069e665bfe37fa745b |     
 microblaze  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/edb13aae5f08bbe9896078bc60427d7c97504d43 | ORPH
microblazeel |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/fdf67aedf7cfc3686fd1cafa9bbc9e1e8e7b5532 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/fc04e109c6f9ddcd2562d59b38948f4aecccca14 | ORPH
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/461a660ad35cd58e2c72e40caefe37a0b7ef391c |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/1ac9aa9aa190f2d82548b9b62422aa8dc0114d6d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
