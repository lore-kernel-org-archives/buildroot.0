From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Jul 2017 09:51:40 +0200
Subject: [Buildroot] [PATCH 04/14 v4] package/skeleton: split out into
 skeleton-custom
In-Reply-To: <20170728081834.5f4d349b@windsurf.lan>
References: <e095a88e-5e31-29d3-54de-4102990304e7@mind.be>
 <597aa94a233d0_33a1157f84015740@ultri3.mail>
 <20170728081834.5f4d349b@windsurf.lan>
Message-ID: <b3f1a1ab-93c5-24cf-5329-a19eeee9aa25@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-07-17 08:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 28 Jul 2017 00:02:34 -0300, Ricardo Martincoski wrote:
[snip]
>> Concerning the test infra (I say that including gitlab) we should choose a path
>> to follow:
>> 1) Use private runners
> 
> So it is possible to "contribute" as a private runner for your own CI
> projects hosted on the public Gitlab ?

 Absolutely! It is in fact more or less intended to be used that way, i.e. as a
company you let gitlab.com handle your repository, but you provide your own
machines to run tests.

 That is certainly one way to go. It would also allow us to do some additional
things that are currently impossible, e.g. generating the buildroot-base docker
image.


>> 2) Adapt timeouts when a test sporadically fails and keep using the gitlab
>> runners ([6] shows that we already use them)
>>
>> [6] https://gitlab.com/buildroot.org/buildroot/-/jobs/24184768
>>
>> I would go with option 2. We are not doing CI for now, so sporadic failures are
>> not a big concern IMO.
> 
> The idea of using Gitlab is (amongst other things) to leverage the
> public runners. That being said, sporadic failures are really not nice,
> because they always cause confusion.

 Agreed.


> Why don't we significantly increase the timeout, like to several
> minutes? In most cases, the test will be successful, and the expected
> output will arrive in a few seconds. It's only when there is a real
> problem in the test that we will hit the timeout, but in this case,
> having the test take a few more minutes is not a big deal.

 That's actually a very good idea.

 However, I do wonder if that will really help. Looking at the log of [1] again,
it really looks like for 15 seconds, the *only* thing going on was starting
getty. That makes me think that there must be something else going on than just
a timeout (increasing the timeout was my first thought as well).

 As it stands, things are rather hard to debug. Perhaps we should do something
like store the modified rootfs as an artefact so it can be downloaded and you
can extract the journal from it?

 Regards,
 Arnout


[1]
https://gitlab.com/arnout/buildroot/-/jobs/24489865/artifacts/raw/test-output/TestInitSystemSystemdRwFull-run.log


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
