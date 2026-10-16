Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51936CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E02040ACF;
	Fri, 16 Oct 2026 15:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26uqirw63t4F; Fri, 16 Oct 2026 15:03:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E4AE40ACD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163031;
	b=AsAeZrVcpfAQkc/caf4L3HTTcF90XsqMUkT/yUZwh4js92VDqsFXJQx2hD0hxxE52S6w
	 j7MDhRxhmIGWQ5wCHBNPZSi02rFIcmWVOzYAiB0BH25zKwKCGRkcfhCJgUaGTx0EWBkKo
	 xzuUOOcP9WdHvKwyN/61oXPXn0ww4O6lYfD3UeJMRJ6MUwEeLD9rk24QZN4Vu0eF0o5HG
	 2HbUeUE5t+fmLMT8rXjvVoGBAaeIR3EVm0WYeZ5i5JkbZBEvF68N3vEvjTt2L1s4C23lu
	 cnArCWUPMgIHv5RCpR/NLuz7cp2UwnlctZN629BiAr/pbndTp1gErf2WjyEVyH1+q6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163031;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=afg3uqQ1xj02QSeFbnHS+bD+UaGclnniKkHreJVvwc4=;
	b=Z3L7/qBKTXTywteALi46DR7Q77fEcTnhZxwuYAxRx4EVKIhPUzFbb8PmyrHygUCwqByd
	 iLey8SCP7GXPCZo5hJ39QKK/ukgXV1fkwGpaaUFUYnLuWV+lt0E/NdOmn04KBmW6ty3zT
	 KQwIip9T7vzz3dd6FPOtTBEMQfXmsXMwSO39DDrva8XNFkrMuHYMuRCc7JcEkbWohMezX
	 OWsa/HCfMBB64OF+i3JuTB3Zf6WC7EZmPRZucsiyyvm2SrVdq3jKr/3WAgOR81J7yAndW
	 31wJ4vQzQZEWUvIsuF+AbubkXQwpuqE3DyzmXWiTJ5ZUaZC6ua1Xm1XY+hcqeSpJD5g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163031;
	bh=afg3uqQ1xj02QSeFbnHS+bD+UaGclnniKkHreJVvwc4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EnhjwhPFXUnbT7VBroU8ypDDVg33LV0YUBfmRbqjgPjNWP03pf8oL/Ef/q+OKSelk
	 AarqgX6rLz54XwR7KKz+MM/LxVF1jVzWISQJIuq5VqwyJI60sG+ZvFYyv50nzdtL41
	 2/kk38odtjfQK3U6b2oz/zKH3zHyq6RfOZ+WboOutTCDUkRwVgOuFYiiSTyAj5cIKs
	 xL4H3pHHCvbu/iQN5RQ00jR7c8AXINJ7Fe2BZ/RX3GW6SdL8RLKV0LPAZngzKAdM2v
	 swgiiMQSpVvLg+Rlujpdi481BS2C846D85cZA1tXYDm/PSkzYFHFR1giP8hNwejVIT
	 9SZ1liJBCZ4Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E4AE40ACD;
	Fri, 16 Oct 2026 15:03:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1AA57AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B319240762
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Foh1NHq4X9aK for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C9E4F40645
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163029;
 b=ktGJlC/7cnHTPTd1/xApbNZGA1D0cQgNIZEUrb9sPSNfmY2CSiCyJ1aIy5/AqM+CLB28
 I4Lude0QLd4Yu4ik349Vo+7/V1nTyXOxQ3+DbUZFUEZzZcSFN4wIfptOfRDVZn30QfAtG
 K/5T7Ib5mTw9W+D+MWmvDdtU/ojZaXEQu3QaRlmwNMJqhAUQQBaAKziXuHJxv6VSjyzN6
 oGqSscBUxML+pO6XmkHNnEMqzLe1g8e6/bk5Cmr0Lk2u0/8VHnILhNm5K8iXE6QszYtmH
 5iSrakz9NMhLsVfqYSHfR8L1/OW00uULqdU/cK3BTjjS5pqkFLIsij2ps7mKsRkRJ7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163029;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=tVzndbM957HgMpcE8p5CIfHznmdT2wH+ffl5D1lB/xk=;
 b=hwgdLj1MIGZveY4/LLzj3hD83DZup/mohSpUPMZmjJIP/98hE1YlPnLJsC1xtIW9jWEy
 fIqiOcIu+31l+pUOO07XsLPSpLryltWBocF/I37u4V0AIT2oJ981Ytj/JIlNS8M4lP7wi
 ZucDUkPBvQzy8MGfZmgZsV/BysDxyNLnoQbG9gFIdDxI3ht6jtpeyTpWGENZZOG123BzN
 eRx/B9H07LlDgLBLvxAlSktu9leWeagWwHchCjiUTjOIdTIh0La7sLsAEnDO6SM4Lfc4h
 9djUuPW/OXKMfkhdfJ6X+7l7tgcVjDbFwhH6dvLSydZeGVKjntSCVKjoEkZZL0UHYAA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=J7CiRT83; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::531"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9E4F40645
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:48 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6b1afcd2d23so7705008a12.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163026; x=1792767826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tVzndbM957HgMpcE8p5CIfHznmdT2wH+ffl5D1lB/xk=;
 b=Su7mq0by6FjMG/hR8rQ/IMBpDGDGD6lgTIjpMiNY6J9It261tSDzEYi/Dc8lB3wlzZ
 vJwvKQIWAw3Mt9WuoA4uSSV7oPid7AZEMl4KGFahOYoVBGq2636QByai8+cD80WcLyZ8
 IHWYENWsE+D/keOiZ6UPk6AO9IE1YhMOIrm/JV5lJerhtZ8yjbnHLh7M2Arub6ANv14I
 zSjaAS+1yh8s37En5xKJxGjVrtOqYuNjQ9H9RRPDHZ+ZL5lcmRTIox4IaDHPvjZ58rSS
 7adEAeGSjLehhJmffVHJTWlmMt6EuGM7tJImHRrKT69k7VmFFW+Emaa3CKgRqom8IyeF
 grdA==
