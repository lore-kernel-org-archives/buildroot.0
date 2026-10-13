Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2629CC6B22
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 23:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851A780DBB;
	Tue, 13 Oct 2026 23:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nR1iPBagdfDw; Tue, 13 Oct 2026 23:30:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8DC6F80DB5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791934201;
	b=o0Ki3aQYHGZz3hdCZ6YMPJy4nyNbZKPWWyZoM3tPgpOY1XX3YuKh6xbqSS/X1Zif8Pts
	 6GCIFgHLW3NgJIA+GEMBH45Wz3L7WnvpFIRN0WpNgIx83zDPbjk6yiEKzPK0f4G40kBXy
	 lsiUFgH/Zd4qi4k3yDX3ORoNnJRYzVWmrAevGmEFAbVjqlOPVa6whSogcl0HQ4nl/jPh3
	 L8MPsB0SDaGEyIcMDUdn8TE6H3dlo9fMUfxLzXOwaeaQ/eZBB9yWy+juaTKaV+euP/Jr0
	 0xXC5AwEmxzmx/Dwl1bSdm9bf/OoqQ+dE0hot4TwAJeH7lF9MoIDG/GhbPuWzh0sJLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791934201;
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
	b=M4Td0FvYCZ6FfnnAVCPYP9Ki5VMDoIODbJPlHIr/vRUif9nC0SPjBpzMlEVlTkkD3wRu
	 VPQRMTvyni+3ail7HdgZMwn78eqgHMzFLS655Ek0EoKsOKvTT3O55QXBTsO5LbpYf0EbC
	 n4pSjBloNNBG7stFuM+b4pYJ9cU1HgUAgjN3s/9uMneiQgIE8HGSU+jj0uMsgHhwcCAr1
	 bILM6rCznDdGjkoT0CNEaGxwBk1/MTsG8Sq5q+y+c6+G9G6fA0GBY1GRNsi6AgGiF5dCM
	 HKEFQA14iSP/AC8qA/DDIKAc32Ltbse3+9TZE5TmhC+mCUUnFxh6wgT7r3sgIYIUBfQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791934201;
	bh=yF46qbIzCDjx/5ZMjDfSBHwlafD5Dy69zLsHAKwXMdc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kymk6M8znDvDNlz1AVH8GRPmAlNL4WVyWla8BruxAODQQ1qMFy1Rsx4FkL5ffdN+D
	 wOxgx5tzb2Kvn7eJkhWz03AGbDkWiJ89DAEMivU0PS2wCLVKO2qEuAzceAeEpzsM2X
	 hNDsK/tT3kw6nz83FQ1/eZbiYsF6wuHYZenahHUG49H1XaLRdEi9m7V5tOBqLGy27s
	 Y8hQ88DxStaKZSvJF47zRCN8183D+Qv/sN+HDTKY+jq0WJVnvDRR7oea9cggv4JdCq
	 9nO8EJX7f/+IqDm5oO3lR6grmggIxvYUyVOK8gUGEP3qcrtei6hSBmokJYsCH295EL
	 cUGhienZno6fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC6F80DB5;
	Tue, 13 Oct 2026 23:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86EAB255
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D0A740715
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeuPokQKfcnk for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 23:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA27A4070D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791934196;
 b=ShLSluurmB6bNEzuqz/e921/LzW1ZCwvSp7EowGAxBIA4rXj4how4er/mHi6RhJRwmSW
 A3W1xqO84QBGI97iIXV4ssEbY0cqMx8FwbXq7KlnRfG0d1krfJk9t3pFHb6Vh1HAFHqsS
 dFg0Nazn+F6IJ/kyH+Nqgr9SgbKrb1qcPL2KPsGUNIPx7j3N8ua6yBnzzFVURo37nkrVa
 KhLcPlzLJ5R+3acVFTCI9xBFM7evdc9lu1ELUUzpv/GqaQEqqtJIFTliX0dxns6rGYO2R
 8If/N7S9/yafE/7bM7QuIaPcCcjptXPcx2InTxfoHuNsCRom7tL/vrlk1GydyhVFE7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791934196;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=YOaLe/68IkTSk16glihPAhmv6qw6CA3A+PjFECPy6Io=;
 b=kBheawA49C/HoUuiLdXsnOx/ABgnbaG03ZUNuo+hO25mhw/ElZFhozvs28krELlolCl3
 tnRWQXk9o1+QS7HqOiqF74qjCCD3zdsf/lMS/tZRlw0DWE+VIylDKn+pef1NsH/i+JzA4
 QJgtezntzsIIib8JlnjgzQrHTEP0XodCXImjggDGMU5tdwCwqsm0qatQOBI5O7lughFwn
 D0l/OOdyEbahGljj4YbahnqsDVRC8FhtCLKS3FE6JuK04F0/y0xaYf2P0MPOpgnHG5DEK
 yEPYA3X6Bhk++9Aygcy2M6KWR2+CAAQu9zRrspEPslZRU2aeqlruV0ulqX9zT0cMtOw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nrRcCuDC; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nrRcCuDC
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA27A4070D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:54 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6de1ca1b05aso2316245eaf.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791934193; x=1792538993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YOaLe/68IkTSk16glihPAhmv6qw6CA3A+PjFECPy6Io=;
 b=nrRcCuDCTqRLKrVr6hTGoilqK2UkJ0n1ASSmPQWuGuTaz4lxLBZ7JyH6vbOmRsl/xY
 ZLBtb/406luvr1hYagh7q0j+EbDZuLj5Tc33tfzrNu05C8lUx1Z/6RfKHbN8w14iriTh
 BDeijlL56rVOoVG9EhkLhDAoClzZzgzbwQ2OnQe+lIggKQ0tv21IgIh+v7VX4X5/1GOA
 OJ9CRh/kFAEr413r8phsNuVg0P90ZuZ0Lkkf0thuy8WN4KJCoHo5Ilhdmasm/pogHjW3
 VG3y0pFILUDXG/eTs8hLP6o1BpICsHFEC5J4pYpD3NdxkbHO9bhrZQMvyY8tRfvrSIWW
 8T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791934193; x=1792538993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YOaLe/68IkTSk16glihPAhmv6qw6CA3A+PjFECPy6Io=;
 b=Jc1caSrM78/p2+bdXff94RMawzuVHrXWsCskhacn1A/oNVGOqkQthCfuQ8v1wNzC7T
 kn6uvfNb7TdGTMz/MnAG6+Byfl/bl1++JcD4aaukUJ0aTVZ+mo7fHM/tdumt91SsE2rJ
 bteReqRZbJKu0gh4cQo2+aV99it1LPmKqE0tutwQbNzUcqsQ/LYTXRc3Y+HvLADXpOKr
 zkS5d/zSZrGXJchEqN2Q6z0+C0rKGn+GBH/ASU6CcZMJP1qb+MbYOTsj8M86iBozIM6H
 S8x4DTNke8iUksAMpbD9/OOWVxcD+S94Qzb5NLuVA65a5w6G82J1COiNQnU9FDdqu3yy
 /39A==
