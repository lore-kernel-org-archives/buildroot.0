From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Oct 2017 12:57:30 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171018085748.20a3a9f5@windsurf.home>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan> <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
 <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
 <20171017210354.38d89b3c@windsurf.lan>
 <ff04b0db-d3d5-2314-9d9c-3ead377eb981@mind.be>
 <20171018085748.20a3a9f5@windsurf.home>
Message-ID: <8dc16ff6-7184-262a-8564-7ab7e43412a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-10-17 08:57, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 18 Oct 2017 01:11:54 +0200, Arnout Vandecappelle wrote:
> 
>>  I mean that maybe the user doesn't want to gather the output with -Orecurse or
>> -Otarget but really wants -Onone. If you hardcode -Orecurse in the Makefile,
>> it's impossible for a user who does want to see output immediately.
> 
> Yes, hence my idea of BR2_PARALLEL_BUILD to preserve the existing
> behavior when it is disabled. However, the .config is not included in
> the top-level make invocation, only in the sub-make.
> 
> So, here is my plan:
> 
>  * Introduce BR2_PARALLEL_BUILD
> 
>  * Make the sub-make invocation mandatory. Right now it's only if the
>    umask is not correct or if O is not a canonical path. Let's just
>    always recurse into a sub-make, it costs essentially nothing.
> 
>  * Do a grep ^BR2_PARALLEL_BUILD=y in the config file in the top-level
>    make to decide whether we pass -Orecurse to the sub-make invocation.
>    If .config doesn't exist, then we don't pass -Orecurse because it
>    means we're about to configure Buildroot and we anyway don't care
>    about -Orecurse.
> 
> Thoughts?

 As I said a couple of times already, I don't think we should enforce -Orecurse.

 About the BR2_PARALLEL_BUILD option, it may be useful, but for the time being I
would continue asking the user to remove the .NOTPARALLEL line.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
