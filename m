Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B4DD0D160
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05DA98037D;
	Wed,  7 Jan 2026 18:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUAY7PaO2keB; Wed,  7 Jan 2026 18:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 283FD810AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767810047;
	bh=1b1oy7Ve7xsNz2NqSw4J/9fDnvSbwKjq938O0LcNsiY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r04fKyJht923Z/1bigbh1jOc3I5sfB6wrH/Gf5hGNvZiXpZbsD8HwJqYlyu6NIaDV
	 JLh5Au/AVJT7KvQ0wG521pE2uE3ECVVH8nZkyKPd+yBQ+KL4Dy9sC8qzXvQhJj+Am1
	 SShWLzacaeaCepbzQZf5WWwwBsD/0JgGP4xHIEABJHa6SQm9XXhrIX6HkJq9Ia71py
	 A4JAYc2/I1O9cPQhFJ6kZsV62LajM66HX7MZlp9gf1zjW4J+KOlS7bnYfiwf2TZYMX
	 nFIMrnh4Z4GNNyZPABYZ9rABiCATFy5RAq0J/4lq4Tm4l9Yn99mh4z9AernjgZ4IIx
	 Y8hWare6B+CUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 283FD810AC;
	Wed,  7 Jan 2026 18:20:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06A1D25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D460E40421
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXh4ChIqqKnv for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C53574092E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C53574092E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C53574092E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:20:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 84A4E13F8B8;
 Wed,  7 Jan 2026 19:20:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 Jan 2026 19:20:40 +0100
MIME-Version: 1.0
Date: Wed, 07 Jan 2026 19:20:40 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>, Alexander
 Shirokov <shirokovalexs@gmail.com>
In-Reply-To: <20260107150725.10c0fba7@windsurf>
References: <20260106231110.991548-1-ju.o@free.fr>
 <20260107150725.10c0fba7@windsurf>
User-Agent: Webmail Free/1.6.12
Message-ID: <e3de047e16c5cef704e38aaf77c38ef2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767810042;
 bh=w2djeYbZFvVjDWv7Q7HqS+ionyRHzM9TF83h+jeIz38=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pXk++XGS0eACqNzjkEPCD7s4nSPNpAawKLp4BgBz2jekxVzItSFKYq4Cf09rSGXhX
 Hw7JgHZhu6/2FRKnJcTQf2TsPD+CJM93501k0lmGYNLfJyppTEcaYb89mujo9G0099
 EYXYSrp6PA/J00wwwB++DV6ApVfXWK2tCA0bWEk5IAorfjKT5TVs9e5vPsY7crmN4M
 v4PRdM8DbgGVt8eVDHx9nRpI9++js4rJPGkFbqYYG7TbEH+jCJqfAen2XPDD9/hyty
 +asKCo6sg0KnfFrWe8+4NIoPL7PVaMMFAM6ep6ZBrk/VipGDGWN+ToxI1JD7vm2deL
 7oKSfnhFMm6cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pXk++XGS
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add aichat runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 07/01/2026 15:07, Thomas Petazzoni wrote:
> Hello Julien,
> 
> Thanks for the patch! Obviously looks good, just one question.
> 
> On Wed,  7 Jan 2026 00:11:10 +0100
> Julien Olivain via buildroot <buildroot@buildroot.org> wrote:
> 
>> +    def test_run(self):
>> +        self.login()
>> +
>> +        # Check the program can execute.
>> +        self.assertRunOk("aichat --version")
>> +
>> +        # We define a Hugging Face model to be downloaded.
>> +        # We choose a relatively small model, for testing.
>> +        hf_model = "ggml-org/gemma-3-270m-it-GGUF"
> 
> Does this mean that the model will be downloaded by llama-server when
> we run it? I don't think we expect tests to require a network
> connection to the Internet, and download "random stuff".
> 
> Or did I misunderstand your comment?

Your understanding is correct:
llama-server has the capability to download the model from Internet
if not available locally. This is what is happening here.

I am not sure if there was a strict rule forbidding public network
to runtime tests.

I think Yann started to add runtime tests with such public network
requirement a while back. See [1] [2] [3] [4]. I'm just following
his steps ;) This is also what motivated commit [5] for example.

I think the argumentation was that the test runner needs Internet
connectivity anyway to download source packages. Most runtime tests
does not require network connection, so I though it was more a fact
than a strict rule. Some tests (like podman, etc.) will have a better
coverage if they are working with their online repositories.

Regarding the data and its source, I would not exactly call that
"random stuff". Hugging Face [6] is a reference repository used
by llama.cpp. Also, this model [7] in particular is a smaller
version of the llama.cpp example in [8]. Note that ggml-org [9]
is reference library for llama.cpp.

Do you want me to send a v2 adding this justification?

Or do you prefer to (re?)open the topic to strictly forbid network
in runtime tests?

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,

Julien.

[1] 
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/testing/tests/package/test_distribution_registry.py#L80-85
[2] 
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/testing/tests/package/test_docker_compose.py#L42-43
[3] 
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/testing/tests/package/test_podman.py#L97-98
[4] 
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/testing/tests/package/test_skopeo.py#L50-54
[5] 
https://gitlab.com/buildroot.org/buildroot/-/commit/cf8641b73e7f1577637bfef0ece78dd519b25d19
[6] https://huggingface.co/
[7] https://huggingface.co/ggml-org/gemma-3-270m-it-GGUF
[8] 
https://github.com/ggml-org/llama.cpp/blob/b7271/README.md?plain=1#L53
[9] https://github.com/ggml-org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
