Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0B4CA9ECA
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4057B60631;
	Sun, 11 Oct 2026 08:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzpvXouqEF3x; Sun, 11 Oct 2026 08:35:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 44FF460644
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791707741;
	b=qyiiP9QtHjEYdzAU4sNAMfUeBZzK8LYeARiawDVNkKjA+9SsffF4A8fyAyI35rQEYAjd
	 FOEPSJ/RiV4OSPp1y+WsTSmpsGbO5XMC4dOMwNaJXjYE8U9dR1ee7TA4asLNmha4KgAEK
	 lmT0nW0dUHHQi7YVMbQVYJWXJiHifJ0A2/FmstHQ8vZv68gypZ9v+eJM8474ZCOWLrMTb
	 pY4Oz/B3GgWZgFcvuOlbnDTxdgHJfgFne0iJsVaKRYBB8nHB0aTBHgDguPdtca15mmUgn
	 JHBTsuLzcIQt4rXMYF+nJrA+5uw0iUxb7L0LnSO/p3SLlDB391e1zFcx6Cz3tQRyJIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791707741;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=JsqEUfeNmgm8CQ8FnwYLXecPsWMq2j1wVrS9wSH6hMY=;
	b=jYL4JB63RoFPwozqy//UUuD3NHb5LS7Jzn4UV2dMr+xC5VlyGcpFF74sH5DOLexhzOom
	 QAxZS559l9M6Eel2A7OacZR1TnD+rYpgMfTZB15//ng7ITbSUGWATuzz7DzzvA35BcTEQ
	 /2Fe3NSlZ2lUs3mMyHAT1juTLdRb3zWP5d9fN5WEKJiqXv0HneSmHUKOuTAYA9zgInJt9
	 7sDawHSmV/QfLUc+EUcnyqUAVwLeYOpmPwhncKu6rs7uyF/rVs+8Kj18PQeE3Z5HEwnRu
	 LwYV7VsDlMf12Tnz1TUwHaBJSKdsFWdY5BdofvfNJSb146qIS514X7jLpI0Kr1ob3lQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791707741;
	bh=JsqEUfeNmgm8CQ8FnwYLXecPsWMq2j1wVrS9wSH6hMY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WHsayBuao5mdVDuxGs4H5IQ57xMfImmNZ8hCoMZ4OlE3Ie4eRVpfhm8L5QdkrUKJz
	 gbBCjU6Ee1JJ0wNLg2iuBszdXac0XoEJXQLkeS8DAIH2CuxWrDSKjB20Vb9g9NOPF5
	 HxyeNEUZgHLyMr2RCVWvmyLO48iCSKYUDrm8hZ7W/LGF4HpTkEkiUVTESO6eOpTN8F
	 p0y8gVmml2ma30yy2WR+TGK4j5eBvnTjV0shiXFNBA/kaegoWGcsDHWC0BL4FArpxm
	 ODqOPBsWsg//HwfPUYJEn4nz+MSdBz60OgeUzEPeDk3jsaALCRrqsBJZMUTxl31Imn
	 RNKAtETZP2m4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44FF460644;
	Sun, 11 Oct 2026 08:35:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF33F156
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4DF660631
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpTbFvHitLhi for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:35:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0497560623
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791707739;
 b=JA/qq0MgVzJ0PIJUPoZCKNBb4C1bsYS5LcVeccLdcBvzihPt3WMPsM62N2ohhKXV2ZL0
 FqOIXYS2Othj82eI9J14cegZ4I/Rwu6zMJ8aYJt+H5NDLoiP/8yt25q7ktv68euARrw/x
 1LN9CjuiG5HHgxI2S0ZtWWct2MCrgRiwpBRTzUq6Cy2V2YZ3asvdnO2wGSfj6aH9gYt0I
 si2CRaUiI/I8SPVjXXCR+++IewjPnGY4DOks4MFSrRNtktYq+Y225uFqMkieJ7j477fYP
 LJOkicVRqdLftCwYRHd7JytGG5oL99ry3j7qoZi1/4GXWsZw3N1Zp38PsMZoMZVij6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791707739;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=ML396h8k5k60tY0M1jrmtAvQwrQLZKet7a0yym+SF5I=;
 b=UtdkKYIBN12CW+HcCzvFw2FJKuStWYD/XWcZbrCjmj6j/KoqigRyY3QnrE/jmim5DxDC
 GcgCprbrmol52o9NYqmxVvesNDylDut1J09lXKe/EE6M0h90vV0SbjyeECsY+ke8dpJXB
 q/5HhIL2ur8htDPxCckC8sHhRyvSV5hVyO/8omDbO6QnAZNpFo9+fi5aDBirUCfrJtOXV
 khLIA0zJF+4kShAMdl/tVCZqoY5QKs0NnQRRiRn1rxRoX2tc0OMcZUNkkzhgT6VnsohRD
 P599tc8/1KtQUJiI3b3DrjOFLoltUsvwYD5GQssvdZHfgb0DbQw0l00iQ8I1lBbqnig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Q9BhL75T; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0497560623
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:35:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D73CEB97A14A; Sun, 11 Oct 2026 10:35:20 +0200 (CEST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 10:35:11 +0200
Message-ID: <179170717087.143633.9265114955065186971.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260918091142.62239-2-thomas.perale@mind.be>
References: <20260918091142.62239-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] utils/checkpackagelib: support other
 identifiers than CVE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 18 Sep 2026 11:11:41 +0200, Thomas Perale via buildroot wrote:
