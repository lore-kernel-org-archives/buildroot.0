Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088CBC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8BF660BEC;
	Fri,  4 Sep 2026 12:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkh9yyf8m8ne; Fri,  4 Sep 2026 12:17:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6645260D80
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524269;
	b=VKe6hA33EtQodOeRpeFPV7l/yWUoryaz88cmwoPYnqE7AFq66ofcT3WbLT9xLcfXcjFA
	 JpjkG7nNsKm+MmYIXPNufF7IHOmBzC2lbgU/TbXjCxZO0TZscXUCcrvXgIHxzJpqN/niF
	 axAzI0tJNrvOw82ce/DDw538TQbKZz9zfz+JM1nq98YK4wxBha/50kC9mL7RRJUD/sKZr
	 ckeySgs3VBzCuuMThZBepAYZ9pz73ogKYcNwtcB/PUUoGO13PNtr+Cr5TLKlV+E7gcYLv
	 TJv4uQcaq6XzMOEJq1l4H3cUWN6/j3Ci5JI4oHl2Q0bmd9i5/sgwH45whD16zceinHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1NkyqUSLe95zvY35/1QkT/5xw7JEb50Jq9749UxF1CY=;
	b=UUmICeR7/VcvW9ds3FUFXAxiGePNJWaYKAUrWq7/GssqBi2fQj245cbfYDjRaPicnbY6
	 xm0tkHuWG8K+1tFwRJJXfdl5tBmHe9Zsac8AJEEI8zdhZa2N8xLfvwIWgH5HdkX9bw2KL
	 mE15m7nQy1SHKMzN/+gjHoon+em1xH16lqTf+Ixajt0NuYVNrB+xcaLndT2/oCc1TQadO
	 V/1JEyBuOzUzAJk1XiwP0EzUFmz+d18l2N9CLmFJ5Ww0ky4BXnxjcw99JMMkH5PnF3w1I
	 t8u+4voAgteqEvHx2g0Fx+Q2VrVszg6SJu2wohQZIZdOs/L4/ojqv40w1IyNYlfBLug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524269;
	bh=1NkyqUSLe95zvY35/1QkT/5xw7JEb50Jq9749UxF1CY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e1GqFOtSRBqz1aQZ8UyzZFPTIyfhHrIE8ylvi93FWduudM1LtJ3v8AMwOtH4wJoFl
	 0cETUoDPxSMZd+U0AUBvin97Ei4YUvKLtpm+qBBCpBoRGZ750TzVNE82/aQlZzUzoe
	 7opUnW0O7aFUrdUKTd3JCAAOYOkmc0Lb0mmZoyFOWijaz+9dDP1RD2M9cRVpnJZrVt
	 FVCVmsC6MaC9MGkIPgM+1hIpk9ABCF94wKdlRqQ75xP9dL1hoIYwDaPpqrhTrHngoN
	 6ZgECcBMB0kPQjTwP4xbzMBtwnVOTNu9n0kml/imhQawMARN3tDMAqUECYcIGFGip0
	 sFjdfqxfW5/Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6645260D80;
	Fri,  4 Sep 2026 12:17:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FA1200E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0363A60D56
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZCsjN3kGZ4Q for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 072DC60681
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524262;
 b=ZXVVSuvhfgOQKmmWAESIBj8+AcCJqMnYlkNtr4E2g7mSwEuB1JIOhV6FdurNY4eW92xU
 /B41iOovMAaQBJl1FxCP9FdvlfIk09wiZfOBnUOJzGmMSLwQ2WL35mJuBrAtYITXuybKG
 4+9C6ms3DpO+LS4V2gnEDzV7K2GwuEz7J8LcAsNdeJOz00BlARnz0+Jwfcmj7yijtRqCY
 VJ5gfQHYUlzZx4DGDZ4I8r+4Szy1MyKRTC7onOG+5ZwK08mlqp6gSP1Rz6lyjN4tTAZeT
 qKagQ8p60cPeGxnW+nguOs+LAMkDA9bIHis31nXuEmsbqO6x0chyYZdVKh96WIypc6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524262;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=WQNj2ItzuiXo10c+PfEwBwMWGIeRlPHgCfLEDQT26OQ=;
 b=qQhGRkVA/IodsYAOzIv/8KmzBnUGDPgng3R5uODfyFxsFxK6B4EOblak2WDLIHS01g6t
 QWv3FbGp3APKRDdXJ+vz1yU72tKSbWnkWcsvNEWBj/U0HfWqrqW1NTWIir7CAqTQsqQ6M
 TEDU0pwRDx4SUrPUf+DrbGkzNJRFbuVC7OE6EumNurtFdM3HXgqsLTEmwXa4/DA+G0dSU
 ZVRuYyFkrrUJNLjku5uuE2lR+e1UZLuAy2OJUU1GTLIoYYCMEzh7zf4wWI/HTFJwx3yyf
 LxTVDrgjEVzQaRqQe/r+X+JCmZIXKCCAAV2z0JW82jkFUflCc1JloBPKS5D0N0mkm6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dPj+aaBf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 072DC60681
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4843efcbdb2so548799f8f.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524259; x=1789129059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WQNj2ItzuiXo10c+PfEwBwMWGIeRlPHgCfLEDQT26OQ=;
 b=KgMNXc5ZEl0LqJLlBDfurNq/K4eyILOt/h2X4DGp+nSgFt2AEQ3+7eDlGzOVTfReo7
 ENUBW9k5dH8DmGFbdBy9DBIG55dB470vXglCzXoaHQohmcQ0CqY2VWNYdzcMU9VbOz/K
 bDMkRTnf9rXK2nulmlyvvzlfyO+5GIeDDLngMGka5/Ay2S4Hn5DgnqN3jDdoMlX0pd/e
 gv6ohQlktUDSodZQ9NkRLOjDXCZJ5GxglJV+BDkQ6r4uBhfKn5MeGPZ56EJ/VMJviJH6
 BSydypwBUAZyx6ydyTiC22lTF5/okH2dGWtK3khwAd8Ts/r9/gh6PYL0RSo2yT6yjuc+
 YliA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwGZvdKKdLBYHs5GFx7utinmsM1xcKS+y1jD0h+3ygZoag05iLMq0UNTEKIIUXe+ITr1mQCcgP9asw=@buildroot.org
