Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71A6CA5FAB
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 03:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CF1540383;
	Tue, 29 Sep 2026 03:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4C6PlZtOTcw; Tue, 29 Sep 2026 03:23:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3D54140355
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790652182;
	b=LJO/MawKHJKmO80KCaAO/FItakzL5Z3RX8jawto+f16oVKiccwjcjRKnExh1eqkFohjs
	 yJ/j/FT6t0tT7lJzmKcAabqIqnGPVy+IiUvZoNgkb//Tbpd4WehzRwxPc/+CsFwhApdKW
	 LhyDeq2shN0+rEVAh7pOqsnL/VLN5VEOy/WvuDyln8lYDrrGP9MN+qLYNxn4CLEMj7umC
	 nRMvO8HeKROGn0PVCwPC8T+6aXGeVw2UOEhQ7EcRm9KO0IlvAL5J2dhq4kQ5ulVABz1hw
	 EnuV8Pdj+E+bwOk4HrJ2OKTFr+i7E+yVKf6EGEFV5bz7FcEHW4NwVQCkaNUPqMa5q5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790652182;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H/h2hz+ZHlbNoj8NZLChdf4RjXko8DkO4BjAP6qpsGM=;
	b=p+LzBYnqXEYrTM9QmqSikl+hzXyJ6wFI3RpiHU3KU+KM/NZEHF9ZibbniFk+XIWVezm2
	 EGytIRApn2aQ2qv2Lkx/ShjZmwyjrBmlMq+muGvaFScnWWbVLIdZ8pyANZjY2XelprQmT
	 HT2aFLakQQt5O3KtEXopuiGGXkvaE7Q/CY9i11xPpZQi+wtUKZ6kMJYpxa8I6hsEgPhPV
	 UZwQDUNaUbwDjQNnKUgDoNJ5KGLF8bSc1rst1y/qOIhwiORwrAi8VRptWDD7bNuPjhrFW
	 WS/FJJCnHj5hT6mCQm+Um6jcoY5+sxjexO9aoLxBwBygtexwQSzHzy4nFcAz3xRwDPA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790652182;
	bh=H/h2hz+ZHlbNoj8NZLChdf4RjXko8DkO4BjAP6qpsGM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Shs56IX9da4aFILQ0XwnnJfyY8oLMH/Y6Up8NLfsCcC4ZREnWSfRTSl0qmpRJd0iF
	 BGhMlQ1ZgkDHC4nPddpRSSgPzHfX5PlvaeTxjGDUaYyVFOc/atsEH1uwni6Nc3kHJ3
	 ojUUxvDojFstZ1w0B7iMf2xdV97FJWsmjfo82vc1I7ovrAUdvlTn/3/NAbsiXjPUNr
	 c+2hgeMXdn5RG4WS4MEGNBG793GkHAqnqSo2D9HH2VL8FQq/qpb6+Mh6rL20MC6WfJ
	 wPVutUoNqaX9xMP/x0wwX5IE3HTQoRz6UXGNSVUK/eOl/cohTzPBKP8PbDHcZM/UvG
	 en/cgWz9rCMlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D54140355;
	Tue, 29 Sep 2026 03:23:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 106E7335
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 03:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9AFD80B08
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 03:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sk02vkJpfVnL for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 03:23:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 80F5E80AE3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790652180;
 b=dT/SkUdecqyNlr534jpEvS7UbyHklQTveDtsBo2Ikkw/ohx94l1D8bN+4TuVuwQdd7V3
 Z+7NbYZpFPcosq/TL2WeMagKXHXtd8wYHa5yzhMnV41CtHXJfBuLipX4LLUdhfbXJBhLt
 lGPyBFTUOJ89xtVdmpICxHJXa8seCdh+95f3QYefwljvLeIeQIEpGrnc9rdAGdHxZ5Lyi
 9+BTLvtGvMaBd3L0iI218vswcKGbS4HD9jnX7y2RaF/msMEHAyiODBuGWJH69vH+gafyv
 dZZZ1iheEiBAC3Bul1xtrEJUDHjnsG7ByyfdW5zj4M6UXwSN6X0qRj6jBx0sW7i7zFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790652180;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=7Mnooo5O5I3gO9ABacum25mLFasoSO9g0DRxKiIXT0c=;
 b=e0sceo0n3Tke0rQTkVqZvMWlrrZA0VsyrOcZ+2KQHE1ARJ9Pf4UV2jowHn0yCoN1rZJX
 n2+65bEiBQGO5FQdWlO7e0ILi/8goxdW3i50nr+Zec1urCGP1w4TE1wDlPE7ZwbwekzEW
 r97lZXaPaMtUqkzkzjTngIB27t8+oy/Ux3R2K5ZC24vcf8gH7p79tQoVUH4iCeoti/inp
 H5Ht6PrVVlUteo6UXfdtORLn1sJ+pburnbv8HrxMfzjzCBkknB+uUcuOE12XYxCTeTZWd
 fqzxEzmk1gwMRcTJevYm96oVBtwkYx9ewris2EnGOLXWCRibA/U79+X1PUCq0lr8vSQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ClgFCSS0; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ClgFCSS0
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80F5E80AE3
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 03:22:58 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e8185e037so20439915e9.3
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 20:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790652177; x=1791256977; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7Mnooo5O5I3gO9ABacum25mLFasoSO9g0DRxKiIXT0c=;
 b=ClgFCSS0jIZxDVBGz/Od87gI4jQtUpDcIwqsimbZ7nax20E5Fu3Vg8/A5nLOkxoK6L
 zR8nvucMI0IjPsmR07cnPKGqBCOYjRAfCE4tiwpYFG6VA9943TR/u9qLKdKsKDVc2YnR
 Rl8DTHd6OJmIkuAHR7KFUSO1zh980ZKAYqcO9zcztBZzulEMNQl9GUaQYc6HXJ5EgMen
 pU+bRoFuX2TFRRGvMKMHilemTiPUrv3paiMwg8J5MCHDKQgOkVSD1v4j2MZ4Hk2Qz73L
 vZdQZs6UNvzvMGoufPgKzuQwvRjgHOzfvwkSX+Kiiao9IJn4neBryQkaUkXMnjIxlS3A
 2J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790652177; x=1791256977;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7Mnooo5O5I3gO9ABacum25mLFasoSO9g0DRxKiIXT0c=;
 b=0E0Tl0MoS8BWI6qrgqNBsjlUUEBsIRJyUjfcgC0G4oKoUhaB5RqUKlDVxu2fSj20Ay
 EyK2wvLlF4UrEdj7leLt3XxrmHOwpx8z76yXgHzC/MX379u96dKrC06iGsitc9h2ovLt
 1S2hqNIhp+sdrh2I+NNCwJp4QPim3gEuK3vYbGTtGN+jebWoGGuKcs0YC51sDLSXGjw0
 bR8tuRTS4iBZ5qpzW1JxQN2V7bXzuqjT42pyq0uG1GQO/5teu1gilDASGXuJzEktVF3G
 gNrGoMPqt75Y0RS+OSqp08u/Dfb2RUh+fjV4NoUMcP3lINwL7mBQ8W8W3xbsj3nLJY0P
 cufw==
