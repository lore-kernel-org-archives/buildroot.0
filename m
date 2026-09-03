Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2626C624D7
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 20:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83B0B60B6E;
	Thu,  3 Sep 2026 20:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdKK9rok1R3X; Thu,  3 Sep 2026 20:25:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2647960886
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788467142;
	b=NF5KJbBwXyly4+0EKkSYaey4WeZG3VbY5itx4ie5JOwM4ePt9s2rGCUxKBu0EnPBSB3R
	 7ArP2TLX/vQABNrRwLROO9Zajrv9mzcosqD3zEuF76CI1W6sYHOR0G5tzgFZckZqegj3w
	 c54apH+k6mELHH8cPmgCXTC3k+g9MmEjzPAuZQnP0ZHdbaxZAsO/QySVpTjhakae8WcUJ
	 /n9SI8MeHTprT4wKII2sK1xItYrJWPsAUwvY9Zn3cgLK4tDuYszhltHybyBPyL6qITmen
	 yQApjkUuAffcRuUkMAKS3LsXDCCDz1UQeU68GJnpbxY0GjfOsYILjQOiXknSwT5VISA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788467142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=r34lLAr87BKqD5dWb3uYUN1p3SjgtLgYKlLV32sIKVY=;
	b=fX/pSs2ejAae709iguWxJfv/bDhLrqR2okiu4Z8Rf5GkMi4xeU7+8W7TnDQotKnm0iYG
	 JySIPqtVjUtR8707ebjQQ8vdE36uxWzsInT/e0S1RoHjzgPTdupOGKe7wRu282V11KL4Z
	 ywcHZTPEOPgPeqdmkXU3uDq7COtyPQrjiG3ekmM4j++iZdz6PBUluiKjZ7R0ocOFLk+a8
	 Oe1mZMyiJmr9AerbuUQpU6vKYymudfSqICwbCgWL0utUQzne5eeJjkNGO1U+oDkau2+eo
	 59KWjKbsib+JQjYP3hl8YOSEhMesIp9AA79J0t2sam2M/JvDCjhs7lMbGZOP5yZJajg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fsFGbUS3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788467142;
	bh=r34lLAr87BKqD5dWb3uYUN1p3SjgtLgYKlLV32sIKVY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OKVAWq4+953qnc7ZzU+x9Hj1fDBQbfykWxtw3gr80E7Sl/DZ+vb4ESOPfKjkCD1+d
	 nyq9PWAabSx3fKIpTW9YMiI1IRbeBCrUvCqEmH5wIpUl1q/IiMx9NVqyDDLjk/8f2E
	 JzdVMB+hb0XUao4wlWlEgZE2x29AbSiW+a1k/aIjMaLz6dqqXAHhCTUySu+Rz3Zx+M
	 i3yAIPVLpLQAQEQHbGS0lDO3HpfMW+lDs/moUuePYoKBmPLatctUBSuQPp53uO1FuU
	 2md+9PGv5YML+cMd714tkFntWQHLszfo3OPffWo45dQrRTPboqwan9+swFRZRe0S0/
	 IQoMJWlBQbWzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2647960886;
	Thu,  3 Sep 2026 20:25:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8DB02FC
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 20:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA9CC607F5
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 20:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baERLjkkSCfz for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 20:25:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BDB9E60886
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788467140;
 b=qcJD6ohw5wno1ZAHX441AYELsJVJQWIa0jOKDbuxUGWpLoDZyR+LV93HwN+Bv9Woxll2
 uPZ+/PHMhsGLhx+lnf0yF03HKI41Fj75tUii0Dpo10FgcrZnUUOi55sHvwbrTRdYjdIsC
 RlfAo43rGgunGhqT2YhrsFCQnEmWEmJBpGW0mE8zZJjaDc2m+J9IR3HQO1ioYbdXEQuw2
 NjWzNOX3XNR/u/RkDMVaI9x4Y872lLNBMTvv6MZ7ul/VOzxneGsLVUmQAFh3cf55n3CA6
 zQMq70WAvfGjFXh/t5gsev3G6Gh2wnXJr0sU0e4vM69Ciqq7Xs0KH8ikYhRsmYTLtWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788467140;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 bh=8pWPmt0Yd4JIQujCCV/q4ETez7xo/6XU3QI0HoyqzIQ=;
 b=UtNR8bvptgOp5cU8QJ3QWVFAciCr44DvnR3SE3cYEeyG0z+/12OqyUjWZ9pe8JbOq7Wt
 NfXi8TAiIR/hoomdvQvI7TL7hmG6Nw6UXRSKVwt7RlwPCAtsdHm0lp8blQxGEm9Dl0qvB
 d7VHeFsPb9t3vgb6CintF6KKYPQLQcncuRP37H/H6P1SIxjTRBC3cj/+t8wB/LVMwO22N
 n5X5iN6s3/9/LFJnlrzWRS0vX2mnjJMn0Xlgx/iVgISGUgxqTmp2wSy2JtmQo5nrakrWh
 ddR/ytL1D5tvyU6M9ne+okXqwuhN3mIkMaYBV/CthsIv3xHdT2vU8CiL4yF2EEtKTAg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fsFGbUS3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fsFGbUS3
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDB9E60886
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 20:25:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-485852d03a4so342864f8f.0
 for <buildroot@buildroot.org>; Thu, 03 Sep 2026 13:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788467137; x=1789071937; darn=buildroot.org;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8pWPmt0Yd4JIQujCCV/q4ETez7xo/6XU3QI0HoyqzIQ=;
 b=fsFGbUS3h6MyEwP5ify9WwzXHLPLBwwsytvBP6IQhpfHKscE+8xiUvIIVo2dCW4tVH
 300HU2McZxzGs7dTycaLTZiX8+C6KD2J7HvYANJ4G8E8dHerAXAOpu9kJN3/DQJwmkyD
 5KV/lkvmebkb0QP+J7oy2hiRaA6yekX90UDeX+AGjD2I0O0QwXFw0JS46l2YXanjvQ5o
 uPwowXQTxA9gZ2xTayqVA/aD0qVmIjSgFA0x6xtF1lYsz2IsaILlwN6qmQIlHGqNJOBg
 vKDzOtatPvL3bbZRRLUM4BKoYMtHogsiEJAOFOIanUk//4bi2agQw7drby2TGF9ezPsS
 2LrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788467137; x=1789071937;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8pWPmt0Yd4JIQujCCV/q4ETez7xo/6XU3QI0HoyqzIQ=;
 b=FozUJgfBROiqgKVfktUdCs/P2xBYOt+XmyildKAKv2MFyvEvOA7DEKj9KVfVGaEoyM
 mCFSK1knv6cWLTdtudjtDNbUf3hcLCL5kEaZy++wod7JO/WbNzezMPuiIUBnGs3OWa2L
 gPgAIjwq0lvuEENgQNJm+XZQvitNVwKJj8DW/PHhausHMjfFRfXqgIqUwISYRLc6C2IU
 1PIxZzdd4z2zeEyd8i2RCapQSG5cWQ5JP4+2FpJFvFQuSW8mzJs9pHvVV27dPwOd7Rv+
 dWzRAXtgmsQzjhiTBoebp0Vool2W/60nv3IrZFjxI7ahPpnoxVgcqFTK7t0z6ohElHkb
 LLZw==
