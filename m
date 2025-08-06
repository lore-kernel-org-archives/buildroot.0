Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E4FC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 16:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12393412F8;
	Wed,  6 Aug 2025 16:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jsw_4k3FT6ht; Wed,  6 Aug 2025 16:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE76412D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE76412D3;
	Wed,  6 Aug 2025 16:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 806E2D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CC32412D3
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEhAtVYJyioR for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 16:25:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29E4140FCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E4140FCA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29E4140FCA
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:25:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 566607674; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 16:25:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujgxD-00H6Kn-0w;
 Wed, 06 Aug 2025 18:25:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
 <20250716093401.1213358-2-fabien.lehoussel@smile.fr>
 <87pld8im6v.fsf@dell.be.48ers.dk>
 <CAKWtHtxtsJz14bqoO1MqhC3m7SpfNn1DvYPbJLSTEAS_oATKUw@mail.gmail.com>
Date: Wed, 06 Aug 2025 18:25:27 +0200
In-Reply-To: <CAKWtHtxtsJz14bqoO1MqhC3m7SpfNn1DvYPbJLSTEAS_oATKUw@mail.gmail.com>
 (Fabien LEHOUSSEL's message of "Wed, 6 Aug 2025 18:05:12 +0200")
Message-ID: <878qjwifig.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YpKcbZFz+Z49WyY2l6jHZm4sXUALBtdYvCVmidqZs1M0XEZqDTO8jwHnnZbMbvwpEzBL5VjrHDmm1/6dayImuUcMHqryBQiVJkr+9mSN0q4sCkSA8qZ9rXli9auFhZHDYgMp6czbC8ZMCNLbTH3wGe0IqxykHzoY/CEPSdRWUxCFwcxTMkG1s/17YMmRUajos0rE7DOuWzNFt4FJPqJ7CurXQSyZZDM8EugOGzCrd8Yk/0Cx9XYnZTnZpRkf8cRI8FdhAhyXJqt0a5xBhTL5+DPijA5B6K44dKCPNEeB3hRTReUgfR6N2DhBBgc3TA64TMEvshloc7m+6+/sQgqYAA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=PCj7yAprO2HdNNEeXMRXZN4oaKk3706oDgE/wPso+/Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YpKcbZFz
Subject: Re: [Buildroot] [PATCH v2 2/5] utils/generate-cyclonedx: update
 package filtering
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabien" == Fabien LEHOUSSEL <fabien.lehoussel@smile.fr> writes:

Hi,

 >> > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
 >> > index 08c591e86b..14f655bca2 100755
 >> > --- a/utils/generate-cyclonedx
 >> > +++ b/utils/generate-cyclonedx
 >> > @@ -277,8 +277,7 @@ def main():
 >> >                          default=(None if sys.stdin.isatty() else sys.stdin))
 >> >      parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
 >> >                          default=sys.stdout)
 >> > -    parser.add_argument("--virtual", default=False, action='store_true',
 >> > -                        help="This option includes virtual packages to the CycloneDX output")
 >> > +
 >> 
 >> 
 >> I am not sure exactly what the use case is of --virtual, but why remove
 >> it?

 > Don't know, I didn't understand what it was for, but this is not
 > compatible with the new filter.
 > Does anyone have the answer?

I guess we _COULD_ define "virtual" as anything without a SITE, but I
also don't really see the use case for this option, so I would be OK
with dropping it.

Thomas/Arnout?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