X-Gm-Message-State: AFuF++mT1qNpkbciEJGBUqUasMLnYkDK/mZ6EXIIf6RhUzAulzCaxl5l
 /jrE79bV+3ZwnQTqyOsnIPmIJY9rvLwEWvqd42BU9C5VTSXw1Ov/ogAphSb2aRqX
X-Gm-Gg: AYBFou0dZTUhwEg0kZaDml8c8dMD0mhP95jBWT1T6mUUl7z5JSnq8h5iy0fXWQYQtC5
 pY7jaAnXB3gFdMFx0Ydm0/IAO6zevTqlm0aMIWyPAPcqrL9HeLdPtVo4JHZvbSAmIwsgFgsw4/4
 Z2Hap5bj0mSq94LK8MOgaV7As3g+XUd/y67OALqD+PkA27ZqA//1RZQsJd2PO3glZ9UthMvdnlw
 Np5RDPMQ47EG7ONa77QCrtUDtqqCi/vq/Tz64QakzarTNIMjGj0RD3/HZnWyDzClUf3DA9Up/N+
 T70TnqjPb7BDoNTe81jgzrB1lWOiN9rZbmveH6IAjlZCn0qRMiZO2fGGwqrsnDPZHzFRWLGZV70
 H0lNzayWvZg1NKUpi0ccFz8RZuCVpHpyuM30GPQfaiWoVXuNRylxnrOjtYP/Gxa+1NWaso08Zwl
 QmsGkpN1xfWGGo4jr5pdykHuwg0gWao8b5WxxW2nwIXMC3zJ8lCu6kWVt82nFTI6AewlYb8W68l
 Xw=
