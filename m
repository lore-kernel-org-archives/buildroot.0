Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B9ACA5FCE
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 03:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A8240BA9;
	Fri,  2 Oct 2026 03:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fnx3vK-vh9m; Fri,  2 Oct 2026 03:29:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AAE0340BE1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790911772;
	b=UHAt/GuDfruLW+cOIKyxYn3quy/kW1h76nFoQgkUGNwGZhF2XyY6vHNdOKOzjA7Yy39M
	 htUZCPt4kw9YZnKePmic/SfpjRsp9e5dkI+2RJv1cihJ18XhyQZJp2Bt3tbX4WJWbx1Gl
	 cm2BDC4mEGlSA/7Jx71YTbV7cqlz8xuW4oVpSSmWdXDFxFPaVVstszAPlVxJhsAHEjMVj
	 xfmxfXt9oaOTYiAwVcRJxWVNnesBngQ+1vDVrKuC7jpeZHbboy7j6SLt5qhqZlfggCMV4
	 lcFAPmhxAfBeuuNhLElAhVMKUxNpC6N5CfahD8lcQEkYkOfqCR9RWjTPsXcC9G4kJqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790911772;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qp3D7izaGI3U8Us9b5bMZhwUdYvB4+W3oKmpEwUxX/o=;
	b=U9IyT7gypR8UQ89JqUPmqCQUXR/y9zWz7m3yQxJXAecNe8Q3ETBu9erHkaESmT2uOzWu
	 itNM7toqD+Kk2EfmNUvbN8NwdAaiMShRbR77YlXZx/rzL611MCR+FZ5l9o/btyRWEir8e
	 pKqEoESe1qQP6TSrEyBakYFFi6wwr09JeLPBGLzTyc56eeIRkwv5WQaIaDRbYSbArtgIS
	 kyv/4axDyWReSEcwA8mbw3R9ius6k6jBdxM0xGLoA2x9ioEEWY4EC1pD5OflTruHRmUWv
	 7y4iTDIJPsM1S7z9jPIGQbUR0BmNteUq/zi75NFOFrPecOSh3+RkdtBTOj0mjUdPISw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cpd6QePk;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790911772;
	bh=qp3D7izaGI3U8Us9b5bMZhwUdYvB4+W3oKmpEwUxX/o=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=arisw70oLwe835NUoRbTsEisVrmnIKg/xp5euQ09XAN3Ut8f/7TzEb/Ov4fR0Nrak
	 qIPfAUnCkd/E2EGRKBmgpfmXvCxnyoohB6ysExMZL4yRz2kw6oJCjYV/JgwLQEDEox
	 YYRU4KFVpIJOeV5UxWXgQflxHA4VcLO5QIcE/fn+EvT9+o2uSGnAScEcP8MWP7aK3s
	 Yn/W5ujRVVDhoKz60e1d59fKpoIxG0df++rUOmNIBMT7EzpNUTNZHoDMurdd8/oY+J
	 zJU3MwBz5DrSoo6JZxLcUmc44oc8CSO6Ch0TEdnL0Z4wJQBQAjziwwIC6I0ECm/efh
	 PaUyiuCJ2H5AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE0340BE1;
	Fri,  2 Oct 2026 03:29:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6107282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 03:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA75540BEC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 03:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVLTwxfsEq6Q for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 03:29:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 448D640BA9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790911770;
 b=mgmDKERNQuWPtbjcjrRSl3jE5c8mj5PurA92lYqW5mqNLlHYaHC3vsQLmWAK3OvpKXjq
 UJlvtWKHq+ykJdj6aZU2srCcKIUk6qwX6tR96jeLYDbRAlkJgFaqvNV3FZBYcm8eyhDAJ
 uPnPgnrA4HQDQbxNDxkogwVBUmShb+25jrF3GR6s4NOYDR97+yONGsRtpV6R2kM8nYElE
 QLF4DLG9WQinKx24CSrcHQocTVPXSGY1qaNFEYfl599Bys31tfqL93G6HQosQTzsidAAG
 SSfUttJkkqSnP51DDvEpPYUT/AfBuH3XEy3eMGrWrj6UJo3h8lPuJk6U7YF5mREIQNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790911770;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=RFjPa2+WZO01CRPBw0HgTLPLIWvrk757wAKURArXUks=;
 b=AgJ/Y7xy2I1mfBBBaXkmAYKT5b2pvLD+EuRUYzDJ9ZDisGwlruXRMZx+n1ytBBsJLTc5
 tnJvxVP4JzcNs5V54XB2cpN6322614SEC+QQ2ySLIuEh5mOd6ROnW5ayFVdzdEXowWg9V
 uXKJjLR3UFNKvG4BhSf0NQFdtK0wVnUHEpZy4Cp4i2+57rlvSU3tVQdnP4fvpPKwywco+
 FlUmKpekZsG6cB5ed0MQF95px+72+racb+yQGoUiyW+ITHVhrUvZx2c5HdKHXVIgyHagU
 v6PtG1+Qn/7oY68K174wehn9YrEPUKo85cwVkOhwhTJuxiX3on4bfd0tNOzUS5XI1LA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Cpd6QePk; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Cpd6QePk
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 448D640BA9
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 03:29:29 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-4a00d8bec5aso22813635e9.2
 for <buildroot@buildroot.org>; Thu, 01 Oct 2026 20:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790911768; x=1791516568; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=RFjPa2+WZO01CRPBw0HgTLPLIWvrk757wAKURArXUks=;
 b=Cpd6QePkhfygHp0bmbGh5EC4MSSFixHaczQOUbXYsvp8RKzvLNJ5boa3YQcYYqpy0X
 a7dl9Q9B/LRYxzzYuQOUwUs5NwWXTJqfm8Y4DObuYzmKrAdCnMGiKSLRF+usx92kfU8r
 TWOvmWiR7DXIvkgtQJwbk9OUzRdciPYjNch0ro/FUGYUwGA8F1DUPprdsOPsBg1+lLtB
 GerBbwKCJvVerj6HJYHUHTK9kaZpZu9pcSkpHY5CuUDULXr2uHRZXB3yQE71wgj3LT6f
 JByOS++v7c6JtYU7aWzy7j3kqlQYWSyIc7DoA729dKuYs/a2GqLnMmUqbFybo0RZedcB
 pGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790911768; x=1791516568;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=RFjPa2+WZO01CRPBw0HgTLPLIWvrk757wAKURArXUks=;
 b=KGd7sJ7Gg2w0nuq+fOwWCdf2R/fnD96vItZ89N/jCZw72MgjvcIUO0v//qrWi4+gW3
 q7SH96cVRn6z5Ketp35SwcH5TIt+nOry0JgNJ8u6DNq+LzYSlOliylgkc6Z8dRLjeCcF
 wSLuvO0N0PagnhABwidyuHKUFZJnCojfUoghTYjFmfAm1MhGtdPzxHSvLsyVmam9coTa
 cIqfEazJGMZSzcG0r5qYrfL/NENaEWh4LQlgHCWNt++obzIQ1WGGDaJSp5fzQh62sH+D
 fjUXMzn/8+I+lys46JZltllSUUl/RLRN1G1IaWdP+gpPZ5C5ppcFdHUTFwFuW6ynB1Fi
 ry+Q==
