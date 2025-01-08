Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFF8E77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A44FF80586;
	Wed,  8 Jan 2025 21:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15vsJgglWpyT; Wed,  8 Jan 2025 21:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B36888058F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36888058F;
	Wed,  8 Jan 2025 21:03:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5DB71FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EDC6401C6
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rJvfyhgpJJV for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:03:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=sergiolindo.empresa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB2A8401BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB2A8401BB
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB2A8401BB
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:03:37 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso57726066b.1
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 13:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736370216; x=1736975016;
 h=to:date:message-id:subject:mime-version:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kP2A8yLC8FW4DPtCLzqQ4+DVEe/VU67h5WojR9OdQYw=;
 b=amVK3ryzG6ZbXqpHUOch06I3uqPPdgWlzzpGAHK2hpYsfQPoweXVnOZMcWOkeRvhJN
 0YGXy9orec9WifNFDPKaleT+OyjIFJOATpH+iN3s8SG5OQ6o6BN/PBtnKN0PYnQrWgTM
 jD+XEc8C2r4Mx5OQ0yU9xaTywBUDq53tkTKjPnor328Ha3FHhP7ne1QQmXr1KljWRyXL
 a6KYzrf/AVRg+bb0NnM6l7oBFgPqoWWckd8Ek1zMESaEyOn3ksAyYN3LiNw3bkinedxC
 0u6ig6sFK7Kfxc2/h9VaiGzYJAPvFiUWzalfAoTVJvZJKFrG7a5QUKkWGGLUPW++y/25
 4JLQ==
X-Gm-Message-State: AOJu0Yz9fhbfS0c+xrPOL7fMw2i33oNeLH3h0DiuM5XfqEqcMIx4GTUv
 wbW0zWasnLq9KEN0078HZBUNtKrp+L4t5PylPTHeabIfleshgGEuOsiIq5JW
X-Gm-Gg: ASbGnctKybgsRNcZVQ3ASRIvMziQTDCHaQPcL0rHcyyIRSrcn0+QLgwyCPApU9N/lME
 18C3y3I8Dem1xc606eiBzfu4r9gT5brHqCW8VXTb7Cjb4X4X5a8XSfPgO50feY5q2lkiyUK++F9
 jyr7FZlsARCc1tfKZFCHDRXgZIkEc1bTMO81AX2YPZkBHTu4IF60W5FklTSjplp+JJA9xQf/mrr
 tIFwywFFw928iBjY90acHm6fCcuERIO1vTEFFHHG1btQ1aTntrjZJ1bUJs9TK5KbVNtpdb/DauT
 U3HxDntFtw==
X-Google-Smtp-Source: AGHT+IHPbX3RBEaWvq+ogLaPTT+imaW8/z4LIGliPNlEGzBAUcBMfvhYjjSM9NJTBbgMvxb/81wB+Q==
X-Received: by 2002:a17:906:ef09:b0:aab:71fc:47a3 with SMTP id
 a640c23a62f3a-ab2abda708dmr383948466b.60.1736370215425; 
 Wed, 08 Jan 2025 13:03:35 -0800 (PST)
Received: from smtpclient.apple ([51.154.20.203])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e895d31sm2535933366b.61.2025.01.08.13.03.34
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2025 13:03:34 -0800 (PST)
From: Sergio Lindo <sergiolindo.empresa@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Message-Id: <DDDE3543-71D6-4367-8769-5AC8D9924A9E@gmail.com>
Date: Wed, 8 Jan 2025 22:03:27 +0100
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736370216; x=1736975016; darn=buildroot.org;
 h=to:date:message-id:subject:mime-version:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kP2A8yLC8FW4DPtCLzqQ4+DVEe/VU67h5WojR9OdQYw=;
 b=nTxkq3M6kX7z7xJVhWCk+AOa6f/ZKhTg8XCAuIN4mNc1yInDtsJ7esOrF11ic0SREE
 vt9OTS01uBFp7GH/iGbw/RYc0fTHRCxyLTkKT/v+4paU8valjfm0VXthSjteqeG3puZc
 96yyPZXJc7pzc/bcIWT7v9WmdMCDqdeHRuRP0O1nA2rc+fAop3Fm747eRrQEQjxWFGV+
 77B06Ka6rMacU6GTvzLyUJ438lVdV/3H2T4oQGVHtyNzJ96lkj7xWcVhvFVXT/8ssG0B
 iUj7TfjUyZKPLbzuYnEKsLOBhBvxg1zbaePC36/IQ8RQRT9IgRhsPOX1IHBcWAGgfpMA
 k1Lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nTxkq3M6
