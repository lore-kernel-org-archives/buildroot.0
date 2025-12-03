Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B7CD1266D
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 04:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED0140426;
	Wed,  3 Dec 2025 04:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yWbst5BGpXk; Wed,  3 Dec 2025 04:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 321614028C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764736844;
	bh=oEm5C3SZ+Z9+iKpSYfYkYgme9KR9BTfO+u9ohEGxgaA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=If6qgqdJ3Z7cDgvc21N30biG2A9O0ToJICczmNI8LK7r+BiuINHJ2Wu7YXlUTQYC4
	 SlgxThxZ6nyULAWQA5+vBFezJ1E7ZC670BYon4l+6A2hiAOAJwLDDLN8l50qKNdxZJ
	 0Hux+vNJT+JNRriAzJI0efqphvvtkTPgeiypl06NiJkkpVegD4CV5q3di4FOAjrvoB
	 tY1heClxaXEq+uIlZyshaQvsCAGYdUQxDVketMvKCHpqJF7ExGpKY0I4whWNZysaGT
	 cppKwmpBxr51ftQyr4dN7lPsMVP6906PdqPW5qnYfYPk3zn7C0dDRrw3uy136iP1DA
	 4EMkIugUZF28g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 321614028C;
	Wed,  3 Dec 2025 04:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B6BEE7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 04:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41A5883827
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 04:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6OdKIjstgWo for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 04:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C000183760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C000183760
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C000183760
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 04:40:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so57593915e9.1
 for <buildroot@buildroot.org>; Tue, 02 Dec 2025 20:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764736839; x=1765341639;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2YdtjDBsP+LUBv9dXbtnvxa3Mr2HJfycxUpt2APUuR8=;
 b=VARgbpgsqRgqHy+eDHRdfZLenvl7+mcHZsR780cw+5mjMzVbQyIX0OtuzdR+5XuRsd
 kS+wme4ClaeIMtbsZIXEtUs3lMvZylH7qMatSbPLZ+zOeNX2vKfm7y1Zd1RyEZhXiW/9
 bIM64QudPq4Zb/i81CG/DG0XrVUHoxgLSetwyZM0cwYg/x/lKKPWksHQIqI1h2mJZlbN
 jyaPMeLGwZpwh5jpmEtsW3e7S1/+G7i3lOc4ydtN24BOVtAZ+fu/TpmaljPYJuNThFta
 ac6z0qXm+yJ9UfZPvXHVh/6GR8j9oOYMSV9fh6TIA3x+q8v8jt9BQMg8zqK28toAq8sS
 FlEA==
X-Gm-Message-State: AOJu0Yx3tujl6gx2Kv+uXmcAI/wtmx4QvUBmCLcdt4xssQ3DcZ9zS5jt
 CVdVUPm+HERet0nYeF/8IMRmg98dyW+LnS93pFYN9jr5PYbK4KzZmiZL2nNQLg==
X-Gm-Gg: ASbGncv62Bbs6saBY9EvSikZsrrJunIke3hC7OkCvXNQU/YQu6NpmBRzXKAnY3Rj4Ef
 hmGErvOCEcr4mr8Rq5fgaaVkdQKTLotaUug3BvJV5nPGcfKmSgQUtvs1NVAJp0aqRfAm7jxcXd+
 4Umn8C4uUlDxfB4hvn6si5pI/uvDYGVmqHH56nqRnaKJ2DfsFT4486WqTyRa+BRW6/xgwzJ2pL0
 1uD8J4gVtP8kYgiW2vIjeWb7oAiVwPUUZvwAkgwmZF0jMo4m9wxhcLm0CP5IJB67z31myPE/lY6
 7kmrb7DX3gbMzBw+H0Rm5retVQvF6aR6I0XKPfiin1NjvDlyiveDi86bs15EgHDx8eJvHUfb30r
 VcvUd6zrYr/6k/8QJGxnMlDHM+oyQ6e2Hd4Ebd/ExP6+QaqmLLYAhcvS8MuPbxo1VePEY/uUHuZ
 lYHM9TY/cnJleTSzsJAA==
X-Google-Smtp-Source: AGHT+IEQqT3Gu94I8Vub1jfv9bE5eSaRGarRMu/TGHTnpIjROusn8JeN2Mq0AOOcdYRmPWpfRNiItw==
X-Received: by 2002:a05:6000:2384:b0:42b:3e60:18cd with SMTP id
 ffacd0b85a97d-42f73180f4fmr604266f8f.11.1764736838549; 
 Tue, 02 Dec 2025 20:40:38 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca8bae9sm35247778f8f.33.2025.12.02.20.40.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 20:40:38 -0800 (PST)
