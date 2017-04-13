From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Apr 2017 00:14:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-04-09
In-Reply-To: <20170413053406.GA4103@tungsten.ozlabs.ibm.com>
References: <20170410062848.062C02803A@b01ledav001.gho.pok.ibm.com>
 <20170411010019.GA2638@tungsten.ozlabs.ibm.com>
 <20170411144331.699becca@free-electrons.com>
 <20170412095212.1A18EB2050@b01ledav03.gho.pok.ibm.com>
 <20170413053406.GA4103@tungsten.ozlabs.ibm.com>
Message-ID: <54038d3c-376b-b5cb-d4d2-671d1119d722@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-04-17 07:34, Sam Bobroff wrote:
> On Wed, Apr 12, 2017 at 11:51:41AM +0200, Arnout Vandecappelle wrote:
>>
>>
>> On 11-04-17 14:43, Thomas Petazzoni wrote:
[snip]
>>> There is a -Wl,-rpath,/usr/lib in the link command link that isn't
>>> correct. This means that the compiler will try to link against the host
>>> ncurses if available, which is bad.
>>
>>  I suspect that that is there just because ncurses wasn't detected. But I could
>> be wrong.
> 
> (I saw the bad rpath even on my successful builds -- I'll see if it's
> easy to fix, since I'm looking at it anyway.)

 I don't think the rpath is wrong. For the target, it *is* indeed /usr/lib.
AFAIU the RPATH is *not* used as an extra -L equivalent at link time, except
when -rpath-link is given.


> So it seems fairly clear now: there is a circular dependency in that set
> of packages and GNU make's behaviour is to drop a dependency and
> continue building, so we end up building readline configured with
> ncurses, with no ncurses, so it fails.

 Yes, Matt is looking at it.


> (IMHO this is very poor behaviour from GNU make: it seems to be
> knowingly producing a broken build but exiting with success, and the
> only indication is one fairly innocuous looking line of output. There is
> no option to convert that warning into a fatal error! I even checked the
> source :-( )
> 
> So, what do we do? It seems like it would be nice to catch any circular
> dependency but is there any good way to do that? I don't like the idea
> of running make under grep looking for "errors", or trying to manualy
> detect circular dependencies either... Has this been explored already?

 Yes it would be nice to error out on circular dependencies. Also in Kconfig, by
the way.

 Our graph-depends detects circular dependencies in the Makefile, so we could
add it to autobuild-run (prior to the build).

 For Kconfig circular dependencies, I think we can only do string search. But
these are usually detected manually pretty quickly. And are also better detected
with a lot of 'make randconfig', that is going to show problems a lot sooner
than the autobuilders.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