X-Gm-Message-State: AFuF++kRwSzYIIVatfwtv9bL9FR+a68YLY/PFjOGEuhTZme1tJdOGF2U
 25m0SzFsFcXjoX5Hl6eY3X9nq2P80yaFfIBQe9nYOjKwNoJNVwtCO0jXqZu171+i
X-Gm-Gg: AYBFou00fE+Xgku7Sjoif1CfLwNT7SZPBIMl9V+PVr0quOu3OIi6gBW1JnjQpzin32T
 JiwyRQPWkhN2SEvnuhH8zYnDvr8o/ZQKjPhbBdnDi7pFy8sfzcd2JOhyi9ipwmQA9Bozuqzrd+4
 vYw+MV7ss6qM5XG5ALk52TOoyKq9HGVSGxUqt4aE6DLH69Vv+u0JP3x3HfmfaPQyIurzGG6SdJc
 n3Hiu9637GXICrHC50HzhP9nvbKYqNnGR4QMR9iVCNg26UKzoXV85e+e4O/Bvs68afp8UC1Yu0w
 Ir37WI/PO6XOxAhGjbI6BXPGafWo4WL8eA7F2/Cl7/EO1i69HcohfeL1xU/xPapqEbS+j1RVks1
 K4gAL8TuTGI2+04yLpqqUt13r1Vr2LBdvuw4B0B1NUHNhTkCKGQozpF998E6yukPBbxIJ9BSxSd
 b2dpRqVksPkcLJgmntecmvLTKNooQWekb0mJYrsyYabRKG4xBOyFnKKcLQtlMdsFExD+6KJmWG1
 w==
X-Received: by 2002:a05:600c:350b:b0:499:bf8c:cfd1 with SMTP id
 5b1f17b1804b1-4a027523045mr22173075e9.2.1790911767564; 
 Thu, 01 Oct 2026 20:29:27 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280d1e38sm32169585e9.13.2026.10.01.20.29.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 20:29:27 -0700 (PDT)
Message-ID: <6abf2517.5cd83af4.38fd24.8da2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 02 Oct 2026 03:29:27 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-01
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

Autobuild statistics for 2026-10-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  6  |  0  | 11  |
  2026.05.x  |  1  |  3  |  0  |  4  |
  2026.08.x  |  1  |  1  |  0  |  2  |
    master   | 22  | 34  |  1  | 57  |

