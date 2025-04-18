Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF09C369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 14:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24E0E40550;
	Fri, 18 Apr 2025 14:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7jXfBvHAA2W; Fri, 18 Apr 2025 14:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5344640561
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5344640561;
	Fri, 18 Apr 2025 14:14:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42E05228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F84984C59
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArylQ2ISIo_6 for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 14:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41D8B84C61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D8B84C61
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41D8B84C61
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:14:15 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e728740b637so205394276.0
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 07:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744985654; x=1745590454;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5YWDVjSu4uPxrbbHe/DFBv7OlBsgTNA+3xrQgAOoryU=;
 b=R3+OmWlPbO9FBCTJHxb5o+ghcWhh5VCoWgoBQpuT+4EO43tSB0qv4ZKwvjHkzyurAO
 zHi1RHYhVWcKZMV+rvDeK00b5max46pzsbItJiDiJDfdcw9pVZgKj+vUeIGKe2av2SjN
 Wdun5zdGEgYin7QP321lDc1KrK/+7YdH462wlS1+BE0Xn3NKKNYf+SsDyhHI3hINDjYM
 XfReHNBOXvRQfRbx1RZeB/6EK8DJjFFjLpH0+JCYPM3BAVHv6VSwnFjW8knHQg6a9f+U
 qBQyTmpo3ReS62gnWkZYxYlQWC2Ph/AK7AO2C7QZjtt4KIuFaobEfREdc5j3nDbUEjbD
 Zkzg==
X-Gm-Message-State: AOJu0YwNKyqGy4k8gX33ZfUfum+rCGFxtS/OX0hGsqBxsGMLXAtBdoBp
 DVE94L9GRO1ev8S9cgiqLETnhP+Gj7MgyNOCxY4zI9c6nxKxZCuFep+iibNEgGtSzsgPaU4tTxD
 JEqvrF9c/QM0HeUXlmqvGSQB0P/0N2F9UmyE=
X-Gm-Gg: ASbGncvxx8uN3qSFyR/VROxUlfGFA9JWF0FupHcHGliLQ5C/e4RgX9dihE7w0/d5sBR
 1RvlYqiZvJ6J0D6jKOTSR+mpvo6TtAPnbGm/WzTQWFXHTQ4iluRmBCRlcbeBKA9n16hwsaIGrkO
 PuUoVX/sWE29szqPWlyfAm
X-Google-Smtp-Source: AGHT+IErON0pp4PDWmSIgTMIDfSoHQxHpG/Lzw3DjzOJBgb0rSWda4Ss0Sz/z4x4IjElJgWV6CPS90dn1qo3XF3CzuM=
X-Received: by 2002:a05:6902:480e:b0:e6d:ebdf:d849 with SMTP id
 3f1490d57ef6-e7297e98e9cmr1555384276.5.1744985653860; Fri, 18 Apr 2025
 07:14:13 -0700 (PDT)
MIME-Version: 1.0
From: Joseph Zikusooka <josephzik@gmail.com>
Date: Fri, 18 Apr 2025 17:14:02 +0300
X-Gm-Features: ATxdqUHNkwbb-jV4XnEj079vASEUhLxkVF2KV6S0_yfglsW6nLI6O3almPQZSQQ
Message-ID: <CAPWx8vsoJUt8YMJG1aUqFRK1=yizNbgjVjGL1Q1+9ygjJGnZLA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744985654; x=1745590454; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5YWDVjSu4uPxrbbHe/DFBv7OlBsgTNA+3xrQgAOoryU=;
 b=GHtPH1YiFxAOGDFGOHHxBeJP0y1efcRvjpxf2KR8WhA9piMyn7HoFjInAfB6INvNsF
 C317mAwEPnoWgrxWmXINpGtenADcM6UF0BET30nteBQGTsJ18JO/R+PlIJFoQpIqjgso
 LyX0N7UVnjM7VrdBearmQqGYel2vQ4kZCU9baz2++fQR+R1GDlfU4Hrrd5/3WNY9O8hm
 Yz1U/bqmH+rfsnh7rYbkDV/tgpgLqwS8Geg+6urXXpmYgYrG+sBdrJFrnyPf4j3CgfiV
 ALkFN1C+HRlaI4VB/+3R9pk5z7adm8X8P9C8PXRDCgI1pnLh1HF9nXXz/h9lGvqrMz1M
 NjHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GHtPH1Yi
Subject: [Buildroot] host-m4 build on Fedora 42 fails
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

Recently upgraded to Fedora 42 and since then I am unable to compile
buildroot.  Make fails at the host-m4 package.
I looked up several sources and found this:
https://lists.gnu.org/archive/html/m4-discuss/2025-02/msg00000.html

The work around on Fedora 42 was to build m4 with the environment
flags as follows:
CFLAGS='-std=gnu17' ./configure && make

I tried to patch m4.mk as follows, but the build is still failing.  Any ideas?

--- a/m4.mk     2025-04-18 17:02:01.174923317 +0300
+++ b/m4.mk     2025-04-18 17:03:29.285694673 +0300
@@ -10,4 +10,7 @@
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING

+M4_CONF_ENV = CFLAGS="-std=gnu17"
+M4_MAKE_ENV = CFLAGS="-std=gnu17"
+
 $(eval $(host-autotools-package))

-- 
Joseph Zikusooka (ZIK)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
