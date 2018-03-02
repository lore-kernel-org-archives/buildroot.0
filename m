From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Mar 2018 09:19:25 +0100
Subject: [Buildroot] [NEXT 06/26] boa: add CPE id
In-Reply-To: <CANQCQpbzWdfmXe-6dJuWzNM0S_DgVYDazFC2_ZsdbVnA3WHcEQ@mail.gmail.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-7-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227231718.090c22ef@windsurf.lan>
 <CANQCQpbM3VHid2rGTFAA=HwkhsUfmHRbGw9EDtT2dPUWwQRDog@mail.gmail.com>
 <20180228073827.312a9a6f@windsurf.home>
 <3a17ac42-e24b-149d-30d3-654545e8c1eb@mind.be>
 <CANQCQpbzWdfmXe-6dJuWzNM0S_DgVYDazFC2_ZsdbVnA3WHcEQ@mail.gmail.com>
Message-ID: <8245f0c5-94fc-a0b3-9710-8c0c779dcbdd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-03-18 23:55, Matthew Weber wrote:
> Arnout,
> 
> On Thu, Mar 1, 2018 at 2:47 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>> Indeed, when someone bumps a package, will they have to verify if the
>> new CPE ID is still valid? If it isn't, what should be done? Report to NIST, of
>> course, but while the database isn't updated, should we just remove the CPE_ID
>> or what?
> 
> We did walk this discussion a bit a developer day.  I think the
> feeling was we document the process of suggesting a update to NIST.
> We may catch that the version bump doesn't have a CPE before merge but
> if we don't, we have a nightly/weekly script which runs to check
> current buildroot CPEs vs their pkg versions for validity.  Then send
> an email to the DEVELOPERS asking them to submit the update to NIST
> (we can have the templated for them to just cut/paste/send).  There
> will be gaps between when a version bumps and the CPE is invalid, that
> should be ok.  We could make it a goal to have the LTS/releases all
> have valid CPEs before they go out (pks-stats helping us).
> 
> So in retrospect (even against my v2), I'd argue we should just report
> everything as the script we'll propose soon with find the CPEs without
> a NIST entry and we can choose to email the DEVELOPER or catch that as
> part of a pkg-stats like activity.

 Just to be clear about what you're saying here: in v3, you'll making it so that
nothing has to be done explicitly in the package to get a CPE ID, but it may be
(and probably will be) invalid? So that the initial report will contain a huge
amount of invalid entries, and we can fix them one by one?

 I realize I'm contradicting myself, but that still leaves us with a problem (or
rather, limitation). We have no way of keeping track of which packages have been
checked and which haven't, so we have no way of keeping track of which ones are
broken.

 Or perhaps the pkg-stats script could eventually check the entry in the CPE
database, and add a column to indicate that it's valid or not?


>>  To help a bit with deciding on this, it could be nice if you could add an RFC
>> patch with a script that takes the cpe-manifest.csv and outputs something real -
>> i.e., a list of open and closed CVEs.
> 
> Ok but the goal I'm shooting for is just a mostly accurate list and a
> way to try and improve that metadata over time.  It won't be perfect.
> A good example of this are the duplicate CPEs, over time they can be
> discarded as we validate they are legacy and no one is cataloguing
> things against them.  Until they're removed, we will have no-hits on
> most of the duplicates in whichever tool a person uses to do their CVE
> checking.
> 
>> The latter will also help to evaluate to
>> what extent this whole thing is useful. In other words, how accurate is that
>> generated list? It's a question we had ad the BR developer meeting and which
>> still remains unanswered IMO.
> 
> The CPE list will be as accurate as people using it update the NIST
> entries, either manually or as Buildroot nudges them to send an email.
> The CVEs those CPEs will find is another complete story and most open
> ways of searching for those don't concluded clean results without a
> good amount of manual intervention.

 Yes, I do realize that this is a kind of catch-22 situation, if nobody uses the
database then obviously it will not be up-to-date. But to be honest, right now I
don't even really understand what kind of information you can get from it even
in the ideal case. That's why I asked to post an RFC script, so we can get some
idea of what the end goal is (and ultimately, whether this is worth the effort).

 Instead of posting a script (e.g. if you don't have that script, or you're not
allowed to redistribute it), you could also describe in the cover letter what
additional steps you have taken to get your final CVE list, and some statistics
about e.g. how many additional CVEs you find with manual checking. And maybe
also mention the commercial tools you've used (if you're allowed to do that). Or
even better, if there are any FLOSS tools, point to them.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