Classification of failures by reason for master
-----------------------------------------------

                   dante-1.4.4 | 3 
                 libclc-23.1.2 | 2 
        ltp-testsuite-20260529 | 2 
                       unknown | 2 
          aardvark-dns-v1.17.1 | 1 
                   atftp-0.8.0 | 1 
                   bird-2.15.1 | 1 
                    ccid-1.5.2 | 1 
          cloudflared-2026.6.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
      docker-cli-buildx-0.25.0 | 1 
                  dpdk-25.11.2 | 1 
            ecryptfs-utils-111 | 1 
                    emlog-0.70 | 1 
              execline-2.9.6.1 | 1 
      freeradius-server-3.2.10 | 1 
                   iotools-1.8 | 1 
                  iozone-3.508 | 1 
              libeXosip2-5.3.0 | 1 
             libfm-extra-1.3.2 | 1 
                  libmms-0.6.4 | 1 
                openocd-0.12.0 | 1 
                   perl-5.42.3 | 1 
                        qprint | 1 
                 rtptools-1.22 | 1 
                 s6-rc-0.5.5.0 | 1 
               tcf-agent-1.8.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
ustream-ssl-5a81c108d20e247... | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.17.1      | NOK | https://autobuild.buildroot.org/results/e0d96a89d06c46b452dcb323fdfbc9b41a1e644a | ORPH
    i686     |          atftp-0.8.0           | NOK | https://autobuild.buildroot.org/results/49a1898d43d8295be1ce41ef63c4f20b82cd6d20 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7dab8279f8357b50812b885879d66dee47ed7fdd |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/3b58ec22981b0e5b40d4c978adb9ba16e4059f2f | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/4b6fc85b10dd0739a40fd6a14f81bb2386879615 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/f14e4afacaa61021463c457def1cad3c81d35f29 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/191235077b2aad35d9ad6c1d401287ab5cdca38e | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a93e4c19829b5aec18c025263ebd275feb7b1008 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/23087c78567b8ab20fa65c7325c202c4a7ce42ac | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/d69de9cde608a3797ca14a20788446c25b7eb161 | ORPH
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/bef8abc5382e1aa9f74e04f65f1aa11ba8081fc3 |     
    i686     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/bc830b150100288168c46335f049c6a5a760bfad |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/1ce47f8cbec6cc84e54650f078f196cc39466732 |     
   mipsel    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/04737fe34e2d2ea66a519f91db8b6c698eb03205 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/0f63b29820b6f3be31fe23cfd208948f0f917d44 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/a6dbbc77df4ed62182cbf11f5ff685683265eca8 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/947874ee3942f4133c3a5b716f8ea198284776d6 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/d8dc24981f08dd5efd05a52a3f23fc933b34c436 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/4246df34ddbcfa3826949ac0bf00e3287ff9edaa |     
    i686     |        libeXosip2-5.3.0        | NOK | https://autobuild.buildroot.org/results/f3f757418d0cd70766b31fa47e754d41b4fdd99a |     
powerpc64le  |       libfm-extra-1.3.2        | NOK | https://autobuild.buildroot.org/results/484e2f3f45e530be750f27d7b15178f3d5e1c39d | ORPH
    i686     |          libmms-0.6.4          | NOK | https://autobuild.buildroot.org/results/eea54d6dcb1e28c65d2d57095e3c28abcd7623a5 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/c78bf1ed788fd8188109f7766ae8d06579894e5e |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/c6568beb3bee2ba6d961b49e293dd2cc8c0ba755 |     
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/3eb84b362e135ee6ec1af3aaaf122cc77245fc0a | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/31cdcb01c3f6028918d0556a365f935325d6ca3f |     
    i586     |             qprint             | TIM | https://autobuild.buildroot.org/results/b321eb65a3c8568f0a666773e921c8292d4e9d2e |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/c1b18f5c6503eadfcee6235e95c9a01588ea924f | ORPH
    or1k     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/0a3b2a2e96f43455013e730f4474a9ac5c773fe0 |     
    i586     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f3892d3d47760b341b054b7fff77a79f81488138 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/e7b3b12d89ed64b9f414ad3404597ac5c23048f6 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/aa179500a295d6f867d147f3c6997b85a0eb073f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/79a0d5d1bcdbd1f08ae6bb6b2f9f2f49c707e03e |     
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ca40e33db4e50385606d7f3bfd3f1f465b589940 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/5694835d2adaae04f03109c0d43abc6198f8f2ea | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

          pkcs11-helper-1.31.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/4a939d07c0d1af81ab6b9a0602d5894e281c5b9d | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                host-gperf-3.3 | 1 
            jpeg-turbo-3.1.4.1 | 1 
        ltp-testsuite-20260130 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/d8fd6974fbf3772887c89b979346efe1cd9a8eae | ORPH
   x86_64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/d2de517ae9de615a6e9bd9ef0ad29f8ca9b83013 |     
    i686     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/cda7a1d3cbe457a3b59bbcc58991a33c3f1bc085 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
             bubblewrap-0.12.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
             libgphoto2-2.5.27 | 1 
package/linux-headers/linux... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |       bubblewrap-0.12.0        | NOK | https://autobuild.buildroot.org/results/a11c5f820ce64e4858991da8af6b2fe9420fc5ac |     
  riscv64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/13a959d04bf4122648281570d4abe53b49c75919 | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/4f3ed520a8daa34135ccc3301dc65e188896f437 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/5b341dbcc68fb9e3a50231b6113857787e0c2e7b |     
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/09f2756d3d26a9e27ef596428c84d37c5d2d5bb2 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e95a4014655ef87557debb111870885ccb3fa7f3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
