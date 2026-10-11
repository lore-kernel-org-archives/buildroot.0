Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969DFCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE7040683;
	Sun, 11 Oct 2026 08:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scKHygc9KReV; Sun, 11 Oct 2026 08:58:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5CDA140656
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791709117;
	b=c80KKZKHmSkUOLj71uRzuJ3dIdEMsEzNMuKoVQ+h611e307yPKMZpmG69q7CDBOzDxXv
	 J/LnKRKgg+hSpEWG/w3lZW1yezuMza27zivSR0s54fOZs2PwqK9SOzy3FhhL/6DPzjgG5
	 Qi/h+Xxwwqq4rosepEcURpMzvVDEPLVCx4VVi2BYuZFpEtL8JeGMTis9jTDcSHt1YEPz7
	 EagOzZd7M2F2tauCEB2QHdxrf0iyshMYI/dfq1imP4iNfZzmR3hOFiY0EbDP/8k6oJIcL
	 sZGxgBh7qtQkxU0sbd5Md8wQ1rZEzQntDZ6OwjE54/7A3Ed7TpvXI2VqZLDwWKekk3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791709117;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=GUGkjMcHU1RYY5/r6OO3g17qJp8PKKdIJv2AW4KTJxI=;
	b=cEPPxHVOZWNm2+pDrWJQFg8rMcuFDTjqojT6ZrKdV1z1M6yrP3I9QgkbHj9DTY+buHP+
	 2QMn2h7tj01jSx9o3HWTK4k/VvpEYrqZiLOUQGlyXQ2qo8YnKADe4vZKhHC8woH6ZW7St
	 6OAkJSRe/8hYHHZjluTrasGSdkvbOMVYIXAR8hCt6Dtu0XDsYyNmITp29cbLLbx+0z0F6
	 STPdxIhNSj900upTo829dHYpiuNrqvGHH6QAabfPwsn1OSHS3f+80etp1qPWoOR8UBDVm
	 M9ygtySRI+Y5R/UT6Bn8j6MacvaUnCD+SAn45rJPHyVeAjVFbuZBpwe21SOeUK4L2hw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791709117;
	bh=GUGkjMcHU1RYY5/r6OO3g17qJp8PKKdIJv2AW4KTJxI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FjYVPeOAckaADAlD749mOrydtJ3AjV54K9QwnW+oqVH+CuhDBb3dPDfNAoSV9D5ds
	 8ardJQXvnRiXFQw5ZMtLV6J7Clld1pqaG9/rMZwBR8RTKFDGNYVa8WjZV0YTsYAkLU
	 ox+tqqKKeu+MIQ7MbDBMt2+HHDTCOeUiJ1iCMfyyK7mlN1verrHW1dPis0nPCLf7bN
	 Yc6RxsC9DV5zXrJekllmcKCjr8L/pRHtEle0/mNPgrS8RxJtUkHYZuTsQyGwW27XYy
	 24FqGUnzKcdIoW1FNNLAxI8tD7JPu1b0JmkpSQP4047/FE5UHeIAiduknG3Yu1Z+Kw
	 6ro35My4QmnrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CDA140656;
	Sun, 11 Oct 2026 08:58:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14DF3235
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 064AD40042
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXWaGriNZf3x for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:58:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C7E904002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791709115;
 b=DutlGygO7pWZe5xEDgfw42weCSB22LlPtC+VqqI8a4bcauvFDXgah8KoFyWXWoQ3g7j0
 +CqPaTEr0gMn0yOk2VBL58agqyYuw09W+vdSVzkqDGqmT2oGgZSgNRSnDdQBNsrXjd/ag
 +NIt7J/KW5mkWpd0K1UXNFK7suUmB7wg0FcbecIsaoYRNh9AnhR4CgXjQkgEMSvcAfopz
 tRL5KElsyI337T3jyjkCNPAfcXfYcXQRyhLdDrVn7SS0t2Tctufr0fwdmLeaSfMaKTojf
 07tW65UOzxCmxTgeMyXv4S0ilWPZPGOCaylWevNP4VSg3yd08RYZRqIzvP6/CC/FYPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791709115;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=CVY1l5jcaNAEkNh62hS/BfazdvoFHSOguNHZLu4NwzU=;
 b=cRhQYiiY9U9sJz3Q06bw0HIwVdBcrD5n1+pTXmpdItz6U5+3Dw2grJ9EqQTpsKRSs/GH
 BmR5o0GhethfKUtiXC2zFcAdHvw28SCNOZI9c4nqZHRP/bpiuKy8UJRKpRrLfLFQZojUT
 ZZ3ufM7sKDidrwA2EC7iZxBEKH7stUpPw87fDHZ00MX8sDBVoJwWye9WgKwLrIziOwqxj
 hITp/I3+p84iBsg18Zhf81x4ESdW0Telbc00BQWqG86TVxKOYGuCgJwYyKBbKpe4z3Igt
 5A35PBprmRWGdpcUdilFCtbtnmz4xC9zUsAHq7Qgu4t3UqKVhAEtkfgzZnTXkJbzbLg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="ORfl/QxR"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7E904002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:58:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so7766375e9.3
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 01:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791709112; x=1792313912;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CVY1l5jcaNAEkNh62hS/BfazdvoFHSOguNHZLu4NwzU=;
 b=lktgh0bF5BmQ23kTL6VD2n8dho8SclwUaa/eazXskFpXHq590niOzLa9IJqIivMfso
 cCToQHcJnX3M3FAXZN55Th8ANjiaz+B1jPYolBzZQ5TIQ00DRsi9RA0iyt0PWLBh/llc
 GQupul8a9V7+Pu5CRxsXaBozPfuJn6lW0QUsN8JPvvoSYvk1asUYd61zfvOB15Ap0tAs
 /I9tCFTYjF6YoaP9WVDV9EtkQhmitUtIcUhh+NWZULZR2R+L3+3w4l3j1e/rJsHZ28Lk
 OBjiV0aN2GHyEIomdaDxz25epw1Tiuv4rtNtyK1W0ofOMnGhmv1TWio7YWD3ZeTmIcuQ
 mmCw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw7c6v2IXmOSmMeWUMw3CPstnSadBYMtHRdd+fOkRsqlt0ZXSKrdq0cSMHe3oFMOWla/Q4NL74Xt28=@buildroot.org
