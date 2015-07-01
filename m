From: Andreas Naumann <dev@andin.de>
Date: Wed, 1 Jul 2015 09:30:21 +0200
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <1591189778.2367426.1435680365451.JavaMail.root@openwide.fr>
References: <1591189778.2367426.1435680365451.JavaMail.root@openwide.fr>
Message-ID: <5593970D.3000707@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

Am 30.06.2015 um 18:06 schrieb Jeremy Rosen:

>>> Our approch was mainly to have each package (on the buildroot side
>>> have its own RFW scriptlet and have buildroot assemble these
>>> scriptlets at make time to provide a test for the resulting system
>>> that would only contain the tests for whatever package was actually
>>> compiled in.
>>
>> At some point I indeed though of having some per-package test cases
>> directly in package/<foo>/, for each package. But you also anyway
>> need
>> to describe a complete Buildroot configuration for each test, in
>> order
>> to have a complete system that actually boots and make sense.
>>
>
> yes and no... your approch is targeting the autobuild system, I was more
> thinking of providing tests for a user's own configuration or a
> semi-randomly generated config. Easily testing on real hardware was
> also part of the idea.
>
> If we want to combine the two, there would be a need for a base, bootable
> config (for example based on qemu) with a randomized overlay.
>
> The per-package part would help mainly with the randomly added packages.
> That would not prevent to also have a package independant base of test
> for the most basic functionalities. Per-Package also has the advantage
> that the tests will be maintained with the packages, thus by the people
> with the knowhow of what is being tested.
>
> overall I don't really see a reason not to have both approch. they are
> not really exclusive...
>
> now, one of the big difference is that you have host tests and target
> tests intermixed. That is a bit problematic if one wants to use your
> framework on a real board since the part responsible for starting
> the card and login is intermixed with the test. Again, my use-case is
> slightly different from yours. Having host-side tests is interesting
> and something we hadn't thought of. It should not be very hard to add
> with a RFW approch if we go in that direction

I agree with most things above and indeed, what to test is not exactly 
that same in our approach and buildroots. But I think it's very possible 
and beneficial to combine the efforts.
E.g. the deploy routines for our boards differ quite a bit. We solved 
this by implementing the same keyword in different (target-specific) 
resources, so the testcases using it doesnt need to change. When running 
the tests, we supply a DUT-specific variable file which then takes care 
of importing the correct resources with the applicable deploy step (and 
setting HW capabilities, and so on).

>
> separating the target and host test (whatever approch is taken) seems
> like a good idea to me, a way to override/disable the boot/login part
> would allow users to run your tests on real hardware. That seems like
> a good idea independantly of the framework used.

This is something that can easily be done via tags and then just run 
--include host* or --include target*


>> I've released my code with the intent that others can have a look and
>> get a clear view of what the prototype looks like. Without seeing how
>> it looks with RFW, I can't really make up my mind on whether it is a
>> good alternate solution or not.
>>
>
> Denis reimplemented an infrastructure to redo your tests. The complete
> infrastructure can be found here :
>
> https://github.com/etkaDT/Rfw-buildroot-tests
>
> Note that this is still a quick and dirty job that is not integrated
> into buildroot, but it can start the custom qemu to test things on
> the target. A better integration could lead to easier keywords etc.
>
> Denis also included the output of running the python package test in
> the output/ subdirectory. The RFW specific XML is quite interesting
> because it contains the complete decomposition of keywords and how
> they failed (there is a failed test in the example)
>
> (Denis is the Open Wide trainee working on buildroot this summer,
> he is the one pushing the scanpypy patch and the related
> robotframework package)
>
> We hope this helps with the overall debate.

Well, great to have another RFW implementation to look at and learn! 
Remarkable also that you guys implemented the qemu part while I did the 
building part without even talking about it :)
One obvious difference is that you create a large number of small almost 
atomic testcases while my testcase contain more of the steps that you 
probably would put into the prepare step. But I like the much more 
detailed report this approach leads to. Since RFW provides only for one 
keyword in the prepare step, this probably leads to having one 
prepare-keyword for almost every suite.
So far I'm using a global keyword 'Connect And Login' in all my suites, 
but it may be helpful to change that.

Btw, what Editor did you use for the creation?


regards,
Andreas



>
>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
