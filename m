Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46601C88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D6880E4D;
	Wed, 16 Sep 2026 12:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmQm3i-uZ_BP; Wed, 16 Sep 2026 12:46:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA06780E57
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789562803;
	b=NNSP7pzCaBTNESPLyYdSWOdK1YolOKq8U8mh3Dykyc73LNZ4YwB+oGOUX3xh9ucHp0Hv
	 VVFJyHhwpuDp/R9XOK6WmByljY2G5+BPBqFBnfOE2SSitBYQbCARzRhFCHq/ICLZemPHj
	 J0RXwfY7j91vvCNUvxj7Y66DKfnTKtJ61r3V5NSNMe9dKmYwXaojLljwtsl/mJC+2J1dW
	 Zb77t5ILt6T1nINo8w7ATw51fHUzUDHtbbFkzeLqO1Vpii7VWW7EOAWcX4MedqLYqWpwc
	 PhTA3D4IJTbqEHvletIiE8l8kNAujrz93vppLZ+Ntp/moHiRB9/emDDjrK6yfE+bElg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789562803;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Swyie8NiE/yPZZjeWQiqsDquz87QxuUesbek+Vp9oWI=;
	b=a5ms/Nv/Uo8jZ3cTud9ROVD9YaBocsr3rWYdWvgNfKYGW4qgdZtj0IaK/ecYBtBshuXD
	 Ol66ApgE6+ZdgxCczhP6q2Wnn+2XwhdCJia8iuwcLk+QncyXZ1sSlPYJwh/5v7z7QWSNq
	 cH/xeSbYiLon1OOX0SkivXMy5brbQQMgRihhB2iKxQkH8lYJBrg7RZ8V9z7lzjQgBSLR1
	 gKdvHn8LNCRwFEpIcQNWCWfe/KMz8fy0zDRRbiF+HWdXKq6OhFpeMeXoerWQk5n4f5/57
	 ozOoyI9Mg8MuP73sv2a2HUBbFmyTyfA/yv36+iHXd7k0QrrOBy5bnwsmIqHR6TDa6cA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789562802;
	bh=Swyie8NiE/yPZZjeWQiqsDquz87QxuUesbek+Vp9oWI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=K7Rrf3wXMXS+H4ZYtPB0lUbgcO2K6qhhD1To2nBXwRofuIl/0xWpRBOd0IHbjI9uL
	 /ZDPtjId9cVFEjc0AJcHXv5GSgmdlQB6ypD03Afy7XXjP4fYkVpLxDoW/FxDH8cifE
	 6ubVJVRsdXjrU5rCvlHnXzdB/Bt1lym/5r0jNIWJAhjBj+0HvvmEaBHtlOcsyGyeSR
	 ebbEvo2yE+/ovFu6jHTJfZkOkcD7h+oZgafc9hXcT6cFDgwq23qgINXPzlm19LzA3b
	 kmsV7vSQ15RApQPFPr1YOzL6VYwFHuXoHR07HUhBGNZIpcjyoH06vQ6ktOK86DCZJW
	 al7cBJ0Aup3rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA06780E57;
	Wed, 16 Sep 2026 12:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FA2C29B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51B31406FB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6gay5wrHVfb for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:46:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1BDF4406F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789562800;
 b=K6wn291GsW++B6g7gEu+zPnMTAr0l5xKFuq7YIlG3FE1xbjUGv83nAFb7JmPevyjQGa2
 l9Bez+BeVm7AJ2U3T3jdpAWsmeTZjZ0xtAgVDykkKNyX1HfWu+UN4EqYteFEvh2aA/R/K
 veS0tKxlFvirFaL3TviD56RfrhrbOXRgJLTQyhlhPiLbDb8513R0qYJ1hGCxuUClm/IXV
 daDq/xbrBBRoaog5TmU7pVqJk6ujOXdqOxsMlUqslX3wopDEkhQAo6NBQp/1Dwwz1cbgS
 cqRFmd2geK4QwfvigR3JLNHDWPqb3a7jyBCw4SdApFP6kD3HqDogfJAYVO7GVJGFLqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789562800;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rL6rE7ntBv74vGt6CiLrqGrVVmB8ay6tNhcs6amPKaU=;
 b=ZKcMIytNn0STRbNjebugVqq9hGa0Fn22NDySmWxq0Ie8wtKRfRMyB5nyfmpnDGjyZdsK
 ah6JM/K179iJerhW5GPXqFk0jzb7IjaUlJJrMk+tPCi8fGdDFrzw8b+n2a2+wSR1dVRUZ
 2lNle/Ps9AMUzGL7245xa49H35MEkbMQ58Pa1eyqoTyi9kVGtuFj+bDTkxSCsHYFEjXFW
 jvCyo0skvnVwsG9U4HdoJY+DvyN1FRYCS2Ho6KVOnbMlrNHtCZ2L3kXNHyQg8Qz8X/OPA
 3AtwSz/n4wu8maN1BFlqnvXGGyJYSnc6gXN8q4zsXz+XmQ0JiG6XgpHqsD9oTcqXKnA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=HBQlA3CS; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BDF4406F7
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1wjPn343w7-0170Cw; Wed, 16
 Sep 2026 14:46:27 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 16 Sep 2026 14:46:06 +0200
