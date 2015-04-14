From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 21:14:02 +0200
Subject: [Buildroot] [PATCHv2 08/21] Makefile: use the package infra
 based external-deps
In-Reply-To: <20150414140519.03a3bdd6@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1428856685-4403-9-git-send-email-thomas.petazzoni@free-electrons.com>	<552C5ADB.6020509@mind.be>	<20150414095202.7850ba00@free-electrons.com>	<552CF861.50004@mind.be>
 <20150414140519.03a3bdd6@free-electrons.com>
Message-ID: <552D66FA.4080707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/04/15 14:05, Thomas Petazzoni wrote:
> Arnout,
> 
> On Tue, 14 Apr 2015 13:22:09 +0200, Arnout Vandecappelle wrote:
> 
>>  Ah yes, silly me. I just _assumed_ that external deps would have been 
>> implemented like:
>>
>> $(1)-external-deps: $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-external-deps)
>>
>> instead of passing through -all-external-deps. I just tested that the
>> above gives exactly the same result as the -all-external-deps version.
> 
> I might be missing something here, but I don't see why your version
> would be any different than the -all-external-deps version I've
> proposed.

 That's because I shouldn't be doing two things at once :-)


> Except that $(1)-external-deps would not behave as I would
> expect it to behave: give only the list of external deps for $(1), not
> recursively for all dependencies of $(1). But except that I don't
> really see the difference.

 Ack. I had interpreted pkg-external-deps as give me all the sources I need to
be able to build package, but your interpretation makes more sense.


> 
>>  The other reason why there are duplicates is because host packages and
>> target packages (usually) have the same sources, so they will be listed
>> twice. That's more difficult to get around.
> 
> I believe this is more likely to be the reason: if you look back at my
> examples, I never got more than twice the same package. So we're
> probably hitting the target vs. host package thing.
> 
> Is there anything that we can do about it besides keeping this | sort
> -u ?

 Not really I think. We'd have to make host-pkg-external-deps depend on
pkg-external-deps instead of defining it directly. But that means that the
host-generic-package macro would have to add the plain pkg-external-deps if it
hasn't been defined yet (for host-only packages).


 Regards,
 Arnout

> 
> Thanks,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
