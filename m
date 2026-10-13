Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE4FCC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 23:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEED680C71;
	Tue, 13 Oct 2026 23:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXKKyLEs7gUt; Tue, 13 Oct 2026 23:29:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DF05D80CBD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791934191;
	b=Mks7qcdJgo95YbiXGH1g62ceXt5LmX0gtSGhqBDeBl1lIGGRL4EDhyiqml3M1WWhJMO9
	 23Mtf5OjN3E2oevMM32C3GD97V7mhVIvEq5TQCedAmOgewNhto/VJdI8jlSPUGGNSkHDb
	 rZlxJBZxvoPTGw0fBmoEE29vfKrNExu3run21wgn3fVWzUmZ0/33b0/2AK9L09YwVvYtn
	 1w7QkWw7y2G2Ecw031WKL+y9+WJ8Snm/iyZygJFNlAFxCZFb564A5RcWpLZQWpZ41CH99
	 slN3nmOMaKJwEGcmrtggQra+3v2QoyDdXOJ0feEsUdK/UoeFr+lEi74ve9v9JZlUMEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791934191;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=8CvPIlF41E1x4kPS9e/Q6GT0sB64Eal20Zug2iZzhVw=;
	b=d02MLy0jA4rJ07hCIRo5peU/eO7rBxkOKw2qxSwSyGz44nG71FxS9LK8lQ7cjR5gaKu+
	 pfQfL3nkttUdk83WfA/A1vjDPJxupUhORF5H32+rxX55IOXU4IzPFH9XyjfrGV7MKH2SY
	 o03jTnWKmUzy0V+g71YJIchOi3KnYzEhh8+NB9ZaCLFcQ3BbHitu6yxZYs7loMYe+ksH7
	 C5aGqSYy566ThO+sAmNtchWWAlFOPnrY44VwFxmr9CBTPZJvMQyvM05+xIQLuyKwKoYt1
	 nT2ZJV5skmx3XwVqqtqdk/iYV2a32k4B9uyudH2oyhAGjsDktP+E5rIW0OdnXRdmtKA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZOgzexz0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791934191;
	bh=8CvPIlF41E1x4kPS9e/Q6GT0sB64Eal20Zug2iZzhVw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=h+Oni/It19p6ClV3aw9gVZqobd7RrCAum7K5RWMZLyycS5pfV8ET93LG3qqc9boeC
	 wxhQaBhyeozT9qL7rOFgNePK9EIu+4y5Ki/3MGoXqqLZ13fJFcJbXeFFERTJ90Vh5G
	 xpg9R7b/8cjsJ6A5kdkYlzj4TokjaMFtr+uQtUmhcrQLkQC9ZVnjr9UdixlikYSZk1
	 aUIg7KGh9PUoAvpfL8tiDK9wAZIaHhS3MNPLlbm9jzCEbV0FV9HpUTF/9dBUucXsMO
	 PJDaX7iXiNKQyTtjPyOxQBlt2ev4e1RL1kq8rDah2np3t5CniaBe0mG9NRJraJdepD
	 VjyEEGo+j4pwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF05D80CBD;
	Tue, 13 Oct 2026 23:29:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72C20255
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64EE680C42
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpFqDgnsCbFq for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 23:29:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ABB0880C71
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791934186;
 b=sOonLrdvj8iActV3456r2Z8MY4O15bb0wjOpi6vJZh/YfKwhu6m7RjXQ294jSW6fUrTt
 7A2qtQvBSNIsT1xE4T1Bera1dchTcqrxgW79M6UgdcwFmF005s50a0LYzJpJtsv3S2RpB
 j0QkJM6A9m1FnlcwbBmp6vtF93NutRGu8Jf9SJL4DdpuejFJSfqUiNeowG1pN5FrZRk3Z
 VG5PHnBt9QjQ0C17YyI36jr00rCASXcNAFWc+DbCNYrNCMJSbeKX7rxiSFRjPYQxSpE5q
 zUd8wRUMLGHLCxqemueIIZtxfofkSm2HPYxUIVp6B8rbq9EILY42uFRV2j+WvYuYenQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791934186;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=swM6DUeuvJlfu7Zk4RM0LaVdKDGcX3HjM3kcqFV/OHQ=;
 b=QH7uSXB6QYQUXXcREMQqfutG0O4kAdUVz3Aq5P09HRAQsbFJFAgt6RbgUcXiakkhwIrD
 0gqBVpVU16dKG1+PMMDsYaafM0WoAtib2E+Nl2l+Y+OdnPSHfd3aJoUlyNw2skNGivmCx
 4NP8TiI9E7a2OWs2MQK8228l9c0eSlvk+6Mlz6O0fl9WMHeu78t3irG4sPdVMl1y8IYo/
 udCvr2jjghCjesqnjQS8gCqrxfkJAz68frXrsViBnCUsv8lcYUnESvzMxrypjJ6EecF+o
 b/uQqtlTwcuyVHMZETUCUOXfnLMAWslNzRo9WbI5SW2KtGjEQENYdJTiWAE4PKUUZAQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZOgzexz0; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZOgzexz0
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABB0880C71
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:46 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-499f20c7054so2016260fac.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791934185; x=1792538985; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=swM6DUeuvJlfu7Zk4RM0LaVdKDGcX3HjM3kcqFV/OHQ=;
 b=ZOgzexz0JZ9tTd9i54YkUqDwEWaFjNbvViaB7HeQ3BknqWe3Ybw8+bbbR9CkUHDpRP
 8KnO6Qt4jqFcenWdHBAsQy7gPwWczEvOp462U6owE5hSQNvPvc7CvypxqHjyDUvKZX5g
 vKJyrh7KRyfkhVELcYUZMdGwKT8z0ULkOYXECVMTOqOkBkDa2JX2Z0Wbu4Rft9y5laU0
 GZ+yP5M1PRhJLzVJ+Laura5UAU6kkD6F4bMAi6LvsirZ265oUZXySukeeL1I8hBrUApZ
 NJHvu+NHcoqV4DIdS6/SkE48CTJd6xhjZLtlSBQpavMiJHzOIR7VIvFDE+DEz353pofv
 XqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791934185; x=1792538985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=swM6DUeuvJlfu7Zk4RM0LaVdKDGcX3HjM3kcqFV/OHQ=;
 b=rmGOh+xiVlTTWRDsOFiAqWrvhoOgOU/kn5oMJsJsEltUV5JDjlHvFIpvDP1PjyPYE0
 NdGcQ04gRO9nozBmPAjY1ipQidMaC4xOLMO6SJ92I8LORw+8DEddZpmez9ErQHO+iDtn
 TBevFeqGNi0Kyzb9zI17FFHNUIB6oezUsMnBi8+ehBQsQP0AaAdT9Q2u8/eNlRaT4KGq
 lxq6zxMNFhvmFfnvqcp2p7nmP4iz1mD83d1NhZi3dDIx/OXMvqSbsjZaYfKZQgtstuh1
 VeUFDl01/gzBA33Pb/hvOYXQ1haiHUDQ3X6jRyroQ8xznAeQClVEShmhE9aGSKLvznqh
 6Msw==
