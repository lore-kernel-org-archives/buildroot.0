Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BE4CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED8F610DC;
	Fri,  5 Jun 2026 12:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGG0ZGJ5CTNm; Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374A0610B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663827;
	bh=AU8dgFL8DMs5j/k/VFHo8qUa6tDbrTuwRLVirLOVR3k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cFyP8FEt/CUU053Q3z7vwXCJyL19MDKZOQsWrtD7dPCadR7wS5QKKPJiq45QAON7f
	 teQrT/KTEwCr3Q9UVDpO5stIYg8Cc3AkA64yTNpSGihnHcdaeQwO0qDwcWLd11Ve/Y
	 QbMdWBpFXF5RDAY3NnzFb5s0sUdVYLrroNuB1YtleVw2YBkQ9MSQxRsxzVVWTatVKR
	 8tA4iVtdSqgd6+ouEKlBPpFIpCdqIeBXWIyXZL0QIbTQVdRcSxqyJOyCOSSznsNUHA
	 w2dxAULrbGtMs73Bo92uO8UPhXfZn+JSz277IjJPbY31yU5IVcbcb3j2WFwSn4ctYS
	 paFOd0xLj2JXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 374A0610B6;
	Fri,  5 Jun 2026 12:50:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BE82F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29CCF41F29
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4A-Dt0f2BwMv for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E29141F10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E29141F10
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E29141F10
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so23305995e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663818; x=1781268618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h1F0/QtiwbSOUlVTdldFi2+w824rRRBX8aA9k7Byv10=;
 b=PGS1gumcWxxArQPmOQaWQkSFs6FhOsMDUVvd44vrJhAllssLoIlwTzMOZURRTATYSX
 wSzJbX2fac+C59Wg2KH+xZ3zrnpHgalTznN0dwoft94s/8NuI/VgUS21o0y9mhdl7/HI
 lQ3NqNE7MaWjMwJSvQ1tooq3AKq1wL3ZnNB0FFAi3TzOmIsvqj5NJMUjZvHdBz7Vg1LU
 FgTOBin41noey2VD/uN0RFi4KbqxIwK3zsCKvAhfkeqqCSw6vjY8XRo9GWuyzvJmnSkL
 WjTQ7cpOnFaSl9/O93NCbE7RfMRibDRQXqpcpuMnCJdJl6zmfWRVd7EgwUJfKtQ/YywB
 1wOA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8wuvNYfieTMJSqBQAOB6/dA/iJ+cA+k51TLykyOYTap36cjwemu1AcLdREO1C0Cc5KFDzKHlYq28I=@buildroot.org
X-Gm-Message-State: AOJu0YzaRM1hP1eHjgEI+DxSIHbdhx44OufkxDFHiwkVXY1l7I9m5rik
 EWj+NSfVoPkoLPGD839OMzObaw/KlLWz36eKkXdALIE7/uME6ZGQzZA6sBbRrukhgE8=
X-Gm-Gg: Acq92OF9BHEzKvfU/cWWqnYXBxYUCRGlfk29HXhsgSBLW2rt5a23YrIOCsWtDV5SGoh
 1h7TUqeonNqNj05StQRpnU6hjJlQXfOau0zdf42GvEyQIkzoButOjptPUlwslvK77fwAiGpl8mP
 rxn0KdNdbReFCdZkwbPAxJrO2VEq8VuQGiuuq+4qLueXl054HNs7a76DxcAWV43olv6+mNRAqDK
 sovmHFiJn/bvmx2QGTn8ztixSa56Q1H8tz/65I2e1Hpzn9Mo9c/YBLHflNy32uX/C9SVFF2nfzI
 z0loRjXcBK5YkjTlRTyfTJK+0Kj3/vs7e2/bMrsZmuX7FRGSib4vTTu44PqgBPm/vYanDV3QL3j
 fiNOSgTM78iT+G2i+XfqjLZg2HgSlsud0WByiJoMRScWkbxMjx7Q3PtK/frGoXmVdzMQZvqukZd
 NgPx9Cfokclx4cAEatUnnkFoguFRAWyMRw1La7
X-Received: by 2002:a05:600c:a00b:b0:490:be41:87c6 with SMTP id
 5b1f17b1804b1-490c256f5f3mr62254705e9.10.1780663817571; 
 Fri, 05 Jun 2026 05:50:17 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc40716bsm159173075e9.12.2026.06.05.05.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:17 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:16 +0200
