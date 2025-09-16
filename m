Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB80CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEE136119D;
	Tue, 16 Sep 2025 20:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5MSdD9wvDiG; Tue, 16 Sep 2025 20:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E746611AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E746611AD;
	Tue, 16 Sep 2025 20:27:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F238199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 203E68350A
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFE1Yki2_xQB for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07AD9834FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07AD9834FE
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07AD9834FE
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ebc706eb7bso1376878f8f.3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054460; x=1758659260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aG98iMNRfDKEUd1BbqhuRUanfGUoj2jELKZ1/RRs2qk=;
 b=rFljGhr180mIc+c/QFSegqU6W3M9LpjW4Op0GaSJcWuVy3KcLbmQPNeSQESf6t8lKl
 Hf5AFp9AO5N8BkefrlDNM41wrvszOLBFpY/2+Ams6zunUosq3FUnvquwUEg03mpwmqV4
 cTBosJZ0SlX1ThZ0I3/efcjKtsZXRwhpK/SB+rsxep9wLxYeBTZ9bc+j+XLLO3X9lWOJ
 YAeQ2uwZj1UtIGUJQiK5HPYfv+/lPo1SnTS3h60aoTUES/9xQ35B4o36luwxJDhAmfaj
 v3mai7J4XS2/Y8LYTF4YmRS6ldhRKNtjB3LNtu3kK3LddJoAZCOJOad6aiX9/ucaPn1L
 Rzlw==
X-Gm-Message-State: AOJu0YzCjlDTtEqiNnnVe4LGerFWGoPF3XY3K13RoFpjrIZ/wZPftcfg
 71MRKBWimPPwCJ9iorXdCPbgXARQ+6ndyNj3I4sy4bvlFSGx/a9x3aViLkofHjgJ0sT1kWzhx9j
 6OnkfOAw=
X-Gm-Gg: ASbGncstCV4FBg6Cdn5GzzrM39XzqJ2L5ONOO4C3kf80fzXoVmGCO7yYTgq0jgs6ZwF
 3npACP37dJoU9+oy4awIL3mGm0V+XynNST4Jqn9QfW2iYjb3vcW252H5iYsXBR5GMbyveFlEqEv
 qPWJ1Q1cIpJ1nKwpCGuVJ0Ltlqg/t8C1cYOG8J8HO7RwH+DY70rEqh3cGn5sjwFeEA/eUBepqeB
 39LgaG2a9Tm4FoyjJOmHVLGsgtoBpWyBG69JgqPopP9vwhuUI0CIKW1J0go4GBTbXYkfetmgWPh
 OcG6r1wOcydwPbhF7OTUZXhmLV/f0AVP6alEKTXlYA6MLJSGIF6UT9d/Q6mydS0IfvturVIXeLk
 3soayzJaTC8jjCPF1NWTkW9v/2w==
X-Google-Smtp-Source: AGHT+IE56nXs2htwCKr/rIeGxF0bA/6JQAogLr1IceIumr9wyjr3otqHZVeG5/ArkdEPveKq6eHmxA==
X-Received: by 2002:a5d:5f50:0:b0:3e9:d0a5:e436 with SMTP id
 ffacd0b85a97d-3e9d0a622f1mr9524780f8f.23.1758054459557; 
 Tue, 16 Sep 2025 13:27:39 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:27 +0200
Message-ID: <20250916202735.1121872-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054459; x=1758659259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aG98iMNRfDKEUd1BbqhuRUanfGUoj2jELKZ1/RRs2qk=;
 b=byYZrLwJdXb9KQeZYtMNBSwW4olRzkaPqw033Ny6tSUpHchzzNrATbYQySo7PGbmp4
 PeTAMEjdoFEbn2z9UaeiGam3C8/UyP92UoapU1G9qAzg9fcWv0ehasvc1S8/S6//wVqm
 NCEqWXjQMwNnZ/pFJW9kefZi2ge6f6CTOmqxh0a1vgAb1mumjrDjceWyJW7ntH2HR3Zm
 b3u+iT6mkZhjoU4QFs0WyFR5+bnsOMilNZi4aOkW0sRt9LJRlTiVmsC5cQzBAFfU5ElG
 yODRGfZonEs5LBHhvE6llerNyG2SsPh0vGa6LbzfFMTDQJDN4bNza0ltoUc89zuQfbRx
 5oNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=byYZrLwJ
Subject: [Buildroot] [PATCH 04/12] package/gnuplot: fix deprecated CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'gnuplot_project:gnuplot' has been deprecated in favour of
'gnuplot:gnuplot'.

See the following:
  - https://nvd.nist.gov/products/cpe/detail/DB68C9F5-3330-4749-A6F5-61FF041037CC
  - https://nvd.nist.gov/vuln/detail/cve-2025-31178

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gnuplot/gnuplot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 2a1072a55c..efdc08deae 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -8,7 +8,7 @@ GNUPLOT_VERSION = 6.0.3
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-GNUPLOT_CPE_ID_VALID = YES
+GNUPLOT_CPE_ID_VENDOR = gnuplot
 
 GNUPLOT_AUTORECONF = YES
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
