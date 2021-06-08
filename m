From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jun 2021 18:36:44 +0200
Subject: [Buildroot] [PATCH] package/netperf: move SITE so s.b.n
In-Reply-To: <874ke9xw4j.fsf@dell.be.48ers.dk>
References: <c160b9eba623c54debf9bf50d69cca4a6d6ed69e.1622119840.git.baruch@tkos.co.il>
 <7d24aa70-74c4-1166-e69f-5d8c7a5c6875@mind.be>
 <a7969129-6272-575d-0846-1874629cebc4@mind.be>
 <87v96wrw9p.fsf@tarshish> <87tumbxxu9.fsf@dell.be.48ers.dk>
 <8fac0332-92aa-9545-7a30-afa8194e0d56@mind.be>
 <874ke9xw4j.fsf@dell.be.48ers.dk>
Message-ID: <20210608163644.GN168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-06-07 22:22 +0200, Peter Korsgaard spake thusly:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  >  Wouldn't it be possible to route sources.buildroot.org through cloudflare as well?
> It would, but there were some complications back when we set it up,
> E.G. you need to use cloudflares DNS servers and we didn't originally
> have control of the buildroot.org.
> 
> Only having cloudflare on one of the domains was also quite handy for
> comparing behaviour when debugging in the beginning.
> 
> But yeah, we should probably use the same setup for both domains now. We
> originally put Cloudflare in front because of bandwidth/latency issues
> with s.b.o for some users. Given that Cloudflare is a bit controversial,
> it is maybe worth checking if we should keep on using it or drop it.

I think we should keep s.b.n, and that we should keep it as the default
in all our settings: backup mirror, _SOURCES...

Also, I think we should keep s.b.o as uncached, so that we have a
fallback.

> According to the Cloudflare stats, ~45% of the requests are cached,
> saving ~1TB traffic/month.

I have really no idea whether a less-than-half cache-hit ratio is good
or not, especially for our use-case.

However, is this 45% ratio a hit ratio, or a volume ratio?

Also, how much of those are due to our autobuilders? To packages without
_SOURCES pointing to sbn (i.e. actual fallbacks)?

> Thomas, I think you had performance issues in the beginning, can you
> compare speed again?

Here are a few totally non-scientific tests, done on a machine that has
no caching proxy, and a direct 1Gbps connection to the internet; both
URLs where downloaded using wget:

http://sources.buildroot.net/linux/linux-cip-4.19.98-cip19-rt7.tar.gz (CDN)
  - first run (uncached?):  2021-06-08 18:21:12 (6.08 MB/s) - ?linux-cip-4.19.98-cip19-rt7.tar.gz? saved [161511299/161511299]
  - second run (cached?):   2021-06-08 18:21:20 (88.5 MB/s) - ?linux-cip-4.19.98-cip19-rt7.tar.gz? saved [161511299/161511299]

http://sources.buildroot.org/linux/linux-cip-4.19.98-cip19-rt7.tar.gz (direct)
  - first run (uncached?):  2021-06-08 18:22:40 (4.36 MB/s) - ?linux-cip-4.19.98-cip19-rt7.tar.gz? saved [161511299/161511299]
  - second run (cached?):   2021-06-08 18:23:00 (16.0 MB/s) - ?linux-cip-4.19.98-cip19-rt7.tar.gz? saved [161511299/161511299]
  - third run (cached?):    2021-06-08 18:24:00 (17.2 MB/s) - ?linux-cip-4.19.98-cip19-rt7.tar.gz? saved [161511299/161511299]

http://sources.buildroot.net/linux/linux-cip-4.19.98-cip19-rt7.tar.gz (CDN, again)
  - third run (cached?):    2021-06-08 18:24:17 (92.1 MB/s) - ?linux-cip-4.19.98-cip19-rt7.tar.gz? saved [161511299/161511299]

So, basically, the unseeded s.b.n is ~50% faster than unseeded s.b.o.
But once seeded s.b.n is ~20 times faster than unseeded s.b.o, and even
~6 times faster than seeded s.b.o.

So the CDN (s.b.n) does have a positive impact.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