X-Received: by 2002:a05:600c:638f:b0:49c:d26a:cf70 with SMTP id
 5b1f17b1804b1-49ff06c9a80mr184010595e9.15.1790652176677; 
 Mon, 28 Sep 2026 20:22:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d45ce1csm26550055e9.3.2026.09.28.20.22.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 20:22:56 -0700 (PDT)
Message-ID: <6abb2f10.25575acf.3c1d65.aefc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 29 Sep 2026 03:22:56 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-28
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

Autobuild statistics for 2026-09-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
  2026.05.x  |  1  |  2  |  0  |  3  |
  2026.08.x  |  1  |  0  |  0  |  1  |
    master   | 22  | 40  |  1  | 63  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
              cryptsetup-2.8.8 | 2 
   openvmtools-11.3.5-18557794 | 2 
            18xx-ti-utils-R8.8 | 1 
                    attr-2.6.0 | 1 
                   bird-2.15.1 | 1 
          cloudflared-2026.6.1 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
      docker-cli-buildx-0.25.0 | 1 
        edk2-edk2-stable202602 | 1 
                  ffmpeg-6.1.5 | 1 
      freeradius-server-3.2.10 | 1 
            host-go-src-1.27.0 | 1 
host-google-breakpad-f49c2f... | 1 
            host-mfgtools-0.02 | 1 
            igd2-for-linux-2.2 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
               libecoli-0.11.3 | 1 
               libepoxy-1.5.10 | 1 
                libsoup3-3.7.3 | 1 
  nxp-mwifiex-lf-6.18.20-2.0.0 | 1 
                openocd-0.12.0 | 1 
      passt-2026_07_28.f8df3f1 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.42.3 | 1 
               pulseaudio-17.0 | 1 
                        qprint | 1 
         s6-networking-2.7.0.4 | 1 
     s6-portable-utils-2.3.0.4 | 1 
             sigsum-go-v0.14.1 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
               tcf-agent-1.8.0 | 1 
               tcpreplay-4.5.2 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/f8f17e919c2deec15189e9758d76141148598146 |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/881c349f61962cb7838b8bc535543ce8ed7b0f9e |     
    i586     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/97813254806dfb7d660aab562148883fe507a64b |     
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/7d5ea93ad8359fffdb4d01d84910a82c3883cf22 |     
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/8721db53036ebe9bccadf34c580c08e09849ec69 |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/1372f6e3137f7106ae4c5b5019622baad47a7e1b |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/45e8ceec4b7889d4442e83b39d4a68eb2e1df35a |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/43a75881db7559c6d5dd8a8564b2e97f82667d6d | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0022d8460db43ccb358f8f2f98e99ecf7dd7ab7a | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/1ae798ffec94fb5971d5c1b5e4f5c3e1e12ae548 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/88aab279e50c0a965e4d226a9fc81835bf1474b8 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/d23d9a028e53a61bad6f98e66ed5fada44b43117 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/d81d0795776f030ac8b22906527f621aa4517a12 |     
    i686     |       host-go-src-1.27.0       | NOK | https://autobuild.buildroot.org/results/dd8db0f9bed182002e57d4062236281673179a3b |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/53e38e6a800f4dee8ada9960cb248233413ee39c |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/3c6227407983035ac6669c6566fa242d049292a8 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/98389547976c73ffde67c8333aecc5a863b1d57f |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/28cceed974b3f116475f6154cd4763273ec35add | ORPH
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/625a2b75e12161af7cb23fafb6d0809ebc573be0 |     
  mips64el   |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/12e1a71c6a2ff87cf66b596f580c09a58ffc00b6 |     
    i686     |         libsoup3-3.7.3         | NOK | https://autobuild.buildroot.org/results/a2af71fccaefbaa378b98048010a4b8f5535e752 |     
    i686     |  nxp-mwifiex-lf-6.18.20-2.0.0  | NOK | https://autobuild.buildroot.org/results/4c5efa1e73232ad12b32e0657ba5c91c24c258b3 |     
