Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE344C982D2
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 08:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCD7260C18;
	Fri, 18 Sep 2026 08:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2PK8DUvEl46; Fri, 18 Sep 2026 08:32:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6CAFD60BF7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789720362;
	b=pFmqHnBtSfU6DgjLXWFux6/m2HMf+SlO5Vi6QgGdGaHgkpq00ONVCUeTLjOZnJ3YBjiO
	 /tUu5dzKRksGQK8SaQMYrptp49/WT7bOjzKAkYssGm8ztMpl5Rnum8vLkMRQsbvQAbxwz
	 nCKoyy2DaZfQsQEhYNpmunPUekJIMisEe+lzy+qqbRBoYgJRnCUjGwTfUQD2X5RMVBkc2
	 q5j0JitKYa48jOyEJGf05yFX4Nu+PcauDFvG5RGT2FXon7T63LjvlYLJIZf6UrPzW+Rwc
	 7a8dbWUV+kIzZSBqp/gN6jMYQGe6J1TRjvKSZg6iU/fr3TaIfmMJ0ulHGkCjfXPLvlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789720362;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BDDI4KD5qlTzGXl0ekdGYczKFeOA1G5S1gE+ov/irrU=;
	b=MnEtYAgxuVS9tv6QmhpZG9jKDBu4S0revwCSlBjsCVrPuPTYUeky3T1BsGS+IGwBlTDV
	 aSqucgAtvd8YdgPxg/PLUSxueGp9lQyHmMyG+6+3b/LA/D5VTO7IgTBaeEk2GwfNvqwWY
	 pxh1PfXvwhte6rWxhVc+oxqQLBbnDvos0Zc3H4e18ILk6tUtfTvqZdhUJFZfjZ+yWtOM8
	 u0vMDGjiRllxWfcm071uIVQL6evYc+aBHMd7mDc5inwTSswVmKMPwjB0OjZCbtk3cRxe6
	 97PB3s1u3OM4Bx/d2W2NcBbuGZnXRIWQQHeqP6nSa2tchZpE0SIw5ilMiQioKvHw43A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789720362;
	bh=BDDI4KD5qlTzGXl0ekdGYczKFeOA1G5S1gE+ov/irrU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mVTbwjJEB1an5AunFr3yB/2Qgp9a7JbVC/T8VadXk8PBnxsmSc1Bf3SkGt8MqucBQ
	 Hc0uq6JXDwTtvNHBH2wghXHzSM6V9e8NgiX8+s/3du9omC8IjlHTj+7U/ZrvIVo/sl
	 LaZZOMN7ThZCuxpnLJPquAQhY4d+RghBE/LZwllcscobDMNm8FkXiz4e00wxu5t/z7
	 7QrbTemNIXgbGvAqaBcHCEdX3hpcXxoP6EYc5074u8oZBDePwYawU6ETGRIMAJ++8W
	 ycBk9VZ9hbckwe+HsSRYUCn1+rTvoShN5g5cyAKWqFR4eNYWk8Raxfj5X1Lu7OmwZl
	 1auyTChdVsK3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CAFD60BF7;
	Fri, 18 Sep 2026 08:32:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28724352
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A34140855
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sh8VCxs9G-yM for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 08:32:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7063D407B8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789720356;
 b=hLTPOuJ74x9M0420u8Xc27bOGV8NcLXBw05neYlXUGzfSSjdaCEq9mODzT/6m2Tpkdwt
 WynTEQVV8AZ1A0s3mDoUc5BnwjcKKLlqFAeY4EzT+Ehpy+lIsNB/2gHt09RHILXtBaIUW
 FsIJdDC9I29qVcpu4gfyCP1cE3zvnxYWpEIH4PjpuqB2GYtA++k8k8AaoxiR27Fl+uCHW
 tJJg+HI9HB6sy1e8X6BSonat1f/D9ekkzhbTFJG8Lmkqu08Ki+IppQeRyegHF5FsGL9HE
 NFjr0FWpRPAsFCZXVQVJuXAZvjbKuysqkaxr13HbtLrGLumkT4Zv4fLFiRTdSS2tJww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789720356;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=kS29nCV54plwy2iq0D8BcY6lNCT5jt5isGdrJHS4zLk=;
 b=oeL8iZtRMQyG6xwYFSSOv+Z+qAMSvYb2EqV+Xh881B8OkQ1xRwOr+paLswijF8OLc0zT
 xFq1vXB0ZyX8mVrRMWBjimIFZWHVGbCkDr0t61UFF6Kh/S+/DgaliKWCYYg7Kg+iBcazQ
 xKWRMcPTOyZyMp4u+B07dPegds2Bl4LNoftA9GZLpi6kMUYegBeyIXK3r3afiM9DSZbgm
 IVWDCwAJ3LWb0g/5VUWWNwX9FtnKoRyafBmIcrYq0X3azWvtxULduGIoWQmd42FZ7MyAl
 G2lc5a5EknJrxUeKJVswIknf74B55JJGN0b4fVaf60KjTlthnhwmpzySTFC00FJlRtA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FTt2kNMI; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7063D407B8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:32:33 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-48437356d60so200076f8f.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 01:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789720352; x=1790325152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kS29nCV54plwy2iq0D8BcY6lNCT5jt5isGdrJHS4zLk=;
 b=m9qFJ+4IIAPZcAe7Uin/46ruEPKtbbQztlzs2O3vygmC6qa4GT2Z58KvtM/q6ALZry
 IYxr4GGz4f9v5riNR5jOc9f34xwb1+j2i+J9zYbx/WXmgIbGDWhqykiYAyy1yXVvQ3PK
 cZ19njp8GKwUd94yATWOTU08GJ9LZPg7R7133zKqiITpA55NDQN2qH7iFPKVLCJV8Ccs
 pfeQLWM+YOysosSLzZISKqKs5e6v5Cz83Sv9kKHKTbURz0dGrLlqQk93aCzlElM1IFfH
 Icje++Z17Rr0lm9Sr0OJSsjtlkY+fpxa7wV+BF91xsuP64f3+nFQeH9aL7zFccH5hIB+
 HrKQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw45+hvukHnlorZmBDk042DE2K6UEcNh+4SPglWmj6Wi5A+xgGE9Zu8wXLCmd+rhJrEKWsikqLDnBY=@buildroot.org
