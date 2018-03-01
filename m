From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 1 Mar 2018 16:55:12 -0600
Subject: [Buildroot] [NEXT 06/26] boa: add CPE id
In-Reply-To: <3a17ac42-e24b-149d-30d3-654545e8c1eb@mind.be>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-7-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227231718.090c22ef@windsurf.lan>
 <CANQCQpbM3VHid2rGTFAA=HwkhsUfmHRbGw9EDtT2dPUWwQRDog@mail.gmail.com>
 <20180228073827.312a9a6f@windsurf.home>
 <3a17ac42-e24b-149d-30d3-654545e8c1eb@mind.be>
Message-ID: <CANQCQpbzWdfmXe-6dJuWzNM0S_DgVYDazFC2_ZsdbVnA3WHcEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Thu, Mar 1, 2018 at 2:47 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 28-02-18 07:38, Thomas Petazzoni wrote:
> >>> The drawback is obviously that all packages will suddenly have a
> >>> <pkg>_CPE_ID value, even if this value may potentially be incorrect
> >>> because it hasn't been checked. And this may be a real problem, so
> >>> probably your solution is better, I just wanted to point out the
> >>> (admittedly limited) duplication.
> >> Yeah, eventually I'd argue we could revert back to infra logic and
> >> clean it all up once there is a baseline or majority of packages with
> >> valid CPE IDs.    However for now, I default those we don't have to
> >> unknown so it's clear for a developer to go research or request a new
> >> CPE.
> > Yes, that is a possibility. As I said, I do realize that my proposal
> > has the significant drawback of not allowing to identify clearly which
> > package has a correct CPE_ID (voluntarily added by a developer) vs.
> > some potentially random CPE_ID (set by default by the package
> > infrastructure).
>
>  Well, this in the end boils down to the question: what are you going to do with
> that cpe-manifest.csv? I think that whatever script is going to use that file,
> it will have to be robust against CPE_IDs that don't actually exist in the CPE
> database.

Correct, from our experience so far, the free and paid tools which use
this data are flexible on duplicate or invalid entries.  The key is
how they store the analysis and the manual updates you put in after
the fact.  Most take that manual adjustment and help produce a better
analysis on the next run.  If we're looking at making a script to do a
CPE to CVE analysis as part of buildroot, I'd argue (at this point)
that is a fairly involved task to get good data out.  Which is why
I've focused just on getting an initial cpe report and then mechanisms
to automate the upkeep and NIST version bump requests.


> Indeed, when someone bumps a package, will they have to verify if the
> new CPE ID is still valid? If it isn't, what should be done? Report to NIST, of
> course, but while the database isn't updated, should we just remove the CPE_ID
> or what?

We did walk this discussion a bit a developer day.  I think the
feeling was we document the process of suggesting a update to NIST.
We may catch that the version bump doesn't have a CPE before merge but
if we don't, we have a nightly/weekly script which runs to check
current buildroot CPEs vs their pkg versions for validity.  Then send
an email to the DEVELOPERS asking them to submit the update to NIST
(we can have the templated for them to just cut/paste/send).  There
will be gaps between when a version bumps and the CPE is invalid, that
should be ok.  We could make it a goal to have the LTS/releases all
have valid CPEs before they go out (pks-stats helping us).

So in retrospect (even against my v2), I'd argue we should just report
everything as the script we'll propose soon with find the CPEs without
a NIST entry and we can choose to email the DEVELOPER or catch that as
part of a pkg-stats like activity.

>
>  To help a bit with deciding on this, it could be nice if you could add an RFC
> patch with a script that takes the cpe-manifest.csv and outputs something real -
> i.e., a list of open and closed CVEs.

Ok but the goal I'm shooting for is just a mostly accurate list and a
way to try and improve that metadata over time.  It won't be perfect.
A good example of this are the duplicate CPEs, over time they can be
discarded as we validate they are legacy and no one is cataloguing
things against them.  Until they're removed, we will have no-hits on
most of the duplicates in whichever tool a person uses to do their CVE
checking.

> The latter will also help to evaluate to
> what extent this whole thing is useful. In other words, how accurate is that
> generated list? It's a question we had ad the BR developer meeting and which
> still remains unanswered IMO.

The CPE list will be as accurate as people using it update the NIST
entries, either manually or as Buildroot nudges them to send an email.
The CVEs those CPEs will find is another complete story and most open
ways of searching for those don't concluded clean results without a
good amount of manual intervention.


Matt