X-Gm-Message-State: AFq9FYJhjlWIZlPsFVp8BsB2NzvXRdhG2AHBBHkglfzUJSatII+HN3Td
 TgEIwLUTAy3kc355dKSpZpn7HEBWPxQnkIE7o9JH1gLv0+HzmRxS8FRaNDLG8Bk3iSY=
X-Gm-Gg: AYBFou1M17kadmY5qdTc4m2f6W43125Up4esLG0tL7N56PPnVIvxCKPLYWyXbeFHrMh
 UNIE8OVvHLEOjo+F2OnsL0mWoT8CjHYIHf1qnefUea78uRWXnToyglmqw34ZAX8NFSeaT3XpVCY
 98mZg5CecoDsRBwi0BfgPB23a3OgQQ/jsNrH5+wTima857HqoyzvrnQjymEo5cuy4cpAteYIpo0
 1SlTKcvuPby4M6OBYCe0MMT0eqPGNbm5c8J/RzbQhnt4q6tmxcnglmWpbosz5i5WP1xDy+2++36
 UxhoD/z6pEaWzRHP3onYALwIG3t17R2fGX24BvJC4pqY95+e4/mtjMcIC0mVJXBxJ25EDFknY0a
 EucfTIF9bHewT9DE4vuxnhuRmIyxGK1Bj4MwvcDtkKE1mMOh2JBecZl3T58S83Ekg/0qcIuHLWM
 TQQl0GQ8LCI1uj8EM3/RVmiuikNXRNIiTCSvSBR/xZ315Bap3ROIed6hyOvhXR0RD5S5R7ip03N
 l0VwyLnAFPvi/d/BCjR7EQBUGxq6RACUEBCArk+lL2A7FNIf85HLs7OaPJRxFnulLyR64DSWOfR
 DmIK5Vdoeqn5D+Tv9UGxfr/114vSrcPFMQ==
X-Received: by 2002:a05:600c:8a08:b0:4a1:96cd:2f72 with SMTP id
 5b1f17b1804b1-4a196cd3235mr41126595e9.2.1791709110670; 
 Sun, 11 Oct 2026 01:58:30 -0700 (PDT)
Received: from ?IPV6:2001:1aeb:401:dd00:a87:9755:c250:f5ef?
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18f3b43efsm232633335e9.1.2026.10.11.01.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 01:58:30 -0700 (PDT)
Message-ID: <4e851ec0-2e10-44cd-9232-1a52c1a4341c@mind.be>
Date: Sun, 11 Oct 2026 10:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>
References: <20261011084334.667976-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20261011084334.667976-1-thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH 1/2] utils/generate-cyclonedx: avoid
 f-string usage
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Quentin and everyone,

On 11/10/26 10:43, Thomas Perale via buildroot wrote:
> The argparse library documentation [1] suggest the usage of
> '%(default)s' in the help text to refer to the default value of the
> argument.
>
> This has the benefit of making it not mandatory to update the help text
> if the default value of the argument change.
>
> [1] https://docs.python.org/3/library/argparse.html#help
Even better, we could use //argparse.ArgumentDefaultsHelpFormatter, see 
https://docs.python.org/3/library/argparse.html#formatter-class

So, slightly earlier in the file, we would have:

parser = 
argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)

Which automatically inserts the default value to the help text, without 
having to add it by ourselves

Kind regards,
Titouan
>
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 98009cef98..e8dcfa8518 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -545,7 +545,7 @@ def main():
>                           help="Specify the project version to use in the SBOM metadata (default: builroot version)")
>       parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
>                           choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
> -                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
> +                        help="Set CycloneDX version (default: %(default)s)")
>   
>       args = parser.parse_args()
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
