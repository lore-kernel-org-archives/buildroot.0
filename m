Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04144C982CF
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 11:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A445B80F7D;
	Thu, 17 Sep 2026 11:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLVLF6r3Hb6f; Thu, 17 Sep 2026 11:38:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4BEC880EB6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789645088;
	b=NbRrJWPOGZppoJMfyNF/ETPBvHTLyELHs+oPxWlBIZr4pcY+8cydITf/0rxb5kfSyiNo
	 j0KIw0n/3rUxFuKFjgQTpiFKkw+fvQJrH2nlMP7Ug9kv2j6QIVl+1dB0eJ5MEpG8RvILS
	 P2zq7fTqvSk8JL9F2T0ltbVoqoKOWSr5BAb+mhWF1LLgpLccQzAr6akv4OsDtofcg1UY1
	 OgIqNu4bW0BJlQ9d7iVytAOvIE/GZ10Qq5c84ky6gClDFNQK/rM9NiEysW7JL2UgUiSWw
	 da2Tz+q2cMAwNPB+jifjZPesyX9gw1r7SB8TvP/WQzVcsKqm0ZA90GLkZQwXeyjAZiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789645088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=g2ZTXtJd0Ov6zQ+qhPbUyvZBLCfEcmar7IhJ5kyOAOk=;
	b=ByKloXwqF/zWSy45VnGtTZAdbFa30KrORiviTHMZBYVYrlFKsICiEano3kACCWiuGCyP
	 5atolQh1yvqp7ZDtBNNb6sIf29QzB1rYABLuJpQ9vpL1skbQPZHWz25WPduiWJo0tZjL/
	 XyT0vcaCWNc+QdLbhXL6J57MJnonifsG2n75XcIor2IhUOGdpFOEy19OJ1vYzd4ssybY2
	 uwNkvG2FE0uWUZSotOkRxGmp3tfG1x2l5Dw7RDz/N/5rK8r8JvRoVZCqfxcFPsCSTcP8g
	 XY54V2+y6Pq+tGX4hsK//YFsPr/7tGwpaapRLoNmMi1Up3HnwjHTf5IBvce2XkzdsOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789645088;
	bh=g2ZTXtJd0Ov6zQ+qhPbUyvZBLCfEcmar7IhJ5kyOAOk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=A6pP4jmNt/NuqeXG4e1mN3I3W9leGe71vRb25UAHD7O7Q7O8QBUBDJYvfVFH120M7
	 6nN5s++15k69iJBE5uj4+/EynajQUFUD6bAs3VwqJzwPTrTwXlgZiKhN7n1APckRAh
	 3G7cWoWozMHIQmPTRAWREl3aAI+5h0y2LVxJo9EP28TE0NdWkpC4AEAUtqPhEUYfai
	 wTa8vw717mpP3jWh8SPHepk0dJAVEecgHV7iKZSWM5dHfKzpeo9lAhyG1WQmAi2m2k
	 xqYjaeAImmjH5LWu9PYe4xEaAKcoypgt4vk+Fg9wTeGE1xVtQBsJVAcC6B/vd890qs
	 SBKyo3feuHTkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BEC880EB6;
	Thu, 17 Sep 2026 11:38:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 340F5465
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 11:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A2A54027C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 11:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMZZeWNSbyro for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 11:38:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6347340050
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789645085;
 b=Py2Ei08o+v1VXg+mu4rx/PKZB+g51dwRDlkAJUhM8zV6IzplMZ1xnS8z/BM0S18QbwPT
 UkCNZLrQN7KJEimZ1ykRB/R6tw39+bSTkejYBnMRyvZorQUiS2/jM5QN41ySWt8dXO0e3
 QSGcpRs+mej079/cbutlsgAPlyYNnKyPvCAiceiUeSOw5iINGcFqor0leF4Y76pkkf3V/
 unMaTExN9dm74cJh9QqyvrpbKARatC9Z64Kqh4X4hPBDeSNjRiY6oSXdi4N1RgaDVUq5j
 q2zN8P0t80dXqFqUSJUDi0HX4MRmTA46y4giU9ibaN1MJCLkUO+73EteU7L9ffE5Frg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789645085;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=ObD3JlX0G08o1ym+wbWruhkdQlKc+ET1Sy8W8t9hAek=;
 b=d0klT6b3GBgYUS8ltJCO07K7iUsK19vIC+1+sSZLyM+6vbvJeS20OJEONVszjBIPVDNU
 WpwefFoAk2AgdA/0c/rUh7zd+fBKyMUDBj1z0nJ6OYot7sC3OUOrOz4I2A38MxkuxntXO
 T3F8A1wJFh+wRPSeCv0QW/uztIFroDPYyb3yIdGZHvxj6B+E15w/qmSn5uzC41COhX5kK
 C2V/pZBX0/Rs6BnGZaCWshaKvb06TBds8JvvOZQDI4i4LLYGt9KhfN+3B6ztMukh6HwFV
 LL1npBHsL7wJH3N6KOwf7po7eCFGQkYU/2dFf6CNEWocZzzTybAj1Y0FVQkfwYkTK3A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=TrCXfQHz; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::1c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::1c; helo=mail-ed2-x1c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x1c.google.com (mail-ed2-x1c.google.com
 [IPv6:2a00:1450:4864:33::1c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6347340050
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 11:38:04 +0000 (UTC)
Received: by mail-ed2-x1c.google.com with SMTP id
 4fb4d7f45d1cf-6a9984f9adcso1180042a12.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 04:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789645083; x=1790249883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ObD3JlX0G08o1ym+wbWruhkdQlKc+ET1Sy8W8t9hAek=;
 b=XJOw46XypxMbsshZ5jw786y9I1cFfqL0hxwFB2FE5yRtLSicSs5C6WrY+Ok1I2XbP+
 BHoiOVovMYWiJwOP//Mr2+IJGvmWa4I6TDDCk2OTLXs8XEUdlLbYltq4+wWd1pVoZS4a
 fht9FEUMJbKzCr/NXzwdMhd46jOgo89DOVCyocnfY9VR+YmHoVoJCgCu0zl0ofRKpBD9
 jXfc5oGUcEVaNKZqBKJKhxm8oQ1NyhSENZm1/+GWdxTSH9ubar9xq2Pg/E2vHhEUMjKF
 gdoahrR4P6Xxkjfl1bzyY7wllMZYSKjP8zIczEf2sG7QSuEOefef+6V+GCTGx203zo68
 rsuQ==
X-Gm-Message-State: AFuF++l4Fvc9p/yJYbLalB68iMJB9zY/h9GiXvob+u8tTBlG7Qy8LGyP
 LfofZONqwuiSdRPz6XWUcFS1Xkt6+2DqbaBJ5AbdNb79XOYcmGVFsZPPSYKbjw==
X-Gm-Gg: AYBFou39qnmuKpg8cTtaa+Ym51UTbNww7fyJVXCLCOJN7dzfAYWlaKL1YQcCoGBZWOa
 l97KzWb+HalH16bPT6QJr0Fm4QFuCe/FjI5htDqmtHaOQdJ+B9VHsRwkNYP6rZQBWarkjZaAf7N
 115pflhVpnEFZRS+nQS7uHUWBvLkqXPSVybMtqrjajk2ffks/n3Y/yQBcUroLa22dz/yZCI+MYQ
 YFUtdQ0j5hR3Rc3DYjefjjxeX+m4umQXW0FgI04egl9YCYYeOguUD0hJ+avgM3JydFf2FD+pJnA
 8iEfjfzMy0j1+vkExkTCXa+T//RDBqRgmkrdideH/Bqz5dub7RDBB8+Su60ycWr/VMBuyqQZhF2
 AhlanLj9Ue2pj43vnKONvHTZf8bu1PB+tssfmcy29dYNelr6eEP1+cskrumB2SFYxCu1ShsBkKm
 a4lyMXQ+Fz2C5bt2rcZRPAlEbc/C6ZH0O0qeECElAattEgkIv/sYaXZYA0+7MBFQjXR8PTuTCTf
 XiN0lFAavtvcco/3mE56RJ6yfeG8vKDXje7nsUME1caEdsNhzqv18zHnQ==
X-Received: by 2002:a05:6402:3808:b0:6a7:ea53:f622 with SMTP id
 4fb4d7f45d1cf-6aa2242936fmr4698019a12.33.1789645082579; 
 Thu, 17 Sep 2026 04:38:02 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa1cfe037esm3687101a12.1.2026.09.17.04.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 04:38:02 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 13:37:18 +0200
Message-Id: <20260917113720.1297345-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] package/{libabseil-cpp,
 python-grpcio}: disable for the MIPS n32 ABI
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This is a v2 of "package/python-grpcio: disable for the MIPS n32 ABI":

  https://patchwork.buildroot.org/project/buildroot/patch/20260908093538.2715153-1-yegorslists@gmail.com/

Changes v1 -> v2 (after Thomas' review):

 - Added PATCH 1/2 fixing libabseil-cpp itself, which has exactly the
   same problem. This automatically propagates to grpc, protobuf, re2,
   webrtc-audio-processing, sysdig, falcosecurity-libs, collectd and
   gst1-plugins-bad, which all already depend on
   BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS.

 - Added the Fixes: tags (commit + autobuild result) to both patches.

 - Documented since when the problem exists, with autobuild links on the
   maintained branches, so that the LTS maintainers can decide about
   backports. Short version: both are broken since mips64 was first
   allowed, and both still need a backport to 2025.02.x; libabseil-cpp
   also to 2026.02.x.

 - Answered in the python-grpcio commit log why the Buildroot-provided
   abseil cannot be used instead of the bundled one: grpcio's
   GRPC_PYTHON_BUILD_SYSTEM_ABSL hardcodes /usr/include and globs
   /usr/lib*/libabsl_*.so, so it is unusable when cross-compiling, and
   it would not help here anyway since Buildroot's abseil has the same
   limitation.

Note that n32 is the default ABI for BR2_mips64/BR2_mips64el, so this
covers the default mips64 autobuilder configurations. All in-tree mips64
defconfigs use n64 and are unaffected.

Tested with olddefconfig on mips64el n32 (both packages and their reverse
dependencies disappear), mips64el n64 and x86_64 (both still selectable).

Yegor Yefremov (2):
  package/libabseil-cpp: disable for the MIPS n32 ABI
  package/python-grpcio: disable for the MIPS n32 ABI

 package/libabseil-cpp/Config.in | 4 ++++
 package/python-grpcio/Config.in | 5 +++++
 2 files changed, 9 insertions(+)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
