From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Oct 2017 01:11:54 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171017210354.38d89b3c@windsurf.lan>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan> <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
 <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
 <20171017210354.38d89b3c@windsurf.lan>
Message-ID: <ff04b0db-d3d5-2314-9d9c-3ead377eb981@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-17 21:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 17 Oct 2017 16:44:04 +0200, Arnout Vandecappelle wrote:
[snip]
>> Isn't it enough to observe the -j in MAKEFLAGS?
> 
> Interestingly:
> 
> all:
> 	@echo $(MAKEFLAGS)
> ifneq ($(filter -j%,$(MAKEFLAGS)),)
> 	@echo "BINGO"
> endif
> 
> Never shows BINGO when called with "make -j2" even if the echo
> $(MAKEFLAGS) does show that -j2 has been passed. Also a:
> 
> $(warning $(MAKEFLAGS))
> 
> shows an empty value.

 Right! MAKEFLAGS is only initialized when calling a subprocess, and it anyway
doesn't contain the literal flags passed to make.

 It looks like there is no way to observe the flags passed to make :-(

> 
>>  I'm not convinced we want to add this option automatically, however, because it
>> makes it more difficult for people who don't want it. Why not add it to
>> utils/brmake, for example, and point people there in the documentation of
>> top-level parallel build?
> 
> Sorry I lost you here :/

 I mean that maybe the user doesn't want to gather the output with -Orecurse or
-Otarget but really wants -Onone. If you hardcode -Orecurse in the Makefile,
it's impossible for a user who does want to see output immediately.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
