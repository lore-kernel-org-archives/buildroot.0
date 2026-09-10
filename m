Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839B1C79FB9
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 09:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41BBC80EDD;
	Thu, 10 Sep 2026 09:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7FjnHkhbuQ0; Thu, 10 Sep 2026 09:53:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0037780EDE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789033993;
	b=KI/hDu9KLXngEpbm3CwDDnRlC/DPwguarF/ADewg4ax/ebM3laqnXD7DXNlZpXgXW9VF
	 VXgB3Jf+wHkR+vKHKitKadE/v9GKngoGXfRhJR/miMhQVfKKYqFbvSCDjvCaVTIA02wmH
	 VXE/4tL3PihttJr+sB7HjCGaKpEbxv58szZfXFY3hGoepVRshiF+khG4VcWZnO4uZKWez
	 lGg0k1tkzeJF3J0uH/wJeRwQkj+M+P3Dxk1mgvDWgbwKaVw9Khw6IQ4hIjuQ1sYCfJ2ra
	 K1AAyQhnAejlm4riSCCfNg7EAwh+76+S62WpU67VDh/rQIFW1yI3ozMcAjU+Rz56rFQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789033993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Errors-To:Sender;
	bh=XrX9HLCZwnEhC5hTyy2YUuexrIRE8GCNB8Mmkxf5XtQ=;
	b=ERO3my72jAEH2EcCaBEf4FeHzRFRVz1d5FeL6z4VQNe40LoLHZSb0XIY7KLPqKcWtDwY
	 P6w+NOnDNrIUM9PWmi6OwXRA7nxnOh6jAZ1Swc6TOdB+hcRZ0dmmmqV1RLS2G1W0uHRI0
	 eB1fmd5B1g2Dj/k7U3yV5lw1NSN1fJhCmKnZ4ZkLdhPeK150JjalShbQAbkACzFxdiPVo
	 AiLWfbzSb/G6HaHI0s2Xvf4/cxml+La5gXFekhf0NKzU2wKF13GM+q1GOI8lcCEmEE2oH
	 H0gVayT8jQKxBO3ykSuBiC9yvyUr0TsAaqPgAA5qTipvJLMlAi7w6np+LoDNEcDcj3w==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789033993;
	bh=XrX9HLCZwnEhC5hTyy2YUuexrIRE8GCNB8Mmkxf5XtQ=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pJ0sOWTKNR40cUFuBLjASLZF97M9QCzWzP8RxJrpAZ/So9fGLC0s+I8v2CSYILn5Y
	 e73coFi9eTlQSK8eytPZ4wVjVFBIryyvKX05RDB706h7tngaBhM78ZIJ7h5N1SIvXo
	 bbEVBXn6N56zAUx0B606ggZHGIy5jxklrFmENgNngV9HKHeZbI/nr5DcnoMw//tiyH
	 7q4gn12I4GGZbNX/iCAnZyTYba6vNqbRgzhn/IaleDOKVRes8DiiXKRQcexOHo+/Lg
	 Lhz1n7H0UPRM0kJKnmfs0rkmnKtoycZbjnffX3wMtKw82XSAX1bwySyH1ZSDTW/zgO
	 8C1HaT5iQKgDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0037780EDE;
	Thu, 10 Sep 2026 09:53:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C823AF
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 09:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69DE1401DA
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 09:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jk73t2mbISft for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 09:53:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D70264006B
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::934"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789033990;
 b=WKPXJNmnyjg1rm/9ldOxWkJ7KJ2p8B2c2pj5vHphlSLrkESDdyAvZ/AvYot5aNNrtMJV
 2mVh7Mk4weqB+Gsy2KTcEF9/IT9ZP7AtluLz7cJIHPyKRVVIqGLS+RhSkK2/sTU32RvE1
 OLLwG7X1jSgllZ9cy20yELWU2AZimlbO/2eY9umGq3aYvS+A2F1RSEPDZOuIL/QAGXlpL
 ohqpCod/w/O7qxO34w454e2NoNv3aUDl5SpwTT0+cpEwe0dCUYRZ/vMSkqrDDf8/DaqsQ
 SA9MIZEk8UPhlbh6DPTj/BRmeT8ymojCrJQpPw/bq/DhveBDLsuldW2Ej03GUFOTXMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789033990;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=ANtNg3t+qI9SSPpLy6MYi9Dp6poRxW8xuL8ydZB45pI=;
 b=mMU1e+tz3spmTHdtCJHcHOyrO2caSaYIxxBzlku8hk480jTIC6MA2FiRXKVypAUnbp9O
 03S+fkboKUUqIONkywywhm8xbm3eP8GwfJtA7Z6XCPB3RGWVZNSen8ic3xIQM3utlVCjV
 3AhKSWhMEpjYTpz4VSM5DExGPL0rJyJUsdBQ1/yjU5bw2AXDF7SHYLp0rWc0SdKIERTjQ
 0QIREUiPIsEaY1AbMEuSsDjbxWV4uswN8fVGgIuv/suwB1yedNnT0NdxxulLswcYUcqYv
 plIzHLFPoIccA9E66Gw+022C50AsceT0ViMgTdXajxJAb6HdAbl8oxYb8zOy5uxXRFg==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Y05qoKX0; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::934"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::934; helo=mail-ua1-x934.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Y05qoKX0
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D70264006B
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 09:53:08 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-982838c4cccso443161241.0
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 02:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789033987; cv=none;
 d=google.com; s=arc-20260327;
 b=HXd64bdQPCJH/qdjFxHOt5LuynFHmV+CVuq5v4us3ZYtpuqt1yx3NxlUZGwuTKGCF6
 LNp2bNIDC4DC13vpXrWQ7ZdXpgxPSwg4SUd7KvNMQHofFPTNt0MnU5JwDBwJ2URmNNdd
 gT8VFAyZDXwDfAHoHuwFIc32HKYN17/PnNPVctmyH8wmazneNCbu0Y8CKgz99TZdphgs
 OKBiU72uqGdGUc+KMUMcxxnZEZt1KKMTXpTp6ausd185ScoNXHeAn0kM9RFpp/1KUIGF
 TQwWRzBE3B8JKD6ytvLy2FJFv35BNm5Q4uLMjk4tN/FDysN77m2fzaZ7hwKHicje7SQV
 TRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ANtNg3t+qI9SSPpLy6MYi9Dp6poRxW8xuL8ydZB45pI=;
 fh=NhjfNVBSfL5BMdsUBDE75pDoM1SLezUFGjGpL0KOMVs=;
 b=q2L0q7GAHUf7jRwiV6Odyfrurb0QLKpZiyzompa5YUojI4tMGv9ciIyhAChMNO3muf
 LH4DKauszqQp7rMyKFDr2q/v9H6hTVvpy1XAnfdMwoehqjabsVDozsgNZx9Gp08uggBf
 BYzK6MX6uvFF5ggtgxfyiHbM/DfHUC4wqBVITCyOdM+atStsSauZDZ7lJle9lbqhiL9I
 tnhuSLnT7QzAcowIleR44YYM8WzBhJT4Af6KoNbhDn4UUvshnZRmI2iU7pRLxA9bwGhQ
 G1iO5zNFbgcowyJE2EYZoFpVF1JHY+6Wuiqbf0Ydeuo9WVUbOavw+LlpI6Z+klRbZTMV
 7aHw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1789033987; x=1789638787;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ANtNg3t+qI9SSPpLy6MYi9Dp6poRxW8xuL8ydZB45pI=;
 b=Y05qoKX0X3fedWtG84p0aGB4SzsKvcbtkfKjWm5lMDhgOsHeVnr15jaWA62ttvZZW1
 Jq3CGbUS/bAKOf6Ov/wPdK76uDbN2e2kpdUsrKIEt/PpotQZHC0fIh5My/7oc0b2qjl3
 ZTcJVQ8yOWYAAtIq7GmFerjWG0oguEoWgNvfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789033987; x=1789638787;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ANtNg3t+qI9SSPpLy6MYi9Dp6poRxW8xuL8ydZB45pI=;
 b=HOURi2T7Tjvxt8DK1D6JOxC76tzojb9EUGhCIegIpTChz8zNNQVEk8vE5sSlZeB9sd
 HK+dQd1YwAYDa/ZRjKBEF9BtXi8vcdUt4Sl4H9HIEcdI/2sIEWfqvC/FrQo/ocWVhgrW
 jpfjHhgErxAY1WYMKLngT4HrbqGhhODMuBfXVhrpQWL59Jp7z5ZjMKdBoUXWzSG+delQ
 2wZlW64qflg+BbqJsAvhN8UdS6VlZNSfAZYL/fDiKEMvYys4f/K2/6lv7//4j0D7xTOd
 U4HJlhdM7lEdpCE/JL/d92BXAM4ETneRmFgnTIkb46ebEdZFsh3eyuxQFqE8AAHTd/c4
 YF9A==