Message-ID: <692fbf46.050a0220.a4a43.3171@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 03 Dec 2025 04:40:38 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764736839; x=1765341639; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2YdtjDBsP+LUBv9dXbtnvxa3Mr2HJfycxUpt2APUuR8=;
 b=fgogmjoBkjcdmj1HRELIRfB+0t4dEtonqfCeiNhAqbZgyqKNAPyrctCS2Uoyasm+ad
 4chhoyqHblyT6m8Ujc1VvteKTKvVEprTs8aYg2kKaqL8jX2V2wslCCe/O8EwuqIa0qvQ
 F5pMdVzBUaxoZn/Ne3spDNWrmQR6758dU2OjJslyCAywkKl8bL0qr8hiGbV3tfFtytym
 aZbhRFHhIhY81krcNl5cYW7NkNTIn4V15RAof+2vakQDw5I13t/1sRh83QZCjcgLZmFf
 T22DnySIawSVy4o6a6y2MsoBmJjX4ec/Mw5jyBGTeX5QQsXpff0/T/kDsvK5krSrcbaB
 JQng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fgogmjoB
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-02
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

Autobuild statistics for 2025-12-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  9  |  0  | 13  |
  2025.05.x  |  2  |  1  |  0  |  3  |
  2025.08.x  |  2  |  2  |  0  |  4  |
    master   | 43  | 65  |  0  | 108 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 5 
                netdata-1.37.1 | 4 
                       unknown | 4 
              host-guile-3.0.9 | 3 
               asterisk-22.5.2 | 2 
                   cvs-1.12.13 | 2 
                   dante-1.4.4 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
  gobject-introspection-1.84.0 | 2 
                   libcap-2.77 | 2 
     libphidget-2.1.9.20190409 | 2 
                    mpir-3.0.0 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
             cni-plugins-1.7.1 | 1 
                 dc3dd-7.2.641 | 1 
                  delve-1.22.1 | 1 
              e2fsprogs-1.47.3 | 1 
          esp-hosted-1.0.4.0.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
                 hidapi-0.15.0 | 1 
            host-go-src-1.25.3 | 1 
       host-nodejs-src-22.15.1 | 1 
            igd2-for-linux-2.2 | 1 
                libdnet-1.18.0 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.17.9 | 1 
               linux-pam-1.6.1 | 1 
                     mdadm-4.3 | 1 
                     mtd-2.2.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
                   openrc-0.56 | 1 
                  parsec-1.4.1 | 1 
                   perl-5.40.2 | 1 
               pulseaudio-17.0 | 1 
                python3-3.13.9 | 1 
rtl8822cs-0ef9ddd619d2a386d... | 1 
                 samba4-4.23.3 | 1 
          sane-airscan-0.99.33 | 1 