Message-ID: <20260605125016.272926-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260407-generate-cyclonedx-br-v1-4-03c45ccba2ed@cherry.de>
References: <20260407-generate-cyclonedx-br-v1-4-03c45ccba2ed@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663818; x=1781268618; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h1F0/QtiwbSOUlVTdldFi2+w824rRRBX8aA9k7Byv10=;
 b=B8VAp19JvyGu4rG1wu20/1MYeXly3Y7YtuTDw5sPhtctSAgdzHCVjclhUyMGyV3SRO
 Xmx2YRynfbEUeQeotCWpaQM1B8xd196bJfC0RkVPtjQ3ZkcbTQSbI7KzBegYuPnDHt4L
 tuFhsyoXCr6Rf7uV+kMLm+DDf177zZH0JEQ/aDxzY4phHiMeksUwhxArKik+LoTXLefs
 VoDT5VE5b6i1b5ValblKRFFd/HBn8+qz9SVSpOFKANYniMFOk91nQ30SAP+X9XYnnZg8
 Mc/ObI6MocdRq06MFDwQnBzXBcGO8xTaYdrKpjD4C4lsKMVHDdYwb1+hkuqTdrUEYsUY
 bWJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B8VAp19J
Subject: Re: [Buildroot] [PATCH 4/4] utils/generate-cyclonedx: hint at
 missing Buildroot host package on a specific error
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
> Since last commit, utils/generate-cyclonedx can now be used with
> Buildroot host tools, provided the user either externally install the
> SPDX schema in the DL_DIR themselves or have
> BR2_PACKAGE_HOST_PYTHON3_SSL and BR2_PACKAGE_HOST_CA_CERTIFICATES both
> enabled. If the latter is missing, Python will complain with:
> 
> Traceback (most recent call last):
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 1321, in do_open
>     h.request(req.get_method(), req.selector, req.data, headers,
>     ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>               encode_chunked=req.has_header('Transfer-encoding'))
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/http/client.py", line 1358, in request
>     self._send_request(method, url, body, headers, encode_chunked)
>     ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/http/client.py", line 1404, in _send_request
>     self.endheaders(body, encode_chunked=encode_chunked)
>     ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/http/client.py", line 1353, in endheaders
>     self._send_output(message_body, encode_chunked=encode_chunked)
>     ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/http/client.py", line 1113, in _send_output
>     self.send(msg)
>     ~~~~~~~~~^^^^^
>   File "/buildroot/build/host/lib/python3.14/http/client.py", line 1057, in send
>     self.connect()
>     ~~~~~~~~~~~~^^
>   File "/buildroot/build/host/lib/python3.14/http/client.py", line 1499, in connect
>     self.sock = self._context.wrap_socket(self.sock,
>                 ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
>                                           server_hostname=server_hostname)
>                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/ssl.py", line 455, in wrap_socket
>     return self.sslsocket_class._create(
>            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>         sock=sock,
>         ^^^^^^^^^^
>     ...<5 lines>...
>         session=session
>         ^^^^^^^^^^^^^^^
>     )
>     ^
>   File "/buildroot/build/host/lib/python3.14/ssl.py", line 1076, in _create
>     self.do_handshake()
>     ~~~~~~~~~~~~~~~~~^^
>   File "/buildroot/build/host/lib/python3.14/ssl.py", line 1372, in do_handshake
>     self._sslobj.do_handshake()
>     ~~~~~~~~~~~~~~~~~~~~~~~~~^^
> ssl.SSLCertVerificationError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1081)
> 
> During handling of the above exception, another exception occurred:
> 
> Traceback (most recent call last):
>   File "/buildroot/utils/generate-cyclonedx", line 53, in <module>
>     urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 212, in urlretrieve
>     with contextlib.closing(urlopen(url, data)) as fp:
>                             ~~~~~~~^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 187, in urlopen
>     return opener.open(url, data, timeout)
>            ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 487, in open
>     response = self._open(req, data)
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 504, in _open
>     result = self._call_chain(self.handle_open, protocol, protocol +
>                               '_open', req)
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 464, in _call_chain
>     result = func(*args)
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 1369, in https_open
>     return self.do_open(http.client.HTTPSConnection, req,
>            ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                         context=self._context)
>                         ^^^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 1324, in do_open
>     raise URLError(err)
> urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1081)>
> 
> Provide some hint as to what could be missing from Buildroot host.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  utils/generate-cyclonedx | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 045bf14caa..fad0671166 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -50,7 +50,12 @@ if not SPDX_SCHEMA_PATH.exists():
>  
>      # Download the CycloneDX SPDX schema JSON, and cache it locally
>      cyclonedxpath.mkdir(parents=True, exist_ok=True)
> -    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
> +    try:
> +        urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
> +    except urllib.error.URLError as e:
> +        if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
> +            raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
> +        raise e
>  
>  try:
>      with SPDX_SCHEMA_PATH.open() as f:
> 
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