X-Gm-Message-State: AFuF++l1rFi5icotkLArhh8mmjns3W5T8eB+MPTbc6Cgc1Qx66x3lDU5
 UhZiCLh4n3tQ24DzW3ITACYWsdaH9YQJTtyl6bzRFTWWXLLiEspYxSQ3
X-Gm-Gg: AYBFou3ifqLJkuQOa50FwYxcvQsm8PYR6zDYBdyy9aZ1VsrbUuuuZu9lsd9HYGSqGzG
 i14vZhXxgtcIb2Dnzo44PXW+Dhw+AoxSK6xqBEAx3c+nTGeCZz09T0Lv12RVUIWsuhUJCLfOPlY
 Bh+AtZ6+/A+AQLflfNkSfXhsbHBWVZE9iJlQUclqLSm1Qg1RkP90HPd6K/1aHNVy4H7+pX88ha4
 7VClanavqnNHO07G7Ffrce1v2OPX9TJsxIXm8daTsFn5mzwx2vyOUfiJ+9cdKCL8hrvfkC7sVYf
 S2J+YCFBJaf371Pe9KH7hAoj+ozfJk+T8H4JTZjg+Phn+tVI3YYeG51wEIrYS7zV3ib1MVZ/O+7
 n0tk+R8mNWIqyXhMVJhBpvwtKFn5sttiHc4Qct8wxIoYXu67tsAjbTiMyBLn4fwPGugnW03Vohb
 JlgTiXLrBXfUZEAfsoibfTx0jPeuqEyHN+0LztVc/X/QJhpDGtPvXSddjbvGWquPI=
X-Received: by 2002:a05:600d:650c:20b0:499:8ff5:8ecc with SMTP id
 5b1f17b1804b1-49cf828609dmr6495605e9.15.1788467137115; 
 Thu, 03 Sep 2026 13:25:37 -0700 (PDT)
Received: from localhost ([37.163.41.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7739b7asm9980295e9.13.2026.09.03.13.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 13:25:31 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 03 Sep 2026 22:25:29 +0200
Message-ID: <jMaB_VW5TgyVepuj6erwgg@gmail.com>
In-Reply-To: <apNbdgIRuxlTeWB3@windsurf>
References: <20260816195616.279864-1-mattianarducci1@gmail.com>
 <apNbdgIRuxlTeWB3@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] package/gensio: bump version to 3.0.4
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

On Sunday, 30 August 2026 00:24:20 CEST Thomas Petazzoni wrote:
> Thanks a lot for your patch series, which I have applied to next. I
> had to fix two things:
> 
> 1. In both package/gensio/Config.in and package/ser2net/Config, add a
>    Config.in comment about the dynamic library dependency
> 
> 2. In PATCH 1/4, propagate the !BR2_STATIC_LIBS dependency to
>    ser2net. You had done so in PATCH 4/4, but logically speaking, it
>    belongs to PATCH 1/4, otherwise if we partially apply the series,
>    or bisect through the commits, the situation between PATCH 1/4 and
>    4/4 would be brokien

Thank you Thomas! I should have considered that.

Best regards,
Mattia


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
