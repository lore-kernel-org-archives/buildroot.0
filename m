Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425E4C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01655400C4;
	Sun, 24 Mar 2024 16:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dc7gvmpmh_z4; Sun, 24 Mar 2024 16:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0A32403A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0A32403A2;
	Sun, 24 Mar 2024 16:29:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0B31BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2836140557
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b86BUWoHMCPx for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:29:11 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0465B40550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0465B40550
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0465B40550
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:29:10 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e6b22af648so3053165b3a.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711297750; x=1711902550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=556GRsuacCR6sf/a97cWdQj3x0ogtvSckfqqGeP3PcA=;
 b=ANViKuKeDM+jsQMRLSWSYVJ3GiwYMFn4qrmvCLlqsGVPAGcsb02LjTllieSJLTHOC2
 jeE0CDHPMpCbk9yjM/SZqhv9Vbq801sLksG0aFsyWaWqpkKmTquCj4J3y+qk4bvR/Xzg
 lEZanYPyJlcDgbRvJrs5qpbbka0nJoOitC0exHMh4shgo19VFCtcJ2Rm4nVC1MTEbquQ
 XgrnqrzKsluTYP8QrHppEVwh4SVEt8qKJO0sdvl9Se6ndn/ZjVipiX3P0UpZp5O1bTtp
 RCYIWTHfqcX///UAUHfJVqW7NxREA1PBygjEgnAJih1qo1ODcIGHXY3DnEe+QzKc8qcr
 zbRQ==
X-Gm-Message-State: AOJu0YySd8/02L2+33Wohln8o4vSV5KB1aur9FP6A8Ura51ydGmrYhjH
 kXW1caJh+BulkHJIRIL0VoQ/c36TROt59ho9WZHgjnQh4Trzic1oZTSWYjEFDAvTyR9HT8d31Uj
 vXWk=
X-Google-Smtp-Source: AGHT+IE+/I7QkkauzCFNWseOLyTy+UW4CqPt6U8wg8VOOiO6JsQY1tCWuOxjiXL/2hyl5dKltMYTpA==
X-Received: by 2002:a05:6a21:3982:b0:1a3:afdc:ff5 with SMTP id
 ad2-20020a056a21398200b001a3afdc0ff5mr6964475pzc.10.1711297749906; 
 Sun, 24 Mar 2024 09:29:09 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:b402:265:5f08:1698:f1a5:8997])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a636b0a000000b005d880b41598sm4594385pgc.94.2024.03.24.09.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 09:29:09 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 13:28:48 -0300
Message-ID: <20240324162848.17338-2-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324162848.17338-1-flavio.tapajos@newtesc.com.br>
References: <20240324162848.17338-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1711297750; x=1711902550;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=556GRsuacCR6sf/a97cWdQj3x0ogtvSckfqqGeP3PcA=;
 b=u9hL1LiBO2tsFbey3Vlpgtz2tc9fPczcP6gcApkWeyIO+bIVL62Qr9LvyXKYiKggmb
 59epMeUBpe+kHaT+cWelyPnLtwXhOik01D3urCBN6mbEKRlI3uznnWAhYcw9M78HCkc8
 owNM6qnpdw2g3ftMoY4tcXWWUnzbqyywOI6o5zfjaIyd5qEjhqCY5umUBaUcPpX1P2bC
 V2Utin/I31BmCKFIz91xkFHHsSnTh2LgJ4yIl0WN1gsODCqFOj+3DGWYJ7w7UrlzFvGM
 dfZtR5ye9p/NPzDTKY+9cWqLhEBmEKgAHJ+rWBBCAOAJ+6eJbL/EQOVSXFpSc0UFmPin
 pg5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=u9hL1LiB
Subject: [Buildroot] [PATCH 2/2] package/python-sqlalchemy: bump version to
 2.0.29
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5o
YXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15
Lm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNx
bGFsY2hlbXkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hl
bXkuaGFzaAppbmRleCA3OTUxYTMyOTc4Li5mMDY2ZmQxOGMyIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBAQAog
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pzb24K
LW1kNSAgN2FiZmMyOTcyZDdlMTYzMTVjOGI3NDkyZWEwZTBmZGIgIFNRTEFsY2hlbXktMi4wLjI1
LnRhci5negotc2hhMjU2ICBhMmM2OWE3NjY0ZmIyZDU0Yjg2ODJkZDc3NGMzYjU0ZjY3Zjg0ZmEx
MjNjZjg0ZGRhMmE1ZjQwZGNhYTA0ZTA4ICBTUUxBbGNoZW15LTIuMC4yNS50YXIuZ3oKK21kNSBl
YTc0NmU2OWUwNzAyY2M4ZDJjOTFjNTE0MGNlMzVjYyAgU1FMQWxjaGVteS0yLjAuMjgudGFyLmd6
CitzaGEyNTYgYmQ5NTY2YjhlNThjYWJkNzAwYmMzNjdiNjBlOTBkOTM0OWNkMTZmMDk4NDk3M2Y5
OGE5YTA5ZjljNjRlODZmMCAgU1FMQWxjaGVteS0yLjAuMjkudGFyLmd6CiAjIExvY2FsbHkgY29t
cHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICAzYzBmNTlhYjg4N2QwNDFkZTZhNGU1MmZm
ZTNlOWVkYjVkOTUyMmRlOTA5ZmFlOWE2Y2Q3YWRiNmU3YmUzMjkzICBMSUNFTlNFCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rIGIvcGFj
a2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tawppbmRleCAxNjdjM2E0
NDk4Li5iN2RhYzkyYTk5IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5
dGhvbi1zcWxhbGNoZW15Lm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9u
LXNxbGFsY2hlbXkubWsKQEAgLTQsOSArNCw5IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwogCi1QWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OID0gMi4wLjI1CitQWVRIT05fU1FMQUxDSEVN
WV9WRVJTSU9OID0gMi4wLjI5CiBQWVRIT05fU1FMQUxDSEVNWV9TT1VSQ0UgPSBTUUxBbGNoZW15
LSQoUFlUSE9OX1NRTEFMQ0hFTVlfVkVSU0lPTikudGFyLmd6Ci1QWVRIT05fU1FMQUxDSEVNWV9T
SVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzdiL2JiLzg1YmQ4
ZTIxMWY1NDk4M2U5MjdjN2NkOWIyYWQ2Njc3M2ZiZWY1MDc5NTcxNTZmYzcyZTQ4MWE2MjY4MQor
UFlUSE9OX1NRTEFMQ0hFTVlfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9w
YWNrYWdlcy85OS8wNC81OTk3MWJmYzJmMTkyZTNiNTIzNzZjYThkMWUxMzRjNzhkMDRiYzA0NGVm
N2UwNGNmMTBjNDJkMmNlMTcKIFBZVEhPTl9TUUxBTENIRU1ZX1NFVFVQX1RZUEUgPSBzZXR1cHRv
b2xzCiBQWVRIT05fU1FMQUxDSEVNWV9MSUNFTlNFID0gTUlUCiBQWVRIT05fU1FMQUxDSEVNWV9M
SUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi40NC4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
