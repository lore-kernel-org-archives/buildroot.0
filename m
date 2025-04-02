Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30607C36010
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 03:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6056B412DE;
	Wed,  2 Apr 2025 03:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dl_qnNgA3n8o; Wed,  2 Apr 2025 03:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49BA0412D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49BA0412D4;
	Wed,  2 Apr 2025 03:14:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4E9C6C
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 03:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE30041223
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 03:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szaTPwBTZp2o for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 03:14:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADD6B409DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADD6B409DE
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADD6B409DE
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 03:14:53 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2a089fbbdso76326366b.1
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 20:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743563692; x=1744168492;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SgiKfOd6gU1MvRaBqNmoZswuAANdw33kN9+KzQqK/L8=;
 b=PhQpBXm3sQHA+gOz8NyUy2TaqKGn4WhBW/7nfJpoqFe704PgfsBuXGfgxBu5Zjduir
 iTWEt0gQ4p0jxvnQyayWpagg0cZdX7TRY2xDG+j2XueyQE5DuFqTOrMtufLRvIH5PTBS
 lkM7IY61fjZ1GRBgu7F+/+kyDOg28ltBZTRj4usWFOetz2HvGSE5+k7dXuC3uxcGWK/e
 5CxEDc8awlpIuMoGgcMI5CADEhM/vsr6ecaVHU1Iqm/UAyReGlSFoGnrGrxn8pBo8+tg
 nVh7ieaQM6KlMkwqzrwM2O+p/JEC/FLyEHW65ZW+BOI+VACrZ1HD4UA8BEsOEHmU/IKH
 G5+w==
X-Gm-Message-State: AOJu0YyuQ1cnktyDxWcQ+dxER3nndeJCSzYXTH+V25mhsLTZ4QK9sX80
 vM4b9V7Gqn1k8SMJRdjIeexuayJcuKCF1EAKWa64kC9WSvfhsJcmdlrF/w==
X-Gm-Gg: ASbGncssG8vRstdUDt+Ctp4s4vlUnybvVdoST5P0V81/8h7L8mO1D7Ptz5Hx5ugtSrl
 Vw/BCBayGz+wYM8XV3p+hqSDrKjmebWcpXQekT8d1p+v+2pPVGHUEm1PFmi5wuqMMuCujfJWDNw
 OLtjuo3643H53LEcqu5amjIhFWLNnFEZs9uf338b5fOM1k9hTNOousMjmO82YcVbpahDDo3ayvA
 2Gy4TcO+SZKoOnt00xCCPnbku2mib0rN1SG2+eU0OEBt1fk3xLW+GoBE9lOzH7JBz2nD1eaZo8I
 7TthdHNYEH1/PsiRSAgjite7SAjQqHjb6zleYgB2kqMkBOsm
X-Google-Smtp-Source: AGHT+IHSbTvVrKzCVbzUQqP/XMUGUom+LebRGzG69I3pqsyWmI83Sb9by61hHQlCjU/8BrF/n037zw==
X-Received: by 2002:a17:906:dc8f:b0:abf:6d1c:8f4a with SMTP id
 a640c23a62f3a-ac7a5387a0cmr39349266b.18.1743563691533; 
 Tue, 01 Apr 2025 20:14:51 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7192e7d36sm848379266b.77.2025.04.01.20.14.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 20:14:51 -0700 (PDT)
Message-ID: <67ecabab.170a0220.294fcb.ac0e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 02 Apr 2025 03:14:51 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743563692; x=1744168492; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SgiKfOd6gU1MvRaBqNmoZswuAANdw33kN9+KzQqK/L8=;
 b=dweP+z8JJ8hhUHqSDcEY2d5Sy8Urvh/Z6R2YW52/LpYGWSoRzxS6FeZ7X08W2jLYq1
 j1M1NAxlWdG+Wpk/M43pP7R+k/6xu7cFK9jAPzisHhNVe6FEGXvEnv7wxzECp6+XlDAg
 fpwTPi6Iqre2t0ygdYDEwxFpOOcXXZLaoQw/oD8qzc7dzIt642inxV3cb3qqaFalZVF/
 JdZuUVQhhoY/nkLqg88qDp69nZM28NLoeOf3CarAw1HEsTiPXL3bCKgGePRtgfRjzmXZ
 ewev8L+ICaiqjwH3dTy5LNHjxwCN54ETiTCsuSRND8p2jUJUra5IKTvykCetaLxKtdmI
 uepA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dweP+z8J
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-01
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

