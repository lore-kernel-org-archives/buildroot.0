Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CE2CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C4A560FEF;
	Fri, 12 Jun 2026 11:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfWnvmWJhJSx; Fri, 12 Jun 2026 11:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A872612AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264290;
	bh=JLXpGxjTo/pm1Y/P3BMXL9DxOphFUNVeJCxBMcf3Yg8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ukp6v9cKbbmhQsVHkiEOhTQVsRK7S7H5+5Q2mgVHLfvz5dGvq1KeSX/HPAWGeL5G5
	 hlmvpS5PQBfQIUmhD8x9HKAVvaDpIJBwmjsdr32zpEf/Wu+uCg1XeJ80ztOEDbDY+8
	 Ddsdg851TmZ6bwM7VDx9S1gXLgfT9vzjlxeCWYFP9C3+qlwMpZdIFZPKdf3CRE14u7
	 rk+NLg/wdntjIrFFEJWqeTFRistSUSBxnbWmClYPweUW+XHbYmLM1tnBEOLE65jfeW
	 0WRlhlB01s9+XAY5JkYvZ2ILnpycxawOvKCfpVXuyWztr4AaKlv2MhEkQ82SWmZxYI
	 eTcgbNfARM9OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A872612AC;
	Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DEB5237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BEEB4066F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zN-cCWCSPQmW for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62ACD40664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62ACD40664
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62ACD40664
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490abf12f0fso4944375e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264280; x=1781869080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oro9gQYufe6RuX16CoYrmSAFydgsUReVJBLqn0hCfqE=;
 b=biln9AdJklmUzhNX15W0W/NQf/9uuagURThQ31i5KYX34q9hAeVIK1S2h2qsLEGt/h
 4Qo45zf/LpWFuwqYyrRBhU+76wf0UPVqDdDeBA3E3QIvUdRBeh/4iEf03hA+dMo4xirZ
 ngbGdbpz7sFEh+Qe28PDa6Pz3Vm121s3dLw0+iu/qbTi9qRd6a8AaFEOZVOEU+IMqJlu
 ZdrvzRV3mfDDeEl/GB7IMG9DPXefQ7sw4E28lrgyG6kf5FRwfo87C72nD90uye0mYUKj
 puGPUMObgvLyjYlN+4TQ9bMgrSbKabBIDioFBF56KX4kAyY3ciIcFkBlq72O2M5mc8FY
 NmkA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/qsVbMXuok53fCYSfbB7FLUu/ZNM2XNEnThBpUUxMtYNM3ZVPpWe9a2smHHAq5T6jzakoiYMdrDMs=@buildroot.org
X-Gm-Message-State: AOJu0Yw4CDTtiJDoLAEXwWCfE5pgiKVsh9cCyIv+Ljltnuy/Ug5RTvBw
 dLDIi61LCyCavV7PLnu+EeRSso3PrMb1Jz+xYIgKtk2QlEw1mf99WqADbFItsounlQr4OaC0hEE
 l46pm
X-Gm-Gg: Acq92OGEvDUFkG5uFOrirT0t669uw5aga5ubVpCGYYRIt4N1hjyN4kXB7qpmc6u+c/6
 k3a5vFOvAgQz0KU8lstHksQnN5ELx4kFlh2U/CyfacGFt1A4RYOeRGKsMsyMtpnKL5SlY7uvwLk
 SR6z7tztTwsk/SjYoJGLeFjEGUQ70MXMt4ohkBwfQZxyPe47oHtTMCguHOShVsmENtWtFqWtqh3
 QxvXlSJT3cG2mPCt5wOXiV+9M1lk/R1EmrTPhtAmFvPS6NkpsyZq7isMUwi2j4SLxCzqP65qFQf
 lOTr3UCJ61FMajjZWVFHDpQ6qYErX6QMT1RDknPVx9msSMxZs161V15BSi3eTM+/N9E+NF0OLnx
 Q8IFfPWlhACWiUF11y8ZcCf/YRCTpghYzh5K/lljUry/J08zVjcFkRKSxkXALHnZIlaOOYJZHY0
 SSFJlhLiUW0MaGnrjFKQGW4Azd5w==
X-Received: by 2002:a05:600c:3542:b0:490:b4a8:e031 with SMTP id
 5b1f17b1804b1-490ec480e65mr26557945e9.4.1781264280341; 
 Fri, 12 Jun 2026 04:38:00 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d09a85sm137553495e9.14.2026.06.12.04.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:00 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:59 +0200
Message-ID: <20260612113759.252639-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601181050.2022722-1-bernd@kuhls.net>
References: <20260601181050.2022722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264280; x=1781869080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oro9gQYufe6RuX16CoYrmSAFydgsUReVJBLqn0hCfqE=;
 b=EfTu0DvUxCqERUPuyysNw2qVxxxHYYK+WAKYAbKkUorZBr8nxJRgNaeGdnL47WVuhm
 65HUsoTwPDQTGk/5oI141cwzAU+tC/3zj86d1vxyBZpOFCEdBcH8yiOR8R+3vJ0AwIMn
 o3gcqrW4iPq2Rig6AOl4blXY667PBGbwOFOzyGGO+0UzJThmufhdoqQpmTVKtQUIhy/D
 ff6cLAAo0+qKbz28VbV6BGvwcsfa0Xa8UUPDfNoEJ45vIkv87dS7QxED/NI41EFTOKiU
 /5NKrw7pN2h0t7wu9tOH5DwC4MDnmn85SUGVj1/94f3VVM86wNYQLt8Fh4CnTGmxqTpG
 DpiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EfTu0DvU
Subject: Re: [Buildroot] [PATCH 1/1] utils/bump-stable-kernel-versions:
 update for split hash file
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
> Since Buildroot commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba,
> linux hash files are split between pre- and post-6.17.
> 
> With buildroot commit da01b7271a4a9048ae8e8ae18753edc5da785a44 the
> script was updated for the new situation but still needs to update the
> version-numbered links to the directories with the correct hash files.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2568080242
> 
>  utils/bump-stable-kernel-versions | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
> index 6303bf4010..0e76cd1168 100755
> --- a/utils/bump-stable-kernel-versions
> +++ b/utils/bump-stable-kernel-versions
> @@ -78,6 +78,10 @@ update_linux_hash() {
>                  echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
>                  sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
>                      package/linux-headers/Config.in.host linux/Config.in
> +                git mv package/linux-headers/"${old_version}" package/linux-headers/"${new_version}"
> +                if [ -d linux/"${old_version}" ]; then
> +                    git mv linux/"${old_version}" linux/"${new_version}"
> +                fi
>  
>                  updated_releases_list="${updated_releases_list} ${release_version}.x"
>                  updated_versions="${updated_versions}\n - ${old_version} -> ${new_version}"
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
