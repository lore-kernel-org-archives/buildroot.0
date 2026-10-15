Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902FACCA465
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BE1781212;
	Thu, 15 Oct 2026 19:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCf6ke6r3P9H; Thu, 15 Oct 2026 19:33:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 57DD3811F1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092790;
	b=IkG+V57r60smoZGYdv+BQ3S31bEacQ5g0QkV4F8na4zikKD5x7hc6hAzCYOncMoVB09j
	 nzoKTXWJh4+55eO6daDmy2bffKvAQCiyjKP+kyTHiZ97sq4mRXDvTl6KzUlTgEhvjJMRu
	 pXyv3AEHtAc6Uf3V+GqGZ8RAUu7RwmqGsHL1MBMwghCt0pATbFcikoXTEpITmix7WYZ4d
	 RVhE2IXDS0mfpCXc6ciM1QnYnHMfWM0zLzXx98AurKizMl1ZdUlhvTZKcNXvBKtdq6ClD
	 IKUxFqJ5e8togOH9ayk4R920oBPsv+D6F+207nxGI+VhznXnGSAob619WmwLdDwDncg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092790;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=yF46qbIzCDjx/5ZMjDfSBHwlafD5Dy69zLsHAKwXMdc=;
	b=fvWeFmd2XGHli/q8mSWFrE+x2MMmlJkaVJC/sJ/qaw2agEh5TYmbvsHsimZqnOxSKV8d
	 uu0DKOZPHyT9a5fb6wrbwvbhWFrYQ3MU5TN0glrJfybwodTLXOhxCBoruUnpBKNdB35qS
	 1HV1jGZOxNMqIxFz7M/on3HmXZ2fhobr9lqRc7FU6qzgfJeMhr2mz/F7fnKUKD36mFO77
	 FGeibOY3Z5GW6p3tbAKtMYkSpWOJtWgWpHOj5lMXbvbWXqk2PYwoclhxHFsmtCgbiRtsO
	 ZJoME0Pe7LZt1RdcjlIlrxM1uQR+UwEXvAk0J9nGPB+4ejAW776oQ9Jxa8u42lPXD0w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092790;
	bh=yF46qbIzCDjx/5ZMjDfSBHwlafD5Dy69zLsHAKwXMdc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fvU3IwFKGpp81Kd9wm1P+bF9klvciaKamyxMzQ2lPanmM9+slXduwE6ih/vZVB3Rb
	 PNJPcpI2NDrMJNlUABhJjVJvObEVJ3tcXyA0eJCvjObCVhfp/JwP8+V4oCk7gHpbh7
	 v01VUwYq+sRE1qUDestgvYS8DqlJtvhcdVm69sVlCG06vH7CjOIalUkKW+j3jzZLIK
	 amA7XS94GtreWhEzHJSvmU2GznJiC08CQlEZfMdZ5qaA5FePN6dTfgrByxnUeOi1wB
	 8dJC1n8BQ5qHxi/kLxAkyi9ce90WCMcNp50WFBkyKTDbYDnsWywqrj6pPk6wFRYnNs
	 g18UX/pkvD6Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57DD3811F1;
	Thu, 15 Oct 2026 19:33:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 521F3362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42ED260A86
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlcCnusFZ0yx for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8AE0E60A68
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c33"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092786;
 b=LR1zkyUOmrTzhbioCPjQ/96FQ6Vb288chGrQrnK9eA8zmY3eOGQCMukY2MXy7IUz21sd
 6Sa39iCF3VuMaO4EiXiXiWpfHgjal7SjfD5JT2k9ejsMcoxteTZrfxki7fL4XgH0bkrOA
 1hiFy2QP9dxMUY/kfhgXyv9urRANqnpu7A1qZZ0hGBa1BR0bBH9/1Ak/hulCStT/be6Ca
 3Ven63Y2wzwyMQwWPjFWKRRaYPjIq0TbqNhNiF6EstocLP5+v6ckgj4qAoIbco2uGuFyw
 vKrt+g0qTl9ag9+aZCI/zAmKIGH+Ne9yIWIr5IxuU1MfvUbfKNnZ/Q/nqQHVAASUyEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092786;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=YOaLe/68IkTSk16glihPAhmv6qw6CA3A+PjFECPy6Io=;
 b=FWgfNvNeuzvhTDC+VcV6bLdkqDUy10YZ+s+ScvcYvA0AZy6kGsBPWbroGeL/gBzL+L4R
 +AssOFortbsWZS+DOVhyjlT4wnjqDRdAgZSwOTJV0UYyyuKhRMXSF0lmb2Kw94EZzjyga
 vXQt2CzgKxRfJf72cx3DeqTpgkCPE3wwibzUFQzyh/5cvD5bDX8iqyDcvPLMj70ocb/bK
 Lf7V5AIweXHNlY4QdoyIAulW65bD0QBLarxLiVtCX1RLAFj9Cg1no9Wc0PA4kenUhVRT9
 iQVaMLEzSEmTsJ7shsQadEmi42/CjhS6/QdHQzyGaaKrkwiJgVWoWyxqW43qXW+I8Cg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CdEfDd+v; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c33"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CdEfDd+v
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AE0E60A68
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:06 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-6de1fd5f572so2543287eaf.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792092785; x=1792697585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YOaLe/68IkTSk16glihPAhmv6qw6CA3A+PjFECPy6Io=;
 b=CdEfDd+vMzRUvvcULfwgNLP86deyvuMMAlpNnUHHoXfeR6DKIgJNXMFenBCEpjwXUQ
 rQ7sw/IyxAzzwjmE0C5mSqMX3JZdTGPO0wAHNMn2mZHyR1LQxk6N6aAfmtsf2Ab1THYJ
 yHYuVK/J9ESeZ/uN9Stjh+4yq3P7mNdRFrYrgVyaavMNQS8zztt989u69OggUp8yfx8q
 bSZgz4UmBLhqZbifEtuGt3MuOsq5o1YdrG1MTKLewPNtQSrpdk+76HlYeP7gn/KZ5mSu
 8GQwqyB6tqwRAlzPdCZ3g4nmx+b09aTQosoeaqHe1PdNIBAwBNzbtKYFS+Tp1JNrY6nb
 NcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792092785; x=1792697585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YOaLe/68IkTSk16glihPAhmv6qw6CA3A+PjFECPy6Io=;
 b=GHCxMEmj0vg3GkAaUcQxW1nzBBfjlYwLHec68EyhwPqQh8SEQ73/tjXmF45YJg7/8U
 dm0PfWzx3xc3s4iqyIw0QQIUY7X71iqwYyw/796FqJTheoWMUgg/5bHakjaJCItYjzYk
 xkgBPnsB0V661cQcyQC7n1/0aopnz2sZvYo0QnngVY42Y/hGZ/eyk0DXmnd6/3t78l36
 WgOv6NofI2K7A3NgwBrOyRi8KkUbF+qmcGzhPsPKksMesWmwab3KMnmXxZJ/NsW6Dmsd
 k2G3QWSAC6+fwS5FuOUbAiptIu1tCmdt2r4aXKOUtuIYz0L7t8ciNUiAp3igqm40NPII
 rUgQ==
