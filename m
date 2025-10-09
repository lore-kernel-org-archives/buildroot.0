Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953DACCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A7E611F5;
	Thu,  9 Oct 2025 14:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WE9G_Qy_KCyp; Thu,  9 Oct 2025 14:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94863612D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94863612D6;
	Thu,  9 Oct 2025 14:54:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8464A21B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7241741068
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8OM2D2Ar0AO for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73D0541060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73D0541060
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73D0541060
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso8752595e9.1
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021680; x=1760626480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=my6JwFgI/n+s6tWYq7cD/qloi6R5XdQiguJoF43kCnI=;
 b=k+4oBPsxlVQLE0EXmctUUCfux8Z6rc3xad+QZMLcB85VCTgh3y3pC1eD+6dq1TYREG
 19/5HKllrjnHsYIo6nWwQP9pUfWZNVz7v9FFPKecttJg0AvZvm5o4rzBTueKtlf3AJZz
 SunT/2S+SIK+eUaV3hzX0opFAKcLWBp8Y8Irp/6z5ourPmwSEQRKgW199muOV3EM+uZI
 eyhU+l5tbW4LBFvnSLd9HkI9P42+n0sUEeJS3kZKX2J4GS/CT0lrK3gGqNuKUvEQ7tww
 3s3G8C2EfyoTAWE7LyPNc1DVeT2VoIc9FQ6CRb5VXhfit/nq7uo2GTvI+/FEyxHfw4mS
 MJ7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxM79NRABxWlgiOqS5KkrEYSRq05IxLmJYZ1ozXs+ymEQLIShSQKYAo+mP+fWkYAwOtqWHP8NOA1w=@buildroot.org
X-Gm-Message-State: AOJu0YzENqralxGSyqK46d4RHfv0BjN2ZTpSR21zlOhmo2nIyWD4WBe0
 eqzWASfggOb4W5EU8pRPU/UL3adeRW2YajUC1RYHlOGrC8Vds9dZtrrSNFUZk6GZsds=
X-Gm-Gg: ASbGncsceGR8KOJv5M45yI/j6Ho954+/rLpxLJzJGREh0jrFSCyGsj5GFnvQ079wPSI
 8Z/GT6Hdzf9BRmLi395GK+vGMtMZiyeNnAELt9FDHS6/5M1rGbxwd0p+mO+WGEU9hEHIt4g23wI
 Hxrv3hz84CugVM2EocGE1BZUjIipXTOJay0goQ9kcTADKzDfJAF2MC8c04R+FgENmOk23y67PfL
 4A6ZkE3xz1amcN/wDOEITpjrN/NgQKwRUcXBXztkMwXNhLqPpJZBclwV3wXJVUnkK0H6d/wbahW
 BRbzj+Xgh8n4wJlKvpsyUKBLrNqXGY8GmFGAzOYqAB9jP6na4BZDrEybM+byYuWRTYSnetm1HVN
 IV12P/CM3kH+hyW1KbMcjO6E4YpnmELeQUi0zORUA
X-Google-Smtp-Source: AGHT+IGUvm4mXBtV0NtDwhJqVg6Vc+ygej+ZoIF2XC8/UsTH3NwhgsO5Rpnupj5lCmYXrWDyGp009A==
X-Received: by 2002:a05:600c:3483:b0:46e:1b89:77e5 with SMTP id
 5b1f17b1804b1-46fa9a996cbmr54615115e9.12.1760021680371; 
 Thu, 09 Oct 2025 07:54:40 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb32a84edsm11145545e9.4.2025.10.09.07.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:40 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:39 +0200
Message-ID: <20251009145439.482124-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929124955.1295473-2-dario.binacchi@amarulasolutions.com>
References: <20250929124955.1295473-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021680; x=1760626480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=my6JwFgI/n+s6tWYq7cD/qloi6R5XdQiguJoF43kCnI=;
 b=LlsdI+3ga2iDgYV4jy6SyXeMGzhB5Pl1wVTC/Pgy9f2Tgq9L1u1SFVB6dHWxFvir+H
 KDndKWs7oRrsTGCHyBXs0HybT4b4dfq6zNXHSiWgGRvk+XL5mO8OkY4ZUN8fMRhMcIF3
 /1kBCkNhL0qsKFpAKgGC143IqMYjuJZVUBsCQ940CCYUQly2/1a3M28MHKRy8EsLKdev
 X5EjHsmg6UStWw43tA2UUb9TXWTQLYHPyfo0AxaAH2GF/Lz7aC21iIcUpaG1KV+HRv3a
 R02Bzg6agRZVR+bnrVNM5tW5dNe/mJvCWtfOUTvXqS3CtO/bLSRIfrNIP4yvRhxpKq6l
 iJ/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LlsdI+3g
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for empty
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
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 71a9b1a15749..d3fdbb49a0e5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -805,6 +805,7 @@ F:	package/babeld/
>  F:	package/bc/
>  F:	package/cmocka/
>  F:	package/connman/
> +F:	package/empty/
>  F:	package/iana-assignments/
>  F:	package/inih/
>  F:	package/pocketpy/
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
