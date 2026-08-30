Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEDEC61DD6
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 03:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DF240680;
	Sun, 30 Aug 2026 03:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPOFkNZP3rnw; Sun, 30 Aug 2026 03:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788060576;
	bh=D4+VH7wiowBV5xh0a9NNf/idYutZaB9IvTAwUHvX7ug=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EcKTAObqq6/FXzBmfIpYcJkuEcKiLhSDucyEmkBkSTN5huXXkLlOebJtkscxCf7c0
	 pffeOnQT9vTlz9WIW+uefBdeMKntTBeffWYZFZmFSMkz288NDrKS4xOizEU5DhsOWA
	 qmFK//X8k8dpjUzHa9Dckr5Pkr3H3g/vVQ8ZqKFFRyalRp7OGldNJ1G0OVredkJ78/
	 kfNai4ByFcI5AJhhrF6LtH3RpoOUrgg1MyamhOqrX9cvjZZKk+7danddr83ftcNLUO
	 Q4mWg8Fol+a63O59opV8swn0o5b7SvFmwpZP6MuSb/r0DEa8QRoGuq+i7LB5vT0c69
	 CuMP4fa0KlNNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21D4E4068D;
	Sun, 30 Aug 2026 03:29:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B70C355
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 03:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E593C4068D
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 03:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAG4RcEFtbw6 for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 03:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=a2HYcFZA
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 324CC40680
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 03:29:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso24573365e9.3
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 20:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788060571; x=1788665371; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Q9WAJ0abDR229Jt9ZeFKl3UZo0uBpEf3ZQc6/C6nVoM=;
 b=a2HYcFZAhADhEaCcr39pQTSrHoPCvRs/faUg5SBjR8ZfJTyur5WAfLtYQdl/86Q+Mp
 VBmQbEIyUzgzYa5ujFuED5dJBO52ppikKDIe/KOK3jwsrq8D+YoMutqTNCJI8RMJwEGc
 6I4G2ePwRP1ypeHqP33DQ/ehcsqFl+1tTGVrm5L4qvZ8OI01a6eSziCXiIwSovUszp5e
 qsDx/jsr0CbKlbVe8yNWIGhnJN5IJTK2eGxLXW16maFK/pW+AFdpgFkcy8p8KKkvOoss
 NtF7NbsrurUSFZYrtJ9rSclU9pRYdc+xGxy6iqNcWChHJP5w7yf51Hdj+oAlvMGfhff5
 NAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788060571; x=1788665371;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Q9WAJ0abDR229Jt9ZeFKl3UZo0uBpEf3ZQc6/C6nVoM=;
 b=bt/lPkTCYFPFpcIeCvX3eGpSlZwSnH1f0OARH6XvdcHn4Y9BcypAVg0tCyV2NaLetf
 OuHFDJcHgYxBjdiI0V//GnEL9BFII0uaHaD8Fa6yUIXyvSRreear4Yl/2j5x6LbuqfDO
 KzenRruoMZcEUQ2iEvYRYjgLr9sBnnQgSiK0ITm5lAe2AcS5Y5ua1KnkmcSkfmIpflvF
 QIYbouvdVM866UAKk+JLCA5HcrKA8VQC7OE6e/+QDA4CAbOVtxz79uEhIsweTaz8BDAa
 bkRpBfTuTraSwuJ/SxNI/uZhKuByeXV1fkOiHPw+Kgc1ZN8RuLysffTK6348Sr4G+O2U
 8kJA==
X-Gm-Message-State: AFuF++k1JKEaFVr2JFdiuU8LqE2NYmzhGusk2deQ+ekHwzUwLgzRCV1n
 W0dIKZPPyiExAqWeAjbo7bxFk5PsOwnEVHME863CBCkARHvA5cRq9dVWJNvNDoyOKcY=
X-Gm-Gg: AR+sD11Z7AFka4MigNxragI24l3dlOyqd/5U1F2kogqUUKj+iQn0hPWYLZSa+o/yDL7
 CfxQ0IlQXwEZagfKKYVJcIresQqqjB+/miY57zxuGiAEJwV62aFNsIE3jnCJPLbz7f1mPnh5/HU
 +2zlDf0p4VQLJOEVczHNAF+8uchOcpSfo3hbGx0KDfoW+NHvgSghAJVDK0DmAXQNrQ9fmm3gQ7a
 q8I0LiZUIeDU/2mHaF/3ZbjVmQ3bUpX/qyGaeUR/nP8QTgyW7dDcRSm4V5+mEdeDo8ieqxHcgoT
 VvNImuKlwR4WUeMbJbxVsRFraDny48zKPIvMIPucFu7VvtwBTIbdxobW27SOtHNqrwKpvwoO5+D
 MOQvyi9VXpp2+beBr/26UK5MzaNIqM7Z6/XBRObcAUiouWFvah7TzJQbNkyb3isORHW3Jw8Gobc
 ReN2DTr5asT13cDQm93NT4N6UbaUm4YLRqrc1NKi3outshSn8jsxHmqbIh+uFB3KC3jmwoBEoqA
 w==
