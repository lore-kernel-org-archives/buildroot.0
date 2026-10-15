Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA827CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A0E607D8;
	Thu, 15 Oct 2026 19:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78_y__ZRmYa7; Thu, 15 Oct 2026 19:33:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B458E6090C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092782;
	b=GyF0KShdNU/OE+cpuMNZE4Ahl14m0behXC7fusSwQbXLEj0SAwzyz9ev8OZfuaYB2Wvg
	 Sn2tIonMNXjAwugPxIn+ofW2dqSkeBHmpYQYeHk7aN9rETElRE2t+c5gcfI/25grwBBar
	 JpJDXjsbjr3H2mIetPbCgs0Lopt3KVwh5VWaCJVvbnmILfe7V8wELcRtAroYiZQQLZ7pN
	 H85+uo3bJu6zo4B10/2KMzVSaNmhgAz7yvUzj6kc6U4DiCXjKy061vTx6EyHVAFIK6Ebd
	 5KRwmvC3eIcl+UeMUsUufs0DbK+m1pOeNiQl9hTSN2SSawQd5haqF3PtQDmdO5FOlfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9042//7sA4l+KE9ombd+vmDIJwa59gx6j5UqbzNYF2w=;
	b=h95wnPAG7nAA/EDG1ef5p361PJbgYy+qxP4XtM1y941FJb0N/Yql+TxuL0u+nmbUBARk
	 XzM1U4Vrlwo6bFFsRjUDEU1V5v/BYuvCufKgeOCqkGa59L16Ev8uc2qFbn+niJt6O8pBE
	 xBr8/4bqEcBHCjN4pn+oMml+yI0oXRo1V16uO7ljsM9rpKS5q1CXdm4xtmP3IHFTA8IDN
	 1TB8ey1TI2heuBDe7tEVqob1PL1TKku8jJ7YrofXAs3YdkKuTQexM6FEnlL+0QGZpoHTR
	 /aehBELC+JYvFUj2aufj3I9SUME9xvoNAkmVbKuV8vkAYOpXIUq8znBkh3vs9KTV1Gw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092782;
	bh=9042//7sA4l+KE9ombd+vmDIJwa59gx6j5UqbzNYF2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=K8KeCPPysou3DE8P0HTMCWRSYQuwWWsI4ZJxMzjt2J+7SCYJRI0YzDoC/Ste3c1xy
	 ku1aR+mnLjZG8TVfc7d86m7rQmlf5v2VSl+l/hN+E8u4Uis2zBjQdU0baDlXE2AfyH
	 BhxlRwSr2V9/vRmVV9OQXE/rUYGvNCsPqd1WJFDnVCcRY+NNM1i+g6IM/Lo0V7G8Uk
	 8FaKlVkE5sHAg4SFMuxdpZtWT/MrCUqohh8Aa/HH9+rOnoxcDosxLH0a9ONJn9sH2O
	 TrsN+hIVs1BC3sIDhFd43ueNd1oeznRv6fTca003foNCPKgLfDi6ROP/nsXld0g5hg
	 FtpNxBx+337uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B458E6090C;
	Thu, 15 Oct 2026 19:33:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ACD5A58
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E12FB40261
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOnEUF2jocIe for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:33:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2716F4005E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092780;
 b=UnD5QCj8vZF6FMrcNmO35FwAaWrepzGLme/QYH+C3hKWBF7RVKUJUOuxg45mX1kGgzNk
 3iOSPlIUBVWy3AvTEf1V72fOYB3s4uiwkDFbSycFn6Yu5i01T5qvUEUKG10WZdOqoOctp
 AxkVpew9E4RIBZSivbyNJqQKaARR3WuPaJmU7x2QIVGHNPtcfFjCJa6vl/ehmdNUnr9uW
 0TQ6CpDst8SgHR/uos5cEyLpKSF4IEgGCkqQPFHfx7YKlP+ptLCNygXNO0gBJlGYU/ACY
 8eBClYpEn1LuChS7MvubET8veF3wxqM3+89bs56XeBqMBDPTwR39ET105vDXmz7GRUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092780;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pDiEB0xXMfxnnuQpcynpwJDQH1P+n6Gwlq9Tg/O4Zq4=;
 b=kcr+HBKDQxAuv3zL4ny48K16qEtTxNPM5XrMC96ZZlLcpr9cibg2AVSpvi3afy46eCdH
 QLcBWJzTs/Am5NZrLJdTDfUjzDgqcC56FYa2A0hI3Te0MLav/7qVxU8ncNfaiEteoGaCJ
 IgmacwROEK/u5Zrz7wtYkgQRWvjBksq6HgW8r5XdqlfhB1Dfl9C+CwgBrl8AICDZbuIbF
 ctlv/YJj3DfgxHxaCZmCOVuHgae4IFylxbxNihWZXtoWT5uBamollPVaIfuYe2HrQVWyH
 ek64jekCX9YBE1WNFVyeees5tWSqyVlgFzcvKxw5BFuepz+2tPgU3g0sAWebLwysOKA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=m46xbgJB; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=m46xbgJB
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2716F4005E
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:32:59 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6df7f544919so3806377eaf.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792092779; x=1792697579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pDiEB0xXMfxnnuQpcynpwJDQH1P+n6Gwlq9Tg/O4Zq4=;
 b=m46xbgJBvpaVVqbh9/I9WJCrV1VrKzkmBtbkQyORuaoDzWZqZZShhjHNYI4aLKss+8
 t7uvlCBJxDblpOnQjsYRRFpLX7ildNbAzvNxbkoKuvkTkD99l8fBNBoqZqeHhWv64eFb
 hy/0ESxyiT1KwAYJeW5lyQ2tim3S31oCyXPq8pivjpUcucVTDHh+WGl0jS2scqSqjkZe
 3nfzSg1O5w05CbLO+v8FFEG2WJcP6gcIkRzIr1pSowd1+ut/F2BLHwUgCNR3WV5ihYq0
 OecOqyJ/sQ1GCbdjdTlOm2ezhIDTMnz+wNydddsn1+nhuVGSN8ayNTLTqcRy8DruG1j4
 TtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792092779; x=1792697579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pDiEB0xXMfxnnuQpcynpwJDQH1P+n6Gwlq9Tg/O4Zq4=;
 b=TfEQ8J+M5b8Cd+OPjE9C++QiFZECPaNUO+/rFmUff3Ym1wj+Wwwzkj/Vhb46XuLWn5
 rFI360ePIzvw4xfYOu9LpxcG1FQ2dwsz1pA0+XtEu0Wh1FqOt0QWxZAz62hiGfxDQ03F
 CvHPA+yrjaOKEmUC3z5i7XVPXLO9b4ZLF6Fu6nJLEDnvCRpCRXE4BYnWkBtLDnY1B5SP
 LiaIrGzKyBEp28mFTzchC6bKcnha0j6E66YTCTGZI2+dAJtCzcXUGRpvkhiRsNaRdB84
 QF21eIiojKbIABV2CWFKiPlY6NNqNuuPJ7LRqL96CSEz+AZUtsZiuL4rPVEG8x9S5kHB
 Ktxw==