> Currently the MissingCVEPatch check will complain if another
> identifiers than a CVE-YYYY-XXXX is passed after the 'CVE: '
> trailer in the patch header introduced in [1].
>
> If a package 'foo' defines the following:
>
> FOO_IGNORE_CVES += GHSA-abcd-1234-efgh
>
> And correctly references it in a patch header:
>
> CVE: GHSA-abcd-1234-efgh
>
> check-package will report the following:
>
> package/foo/foo.mk: patch file '0001-some-patch.patch' is missing 'CVE:' tag
>
> While we could argue that GHSA identifier should not be present in the
> 'IGNORE_CVES' variable, it's still valuable for users to have a way to
> correctly ignore and link a patch for their vulnerability report.
>
> From our point of view it allows us to track GHSA vulnerabilities that
> could later be assigned a CVE so we can update the IGNORE_CVES variable.
>
> This commit relaxes the constraint on the 'CVE' trailer to just check
> for the presence of the trailer in some patch.
>
> [1] 1167d0ff3d docs/manual: mention CVE trailer
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

 Applied to master, thanks! But see below.

> ---
>  utils/checkpackagelib/lib_mk.py      | 9 +++++++--
>  utils/checkpackagelib/test_lib_mk.py | 5 +++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 065733d464..c5b85bcda9 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -121,7 +121,7 @@ class Indent(_CheckFunction):
>  class MissingCVEPatch(_CheckFunction):
>      PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
>      IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
> -    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *CVE-\d+-\d+$")
> +    CVE_TAG_IN_PATCH = "CVE: "

 This would allow multiple CVEs on one line, which is not actually supported.
So I've kept the regex and just allowed any alphanumerical character or dash
in the ID.

 Regards,
 Arnout

>
>      def before(self):
>          self.pending_patches = []
> @@ -136,7 +136,12 @@ class MissingCVEPatch(_CheckFunction):
>                          .format(self.filename, patch_lineno, patch_name),
>                          patch_text]
>  
> -            if not any(map(self.CVE_TAG_IN_PATCH.match, patch_file.open())):
> +            trailers = [
> +                line.partition(self.CVE_TAG_IN_PATCH)[2].strip()
> +                for line in patch_file.open()
> +                if line.startswith(self.CVE_TAG_IN_PATCH)
> +            ]
> +            if not trailers:
>                  return ["{}: patch file '{}' is missing 'CVE:' tag"
>                          .format(self.filename, patch_name),
>                          patch_text]
> diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
> index 21effa9489..ba9dbd6aea 100644
> --- a/utils/checkpackagelib/test_lib_mk.py
> +++ b/utils/checkpackagelib/test_lib_mk.py
> @@ -239,6 +239,11 @@ MissingCVEPatch = [
>       {},
>       'FOO_IGNORE_CVES += CVE-2000-1234\n',
>       []),
> +    ('patches present with other identifier',
> +     {'0001-some-fix.patch': 'CVE: GHSA-abcd-1234-efgh'},
> +     '# 0001-some-fix.patch\n'
> +     'FOO_IGNORE_CVES += GHSA-abcd-1234-efgh\n',
> +     []),
>      ]
>  
>  
> -- 
> 2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
