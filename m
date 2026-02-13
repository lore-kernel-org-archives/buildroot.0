Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A42DEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE96C41E52;
	Fri, 13 Feb 2026 19:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL20sYLokHrQ; Fri, 13 Feb 2026 19:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1667241F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011457;
	bh=Cn+tEUdKcm/7uz7B60SQwNlxeEirezOSVdMhnjQqP/w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TS1WgWBpXX9Ti22RVquYBrnB7vkMd8bJrMvxCxsunR6LDjWnJtNpA9cbxIubyp+E4
	 ThJcqb8VYUH+A1R93w9s6Wyzlq7GFMHpeQt4mV2B7Oya+cnok0FplercgvFM/WV7ZZ
	 bE3a0i+dtJhA+gaLkPPt9RxtlylBnBqH0flzVrSqI01lzECNxn+Co5Oj0DT1RkPLr5
	 HcGNhWM7sWKJ2tE4UK72X76w2ZjDnm2ztnVUi9FGw72zti2tNfx5wM7nN9ZwrNKxrL
	 jbRT//Og2U6X7ZC5JFdE4PB436rm2hWCeNfCUGyv2UCV91NFXFELsI2Jh8MuSy6hRw
	 AESgkqqRk8CtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1667241F7C;
	Fri, 13 Feb 2026 19:37:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B453EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A25561598
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZY4q_FkVtVex for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F5F56151D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F5F56151D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F5F56151D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48069a48629so11739115e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011414; x=1771616214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qZnQOE4Z4WIpeNeYnA75Ej/ZYAGKxIocaZTsZ9UDLPw=;
 b=eiwx1MgmS1tUKbiSmzyY4E1w1ZXdaDJ6FZIpOgf9jZu/g7laoiOcZBJX5PpvHdSUBi
 +faGQ9z2yLGUcyXxqwmNuvOKIS8bYcIjLcULewHOJXh0D/o1ZqnbaPDrtF7MSn9oZRh9
 xJcPiS3CKxF6g4QoehdMZYkKnJkM9s+ZCD/6dS3a3vok5t26oeKskFcW0ylbJMBOMjc2
 AHfCT6tkvBcJuVVSofMST4LrUyxd1BKKI9siD4SJxDPQuBhK4srHzYfTRpgvjBvnxCK+
 vWBCQf5weZPAnpspB9HdOzsfSqvAe2SHvy8fKm8KO2jEvvgoTY7yKc/U0eCUmy0y3aFL
 Whyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPcrH98xbavms//4mMJiJcN5zHhJBnkUcnhZ48yz7OwyuB3wR+8XuuiHSJ8AEEDH2PAHZdrbZEiAs=@buildroot.org
X-Gm-Message-State: AOJu0YwJEiJP42y3q9qSWrPJgAx6+dhKPI63RLS7d99xk7Tq4lJQpUQ9
 CVtj9vUFEzrnstakhWisI9q+yOD87xHe3NI6/UsCIgjr87wpNO3bk1SFzsmneJk7IKf5oMqSFc7
 wUdua
X-Gm-Gg: AZuq6aJ2Co8YtC6hx8C8D6C+r2BI8vgdqDRCds3rYEa9auI261K1XU+c0i+OTg1LMgi
 lBzEmKzeaDhidtpBFzBiK0TzCVhmNjOEQE3pf8mJWgcCyCfpWni9DoqZ3UR8/O//p8FGHWV5kLp
 sY4mqxOrlBj1gmM/4ZvSXS5+2++B5RdN1Z/YT35b462aZVvIpiwvsUQkwAAuRzFCCYV/o20LabL
 p7O/AS8LYH/8Bsf+4vonpdDDoVNTmhp18IWtltXEfsM4P1NQIh1UmSs7DwaCIoK0jVxiTtb+HPW
 +mf6VATLIBDHeH41DzWLeoF0cBXNT11eJhqsyg5jO6M+fk45n4m9LjwRiFbsoNT0jcnIUsTIewl
 1n5fNoGCjM80ojhBVARk2x6vJDaIUS1ysYNDcihy268Y3Tb37D+Wb6DtqA4jZaoybSvzkpffISh
 RJHCc8WmhsRsmSZuo=
X-Received: by 2002:a05:600c:3f0c:b0:47d:5e02:14e5 with SMTP id
 5b1f17b1804b1-483739ffa1emr49145915e9.5.1771011414628; 
 Fri, 13 Feb 2026 11:36:54 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836cd7af87sm119202955e9.1.2026.02.13.11.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:54 -0800 (PST)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:53 +0100
Message-ID: <20260213193653.38503-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203141357.790411-1-ju.o@free.fr>
References: <20260203141357.790411-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011414; x=1771616214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZnQOE4Z4WIpeNeYnA75Ej/ZYAGKxIocaZTsZ9UDLPw=;
 b=Z76E3sGialNqgqv2oo0MArxjYHdOVNgn/HzRkYlGsK5SCnkJ/PzftO28EHz/i9X8RV
 JSqZ6ywKJ6XbycZzfOqXBNbm7PKdV7GBb8BMzYcDbhn5gN1RmGL7ymqQ8X9j/uyNcyiH
 PlOJ8fcZ7mSE8IA0Mp4x1vy7co+Z+ljSYcDcsqmmf6fD41J/ETuL2Mp0j/H7ZuqABrpb
 c0dybv+/nn31Ysacvzx+sTw4BcQrwDa/mxQYpZJ5mgnKDBDXjae2SED+IpKdVgnY0Nd1
 Ijsxr5w6qDpU0ZfTIalU7gLaqc/cHQC/lHw2evce9v/sLSDRv4ZyKZLsbmX+9U6rHd5k
 5gDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z76E3sGi
Subject: Re: [Buildroot] [PATCH 1/1] package/efl: fix check-package error
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
> Commit [1] added the "Upstream:" package patch tag, but forgot to
> remove the corresponding .checkpackageignore entry.
> 
> This commit fixes that.
> 
> Fixes:
> 
>     package/efl/0001-ecore_fb-fix-build-with-tslib.patch:0: lib_patch.Upstream was expected to fail, did you fix the file and forget to update .checkpackageignore?
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/bac34296bfed5282df07496c845d74924beb5da6
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.11.x. Thanks

> ---
>  .checkpackageignore | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0bf57b8ac2..16a0d5b511 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -326,7 +326,6 @@ package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patc
>  package/ecryptfs-utils/0001-musl.patch lib_patch.Upstream
>  package/ecryptfs-utils/0002-openssl110.patch lib_patch.Upstream
>  package/ecryptfs-utils/0003-fix-parallel-build-issue.patch lib_patch.Upstream
> -package/efl/0001-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
>  package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
>  package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
>  package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