X-Gm-Message-State: AFuF++ksdacW7nmJ/k9AzlA6vAvNi8Ey3/rsqsWqiEyK3t2NSEVikKPK
 JzH4dZ0TvdpVAnJcRtfTe9aN+6927w64H5lpT0TFm0eJXOEj+4S69/h7jMo8cQQAYPF3lvEoZL2
 E7TjX
X-Gm-Gg: AYBFou3AOEgZF/g2jYImG/qIGllkHtp1L13M5fbLBsLOy4EG/ENC2K2RtWq2nJ9rqJh
 cvMGinTGpzrhpXMCqsvenJY7pHAqctAKvKn8vy3yKCeX5SAqWAUjEREYJihzajsDpGuTfugQvb/
 Arn30ifTr5GfB1WyUA8kBmteCtxIgWj42hX0wbVzQxJOoBW3MXiWW7OhJb9qrXhlrL3xdoiU5FF
 ubG0shFD1NKnwiZqT5CrZA87MnwUUPHvY5St3ECPH2061Enb1LcRi0cwLYgUdyBd2In2954fLfb
 pcsYfNlAUOAdlvMiB+QEJTLZ31VmLog3AXL9FxwdsJtBgRlpwwPMmxPKkqaaLehu1hHRRQstwI4
 2YaDxVcDPfvxYr9Uw0YFd/AoOA7cyrdgHZThSb/MbKT2r7VTcNu0vyqkgA6h4xHNpmcnM+4eJIq
 o99XGlQw7MjkEzTxNeb7tZ+O4XpJjKyqsQxrrpdYZ7+AGf8MWcRtPWCQ==
X-Received: by 2002:a05:6000:250f:b0:485:8a47:5b8a with SMTP id
 ffacd0b85a97d-4858a475d57mr4319031f8f.39.1788524259553; 
 Fri, 04 Sep 2026 05:17:39 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885c5bbdsm5607618f8f.36.2026.09.04.05.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:39 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:38 +0200
Message-ID: <20260904121738.404092-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826152732.3556127-1-romain.naour@smile.fr>
References: <20260826152732.3556127-1-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: TestPythonPy3Gobject:
 test glib 2.88 regression
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
> In Glib >= 2.88, GLib.unix_signal_add has been moved to a separate
> platform-specific library. This break backward compatibility from
> GLib-2.0. A workaround has been applied to pygobject >= 3.55.3
> https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310
> 
> This issue currently break TestFirewalldSysVInit and
> TestFirewalldSystemd runtime tests since the bump to glib 2.88.3 [1]:
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 (TestFirewalldSysVInit)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 (TestFirewalldSystemd)
> 
> Break the test TestPythonPy3Gobject now in order to reproduce the same
> issue than for Firewalld test.
> 
> [1] e313a2d2590af689eb1f79e55b5a488154400da1
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2026.05.x. Thanks

> ---
>  support/testing/tests/package/sample_python_gobject.py | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
> index 4490a73613..1c2b327206 100644
> --- a/support/testing/tests/package/sample_python_gobject.py
> +++ b/support/testing/tests/package/sample_python_gobject.py
> @@ -4,6 +4,12 @@ from gi.repository import GLib
>  
>  
>  def main():
> +    # In Glib >= 2.88, GLib.unix_signal_add has been moved to a
> +    # separate platform-specific library. This break backward
> +    # compatibility from GLib-2.0.
> +    # A workaround has been applied to pygobject >= 3.55.3
> +    # https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310
> +    unix_signal_add = GLib.unix_signal_add_full  # noqa
>      sh_path = GLib.find_program_in_path('sh')
>      if sh_path == "/bin/sh":
>          return True
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