X-Gm-Message-State: AFq9FYJCY7ULBZcGFxS/fIrrUQ46HLJBrNvcyvZeCpypc9cq9xZevhDH
 sDKhP2eaNhZX/W/CBsT+S4KeVnXLutpbb+lac4wvYeG+TSinFHda7V6c4PCCFQq9
X-Gm-Gg: AYBFou1DMmjkthByzEn3oOdUuQBKrwehhM78MZQJYAsYyOETtR0+UeY/Jb1Tjb9cAT2
 K+tfSzQaMh5LvRBAVR9Q9iWLPtcyd6fiE0K48VV/S6eCJyca1TAcip02Wdkefd9U/TpGWQ81wPA
 rsiqrhYM3rgAD9W60gLmHFg6WFVDw+nGGBPq2d+d1U51pkn7NpnCIHoz8TmmKHK8xrL3G/wIErX
 JKrVzQy7PqkUCkq6ko9jJTu84QJm7aiZERmlMNIsq+juh62xyz8FoxHUXciq/txw/1Q2bdtWEw+
 0guqp3/2YMYVnBiNIbuqXMh33BZ3DWT1dUIqqacl86Z603MXlJWR+1HHLaAhR8FDrORyJkIkDYi
 3KVzv1izxIbBRD0zF9WSaqzsFrZjAxkTq0EDei+c/W7bTObLapsp/lGVcbzA4+0A1kyW+YsMYZz
 sLB2vFxYo+FqHGS4eCymgw5Eqax81bfLvnUTLOhB6jiHyZZdjhooSQRUi7JHhI4iMezAjOzplZ3
 Be/egj95QPHKFtEtIy9eFeg3UaMs+JqvYIhHC2tZ0m/RHAeQIj7ekb1o0pLUkba0okPLZuhl3Jn
 S8ZhNW6PvH5ioAOiC9yIzDw4qtoxcd1+nyWPMAS2W6Ay+W16jZbs2gqu9EIvmwlehhojFRPWnld
 keF/4+0X8G+RzBqLDEeyRFY+AB9v9hR8uxhAqHKHRvXbBtzlEiremHw==
X-Received: by 2002:a05:6870:e311:b0:48f:e107:317c with SMTP id
 586e51a60fabf-4a2a8ab1099mr11527126fac.47.1791934185219; 
 Tue, 13 Oct 2026 16:29:45 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6dfbd6a92sm828514fac.9.2026.10.13.16.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 16:29:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 17:29:33 -0600
Message-ID: <20261013232940.2690456-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013232940.2690456-1-james.hilliard1@gmail.com>
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/9] package/python-autocommand: add host variant
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

Enable a host variant for host-python-jaraco-text, which is needed by
the standalone pkg_resources package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autocommand/python-autocommand.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-autocommand/python-autocommand.mk b/package/python-autocommand/python-autocommand.mk
index 37b421e418..1eab76123d 100644
--- a/package/python-autocommand/python-autocommand.mk
+++ b/package/python-autocommand/python-autocommand.mk
@@ -12,3 +12,4 @@ PYTHON_AUTOCOMMAND_LICENSE = LGPL-3.0+
 PYTHON_AUTOCOMMAND_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