X-Received: by 2002:a05:600c:4752:b0:49b:8f01:7119 with SMTP id
 5b1f17b1804b1-49b91c4fc92mr212952595e9.14.1788060570578; 
 Sat, 29 Aug 2026 20:29:30 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484397f33fesm29671f8f.15.2026.08.29.20.29.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2026 20:29:30 -0700 (PDT)
Message-ID: <6a93a39a.5a337f39.143c95.7d5c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 30 Aug 2026 03:29:29 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-29
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

Autobuild statistics for 2026-08-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 16  | 22  |  0  | 38  |
  2026.05.x  |  3  |  7  |  0  | 10  |
    master   | 20  | 79  |  0  | 99  |
     next    |  1  |  8  |  0  |  9  |

Classification of failures by reason for master
-----------------------------------------------

              host-perl-5.42.3 | 14
        edk2-edk2-stable202602 | 4 
                    attr-2.6.0 | 3 
   openvmtools-11.3.5-18557794 | 3 
               tcf-agent-1.8.0 | 3 
             alsa-lib-1.2.16.1 | 2 
      docker-cli-buildx-0.25.0 | 2 
    host-mender-artifact-4.4.1 | 2 
                  iozone-3.508 | 2 
                  linux-7.1.11 | 2 
          linux-headers-7.1.12 | 2 
                   linux-tools | 2 
                       unknown | 2 
                     bc-1.08.2 | 1 
                   ccrypt-1.11 | 1 
              e2fsprogs-1.47.4 | 1 
              erlang-26.2.5.15 | 1 
                  ffmpeg-6.1.5 | 1 
  gobject-introspection-1.86.0 | 1 
            host-go-src-1.26.6 | 1 
          host-tipidee-0.0.5.1 | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
               libecoli-0.11.3 | 1 
               libepoxy-1.5.10 | 1 
        linux-headers-5.10.267 | 1 
        linux-headers-5.15.218 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 
               madplay-0.15.2b | 1 
                 mesa3d-26.1.8 | 1 
           oath-toolkit-2.6.14 | 1 
               openblas-0.3.34 | 1 
                opencv4-4.13.0 | 1 
                 openmpi-4.1.8 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
               pulseaudio-17.0 | 1 
                 sudo-1.9.17p2 | 1 
                 systemd-258.7 | 1 
                      tar-1.35 | 1 
             util-linux-2.41.5 | 1 
               valgrind-3.26.0 | 1 
   webrtc-audio-processing-1.3 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                      x265-4.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/a668ba08746179d82cbc1931cf2e1b6518fdc003 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/c96f7b344b497a60fba4b6d43037d0972b28f987 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/9758f938e0a4d28ac11367bfd3c18ff6b24becda |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/b975f79d6d41cf28ce9390743e1115b884856ca4 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/8beccd257be6a6a5a4d9afe5d4f766ae4a703414 |     
powerpc64le  |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/ab20c57eaf6b343a7f52b9503162a2ed0fa2d48f |     
    i586     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/90ed97b9d40c5712b73f0484d02acb581701e98f | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/022b11afe769d714be3cc371f407c313a57c663f | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/bc172be33b4c59f9817a1855f5beb04ced87c998 | ORPH
   x86_64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/d600a1679a14c8f1eb098db8e022e9cad93a846d | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/5f1d9c50d98ee169078c5e4a6b7bf001bbc7fbda |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/e3d727a445983cc35f7f8ec5e9530409e222846b |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d661056c04dbaa921af49d5701ddea1aa8803e5f |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/2d2d3d97ef5170904459c3fc622a5fe75c92308d |     
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/5adc902aa0752b8bebf7c9f73ba2031fa218633e |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/781dfb98d7737fd0fb3a7e712ce676364cfe77b4 |     
   x86_64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/e8c5f6b3f58a9ac23c82e406c0e6dee0e4fc6553 | ORPH
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/2fd0b175bb5cab74503099b1ba10a214a9f67ccd |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/e85735428a0963fd9759387a881e56a780e19046 |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/f75f695b769611f94775350b6308637d7d58e181 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/f10718975de46f9e790d01e52c3d89b490eaf3f6 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/3cbee8d5bd3144dffab29296e44e48ac7bd9c4f6 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/d8740680931da40dcb90a1d16535f4c1c2712741 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/d468b3d3b799590d908e693095f05f9ba11fff14 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/aebc13c8511e3749f39e1aaab7fe9b34da8f3a45 |     
 powerpc64   |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/1dfc8cde7732ec1aee078d583b8343f235d48666 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/f1624a6824b77ccef6be1d1f9823c0288cdbcb50 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/d90d1bed83bcc86479b8335119f5f4d879627edc |     