Subject: [Buildroot] Help building c3270 (expects nursesw/ncurses.h)
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
Content-Type: multipart/mixed; boundary="===============6221188557292029380=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6221188557292029380==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_68A16BB0-B3D5-4C1D-8D7A-3932BD8090B5"


--Apple-Mail=_68A16BB0-B3D5-4C1D-8D7A-3932BD8090B5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi there,

I am trying to build c3270 from =
https://github.com/binary-sequence/x3270/tree/override-cflags and it =
fails because it cannot find the header <ncursesw/ncurses.h>.

I could only find old posts from 10 years ago about how to deal with it. =
What is the best practice in buildroot today to deal with software that =
requires <ncursesw/ncurses.h>?

For more context, see attached files.

Kind Regards
Sergio Lindo Mansilla (binary-sequence)

=EF=BF=BC

=EF=BF=BC


--Apple-Mail=_68A16BB0-B3D5-4C1D-8D7A-3932BD8090B5
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_B448E18F-EE6F-4CDD-9A08-4072920D1EDF"


--Apple-Mail=_B448E18F-EE6F-4CDD-9A08-4072920D1EDF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Hi =
there,<div><br></div><div>I am trying to build c3270 from&nbsp;<a =
href=3D"https://github.com/binary-sequence/x3270/tree/override-cflags">htt=
ps://github.com/binary-sequence/x3270/tree/override-cflags</a>&nbsp;and =
it fails because it cannot find the header =
&lt;ncursesw/ncurses.h&gt;.</div><div><br></div><div>I could only find =
old posts from 10 years ago about how to deal with it. What is the best =
practice in buildroot today to deal with software that requires =
&lt;<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);">ncursesw/ncurses.h&gt;?</span></div><div><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);"><br></span></div><div><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">For more =
context, see attached files.</span></div><div><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);"><br></span></div><div><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Kind =
Regards</span></div><div><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);">Sergio Lindo Mansilla =
(binary-sequence)</span></div><div><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);"><br></span></div><div></div></body></html>=

--Apple-Mail=_B448E18F-EE6F-4CDD-9A08-4072920D1EDF
Content-Disposition: attachment;
	filename=Config.in
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="Config.in"
Content-Transfer-Encoding: 7bit

config BR2_PACKAGE_C3270
	bool "c3270"
	select BR2_PACKAGE_LIBOPENSSL
	select BR2_USE_WCHAR
	select BR2_PACKAGE_NCURSES
	select BR2_PACKAGE_NCURSES_WCHAR
	help
	  Interactive 3270 emulator that runs on a character-mode terminal on a POSIX system

--Apple-Mail=_B448E18F-EE6F-4CDD-9A08-4072920D1EDF
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><body style="overflow-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-white-space;"><head><meta http-equiv="content-type" content="text/html; charset=us-ascii"></head><div></div><div><br></div><div></div></body></html>
--Apple-Mail=_B448E18F-EE6F-4CDD-9A08-4072920D1EDF
Content-Disposition: attachment;
	filename=c3270.mk
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="c3270.mk"
Content-Transfer-Encoding: 7bit

C3270_VERSION = override-cflags
C3270_SITE = https://github.com/binary-sequence/x3270.git
C3270_SITE_METHOD = git
C3270_DEPENDENCIES = ncurses openssl

define C3270_CONFIGURE_CMDS
	cd $(@D) && ./configure --enable-c3270
endef

define C3270_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) c3270
endef

define C3270_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/c3270 $(TARGET_DIR)/usr/bin/c3270
endef

$(eval $(generic-package))

--Apple-Mail=_B448E18F-EE6F-4CDD-9A08-4072920D1EDF
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="content-type" content="text/html; charset=us-ascii"></head><body style="overflow-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-white-space;"><div></div><div><br></div></body></html>
--Apple-Mail=_B448E18F-EE6F-4CDD-9A08-4072920D1EDF--

--Apple-Mail=_68A16BB0-B3D5-4C1D-8D7A-3932BD8090B5--

--===============6221188557292029380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6221188557292029380==--