X-Gm-Message-State: AFq9FYJW/2ou84IvAm3B3KQTgXouZEwG/IEsmma/2UecWRUttdLbaopl
 RMzVi38IGMSXbUy2rKQnFj23PwWweu27PQn1zRghCMcwlmKhJP+DgQlqkNNWzcEB
X-Gm-Gg: AYBFou1LSsubWWUumG/IybLhGYlReNDpgKV+AEmU8t6UPAvdjfSv4+JxGh77cJbdmDY
 Yd7sDivtA+5nbhDl1qyIa7EksCWYX6qX9ETT6mBt5DGTYwZdLP91bUvU0pfTpk8xuXLR5qIjtEV
 RlFz6v02bxUSuHdpatMZwzpKodVaBCS3kYOmNf3O0jOs7iVYMFqNgoooEnPxiMrKePfDvXFXOKp
 bXPNs+yZE74N4kVsXTYYklk25mF2xxmrl5q057XbenQ2E9HxaAV4EiuHo1tYvf7x681UZx+72S+
 wklme/+Au8pyf40iFz+LShSYOkiI1aRbNGHXlhYg3YBClEXlIu9/8CoO9J0aYVp1Y3dorLeS3wr
 w5qAruXXLiabqubcLfa13HJTzZJ0HpVOWNBMLeHz2Ne5XYYwakM6cJFz1/OT1u1NwC3Z7r2MHhw
 olxmm/MQbP/p6jQWT7+Qo9lxIpB+hWSAvuTUDzHLG+GdQjXCTgN0vIWOObXHBJJ/zYdQ+wC4E8+
 R9bJ37w5hfaJ1NCmMeS0BgNqQJs+/Lz1UcLRHQVCk33FCPF1r2iFXYu++ceLwtQf1hPD3kAO4/E
 eY2y+YV15RXpwn6CS1h/Ydlf6fyiXO1MXTL5q6jGpIjbcDUZqgz6M3yAETYT8l9YtCbqbB4br+M
 RirkC6uXZvz9PMXh2Ga8XrTjjQGbFJATV9gH7t8ujKMA=
X-Received: by 2002:a05:6820:820:b0:6f5:a96d:cad with SMTP id
 006d021491bc7-6f5a96d18b6mr6392249eaf.10.1791934193444; 
 Tue, 13 Oct 2026 16:29:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6dfbd6a92sm828514fac.9.2026.10.13.16.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 16:29:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 17:29:38 -0600
Message-ID: <20261013232940.2690456-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013232940.2690456-1-james.hilliard1@gmail.com>
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/9] package/python-platformdirs: add host
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
