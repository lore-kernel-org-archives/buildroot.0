From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 16 May 2018 20:42:17 -0500
Subject: [Buildroot] [PATCH v4 5/5] support/scripts/pkgstats: add CPE
 reporting
In-Reply-To: <bb3dfdb4-6479-41c0-1ca0-0bd68225a7b7@mind.be>
References: <1525978734-35706-6-git-send-email-matthew.weber@rockwellcollins.com>
 <5afba8e06c27d_55f23fde3a09addc27f9@ultri5.mail>
 <bb3dfdb4-6479-41c0-1ca0-0bd68225a7b7@mind.be>
Message-ID: <CANQCQpbGJ_OgpT3VyWKSc4RWRWPZKfggs9YiiC4fB=JYRee3mA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Ricardo,

On Wed, May 16, 2018 at 6:32 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Matt, Ricardo,
>
>  I haven't been following things very closely so I may miss something entirely,
> however...
>
> On 16-05-18 05:43, Ricardo Martincoski wrote:
> > Hello,
> >
> > See below:
> >  - an important typo to fix;
> >  - some considerations about verbosity;
> >  - a possible trivial patch to split from this one;
> >  - some considerations about performance (to possibly run 2x or 4x faster, iff
> >    we can make some assumptions about the XML).

Ricardo, thanks for going through v4 and all the great feedback.  As
Arnout responded to your email, I'll add on below.


> >> +    def find(self, cpe_str):
> >> +        print("CPE: Searching for [%s]" % cpe_str)
> >
> > ... and this make the script very verbose.
> >
> > It generates 4000+ lines to stdout when generating the html.
> > Should we remove it from the final version?
> > Should we add a -v option for debug?
> >
> > It seems to me it can be removed.
>
>  Well, if it takes 17 minutes, it's nice to see some progress... But if you can
> reduce it to 4 minutes the need isn't there so much.

I believe the verbosity can be removed/reduced.  Both CPE activities
end with a report output of some sort.

> >> +    cpe_dict = CPE()
> >> +    cpe_dict.get_xml_dict()
> >> +    if args.cpe_report:
> >> +        print("Performing Target CPE Report Analysis...")
> >> +        get_target_cpe_report(args.cpe_report, cpe_dict)
> >> +    elif args.output:
> >
> > This is not common in other scripts in the tree. All checks between options are
> > done at the start of __main__.
> > But having two different code paths is not common either (in the scripts in the
> > tree), so it seems to me it makes sense here.
> > Maybe others disagree.
>
>  The way I see it, there is almost no commonality between the script with the -c
> option and the normal pkg-stats, so it makes no sense to have them in the same
> script. I would split off the CPE class into a separate module that would be
> imported into this script and a new cpe_report script.

I debated this.  Ricardo/Arnout, what naming and directory scheme
would you propose?

> > About the performance:
> > 17 minutes is not incredibly good but it is not terrible for 2000+ packages.
>
>  IMO it is terrible...

It's going to get longer once we have the "updated pkg available"
checking merged, so I'm up for optimizing now.

>
> >
> > I created 2 *poorly-tested* patches for comparison purposes only. They seem
> > (again *poorly-tested*) to produce the same html output as v4 when called
> > without -c.
> >
> > series v4 + typo fixed:
> > 17 minutes
> > series v4 + typo fixed + comparison patch 1:
> >  8 minutes
> > series v4 + typo fixed + comparison patch 2:
> >  4 minutes
> >
> > I am OK with first having the script functional and later, in another patch,
> > improving its performance while keeping the same functionality.
> > Maybe others disagree.
> > Maybe you like any patch below and find the time to fully test that it really
> > covers all cases and decide to merge to this one.
> > Maybe you foresee any use for other fields from the XML. In that case, both
> > comparison patches would not fit, as they assume we will always only need to
> > know cpe-23:cpe23-item/@name and that there will be always one, and only one,
> > cpe-23:cpe23-item/@name per cpe-item. Notice: I did not read the specs for the
> > CPE dictionary, I looked only to this script.
> >
> >
> > comparison patch 1:
> > Can we assume we will only need cpe-23:cpe23-item/@name and pre-process?
>
>  We can easily keep both the dict and the list.

