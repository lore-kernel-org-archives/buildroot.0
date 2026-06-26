Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D2DC43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6729D411F2;
	Fri, 26 Jun 2026 14:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vI23qw7YBgb; Fri, 26 Jun 2026 14:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82512411F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485784;
	bh=qdgY9usnBJM7+mbCAY31yH7X+hs+xlOtZytC8i4fO4U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CnIfKewndurwFPkPmhDl7ufz56P65BbbzaM1ZvW4LD6c29FTxcJY+eMj3qh6Awu24
	 +If7s6eM3JB6Dhm6Mp6fE5fOP4ei4CXMKypluo5nYBfDU1hzjDiXJKyex7h+n5jvEv
	 LsRECS0gA9aR5kEVBMukPIwZeyx+MomJPksVS2IoP5txHA6ToxSq/sF+XpV8fFaKhq
	 GSnDTwPZ1J8d+hnIOv3XtVY8aXb3ydJMP+afeOjycPZDyj2y8QZQkgqZbCHhhdxqfH
	 /vmgiQ4LtBWDMWv4ZSbCo2SpS3nyYGRsTOvgKs10t87SQ7l4DE7dE6/ZwJVGJyqRyA
	 z8TmUirwRbxrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82512411F7;
	Fri, 26 Jun 2026 14:56:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A7793A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C589823FF
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISJkAP-97fwN for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6752E823C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6752E823C6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6752E823C6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4927014c0deso1563935e9.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485771; x=1783090571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JrUrlaXc3ZoInL0hQuDR+ABeOm9kelqzaSi7bmQ8pIo=;
 b=B9eWPR/sUJTVdAOPEcAZSdMjNupFX2Jq8JIBnXejeOw80HOTi6uc2oqCAalbcy+7lm
 mrhhNble2Sw70RJvFzhoJ/qAkiCJl2pKGCitKF3fHcphuM6CJ0R8uupFxWIoNDlqbhpQ
 cdltxVekqMd94SOH02dnZNT11MTLWpd1sAXoHtMBbEgnLL04NfWuszyIfBopoM+b0VEQ
 valLenOkMbx86fuHOQaSEW3etZ5WNBxjv0AK8fKB3Vo8jCUxnkrSNptN7w4BzlZwvL/D
 xB2B2uKpk5c4fQoMwd0RatZTSQ2WjJJ97Nc2qbTWNZvsuJvDcwGOIcaybeBrR5sufxYx
 t3Zg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Iob4XlIU6kJVD+ANF+1PMLE3CezPoNJQMpuBvYZStBFUo9gBGA9zwFiGHPMRDQjx6tATZ05g3vWE=@buildroot.org
X-Gm-Message-State: AOJu0YxYf3NwdF1rJNPsWoFpuqF0OAMXImudZhqWY9ni5BzIa5MFrrWO
 avRlVUSDaWLZofb3tMAb0POYnwdsryME62OhAYZpp4UzviV+Dk4Sye7ZcUrNYoloN4lR6zqPwra
 ZmmR8
X-Gm-Gg: AfdE7cmTVs9qQfIILw+r516MbuuTym/vpjW5opw5sk4FRjizwua06DWboNUgmx+XkXo
 jscDzvegNZ3qoyFhM20MhnvMvfJzGj2pLo90//5XqrIo5wor65gn0TKVaY2rw6u8qsHMxwTwD0M
 mcb7XIKXCcqil2IUOTOjpmGzPjMNVxNDjqNyzmit9YSS8rv945m2fVUrea87CcmStNqS9O/mjfx
 9aynRl7yy4ZKk0ulcd/MQqBZQ3VdyqjxUdIucuZ75RVOn0MhYV/VeE3kTqxjp2bH+bG0flYfcHf
 EzoqXONGVT83tNGY0lWBvcSu5oWS+krSird29O0jzRUP0K+w1WqNAarPVFw25ripIw5OEYnSt83
 kLH7Dm9iSuSHb52e997ZmbT4VNzSoLaOnnfGZApQWjBV2c7YkjsBwcb+Akfdb6qs8RXTrWUH/5b
 TXHpis
X-Received: by 2002:a05:600c:c4a5:b0:492:2e48:81e6 with SMTP id
 5b1f17b1804b1-4926684a6b7mr107374305e9.4.1782485771286; 
 Fri, 26 Jun 2026 07:56:11 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46e95f3d71fsm9173922f8f.12.2026.06.26.07.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:10 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:10 +0200
Message-ID: <20260626145610.344138-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-8-peter@korsgaard.com>
References: <20260618124835.2935850-8-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485771; x=1783090571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrUrlaXc3ZoInL0hQuDR+ABeOm9kelqzaSi7bmQ8pIo=;
 b=cKSMSSIXA8/dNHzxkgWfb/+X480Z7W2RNETle7+kVqa1lfNjHwTqOx0/AG3YTNNhVe
 y7V7Aq0LhKVLB1sBpnDHp5nZ8MgZpGwab5VLgtm5y/6sV08D0F8LLK9wx2AAzp2fFEcW
 CLji16PDFCubV5dYX5Vmft9KjGPOLJwTuFWioMhZDBxTnNIbzEthsrkH73g2VM6YT5q3
 IJOfIwo5L2I+5XofQ4YPP2Q88eBpJE245FAP4chehC/w3ItgOfJ81b4lJ/Y16pRM6+DG
 nj4i1NogRveFveC9Rs2PDNbGl2bIxPtOhAJQTrTj7iy2cOl5NbWo8/Imq7Q/NhQi0sSQ
 rSNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cKSMSSIX
Subject: Re: [Buildroot] [PATCH 08/29] support/testing: test_ddrescue.py:
 use assertRunNotOk()
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

In reply of:
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_ddrescue.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
> index bd34694737..e7e71fefda 100644
> --- a/support/testing/tests/package/test_ddrescue.py
> +++ b/support/testing/tests/package/test_ddrescue.py
> @@ -70,8 +70,7 @@ class TestDdrescue(infra.basetest.BRTest):
>  
>          # A normal 'dd' is expected to fail with I/O error
>          cmd = f"dd if={dm_dev} of=/dev/null bs=512"
> -        _, exit_code = self.emulator.run(cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(cmd)
>  
>          # Where a normal 'dd' fails, 'ddrescue' is expected to succeed
>          self.assertRunOk(f"ddrescue {dm_dev} {ddrescue_img}")
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