X-Gm-Message-State: AFq9FYIkmSYthu8YXi+bavlct3CeGD/zACzU2v2ENIzm5pjC5MIIEuJi
 WONew1F9rSdsSD4yks7uYKBOiN1Zk1nTaTAPIcKWjrE8NbS3iRjYiQ+vWaR9Nw==
X-Gm-Gg: AYBFou3yQFt2VTG06f7w9xwFttL+cK5QNQBwC42TXB/SRIGTJSv1Dj44+x56pD6eR/R
 avDlhyyn1opUa6G5PDb6r22U/7No1TxY/2d+U7LBJd9rO6bUzCcZOWXX6Lfi8nAJKc2eo0/9cB3
 5dJ3hmRcXUvz+ebJ+pLtV2UqjrWK12nfyysRqM0u8OjeFoU7ormUucZYldmOn8G8JLRrxz6SiZb
 tJgu3vIN6WfbFZMCutNUQAPVFSc5q8CApX5XgNpltfu3qkHvytO8aiICvOKYoQAuMIdXfbgriKa
 a/VMBICEV9H6HtiItMJIwckSw2Bk1qyRQ7zGWd2QzWAfhdOByMnnMJmoTZmrZZYQCRGM8goTHqz
 6LeW5te91YkwelaMxtKo0M3Vj9dH1bVL/Buwzep7uVT5Hv92xlg4p8ltO8Cgz6yIZIMN00tKns4
 dCkmDNa/qbG/hw+v1M4KKa93FjTuQ8lcuNqHKs9ZWxj19bQTsAUpmkThC21eV+Bd4AgMuHKHGRm
 vP9Z9dfiRkJtXL/LOKitlftHESGh81RfFwqbbQ0mjlGMy+/rCCS+/0WB0MKCJMsr++h7RroR6oC
 YloACDHgp2BIvYLf7a6NKGZdgW4OR73OREXhYhFzZ9p1JX9YRIwUSG27PMOg8SxiZIMFUCwrnTK
 +USP4SD2kgnOcOWoFlJwAJP79gcIDwu0z13U4F0Uh/g==
X-Received: by 2002:a05:6820:f05:b0:6d0:1fe7:1744 with SMTP id
 006d021491bc7-6ef11165dc4mr13996353eaf.83.1792092778922; 
 Thu, 15 Oct 2026 12:32:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-7018f2df328sm180045eaf.7.2026.10.15.12.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 12:32:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:32:37 -0600
Message-ID: <20261015193243.3299884-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015193243.3299884-1-james.hilliard1@gmail.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/9] package/python-more-itertools: add host
 variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable a host variant for host-python-jaraco-functools and
host-python-jaraco-text, which are needed by the standalone
pkg_resources package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-more-itertools/python-more-itertools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index fa3d859905..6fe90f84ac 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -12,3 +12,4 @@ PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