Message-ID: <20260916124608.2644663-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:H/gUBEIFy8FnyvRlJNWEVk0KivYOE6nB940ptqq+SDgUUyt5ZES
 1eIqbPpgnmVP1aUcFbI4+QgFwByAY5mIVhENAQ0rffHXK5cr5WKYLlmtjf/68lECc7lNAie
 xrpK9qkAjWX8oE2bRsLiPmNkMER1mS4qjGWjjGJis8UPZUxs61nb/9lZEQ4ik7x/0uRdTv9
 x6Rn6clO+dnSglpEl90vg==
UI-OutboundReport: notjunk:1;M01:P0:0PEQk/fZkJY=;EYAEChTaYZEPzSO+EyxEFWHiAUV
 EpAtiY7NhrvQK3wDK0bXRP/z+G/rC7nu4Zg+vstEAQMA6cTcVu/MhWu4AkTc5Lv9ADwREt9cx
 ceYSMYtlEvr2W8UDCXyZR1GbGOGd9t1eSKgtG+kYNsq7+/PMK4ANBEzvesOdc01J5fFDvNp6t
 chy0QJli72t5wI0v8SVIc8FBcYEQAE03pBhkOQcbUpBNkf2gNpGmtxiNClX7OFTB/psZ3lmUU
 VoqS1g/lo2ODLKvFbDY72h1DOSShfx+n03kWCzL9lP7k0X/BINAA3Qruon8jnHZ1ZvqCssZkp
 292ijtcmQvtHynvIkiTSR+ty2c2rKKrA4i7cMWZQgxf0kruuAc7lxfnwUWSdZ8hNpmMcgyW3P
 F1CiR8eqEr/njHI9HiFI8bwjALYa4Th7WyrwCGOpah3mdCNS3qhnfNyhRq5T9GRIIGZQayTgt
 ceFMoeZdIOD8zGBzM11faEreJG6nZ4HB9HF0r1enyP4egVjOS98kvj1PxFkIkk7ZSav2LXDPf
 xkzu5OPCt4u8/e0MTJBdsGHXKNykLa5iUxB++AuDkT9PxcTsKHrqAxe+X8qUnQItGqFbnV4YP
 gs2GOzi0kr5iXx72pedni+Oh/7DuDmP+5OsG23pqrQHbe5N0w9OR+NFa4tymPcFW9Bcy1Ycx1
 FY+yb72QbW9BswxaLpc4jmPiYX4L+DWhC5hAu0H9pyQY9mM3PbTR35hgfkY09C7R7qQoxMflI
 ysSSISicW/1Qny5UpxoDCH+u5d/hDKN/uKAI98BY+3a09CwQbOK8EghSCx6SARHsOQJnd9Yi9
 Dk387KkaEjLNOPOQMYAPBXhqfe9M10XYCODVh4V7t7RV1zThSWc/5GiIdrjDiHCYUYTTCB8Zx
 8fAXdSAPGHP42OvzP3znVBuIG0uCHaAW12oMgddwKChi14eCtHvXaoFdlIWpBxziXAwJF3zvy
 3HarfCByTH7Ju0UnjCfzHWwN2kGV5uayF3keBv9MlKPgOLJmxnXCkOWHoBwlYgNlSibuzel0T
 KTUoMh9C/8n+sGQaKDrzLfmFhinQavXN7K5swa4AvG72ZrA1NuMLt9qJvB5FGIM2+cWjafGB5
 eNe+7mmC17pxM6o5lgmJPL6qHBgKHitdZmLKNE2cqBgIwpNNnMu0XL/l6Zbe9fw6f+47nKyDj
 3tiOq/vB7jVz7g8npRIIwFA1lm1iJvkYAntI9lCX9hZmOZyPl20+qhCpvCsLOykppJJ3D3vxr
 G83TMIW3wFP9mupMjviBD1Nwj7Wpu9Aw8AZhE0wEqfCdNpDTN/f+eoR43tS8VCymYik9vGv5K
 wiIxGZs56OcJ4g24b1EH9abQE3P/5ob5Ysc+P+P7aH1AgEHcTXFvfOkQg+RRsg7er9J0zWkPP
 eoXESIczNriljiToVblrO2SjM0PuAMrTlw4eYU9ETZroyGAm22sjjhS/LEp2iJgx1KVnFzvBE
 0vMI/Il0FqcKDNL1HlFkNt/NoFoy0sbVWanUIdA3T8jMIDVd8XBwnRkE7It/kK6Bhw8rplL1J
 jjJuo+xpN0Vxtv3fmiFIPQwjhn2zIf4u+DQ/rx7csg2Kek0Ie2mW1OaY6Tv+LsfaqgQJc37zW
 6knOTpB2ay4sn3nn3DrTNAYictmwNfiNe5zz2igz6uDr2xAWrna45zIuv8jdboylBxSBj9cJK
 uWQCX5/nQhBWUQ15WGOPCll3C4rnzDhZOfDF6Hi4QiJCNSvImcmidDltFvwDriXaO6+avg1Qu
 ljC8DbGEsKKj9wXfvPPM8d6OFWlWDgpjmNH4MXJ1pXGAbelxNB9bs+mUrvHGzPqYLAXReAhh2
 njBY6r5cjWQxwNA7IVBndIxtksPZEF2Wi80P7xkwqnbjHlajePWJzSiCAz8AhA53T9vXs/QY8
 iriYvaW9I5Q3sk18gemxLCmK3DLuaPaPA16eDHQfJTWQ9N+ttDbl9ZstRGn+Kn3ELxUK5dVbd
 Xo6m8zzDG129LN5c1sFXOq0Xxi4mPMZ2MdSWJhDEoyFq4nqmhHFzbr5iwCsFbTMKmFBKCy7Bp
 nqqaoWOspm3lBi8GTX4vlveAIiLBkH2oDhw4k5HHAcZHmw3XUMcHaJnuigy7/jGn1jbZbZvNV
 fyyGrI870K8rjjhY9L+asd29lGQLSAJJRI2Q4LlJvTbob7SjAEJseq8noZB3u9nFPNrIH4V1j
 V+U+aXyGym321SCSyyJCogRmFdHH2KQOr1ntNKYi4hu0mDOVnMijzqj9yJtITyG/ooyUpf3te
 FtwQD0L4mtNkxUhxqqG6G5biJ4cnRawAPMirUsYTZHUsZfVduswBgD41ybNR6lgA1RwR5BtOy
 y+J+UlhaSuYvXz3smSMT3HmwBvpX3nuS2WatnAMoZo+lQmLQ5WMSl44YZfAEe6QdYAdCNKjc+
 4FD4DCJ0VJs1fEbbrBj2RemNHN/SHVCusz+vEW1klYw//AiWat3HaH9b+5nFQ8mlq33rdllCZ
 L/rS50MraCFJFbolJr4iqpmMpeXqlwR0AAfQ34ybrnq+AIGimA7Y6R1T+qoUofBlz0bykNgx+
 sM1M0i1OI/Wd+2bzmwxuN8OqH9ynlDt+qw6tuWDqiK4W0+fQuzCZUuSNDNQaGkrRHMAMf4+kU
 jXRAzZSIa7905oXjjvz+as7wXmpwAU76VQiounCU19OPQBFtbx2CT/unqzknNSGtN1zUJ4G+r
 zWRsam2FzuWz0u2Gbuv5YLgRIN1UApuUAnSUdDROGbdKCjqW1EFOnzvUUhnlShHdD2uqiVj1P
 URFdY8AhXwvMVG1G/S5jQgxlgWVkLz/buz0yGjzou/rENMJRIQWMgsufFMvTlqqSoz5GeMlYn
 xPcE61kUewMmJkjf+SjajnJytDAqnZimr/tnmQRZqJbsYu5I525KpXJGPMvUROAGNq1gAfiMR
 YFtVAQmQuIvrIe0uuqlIkhbZRB57IJFXu/G39N3ThacX/SrVMgLJMUM2hzR8iEXD/6tzFJmZl
 yjn3b34WkoEVtwdZDvxazUP4przKo+hH6SME7bv+gJHxfgAQ4Y4Ht41xL3Y6T8/V+eB/zoTP5
 Nik1rIzvyUs2zPrwre7wnBOUe03duBJ743WlDdGPCWMf1hYwtzYVTJ62RcOW8HGNkCapZfepd
 T3NLTTH9WtgO35oHp1tu2Pq1z4YLkBZXUQ2wyLxzUsqf7eYB/yXNiGhTzLUBaGLxNGoCOWXtl
 5uz8Qs5Oetj5PJteNM2PDZF2mYgJSubN6BCrjE7BTitZtBsv/VPLv7o0650lHD7xHtmZQ3K+V
 ZjgxH865jpVYg7WgN4AiDM+5Ylj6Vzcj1v9gfJhDvaIyFtHcGdKp90fG7Nhj4UtLZ817oQ15n
 +Y+2RdyQmk0xdPX1dbvnaJ60ZY+ZgYjVXnUcVBxxN/bSue4owoTxidE7yWJv2Opz6OG8+zfpB
 lr5yuu7rhusPqE3sXeS3i34dFfkKsfV44Y4Bnd8YgHAfNAa4ynAEqGwErJ10KELx8Uc05zTJg
 hNsdL2joEvIw/4NzDAhHG3bgE2yBKzrMhysewVqybE50H6+AbWJcr0zzn+031mV/tfhKImVnz
 OXiYq8mGxM3V06rP0/hWx+enmFWjbOJrFcpVaGcomNFoZliAmpjxTKYsNLbMTUc5L4qCHmyN7
 pbOHqikVc7GMORXQ/LzFLuUhHL50ZQsbhAdDvlPqlWT+8SWwMU0pX45m7tHDgpm1CHcs24B2M
 vA2Gbf3n4LpRbhGxZ7iHwwGoi4f40KJRgxRhiEQRlif7v7ioB7wtgqCFZqalHJOV95FAyMog8
 1LViGPDUCmUurcN03ClaTI0myMdHUL+NyKgmFoReEG/LCsIvbt7zDqCl79b2XIkNcQnS0FGOR
 K1y44EZlmFj/EdBA7Bzlabaim+Yp1pX2a1dca5xp+Luj0ptXiWjUBqck25eVnuoLBn4M7Zk3k
 WOEJrFEpkcxy2zm7y/jHpQA4DmcvISq2WN9C82Ym+US2/z4Pim9entclO1uzyc0H5CXKdxzSp
 KcR/cJjj947QdrOCo7nf5bEdTfzFgh97P6Y1k7f/SiAM1l3tHIrGs7puX69ISReuMtMI65U4Y
 oQYDYHEZ11uKXyLQl5RtETQdfPt2QsAHQPOEhKc2slQh5zGdJL4c+5KNz25L32eg+EApj/a5Z
 S8zqs0pjVIU/+6x6ZgskjpM2weoYG4OCM2CdTheUzyx2XIbb465S5lDghKuOxkONxzLJNpT1v
 FXVuiqQgNZ42ZG3dZeKgeZkOXRS6rOg6XCjNLH+KOv6d2cf/XWdcJAueNH7RHuivmu5ndGVYk
 OoiBrsJyQX5oumTprzc3BOkzgI8/WRHdyWejPcwAIOiXF0jHiUUe+Sy0L91Krb7ln6iHHtiRo
 KOVVzYv5KdhMXpkwE7r3okCK2dYjMP62kbzIx1r6RyOifma+F5VG8bkSkQhVarffoA1J8Iru1
 e8qu60/CR6gnXvjbpzP7nGtiot5ibePvaAcxDcWQwpEH14GKkPxZhRkGd8mzfuR72jbrr/69g
 gmHeACAOcT7yRwBdTAoKXW5B9FZfmqHxt96huPKJCsAZfOxpVRlqHNvUUI5GUIFYGeeqXT3Cf
 ygZ2I/XGMJMJIJzMuvN3K6tfvwANaM2601z4I8ETz5XUCK+L0ol/eaGRT00rg5bcYubaZhSA/
 BLgxsvIoc1YxZYEmSy+GJ4BXucxwx6FX/oUYL5vROiexNe48b310mY4bEhSWfO//z4n5u37fk
 h2a4f73RGBf32eEUP2FWFzIOOdmGLLumlQ8cT3uwJ4/kjeC6zl/ARMRxFrn0ODEjui+/H76eL
 UR1MjagT9Lo+SMVknP5YJtaprf2N707WOgIC/ZX/urqSIMLfM/JfvYQSGjgKFEC1wDrmnndQx
 xjEAr3VmQuvB8Ta1Smu2rqwOSlR5YwlsDOtcSZ5bEtkh2WVSaQxy0hb5mKUQqzVZCctaRK30u
 skShJzmyjlj7QUiBiHqgvhQ3+dC4eUtfxJ+c/+wSsA1D9VTgdW2ue+BU1GAxcP8qkJWUWuUcE
 Vpj89hLNidhf+VpZiwHvJ81gh3ckvaArxrwn5HCiV8sMYGwbQHDPzu2raCXOCdPP4Sq0blldq
 kEurlrlcmot4TXEdWAhNQgcXANGMMJhcbpUgJQAwdX9dCzTcD+rTkOWqTWkpYIBR222pYp7IR
 xzOnu4DfhKXNUuK5LWg0q1IsGBuVV4jjQaby0XUMYWIVMjXgKqcL/qjaNj3uLbYAhBh6NC9U+
 yQOb3l/60rzV9sMjsosqvwrYICTKRnXfcczvyPLM3OyvzZYYFwI6NWVXsTK+jysUQda2RwsFM
 zAzVGiL6TEPcZ3iD0xI9FSWWqai6KXW855Mm9oFlPv0szdaENKcWJNzLgJu0uVgzda1XXPEJr
 /vAXl+WpMgJ3UqGQOBUKLI7IhUA5ERQWery4WDtO87auQWcJUgzqk+/1piXV8w9IxCrF6QQvz
 BtZGovOKBiUKBpdPg5CGYZbJOPVHuIWbBoB0YyziJ19knvNpEGqF4Q97jyYZsct1x0X7q37ix
 GmoVWOWabz+/wHIdV88PKzzn60HeXqb8DZCWRhidG7QWVy02mZs2XAAJs7SFddQ82ow2iW2s4
 BS5OFr2EsBHWtQma5Yhl+673Y4iqOgNGN2aBvgeYxQk6a4QldBmV9gELLOZTTF7rCj+3IC23Y
 gkYiAsGTcsGzGUosBSpb+IQM1o1+t8AmpSskwtaucr26T4wQzqPwVPqiCYP5sNA+0BLxsYhWX
 hm/wk7DjUt5HWNf6NIErao5acJ1JrsoZ9DHcluCoQPV8gxJIpbauFjW3ubmnyvKF7tkxSBBhN
 ABQUvl999OYjd3BFe6SREaakysQvuWFbtEH+zzqiZ7u+4fiH+k0FOCOK03BnHIVGDHgORhhNT
 xKNtJb3JnN9oI2mHBExnPsYWWrf1FI2nbKh2dI0f5M29eVtt85Ll5c0Kos6YAzEFD04+4cTTu
 E8NSdJ+zK8HSJoHo2cbPNqRfihkRuvxZMq1aTxhy+J8ppHwf9LO9ohrgGRO3xAkQOw3eJJHKV
 XpdwmhqWdXrzIQaHfE0rwcv49hRdU16Nl65+izlBFCn0wsxD0u3412VeDF3Qw5ssN5IOdAsZm
 9/ch+SB7PoXIUz8fbbAm1GpryVTAt2GUNPuCS3KR90e2Kg/HNpt7VaTJw8u8u697yjyCjuwPJ
 RZiaO8+XEA5FqeBkP5E/54shTiTPhXAF4OVkFPVwAkct4PWZWqYyO0MqtfeGuRoyMdUrFrphB
 2KCTBuxlI9rIb3+uDtKFd7R/ekW81OcOOXSFaBGMRwkNQ06nVjCy1tfN1k3Br4mPb8EBDtRTD
 JneYQbPCTpuLbTe6l8/J3yt8WIJUiLPyPEmFZmfoZOJYkX2dPl040TWyhS2Tba7dVYBh2NW2R
 O8i+emMy9UFw0
Subject: [Buildroot] [PATCH 1/3] package/tpm2-tss: enable host build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Building host systemd with tpm2=enabled (to build systemd-measure)
requires tpm2-tss.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/tpm2-tss/tpm2-tss.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index b9653ad33f..9bb3b9d677 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -50,4 +50,20 @@ define TPM2_TSS_USERS
 	tss -1 tss -1 * - - - tss user for tpm2
 endef
 
+HOST_TPM2_TSS_DEPENDENCIES = host-openssl host-pkgconf
+HOST_TPM2_TSS_CONF_OPTS = \
+	ac_cv_prog_result_groupadd=yes \
+	ac_cv_prog_result_setfacl=yes \
+	ac_cv_prog_systemd_sysusers=no \
+	ac_cv_prog_systemd_tmpfiles=no \
+	ac_cv_prog_useradd=yes \
+	ac_cv_prog_groupadd=yes \
+	--disable-defaultflags \
+	--disable-doxygen-doc \
+	--disable-fapi \
+	--disable-policy \
+	--with-crypto=ossl
+HOST_TPM2_TSS_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=c99"
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