powerpc64le  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1b5dc42edd77350fec3fa9f7af76910bd36fd662 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/c39f46e5e55da1772dac307cdef09c54f95b735f |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/a77e3b098cda59faa99572f6967ec1cf1c58b34e |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/095676c96a9f1e68fe7099ccd4da5ef1e2613cd5 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/8e8cfa0fab6aec836b6fc5d9b1114e38aac5737d | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/548672fb8e2395a0195c0b638569a02c217b8258 |     
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/08ace2159c54d4683bc2ffa84e5730eb9b58a3b6 | ORPH
  mips64el   |             qprint             | TIM | https://autobuild.buildroot.org/results/97efa78b73fc00dcb12ba9b85abf335a18e2a693 |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/8a2fc5be530d11543239acb05df80930cc9d2d52 |     
   x86_64    |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/4f8d1ddc7f380295081233ce24b9f1a5aff0a8b5 |     
    i686     |       sigsum-go-v0.14.1        | NOK | https://autobuild.buildroot.org/results/f7ea572f3dafe26f967a7026b4b5ff299893e31a |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/b503678ff9dbe7da2858651b8edb940c468f625f | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7f07a99b704b3b140701d1e5eebb334aedf48f33 |     
   x86_64    |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/1db3e924c659c8edff026568ffbfc576d5222db9 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/243b2a99d27d6b789a47836f87df4167ab3493a5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/96bb2824e4da5dfc28ee434f98df181b1086bb70 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/217187d2d40f29472dace3cef0c2faa533986f55 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dea8cf02615f0dd1afdcdb757f716b609367216e |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/ccd8e4b04e55ea316f71132e3f5ad55a347db4c5 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            igd2-for-linux-2.2 | 1 
      passt-2025_06_11.0293c6f | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ed178830bcee6d115693e0ba2e1aea34b2ac75d6 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/73a1409848dc1c32064ef55fab91d3524d6e3a23 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   duma-2.5.21 | 1 
        host-python-lxml-5.3.0 | 1 
              libeXosip2-5.3.0 | 1 
             libtorrent-0.13.8 | 1 
               openblas-0.3.30 | 1 
                   perl-5.40.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/d818ea5f0dedd3b0067ea6be70f0168c700f497b | ORPH
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/8f456fe27f000a37023f42c621fc0cee1a420a73 |     
    i686     |        libeXosip2-5.3.0        | NOK | https://autobuild.buildroot.org/results/5ca7ecc7f2295ae8e2a45e056b78327835f37b06 |     
    arm      |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/f125a62d3a8072ceebcceeef21f5f1056c9eb377 | ORPH
  riscv64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/081962789dedc1a8fc9467be02e918097c4036be |     
    i686     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/a18ee15342cb4b15d891a34911cc9deb9f5408c8 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
