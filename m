From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 17 May 2018 22:21:44 -0500
Subject: [Buildroot] [PATCH v4 5/5] support/scripts/pkgstats: add CPE
 reporting
In-Reply-To: <5afe45a26777a_409b3f9b6407a9101003d0@ultri5.mail>
References: <CANQCQpbGJ_OgpT3VyWKSc4RWRWPZKfggs9YiiC4fB=JYRee3mA@mail.gmail.com>
 <5afe45a26777a_409b3f9b6407a9101003d0@ultri5.mail>
Message-ID: <CANQCQpYhWzrvpbRqfVm__nrdGe7_ThfW9smmCD4CKSBKk4ySwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Thu, May 17, 2018 at 10:16 PM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Hello,
>
> On Wed, May 16, 2018 at 10:42 PM, Matthew Weber wrote:
>> On Wed, May 16, 2018 at 6:32 PM, Arnout Vandecappelle wrote:
>>> On 16-05-18 05:43, Ricardo Martincoski wrote:
>
> [snip]
>>> >> +    cpe_dict = CPE()
>>> >> +    cpe_dict.get_xml_dict()
>>> >> +    if args.cpe_report:
>>> >> +        print("Performing Target CPE Report Analysis...")
>>> >> +        get_target_cpe_report(args.cpe_report, cpe_dict)
>>> >> +    elif args.output:
>>> >
>>> > This is not common in other scripts in the tree. All checks between options are
>>> > done at the start of __main__.
>>> > But having two different code paths is not common either (in the scripts in the
>>> > tree), so it seems to me it makes sense here.
>>> > Maybe others disagree.
>>>
>>>  The way I see it, there is almost no commonality between the script with the -c
>>> option and the normal pkg-stats, so it makes no sense to have them in the same
>>> script. I would split off the CPE class into a separate module that would be
>>> imported into this script and a new cpe_report script.
>>
>> I debated this.  Ricardo/Arnout, what naming and directory scheme
>> would you propose?
>
> It seems you need a single shared module, so inspired by:
>
> getdeveloperlib.py
> get-developers -> import getdeveloperlib
>
> you could have:
>
> cpelib.py
> pkg-stats -> import cpelib
> cpe-report -> import cpelib
>
> But cpe-report seems to be a user-facing script, so it would go to the utils/
> directory. I am not sure what is the best way to solve the import for:
>
> support/scripts/cpelib.py
> support/scripts/pkg-stats -> import cpelib
> utils/cpe-report -> import cpelib
>
> Maybe a symlink utils/cpelib.py -> support/scripts/cpelib.py ? (not tested)
> I never tried importing using relative paths without having __init__.py.
>
>

I caught Arnout on IRC today and my v5 patchset reflects his
suggestion.  Ended up calling the class/module file
support/scripts/cpedb.py and support/scripts/cpe-report for the
checker script.  I do see what you mean about a user facing script.
What do others think?

Matt