powerpc64le  |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/60a7be23915660f3b6785cb2fec10c0a1caf105e |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/4fa4dfa471fb344a4f2b60235c8769b2f5e31a8e |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/0ed5f0906b9d94110410d0ae38fce1166b75e93e |     
  riscv64    |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/6131cd65c325d5fe062b494ddd040024225ac3e2 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/c9b72581cc1c7a3528190c2188622957f8d174b9 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/5867e73e4b747b347607d2a7ee6c37055dfc071c |     
    arm      |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/1d5993042091a0058b6967fda54293f6f1a8add7 |     
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/8845191003233944ed328e48fe6943c237e6e03a | ORPH
  riscv64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2bf133dd7eef501805651003cc0382d942b963a7 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c1e664fe1407e21f190873ec270ab03993988824 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/84852fbab40777603f9749ff8ffaa3f975255fe1 |     
  mips64el   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/a66101827417e48cdc9eccfc02b68e61af9d2579 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/ffdb6b244cd587aad6b8b8d714c9c97323dba174 |     
powerpc64le  |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/b32c0ae4a62866c6e67e8cc710dd8eac0ea4f58f |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/04ac7abb623ba2f3275037297b92ac0c2e38266c |     
    i686     |          linux-7.1.11          | NOK | https://autobuild.buildroot.org/results/551028092c91c146a39d27a282fd90115e8ab113 | ORPH
powerpc64le  |          linux-7.1.11          | NOK | https://autobuild.buildroot.org/results/c77dcf2d52c6f0cf0994848d6e89892f10a4134f | ORPH
    i686     |     linux-headers-5.10.267     | NOK | https://autobuild.buildroot.org/results/0d5bef0e0e233a3951342fd0805b8f02b56eb7c8 | ORPH
    i686     |     linux-headers-5.15.218     | NOK | https://autobuild.buildroot.org/results/c54686d3583d48bdeca9f98094aebc779d3992f4 | ORPH
    i686     |      linux-headers-7.1.12      | NOK | https://autobuild.buildroot.org/results/5066ee94437b977a310e94afea7be245a77734e3 | ORPH
    i686     |      linux-headers-7.1.12      | NOK | https://autobuild.buildroot.org/results/f12b8f837f1e08fc766498320d1468d04107c78f | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c23eab9f871957b32f9a25d087786df71f9933a8 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6c0e5568d499d5a6e2d8c4431020d7be66528163 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/71d8b053b3eabc01849fbbaf1765f763e3194c1a | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/c3c2707b7a31489a1653851030d802b0102689f4 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/6bfca093387be80cd2001398f4ad4dcd6078ec6c | ORPH
    i686     |         mesa3d-26.1.8          | NOK | https://autobuild.buildroot.org/results/a3e624d7b5de99160f9911176e67cac703c3b2aa |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/943e73ac30d8ec552252d8fea28a7c720450a08f |     
    i686     |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/913684163db95cafbfa53e245fbe2a9f4f8945a7 |     
    i686     |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/d3e0446a87d32469267e241866c4224143170f31 |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/3ea7f907fcec758704583552c5c13193b9c840c1 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/b71cc6671b39816a6ceb39210e4a693ad3afde4b |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/c8a08178cc5b9a88318cd193e77fc85bbbe403c9 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ff77ac9d0fde15283b132b0bd649c262fe76a54d |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/60832fe64019ef5a04cae6ff52e4e47d13fabdd4 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/2843187b5d8f80d4d8123ca96e524cccb89ac20b | ORPH
 powerpc64   |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/ff15c21b4083c58b14920232cd446356be61f698 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/620d21e986b1cc07f0f9d70ef77d04139d9f4bfc | ORPH
    i586     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/4e039371d3fbceca8edce7da76a7b4ac0a553376 | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/d859f403b038e2efca75c58af9afd61e96651454 |     
    i686     |            tar-1.35            | NOK | https://autobuild.buildroot.org/results/fbe25be7e8d25497a15bbf2455d8294745503c17 | ORPH
  powerpc    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b804cdc4b4b0edc9e0f510c6667f1efbc97470a1 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3f927ef335b6af5678c4afa03f7e2db8b4e71298 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/40bf4e9fab99068c6fa67fcc30af6cce08f007af |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/175a5f6b31ddcd687950347cbd355b6c6e921b5e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d7238f5e5d2916bb82d2591ad06e4922f8c2aabf |     
  riscv64    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/6632e1260011d12b2a78596b8dea9a2694fcf148 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/1e7ced41142ead83785e74f2c7fc3bdadc01ef57 | ORPH
    i686     |  webrtc-audio-processing-1.3   | NOK | https://autobuild.buildroot.org/results/a036383a22e5313f1c39dd69e43e0f109c4e0a8f | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/6a139431fb3b63a3d5eef7a0d3f58ea5cc2a457e |     
    i686     |            x265-4.1            | NOK | https://autobuild.buildroot.org/results/607afb9eae1d802b3a64a1ad832033629eccc3de |     


