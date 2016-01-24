From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Jan 2016 02:04:33 +0100
Subject: [Buildroot] [PATCH] support/graph-depends: detect circular
 dependencies
In-Reply-To: <20160123230027.GE3363@free.fr>
References: <1453586685-24190-1-git-send-email-yann.morin.1998@free.fr>
 <20160123232121.10d1ffe3@free-electrons.com> <20160123223112.GD3363@free.fr>
 <20160123230027.GE3363@free.fr>
Message-ID: <56A42321.9070104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-01-16 00:00, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-01-23 23:31 +0100, Yann E. MORIN spake thusly:
>> On 2016-01-23 23:21 +0100, Thomas Petazzoni spake thusly:
>>> On Sat, 23 Jan 2016 23:04:45 +0100, Yann E. MORIN wrote:
>> [--SNIP--]
>>> I am a bit worried about the algorithmic complexity of this new
>>> function. As you know, we had issues with other parts of graph-depends
>>> having a too high algorithmic complexity to handle large
>>> configurations, or configurations having specific patterns of
>>> dependencies.
>>>
>>> Have you measured the time impact of this new check on a very large
>>> configuration (like allyespackageconfig) ?
>>
>> I have an allyespackageconfig with an recent toolchain so I get a lot
>> of packages, and I tweaked the config to disable a few to enable others.
>>
>> And no, the speed impact is not measurable for me. I'll come up with
>> numbers (of course, when there's no loop!) a bit later.
> 
> Damn, I spoke too fast. The speed was totally fine as long as there were
> those circular dependencies I was hunting for.
> 
> But without any circular deps, the speed is awfull and totally
> inacceptable.
>
> I'll see what I can do to speed this up.


 Naive cycle detection is exponential. See [1] for a pythonese implementation of
single-visit cycle detection. Note that you have to do it on the whole graph at
once, not once per node, for this to work.


> One option is to not do the check in graph-depends, but to off-load that
> into the package infrastructure, so we detect them even earlier.

 It's going to stay equally exponential when you do it in make... And since make
already has cycle detection, I don't think it makes much sense to add a custom
one there. What more is your custom cycle detection going to tell you? Ah, yes,
you want it to show the entire cycle instead of just the place where it
arbitrarily cut it. Hm, I think graph-depends is still a better place for it -
the make logic is going to look _very_ ugly.


 Regards,
 Arnout

[1]
http://codereview.stackexchange.com/questions/86021/check-if-a-directed-graph-contains-a-cycle


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