uclibc-ng-test-132c6134d691... | 1 
           v4l2loopback-0.13.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/163d6014c19f04e9d7c31651e03e36867e518533 | ORPH
    or1k     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/38b4c7eb623b0af2166d01f3628efb1ec4cdcf47 |     
   mipsel    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/ba6ebf4dba7d18547ac73ded3e66a7eb699319f1 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/657265f82ca38f12bbd531ab3e38097f6b7d4bcd | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/ff20919f71ed14e9b8be0e75af665316c60dafd5 |     
  riscv64    |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/69efcb776513007465c6055b327dd732035badc3 |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/99cfa731e0d28c5db02f85083e2f8d139f1ec194 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9e364875e25db41feda0816310504cfb2cdf071c | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d9719e75b779ec3f1c4cf29a8d4b113354fa919e | ORPH
 powerpc64   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b600633fd09a250515d520a4e984dc4c30c63107 | ORPH
   s390x     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/f76f468e97771695140a739a3d50eea17699ced1 | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/2a44381e930fb35eff6664548ec9cb9a1ec39dcf |     
    i686     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/ff2451bf46fe698d57102ebbefc30d2c27c837d6 | ORPH
 aarch64_be  |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/92b3dac080e1cf7390cfbe2ab9f8a15229c5a086 |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/2c013de24e5cb37e68ceffc357dca7d628be872e |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/f46ebc9249e982807385b29392992e1e87922d85 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/bd690f347371ee8eb510c7766a6601cad5ad9d2b |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/43f744c2d152bf444e5ed7d39e19d27285674d9f | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0ea540c9917b5c59b1915cf72ca029fcb6c9b1d4 | ORPH
  mips64el   |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/9fb7114a7b50f0aa47480082f5f43feb8f5e39fe | ORPH
  riscv64    |       host-go-src-1.25.3       | NOK | https://autobuild.buildroot.org/results/bdecae1abd1ec0732abdbd922b9a749363e52baf |     
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/63b1febbd12758294c9cdcb44c813f81d32b300a |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ffdae66d432f74079d0dd97e767af6ac21a14368 |     
   mipsel    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/caaad4d97cae222446f64c8d52e63509fa87cff1 |     
   s390x     |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/40287a5064d5632767e5483d07d6c1fbb815b456 |     
   mips64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/33b75643b58c60d42f3e2df44a1599be8922ed72 |     
   mipsel    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/646ecd9c829bee61fa19e817c581c9de96c02173 | ORPH
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7448de413e7218d22d1f86542c7c41bf0b73324b | ORPH
   mips64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/31e2d8c171472be3eb0b02b4ac3a8668fac5d1dc | ORPH
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/733c87a86e7cb48f61f27927c9aa8d1e8d40e9ba | ORPH
powerpc64le  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/2f66ee50cfc3829266527dcaf56c9fa4663464c8 | ORPH
loongarch64  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/f9658e7bfe71d39b1de3f027fb913a1b78ef3e4d |     
   x86_64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/ba4752e1d4dc6b96e87ef6e6f36a455f20c4d4be |     
   x86_64    |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/0a3c8b4221e771c0fd694e39d9a967fb7266a828 | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2323d7632ba557796c399c9aabfff2b9aa9a9e69 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8611f0508a5b3fe57d72d8549e1403f5d025fc29 |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/df36428c48da0223dfb81622710106031cf4e1aa |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a59d29b5e3ebc70111c50be75a551f2b1e8739ab | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/afc150df6d2ec18bf78eb5829fea4ae04cf98fb2 | ORPH
    arm      |          linux-6.17.9          | NOK | https://autobuild.buildroot.org/results/de9add75dd164029649b133137aca05c6966ccab | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c1874b6ba7182a628985c4fdcf8f5eec8a08f86a | ORPH
    or1k     |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/8eca6df7ac1bbeade43e4ed42059c380e251569c | ORPH
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/238b6ed1ee50135db56c462fd3f57e28e061485b |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a18bf2c6a3164e58eef65225abcf5152b564030d |     
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/8a3d8ea67d09d0be40d2b214540dbb14957e26d2 |     
    mips     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/6c45e94ce1896d2aafa8777b838f6971c0c65472 |     
 aarch64_be  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/9b08259d6b10da65c64abc4b78b4a6151e6b63d7 |     
  sparc64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c2dbb265dd521bd47446d58f73c96aa74a02a330 |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/2f01f51be4957a40928899af055f21e57fe7f024 |     
  mips64el   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/2e84ff45b7fca21694013e58f9f1ac7477ba9aae |     
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/979c3931d2c6183bb05f87cc41cbf0c87ba761c4 |     
microblazeel |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/c7a24285c6553746ad4160ff21003c52c8208d3d |     
   s390x     |          parsec-1.4.1          | NOK | https://autobuild.buildroot.org/results/32b90c41d1e5bb37600322833c7300dc6a3a8d6f |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c11b4941565b3c896fff117bed7d95c74fe8e04f |     
   sh4eb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d575c83626ed55bc8544f574b06bbde182eebd57 | ORPH
    sh4a     |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/e5536dcf598a51f5006343513a76f4e223e80a55 |     
    or1k     | rtl8822cs-0ef9ddd619d2a386d... | NOK | https://autobuild.buildroot.org/results/bafd5af112e49359201580ece3a12bc8724914fe |     
    m68k     |         samba4-4.23.3          | NOK | https://autobuild.buildroot.org/results/0c8438c9670ff1d694739e3c41791eeab1466bb7 |     
    m68k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/6d289ae7143fa38d6ce7d2023d2cb9d76fc2de4f |     
    arm      | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/dce34a7c1e3f9f85e9024bb70b1d40a7bcb42f9c |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4681f973c04b7ebed03b8967b4a58c771247909a |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/fef7e92d8bfd3c9b78c21ccc3c2934a6cf4a3502 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c0ee02657aeb8065626c6eaab5ed9ae508400a9c |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6dde9f7282f55ebc993c7355382028d68753794a |     
    mips     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/910e27b189c62f977bc42f7c53471334eb765168 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 c-icap-0.5.10 | 1 
                       unknown | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1ede5b65234a2ac9d7317549ea64be70eaa83242 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/f0399f8946ce8ea2efe644593fb646ccd45b6342 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dante-1.4.4 | 2 
             docker-cli-27.5.1 | 1 
                  iozone-3.508 | 1 
                  libbpf-1.5.0 | 1 
             libtorrent-0.13.8 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                     pound-4.8 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/cc13f1c9ecfd93ec19629c527f54df9c97044941 | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c3edf76779793f6d2ed1126bf8f526b18a8447ab | ORPH
   x86_64    |       docker-cli-27.5.1        | NOK | https://autobuild.buildroot.org/results/0ff4ac752de0f13bcbfee8027976716e009cbb8c |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/50fc22af87736672af4a1f71eab0130fa201eba3 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/bc127e4e9d39fda2ecd882e372085e68d3e359a1 |     
  mips64el   |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/a2e609caecc26f67134d0fed1c239e8d148e07fd | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1202596bb9dc5a1a03298e0b09d0ab4a2336243e | ORPH
   sh4eb     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/afd8287a145b0923e0c069c538f226755fddaf98 | ORPH
  aarch64    |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/a5a94662d0edf281655d8c320640ec7788a8e41f |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                libcurl-8.16.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/811370dfa497930761d85919d21d876a620058f4 |     


Gitlab CI results for 2025-12-02
================================


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
