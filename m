From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Oct 2016 17:11:05 +0200
Subject: [Buildroot] [PATCH 00/30] Splitting the toolchain-external
 package
In-Reply-To: <20161025165404.2c91f30b@free-electrons.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
 <f0262d9f-d9e0-9690-7a51-a094dd57c06b@mind.be>
 <20161025165404.2c91f30b@free-electrons.com>
Message-ID: <e1154660-3e25-d1fc-1279-738e7d5c110e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-10-16 16:54, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 25 Oct 2016 16:26:19 +0200, Arnout Vandecappelle wrote:
> 
>>> Then all toolchain packages are introduced but are not yet used since
>>> the new toolchain-external infra will be added latter.  
>>
>>  Meh, I don't like that. You should introduce the infra and then convert the
>> toolchains one by one. Or is there some reason why that is difficult?
> 
> This is not possible if you want a bisectable patch series. You can't
> have some of the toolchains handled by the old stuff, and some of the
> toolchains handled by the new stuff, because the entire point of the
> series is to replace the toolchain-external package from a real package
> to a virtual one. So this has to be done in one go. You can't have the
> Linaro toolchain living as a separate package, whose build is triggered
> by the toolchain-external virtual package, and at the same time the
> Sourcery toolchain handled in the old way, directly within the
> toolchain-external package.
> 
> I originally did the patch series, and turned this around many times,
> and what Romain is proposing here is really the only reasonable way
> that I could find.

 I figured there had to be a reason, but it wasn't documented :-)


>>> Before introduce the new toolchain-external infra, some specific
>>> functions and logic are moved into a separate file (toolchain utility,
>>> toolchain wrapper, variables definition, uClibc, musl and bfin).  
>>
>>  This part I don't like either. For me, splitting into separate files
>> *decreases* readability and ease of use, because you have to consult these
>> different files to understand what's going on. Splitting is useful when:
>>  - there is a really clear separation of concerns (e.g. pkg-cmake and
>> pkg-autotools are clearly unreleated);
>>  - or the same "code" is "called" from several places (e.g. the pkg-generic
>> infra is used both by pkg-cmake and pkg-autotools);
>>  - or the file becomes really large (top-level Makefile is more than 1000 lines).
>>
>>  For me, pkg-toolchain-external*.mk is all really closely related so it can go
>> in one file.
>>
>>  In addition, I don't like that all these pkg-toolchain-external*.mk files are
>> included in no particular order from the top-level Makefile with 'include
>> toolchain/*/*.mk'. In fact pkg-toolchain-external.mk defines
>> toolchain-external-package and it gets used by toolchain-external.mk (that
>> includes toolchain/toolchain-external/*/*.mk). So if toolchain-external.mk
>> happens to get read before pkg-toolchain-external.mk, things will fail
>> miserably. I believe we've had problems with that before, haven't we?
>>
>>  So, my proposal would be to either keep everything together in
>> toolchain-external.mk, or move pkg-toolchain-external.mk one level up (then it
>> gets included before toolchain/*/*.mk).
> 
> I'm personally fine with your proposal, we can keep everything in
> pkg-toolchain-external.mk, both the infrastructure itself and all its
> helper functions.

 OK! So, do you prefer Romain to respin, or will you just apply and we fix later?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