For the validity check we'd only use the name entry but for building
the "update xml file" to make changes to an existing CPE (patchset
being developed now), we mine some additional detail out of the dict.
Like mentioned below we could build two sets that are pre-processed
and still have the dict available.

>
> > ----->8-----
> > +++ b/support/scripts/pkg-stats
> > @@ -561,3 +561,3 @@ def dump_html(packages, stats, output):
> >  class CPE:
> > -    all_cpes = dict()
> > +    all_cpes = list()
>
>  This (both the dict() and the list()) is a bit unconventional. If two instances
> of class CPE are created, they will refer to the same dict/list...  Normally
> members are set in the __init__ constructor. Was this intentional?

Nope, just maturity of my python knowledge.  How would that work
instead?  I can only see one instance of the class for the current use
case.  However those variables could be shared between instances, we'd
just need to manage if they're valid.

> >
> > comparison patch 2:
> > Note: I usually don't parse XML using Python, so I am not sure how future-proof
> > is the string that includes the namespace. It seems (from google search results)
> > people invented few hacks to disable namespaces in ElementTree. xmltodict has
> > process_namespaces disabled by default.
> > ----->8-----
[snip]
> >          except urllib2.HTTPError:package
> > @@ -580,5 +581,5 @@ class CPE:
> >          print("CPE: Searching for partial [%s]" % cpe_str)
> > -        for cpe in self.all_cpes['cpe-list']['cpe-item']:
> > -            if cpe_str in cpe['cpe-23:cpe23-item']['@name']:
> > -                return cpe['cpe-23:cpe23-item']['@name']
> > +        for cpe in self.all_cpes:
> > +            if cpe.startswith(cpe_str):
>
>  Originally it was 'in' instead of startswith(). Obviously startswith() will be
> more efficient. And also more correct, I guess, or does the partial match not
> need to be anchored at the beginning of the string? Well, since it always starts
> with 'cpe:2.3:a:' a match somewhere in the middle seems unlikely...

startswith() will work.

>
> > +                return cpe
> >
> > @@ -586,5 +587,5 @@ class CPE:
> >          print("CPE: Searching for [%s]" % cpe_str)
> > -        for cpe in self.all_cpes['cpe-list']['cpe-item']:
> > -            if cpe['cpe-23:cpe23-item']['@name'] == cpe_str:
> > -                return cpe['cpe-23:cpe23-item']['@name']
> > +        for cpe in self.all_cpes:
> > +            if cpe == cpe_str:
> > +                return cpe
>
>  Looks to me like the lookup time can be cut in half again by merging the two
> find functions:
>
>     def find(self, cpe_str):
>         partial_matches = []
>         partial_cpe_str = self.get_cpe_no_version(cpe_str)
>         for cpe in self.all_cpes:
>             if cpe == cpe_str:
>                 return self.get_nvd_url(cpe_str)
>             elif cpe.startswith(partial_cpe_str):
>                 partial_matches.append(cpe)
>         if partial_matches:
>             return 'Updated' # Or we could return the 'best' version?
>
>  Although... that probably doesn't make much of a difference.
>
>  What would probably make a difference, however, is to make two sets of cpe strings:
>
>    all_cpes = set()
>    all_cpes_no_version = set()
>
> ...
>            print("CPE: Converting xml manifest to dict...")
>            for cpe in raw_dict['cpe-list']['cpe-item']:
>                cpe_str = cpe['cpe-23:cpe23-item']['@name']
>                cpe_str_no_version = self.get_cpe_no_version(cpe_str)
>                self.all_cpes.add(cpe_str)
>                self.all_cpes_no_version.add(cpe_str_no_version)
> ...
>     def find(self, cpe_str):
>         if cpe_str in self.all_cpes:
>             return self.get_cpe_no_version(cpe_str)
>         cpe_str_no_version = self.get_cpe_no_version(cpe_str)
>         if cpe_str_no_version in self.all_cpes_no_version:
>             return 'Updated'
>

Agree, the pre-processed sets would be cleaner and more efficient.

I think I have enough good examples, should I make an attempt at
another version based on using sets and other patch#2 suggestions?

Matt