X-Gm-Message-State: AFq9FYIym0RjM6hwyaNIvM0IoR1fRoGIsfBOq1AUrHKtbn809rslTWJG
 FPpQXIy8x8VlARi0VFgyLotIobyk/cIm+ooU8UgYMS0tezpXPVQH4b/SuvbwK1eTBNGzFk3d/hl
 KZX8edIY=
X-Gm-Gg: AYBFou07awFx2AdSffiGqp7e2UKq7yAEBucyHdwySMiPiVi4iljlfBvGWbQ2cW4GUbT
 rmH6CrQJ7TzOsq+hhBzPVt6yFaAf8KSQBrSAPpRHuie+Pe8TFnsHPSK+DfHT911j2QxUpSYHu1l
 M0lnG5PPJCiLiugp0Qj4vSPFNQBQKjt8nI513MtjJdERFMjWHpUYlB/0/NBj4oYodgizL6TIClm
 qUINxdNSFjoS/1z3t095k99HuwlCoVpzGjTVMkoNEtRkiCa8GO7RoytEA0VJKGQKYJkYPRLGWkH
 Wp70Ty7pzK9JcdTQJjLIEMcvV1KBIyLk4lJUHtm02QIVRESXovzm2RI00+9ELJJ+Cmi4Wpc2f83
 SWO+M2mKgbNmuuTy8Lo1VvZow9ev0X+ytuLIeR0kONyzj4Ia38pLD10JDy+QsSb5uMA3RX2vn8g
 qfIdYZ8pKeg93DvHKgclMeY1xKS+WrPAIkoN0itMuDbko4O8eXEsQyCjxtUexJy10MBH+NYPlSA
 +OL8bC/7lqOese9JwPPwEjitrUWYdlacijxPOgevrxAqz06MNbR
X-Received: by 2002:a05:6402:c51a:10b0:6b1:a544:da5f with SMTP id
 4fb4d7f45d1cf-6b1a544deaamr10884513a12.27.1792163026634; 
 Fri, 16 Oct 2026 08:03:46 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd503862sm5617305f8f.46.2026.10.16.08.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:45 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:39 +0200
Message-ID: <20261016150342.66381-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922132648.3229462-2-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/iproute2: add optional
 dependency on libtirpc
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> iproute2's configure script probes for libtirpc through pkg-config and,
> when found, enables HAVE_RPC and links ss against it. libtirpc was never
> listed in IPROUTE2_DEPENDENCIES though, so whether the feature ends up
> enabled depended on whether libtirpc happened to be built before
> iproute2.
> 
> Add the missing optional dependency to make the build reproducible.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/iproute2/iproute2.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index fe7a6fc304..344a6fa8e4 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -25,6 +25,10 @@ ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  IPROUTE2_DEPENDENCIES += libselinux
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +IPROUTE2_DEPENDENCIES += libtirpc
> +endif
> +
>  ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
>  IPROUTE2_DEPENDENCIES += iptables
>  else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