Classification of failures by reason for next
---------------------------------------------

                 avro-c-1.12.1 | 1 
              host-rust-1.97.1 | 1 
               libecoli-0.11.3 | 1 
                    lua-ev-1.5 | 1 
                  newt-0.52.25 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
               owl-linux-1.0.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         avro-c-1.12.1          | NOK | https://autobuild.buildroot.org/results/fca7fe32c68f26cde27a20740225f5df1bf8dcd7 |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/32038460af2174d4383d85da0aff9b06c47834fc |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/b50971c5c85231512ea849084bcf0553ec6bfd80 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/c40dc2db271ddcc55df34d17f97ddf299766f427 |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/1c1f4ce3ba08442fbe08794e389dcf6cc1a3df20 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/c5c5d3a4fe6f5a063910c78bfe7d828044d138c3 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1b24b97e1344c28d4865098d5cffc70d09f106c1 | ORPH
   armeb     |        owl-linux-1.0.7         | NOK | https://autobuild.buildroot.org/results/03df5f53f50a7b83bb3a643ac207cbbba13a762d |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
                   dante-1.4.4 | 1 
                      fio-3.41 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                 rtptools-1.22 | 1 
                    sbctl-0.18 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e8ce577a267cb80415191fb4521848e1dfe744ca |     
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/1c39464397b500bfc1c03f4d25164662b26647f4 | ORPH
    i686     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/7e8f4be914e2694e051c592abb99cd883c294598 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/0423e2e7863fc19145d57d24b94aa9864a45292e |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/8206755ffe5851231ad8d49d677b1f03f25f10ce | ORPH
    i686     |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/9b2714c60fcddc136fe0f99060bc292fce3a8e25 | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/6d71ec56f12f0e5629d34df03d682d736c573751 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 2 
            host-go-src-1.26.6 | 2 
                memtest86-7.20 | 2 
           oath-toolkit-2.6.12 | 2 
                 ddrescue-1.28 | 1 
              erlang-26.2.5.15 | 1 
             fluent-bit-3.2.10 | 1 
              host-pahole-1.27 | 1 
        host-python-lxml-5.3.0 | 1 
               libunwind-1.8.1 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250130 | 1 
package/linux-headers/linux... | 1 
                 rtptools-1.22 | 1 
               trousers-0.3.15 | 1 
                       unknown | 1 
        util-linux-libs-2.40.4 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         ddrescue-1.28          | NOK | https://autobuild.buildroot.org/results/929b91446216aed5e1d6acded8a811140d018f68 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/2397e0fa7249c306d84d003d010add58acfc0396 |     
    i686     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/2ffd9913d7fb0088029de4aae19ea472f1060135 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9d9ad851c3b80c432431c81150397e768cee3172 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f230d658e3ac8da8747f5e53c58664e1ad2fcad0 | ORPH
    i586     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/38788e0799836fc0cf36c394d9c2722a84f09e4e |     
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/2ace605044d56200a7066fc73b5336be4124929f |     
    i686     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/53d6ee92f728d0bcf3f5a89c8ee538c817d6a889 |     
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/7a09a6a945f119bbb471d8db286b910c7e8d5c25 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/6a91dc59235a3101b8b0159669603ae4307f3c9f | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7ce71a37283f4066193df0019bdc9ef590eaa52d | ORPH
  mips64el   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/0da993c9427e9e1bca571f6e04529136592f28b0 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/375f53f2064aa8323eae1808040f2fe66a73ba51 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/acae8162eb96089f7f9a8be7911fdf6812452d4f |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/67c386333e14501eede2d87734e2565ad60a339b |     
    i586     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/2e6fe585f3d242f0eecbe9338f11818f5df3a970 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/48c5b856639a84f52610d8bc0d57c748b7544793 |     
    i586     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/38e918507d2a099fc3ffcdcaab5bb272bb9c283e | ORPH
  mips64el   |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/9f8afb1b4f98b06c09c57a1e2a75236f0ddf9934 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f3da7dae2c1b0da570f3d3c68365b38eafbdac66 |     
   x86_64    |     util-linux-libs-2.40.4     | NOK | https://autobuild.buildroot.org/results/30e1490139ff53702e6e0f3b5108a7e2100426af |     
    i686     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/739ea7e5732ebc0237b0caaa547001869d2b7a5f | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