X-Gm-Message-State: AFuF++k/uwGSZmECxdOGu7twTtiYW5/6X/R7QYKPE1RraY6+9NguTlUo
 ZXiaabmlOZ3GoNA9xyee47Jowu8yDd5Ici2tUYi+xVo4lBoB+h7iqjs6XC+9k7z9tdb3wp8eesh
 kcdyKZAhyMqDE9NGm7ZHJPpQcklLBHAUx+GC8zuI0Kg==
X-Gm-Gg: AYBFou0QB9JspGNTTO1fqKMXh6yIxB1+Ta9JQtbMZWw5Q4lAUcbW9aSN/BYMX/xJW+1
 bDZmuYYrJCEf8mCCvfDGkBI1j4PDOlR4+fdiJrDAeC1ZFQy0aO5mP8YS7H2Z+xrM6HgCNbllep/
 1v6aRo1Nqvw8NGHjI9zhOFq/3TFsuhC8gtgLJiVEqG39dN/B1lWB0poms/wgh2iCPZM47VOS7gC
 W14lqX+5wIe5+qr3YdL1nQHA1zNVqZNb/vJhP49011T2bH6WRmcKiKEdzWfGh1pmAX09HNhX33L
 DG8RrcuWb/PdOmLavRVrDF+knonH7hk8ClPhcmUoUvdlQOVr5t2+ACkI4Sx6m37mYkO+0/C2VZQ
 IQiCaAv4Q9iJLkoggTKvdY3AXghydClZzVNtYlerSKNTeZr9vy/ZES6YfktWu18ULduT5nGM=