X-Gm-Message-State: AFuF++mR8NKvhzGeF6w3c/uUy6zHAuU/BwBOMKJKeYi5m1fUg8zkUkXn
 hXy/zqF5OFn8vlT4YCF/KQEpUTh5Hwz+j/fqxMa7ilw6rUdfH8wrmOrpJLBJRws0+3g=
X-Gm-Gg: AYBFou2lu2+rcyzCCm/rl7oRk1mtRh4c9VAisrYbD8GkaI/n4DRMqIzvSi4urJOLP9x
 7JYGnZwvxOTGSsOyQChqt1rFVv2Z3Bkc6N+oDLZUFCVBtCMHMF9dNh7L8rV9TPHpM36gocAoevQ
 FEFsPqwwSrl4uNclo197cX00Q2FKourI1/Om9+JZ47i1jtSHEUcV6NF9Eg6yyA3fX4m7Xci4FVB
 GbhaO6Z2X/JySKVCK0ZQzz5sE5+qTyCCQ2O84zSU3rKAVDNf14++cR0cw6J7THIpKw9iiClm2/d
 jalgVfi+f4ryQ8O7VrNJEmsguZ+Rb3V8lqTBXMdHOyLKt/FDlTHyFWB/LeZTiJ0D53YBw27UvBk
 voSemoaJEF1WH2v+xIEoSCoxIihuGBTCEK+Zb2T7tMiiukecgPGIox5HyoZmNxbrMb3ZlcRXY3i
 vG5TJE2yeLl6hBd3Hmf/KdHlXw6lZR2U81ex7rC8WjBRiBI++chsEsf5ybESF0noi9
X-Received: by 2002:a5d:5d02:0:b0:485:8ee5:5ffa with SMTP id
 ffacd0b85a97d-4871e36b1c7mr2323644f8f.38.1789720351685; 
 Fri, 18 Sep 2026 01:32:31 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4871ff3a928sm2563938f8f.13.2026.09.18.01.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 01:32:31 -0700 (PDT)
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 10:32:30 +0200
Message-ID: <20260918083230.33707-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918073631.665322-1-heiko.thiery@gmail.com>
References: <20260918073631.665322-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: add uuid as
 serialNumber
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Heiko,

Thanks for the submission !

In reply of:
> In CycloneDX the serialNumber field is an optional top-level field that
> uniquely identified a SBOM using a URN RFC 4122 UUID format.
> 

Initially I didn't include this field for reproducibility concerns: generating
an SBOM from the same configuration wouldn't generate the same output.

Of course this is exactly the goal of this field from the spec point of view
but I was concerned this could be an issue for Buildroot. So I didn't include
this field and thought it could be set by the end user if needed like other
fields such as:

- version
- metadata
- ...

One of the idea I thought about to solve this would be for user to be able to
define a template the `generate-cyclonedx` would take as basis for the
generation.

```json
{
  "serialNumber": "{uuid.uuid4().urn}",
  "metadata": {
    "timestamp": "{datetime.now}"
    "authors": {
      "name": "..."
    }
  }
}
```

But i don't know if it feasible or nice to deal with from a user point of view.

Is there a tool you are using that enforce setting this field ?

Also in the commit message I would include the link to the spec:

https://cyclonedx.org/docs/1.6/json/#serialNumber

PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
