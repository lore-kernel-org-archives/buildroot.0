Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCFBE8305F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B8C81140;
	Tue,  3 Feb 2026 08:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1a8Fkc_I1-I; Tue,  3 Feb 2026 08:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BFB680FAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770107398;
	bh=zu3m0qu26Bl5BRoJwtNnyO0/ilqQP/Z/lZD9tZUenak=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dyd76OamKSwGCzs/ivNAJXAUToIkPNls4e2tfXMpBDDjorfWtPT1SCk5zmDkDROgN
	 qwIW0B/qqjXdQ08LBvvsGiRpE9fn6le8K9xM+byWN48vj8h/0poPPWRk/dVGppLIyX
	 IyjVJYSNadgvXNI1D9MfPpfu2B1DseHNPetJuxhHYgg3eK3IQcS5dEF8pYwoZDqS6T
	 mRicURD77YjEhRTM4UCljKHzZzehJV8pyREmMlzQZwxmsk50skrPnpfJhIj9eq5j4W
	 8Z6Mrx4w5yyr1b2jqN6G0nE95Pf6h+VpE9bIaFLNdyAuQ/12HbDArrKRuKDqJV2zLP
	 ZxhdVDZWcOeAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BFB680FAB;
	Tue,  3 Feb 2026 08:29:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D98B5F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B87AF80C7C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtvLYNj_VCja for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35C0C80C72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C0C80C72
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35C0C80C72
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:29:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 480612003AE;
 Tue,  3 Feb 2026 09:29:48 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:39076])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Feb 2026 09:29:48 +0100
MIME-Version: 1.0
Date: Tue, 03 Feb 2026 09:29:48 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Julien Olivain via
 buildroot <buildroot@buildroot.org>, Alexander Shirokov
 <shirokovalexs@gmail.com>
In-Reply-To: <e3de047e16c5cef704e38aaf77c38ef2@free.fr>
References: <20260106231110.991548-1-ju.o@free.fr>
 <20260107150725.10c0fba7@windsurf>
 <e3de047e16c5cef704e38aaf77c38ef2@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <35ff2e66e3b8d0a2af778fea4bdc75da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770107391;
 bh=uk+pPGOt6SgQBj18rMkx7iHZ9Qij4kUbzWLixP2C9FU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X5bTaNBlxqSk8+s863O0dE9FUuzKkMAP0CAY6Mw6NbSzaOL+pJh/KAJkA8JJWVB9O
 X0jYgNvFVqf/LLePdwNbMz0RQMPBddKpbu3ygMDm6weTgGTuayvnvqJuvvK63IUiU2
 35BcO/VQQVY4gQpLNJP3EQdgCd8bR06cTdg2mh4+ZeXr1pZt6iKC2H777DgzEmmyI/
 Miqgb0RAzB1zRef1kNE8CtxQVwjTFROpyVpg6cg0AjIkqSfvuqE+nbp9DEwwmUNQno
 2n4NJoj0FSe0MqQeCGCLPwXN1JQngLqqm34J4lcUFEODXfA3fMzsA3ow4KZaT3L42N
 75rLqdLapPCKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X5bTaNBl
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

Hi,

On 07/01/2026 19:20, Julien Olivain via buildroot wrote:
> Hi Thomas,
> 
> On 07/01/2026 15:07, Thomas Petazzoni wrote:
>> Hello Julien,
>> 
>> Thanks for the patch! Obviously looks good, just one question.
>> 
>> On Wed,  7 Jan 2026 00:11:10 +0100
>> Julien Olivain via buildroot <buildroot@buildroot.org> wrote:
>> 
>>> +    def test_run(self):
>>> +        self.login()
>>> +
>>> +        # Check the program can execute.
>>> +        self.assertRunOk("aichat --version")
>>> +
>>> +        # We define a Hugging Face model to be downloaded.
>>> +        # We choose a relatively small model, for testing.
>>> +        hf_model = "ggml-org/gemma-3-270m-it-GGUF"
>> 
>> Does this mean that the model will be downloaded by llama-server when
>> we run it? I don't think we expect tests to require a network
>> connection to the Internet, and download "random stuff".
>> 
>> Or did I misunderstand your comment?
> 
> Your understanding is correct:
> llama-server has the capability to download the model from Internet
> if not available locally. This is what is happening here.
> 
> I am not sure if there was a strict rule forbidding public network
> to runtime tests.
> 
> I think Yann started to add runtime tests with such public network
> requirement a while back. See [1] [2] [3] [4]. I'm just following
> his steps ;) This is also what motivated commit [5] for example.
> 
> I think the argumentation was that the test runner needs Internet
> connectivity anyway to download source packages. Most runtime tests
> does not require network connection, so I though it was more a fact
> than a strict rule. Some tests (like podman, etc.) will have a better
> coverage if they are working with their online repositories.
> 
> Regarding the data and its source, I would not exactly call that
> "random stuff". Hugging Face [6] is a reference repository used
> by llama.cpp. Also, this model [7] in particular is a smaller
> version of the llama.cpp example in [8]. Note that ggml-org [9]
> is reference library for llama.cpp.
> 
> Do you want me to send a v2 adding this justification?
> 
> Or do you prefer to (re?)open the topic to strictly forbid network
> in runtime tests?

After discussing during the Buildroot Dev Days 2026, we decided
that runtime tests should avoid using network whenever possible.
But in cases where a tool functionality depends on the network,
it could be used.

So for this reason, I applied this patch.

>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
> 
> Best regards,
> 
> Julien.
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/testing/tests/package/test_distribution_registry.py#L80-85
> [2] 
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/testing/tests/package/test_docker_compose.py#L42-43
> [3] 
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/testing/tests/package/test_podman.py#L97-98
> [4] 
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/testing/tests/package/test_skopeo.py#L50-54
> [5] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/cf8641b73e7f1577637bfef0ece78dd519b25d19
> [6] https://huggingface.co/
> [7] https://huggingface.co/ggml-org/gemma-3-270m-it-GGUF
> [8] 
> https://github.com/ggml-org/llama.cpp/blob/b7271/README.md?plain=1#L53
> [9] https://github.com/ggml-org

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