X-Received: by 2002:a05:6102:2759:b0:78f:efcb:23dc with SMTP id
 ada2fe7eead31-790da2b2db5mr1020813137.13.1789033987093; Thu, 10 Sep 2026
 02:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
 <20260908141253.1556634-7-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20260908141253.1556634-7-dario.binacchi@amarulasolutions.com>
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Thu, 10 Sep 2026 11:52:55 +0200
X-Gm-Features: AcwNN1XgFvygSLv3ZnRULtrEVfUVk73YLzPBWlICE__aExCt2NVY9lZp_M0_HcE
Message-ID: <CABNF3=aOyhiG79230eRj9bMf6gHRf-sG7M81zD=2Po0Ani36bQ@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH v5 6/6] package/cutekeyboard: enable build
 with Qt6
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
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Jesse Van Gavere <jesseevg@gmail.com>, richard.genoud@bootlin.com
Content-Type: multipart/mixed; boundary="===============1425551290217767219=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1425551290217767219==
Content-Type: multipart/alternative; boundary="0000000000004ac9a8065b1def16"

--0000000000004ac9a8065b1def16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The package changes look correct: nothing in the upstream .pro files is
Qt5-specific, and depending on qt6declarative alone is right since Quick
Controls 2 is part of qtdeclarative in Qt6.

One nit:

 - "select BR2_PACKAGE_QT6BASE_GUI" is redundant; it is already selected
   by BR2_PACKAGE_QT6DECLARATIVE_QUICK.

Upstream CI tests only qmake with Qt5 and CMake with Qt6, so qmake + Qt6
has never been exercised. I confirm that the plugin lands in
/usr/lib/qt6/plugins/platforminputcontexts/,
and the QML module in /usr/lib/qt6/qml/QtQuick/CuteKeyboard/.

With that addressed, and provided the qmake-for-Qt6 infrastructure
patches in this series are accepted:

Reviewed-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

If the series gets merged, I will extend the upstream GitHub CI to also
build with qmake and Qt6, so this combination stays covered.

Andrea Ricchi
Embedded Software Engineer
M. +39 333 775 4973 <+39%20333%20775%204973>
andrea.ricchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com



On Tue, Sep 8, 2026 at 4:13=E2=80=AFPM Dario Binacchi <
dario.binacchi@amarulasolutions.com> wrote:

> Enable building of cutekeyboard with Qt6. With the merge of
> QuickControls2 into qtdeclarative, the corresponding Kconfig option has
> also disappeared in Buildroot.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
> Changes v4 -> v5:
>   - Rebase on version 1.6.0
>
> Added in v2
>
>  package/cutekeyboard/Config.in       | 13 ++++++++-----
>  package/cutekeyboard/cutekeyboard.mk |  6 +++++-
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/package/cutekeyboard/Config.in
> b/package/cutekeyboard/Config.in
> index bd661b0cd42e..4f83316644a2 100644
> --- a/package/cutekeyboard/Config.in
> +++ b/package/cutekeyboard/Config.in
> @@ -1,10 +1,13 @@
>  config BR2_PACKAGE_CUTEKEYBOARD
>         bool "cutekeyboard"
> -       depends on BR2_PACKAGE_QT5
> -       depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
> -       select BR2_PACKAGE_QT5DECLARATIVE
> -       select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> -       select BR2_PACKAGE_QT5QUICKCONTROLS2
> +       depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
> +       depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE || BR2_PACKAGE_QT6 #
> qt5declarative
> +       select BR2_PACKAGE_QT5DECLARATIVE if BR2_PACKAGE_QT5
> +       select BR2_PACKAGE_QT5DECLARATIVE_QUICK if BR2_PACKAGE_QT5
> +       select BR2_PACKAGE_QT5QUICKCONTROLS2 if BR2_PACKAGE_QT5
> +       select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
> +       select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
> +       select BR2_PACKAGE_QT6DECLARATIVE_QUICK if BR2_PACKAGE_QT6
>         help
>           CuteKeyboard is a Qt virtual keyboard plugin for
>           embedded applications.
> diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/
> cutekeyboard.mk
> index 12a6573d52e9..908d371cbc2c 100644
> --- a/package/cutekeyboard/cutekeyboard.mk
> +++ b/package/cutekeyboard/cutekeyboard.mk
> @@ -6,7 +6,11 @@
>
>  CUTEKEYBOARD_VERSION =3D 1.6.0
>  CUTEKEYBOARD_SITE =3D $(call
> github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
> -CUTEKEYBOARD_DEPENDENCIES =3D qt5declarative qt5quickcontrols2
> +ifeq ($(BR2_PACKAGE_QT5),y)
> +CUTEKEYBOARD_DEPENDENCIES +=3D qt5declarative qt5quickcontrols2
> +else
> +CUTEKEYBOARD_DEPENDENCIES +=3D qt6declarative
> +endif
>  CUTEKEYBOARD_INSTALL_STAGING =3D YES
>  CUTEKEYBOARD_LICENSE =3D MIT
>  CUTEKEYBOARD_LICENSE_FILES =3D LICENSE
> --
> 2.43.0
>
>

--0000000000004ac9a8065b1def16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br>The package changes look correct: nothing =
in the upstream .pro files is<br>Qt5-specific, and depending on qt6declarat=
ive alone is right since Quick<br>Controls 2 is part of qtdeclarative in Qt=
6.<br><br>One nit:<br><br>=C2=A0- &quot;select BR2_PACKAGE_QT6BASE_GUI&quot=
; is redundant; it is already selected<br>=C2=A0 =C2=A0by BR2_PACKAGE_QT6DE=
CLARATIVE_QUICK.<br><br>Upstream CI tests only qmake with Qt5 and CMake wit=
h Qt6, so qmake + Qt6</div><div>has never been exercised. I confirm that th=
e plugin lands in /usr/lib/qt6/plugins/platforminputcontexts/,</div><div>an=
d the QML module in /usr/lib/qt6/qml/QtQuick/CuteKeyboard/.<br><br>With tha=
t addressed, and provided the qmake-for-Qt6 infrastructure<br>patches in th=
is series are accepted:<br><br>Reviewed-by: Andrea Ricchi &lt;<a href=3D"ma=
ilto:andrea.ricchi@amarulasolutions.com" target=3D"_blank">andrea.ricchi@am=
arulasolutions.com</a>&gt;<br><br>If the series gets merged, I will extend =
the upstream GitHub CI to also<br>build with qmake and Qt6, so this combina=
tion stays covered.</div><div><div dir=3D"ltr" class=3D"gmail_signature" da=
ta-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p style=3D"color:rgb(0,0=
,0);font-family:&quot;Times New Roman&quot;;font-size:medium;margin-bottom:=
10px!important"><span style=3D"font-weight:700"><span style=3D"font-size:14=
px">Andrea Ricchi</span></span><br><span style=3D"font-size:12px">Embedded =
Software Engineer<br>M. <a href=3D"tel:+39%20333%20775%204973" value=3D"+39=
3337754973" target=3D"_blank">+39 333 775 4973</a><br><a href=3D"mailto:and=
rea.ricchi@amarulasolutions.com" target=3D"_blank">andrea.ricchi@amarulasol=
utions.com</a></span><br><span style=3D"font-size:12px;color:rgb(241,194,50=
)">=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95</span><br><=
span style=3D"font-size:12px"><span style=3D"font-weight:700">Amarula Solut=
ions SRL</span><br>=C2=A0Via Felice Cavallotti 25D, 41012 Carpi, MO, IT<br>=
<a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@amarula=
solutions.com</a><br><a href=3D"http://www.amarulasolutions.com/" target=3D=
"_blank">www.amarulasolutions.com</a></span><br></p><p></p></div></div></di=
v><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Sep 8, 2026 at 4:13=E2=80=AFPM Dario Binacchi &lt;<a href=3D"=
mailto:dario.binacchi@amarulasolutions.com" target=3D"_blank">dario.binacch=
i@amarulasolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Enable building of cutekeyboard with Qt6. With the me=
rge of<br>
QuickControls2 into qtdeclarative, the corresponding Kconfig option has<br>
also disappeared in Buildroot.<br>
<br>
Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulas=
olutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;=
<br>
---<br>
<br>
Changes v4 -&gt; v5:<br>
=C2=A0 - Rebase on version 1.6.0<br>
<br>
Added in v2<br>
<br>
=C2=A0package/cutekeyboard/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++++=
+-----<br>
=C2=A0package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D"norefe=
rrer" target=3D"_blank">cutekeyboard.mk</a> |=C2=A0 6 +++++-<br>
=C2=A02 files changed, 13 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.i=
n<br>
index bd661b0cd42e..4f83316644a2 100644<br>
--- a/package/cutekeyboard/Config.in<br>
+++ b/package/cutekeyboard/Config.in<br>
@@ -1,10 +1,13 @@<br>
=C2=A0config BR2_PACKAGE_CUTEKEYBOARD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;cutekeyboard&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT5<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # q=
t5declarative<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT5DECLARATIVE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT5DECLARATIVE_QUICK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT5QUICKCONTROLS2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE || =
BR2_PACKAGE_QT6 # qt5declarative<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT5DECLARATIVE if BR2_PACKAG=
E_QT5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT5DECLARATIVE_QUICK if BR2_=
PACKAGE_QT5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT5QUICKCONTROLS2 if BR2_PAC=
KAGE_QT5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_Q=
T6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAG=
E_QT6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6DECLARATIVE_QUICK if BR2_=
PACKAGE_QT6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CuteKeyboard is a Qt virtual keyboard pl=
ugin for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 embedded applications.<br>
diff --git a/package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D=
"noreferrer" target=3D"_blank">cutekeyboard.mk</a> b/package/cutekeyboard/<=
a href=3D"http://cutekeyboard.mk" rel=3D"noreferrer" target=3D"_blank">cute=
keyboard.mk</a><br>
index 12a6573d52e9..908d371cbc2c 100644<br>
--- a/package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D"norefe=
rrer" target=3D"_blank">cutekeyboard.mk</a><br>
+++ b/package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D"norefe=
rrer" target=3D"_blank">cutekeyboard.mk</a><br>
@@ -6,7 +6,11 @@<br>
<br>
=C2=A0CUTEKEYBOARD_VERSION =3D 1.6.0<br>
=C2=A0CUTEKEYBOARD_SITE =3D $(call github,amarula,cutekeyboard,v$(CUTEKEYBO=
ARD_VERSION))<br>
-CUTEKEYBOARD_DEPENDENCIES =3D qt5declarative qt5quickcontrols2<br>
+ifeq ($(BR2_PACKAGE_QT5),y)<br>
+CUTEKEYBOARD_DEPENDENCIES +=3D qt5declarative qt5quickcontrols2<br>
+else<br>
+CUTEKEYBOARD_DEPENDENCIES +=3D qt6declarative<br>
+endif<br>
=C2=A0CUTEKEYBOARD_INSTALL_STAGING =3D YES<br>
=C2=A0CUTEKEYBOARD_LICENSE =3D MIT<br>
=C2=A0CUTEKEYBOARD_LICENSE_FILES =3D LICENSE<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--0000000000004ac9a8065b1def16--

--===============1425551290217767219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1425551290217767219==--