Autobuild statistics for 2025-04-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  0  |  7  |
  2024.11.x  |  1  |  4  |  0  |  5  |
    master   | 16  | 19  |  1  | 36  |

Classification of failures by reason for master
-----------------------------------------------

               cracklib-2.9.11 | 3 
  gobject-introspection-1.82.0 | 2 
                elfutils-0.192 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
               host-nodejs-src | 1 
              host-rust-1.82.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libva-2.22.0 | 1 
                libvips-8.10.6 | 1 
                  motion-4.7.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                pipewire-1.2.7 | 1 
                python3-3.13.2 | 1 
      softether-4.30-9700-beta | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                       unknown | 1 
               valgrind-3.24.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/26f6fe75f75c65bb9d58bbdbec733ebfe9b8565c |     
   mipsel    |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/d4ab57d506dc6f1b154d51073141a94bfba0e536 |     
microblazeel |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/e2a17870f5cfa539fd5f90813c5b3b246fe1f3d9 |     
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/471bf82d65d1a4ce7822353d9c772d5e2faf4b3e | ORPH
  riscv64    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/fe8d569cab507992978ef0da649278dd3a9e0b23 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/4b231fd7ee9b52f8070067b80ad5a0db3bfe045f | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c74da0d2b981f6e50771db4e89e28c0194eec215 | ORPH
   xtensa    |        host-nodejs-src         | TIM | https://autobuild.buildroot.org/results/6bb938277d89cadecac15e9a9eaa313e090bb105 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ccb254935135cc54092be3c78bccb181a9edb924 |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a191706727625e698a55046cf1c2bef7dcfe18ec |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/6e406990c592df7fa68f80ee7c183aebd385e9de |     
    or1k     |         libvips-8.10.6         | NOK | https://autobuild.buildroot.org/results/a6df05efb234d5ac0c517776f7fa4c5020e2b086 |     
    arc      |          motion-4.7.0          | NOK | https://autobuild.buildroot.org/results/88ff04ad48173e66ddf8772e60537f38a92faec0 |     
  riscv64    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/636cb231f221ca5e50cc39015b136c9942599bb2 | ORPH
   armeb     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/9556e818123480097fa682f27585ef5612a3ba42 |     
   armeb     |         python3-3.13.2         | NOK | https://autobuild.buildroot.org/results/7c88d0810ce2cb02ef2dfb968332d5416fa7ba3f |     
  sparc64    |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/29a121c3fe9a20cefe3e69b3faa6494b90a485e7 | ORPH
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/5f1c9668b9afe5c206e830b607a3b30cecbcb44e |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a7d17c1f1a9eeab3fc7739851f51ec0742b58760 |     
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/2567bc6f886956a9930325dacd12d34294854908 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.83 | 1 
               popperjs-1.16.0 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          linux-6.6.83          | NOK | https://autobuild.buildroot.org/results/4a7e131b66a57dd2661a55d4889c39668fcef5ec | ORPH
    or1k     |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/9a843f73bda46b90f576720f2383388c8b7d7293 |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c11666b3d0116c31ad26b3bfb7eee2f14b32e5ff |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  boinc-7.20.2 | 1 
                   exim-4.98.1 | 1 
 host-softether-4.30-9700-beta | 1 
          linux-5.10.162-cip24 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/a43d9b2e6a725251d8cc8be251651a462a6f6224 |     
    or1k     |          exim-4.98.1           | NOK | https://autobuild.buildroot.org/results/f1ad3c68d83a5871e62fc04a0606f6ee1c9cb952 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/9dc5456c6e28157cfd6ffe895b471f6f8d89ea86 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ee76832bf3c901a4cb6d736397ecd725225a9098 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