X-Gm-Message-State: AFq9FYIDuHjkEXLtS4Z4PhEXYspIjG+OrP7f2LZChDhbXphIQSnwgRWQ
 dK1zXyOYpSS4kaZd6/b+erFLzi7M2L/pqVmZpDsCBiPNvO12GruMM2coTUg6yw==
X-Gm-Gg: AYBFou2fTvVt/v3NkH0f/8MJCQJdIAGhuyY9jVBxfDyXJTZEFQv3DijUeco+pM2r/v4
 ukjfwslA1LAzwxNFLxy1fbyyNDC6naSob7+yyCvtI5CVxMi8t7iDXmgrlokm6+qiu24Tyx4ga19
 Rni6Kligs1w3pSMc+QGZfxF39uLyvbGwwXiaR8qvylkVxeFb8wrcNgFiDVWUQnOgBSV208a8oKA
 3bQfY4IdwR36D3hJ3/Ae902tNiZrRdan9qAuPEAe54GcHPZ7xATplebUDPAIt8gdg252FiEO8Pg
 4YKz1c1b1F5KT1iy6ntCHoMYImsNDS7CWehkw4om0lVPJKfFSfceuN4IpG9q1lzJmonKkVyFLoD
 B9B+B5FAGIy5umuZaUK4xWGBIQt0OOgAV47JJrfQ9gWIZgkQuC5UGHC056ytM3bfWoI5kzHjEox
 RcnecaCsClX15LuXik5xyWNRdSF4NqoWy6Q1uHa7Ct7YflXIclhp5yE0m4ELDAIAyAUejhYqhMd
 ysrvJUVy7ZjcPdYGzefRpy5S1nGXmvrAj12L//XfNjDBhIA9rg+xD0hydb5wwMsV0cNtWOt3YPu
 HUaV0uFTShkhwgZkZy0ecV10rFJdkKNPIT4Mt060y3wgbgunSqr9Xwc75zEPk727lkEUtbA6cHw
 peIAmRzhMnipNHJUunwJloa2IJpYhEH/2eVwht9oapQ==
X-Received: by 2002:a05:6820:f023:b0:6f7:fc58:b7aa with SMTP id
 006d021491bc7-6f7fc58bbfbmr8375797eaf.19.1792092785403; 
 Thu, 15 Oct 2026 12:33:05 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-7018f2df328sm180045eaf.7.2026.10.15.12.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 12:33:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:32:41 -0600
Message-ID: <20261015193243.3299884-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015193243.3299884-1-james.hilliard1@gmail.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 7/9] package/python-platformdirs: add host
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

Enable a host variant for the standalone pkg_resources package and
include the hatch-vcs build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index dba59abfdd..6305681a27 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -11,5 +11,7 @@ PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
 PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
+HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
