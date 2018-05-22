From: Andreas Naumann <dev@andin.de>
Date: Tue, 22 May 2018 09:51:37 +0200
Subject: [Buildroot] Tesla is using Buildroot
In-Reply-To: <CA+TH9VmeeTym-u-fyAWhOJ8=J9erOE=FmC1dHJLoHjhqgOWGHw@mail.gmail.com>
References: <20180511172314.28ba9f80@windsurf.home>
 <20180511215508.GA28572@jaya>
 <BLUPR0601MB705720B009168FB33EC2CA5FB9E0@BLUPR0601MB705.namprd06.prod.outlook.com>
 <704976570.261553.1526089365924.JavaMail.zimbra@datacom.com.br>
 <20180512142738.GB3674@momiji.home>
 <CAMWSM7gzGhpgRB-xXqNreQtvwR27d+UQuGUZ35_5uwhNY6gonA@mail.gmail.com>
 <CAOesGMimW+-9zEaSoJk0-Xjwg7O6-NJ3fXMYDdkzGRDUSaKB9A@mail.gmail.com>
 <1526320807.30073.31.camel@impinj.com>
 <79815658-f349-2b3a-ab08-3035bb08b170@mind.be>
 <CA+TH9VmeeTym-u-fyAWhOJ8=J9erOE=FmC1dHJLoHjhqgOWGHw@mail.gmail.com>
Message-ID: <50a817f0-5c04-3560-5bf5-e532513ba715@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 19.05.2018 um 13:08 schrieb Angelo Compagnucci:
> 2018-05-15 22:18 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>> On 14-05-18 20:00, Trent Piepho wrote:
>>> On Sat, 2018-05-12 at 10:51 -0700, Olof Johansson wrote:
>>>> On Sat, May 12, 2018 at 10:06 AM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
>>>>> On Sat, May 12, 2018 at 6:27 AM, Adrian Perez de Castro <aperez@igalia.com> wrote:
>> [snip]
>>>>> I do the same thing. The top level Makefile exports BR2_EXTERNAL="..",
>>>>> there's a target for cloning and checking out a specific Buildroot
>>>>> revision, then there's a wildcard pattern at the end to pass any
>>>>> unrecognized targets up to Buildroot's Makefile, so things like
>>>>> "linux-menuconfig" still work.
>>>
>>>> I liked the split of having third party software in an upstream-based
>>>> separate buildroot repo, and only proprietary components in
>>>> BR2_EXTERNAL. That way it's easier to separate out the portion you
>>>> need to share for compliance (i.e. see current github contents), while
>>>> having a place to keep confidential material, work on new
>>>> configs/products/prototypes/internal uses that are not yet released,
>>>> etc in the BR2_EXTERNAL. As expressed above, wrapping it with a second
>>>> layer of makefiles makes it relatively easy to deal with.
>>>
>>> We have a top-level project with a top level Makefile that contains the
>>>   BR2_EXTERNAL tree.  I.e., the BR2_EXTERNAL tree is the top level
>>> project.  Buildroot exists as a git submodule in a directory of this
>>> project.  We can update buildroot by pulling from upstream and rebasing
>>> and can git format-patch a patch to send to the list.
>>>
>>> We patch buildroot if:
>>> 1. We think the patch is upstreamable.
>>> 2. There appears to be no reasonable way to accomplish what we want
>>> otherwise.
>>>
>>> The top level makefile uses a pattern rule to provide a target for
>>> every defconfig that exists in br2-external/configs directory.  It'll
>>> call buildroot's build with BR2_EXTERNAL and O set build that defconfig
>>> into an output directory.  Or just do a buildroot *_defconfig call but
>>> not actually build.
>>>
>>> buildroot sets itself up so that once you go to the output directory,
>>> there is a Makefile that will execute any buildroot target (menuconfig,
>>> pkg-rebuild, all, etc.) with BR2_EXTERNAL configured.
>>
>>   That's *exactly* the setup I've developed for one of my projects. I've been
>> meaning to export this to a buildroot-external superproject that people could
>> reuse...

I use a similar setup, but use the android repo-tool to checkout 
buildroot itself, additional BR2_EXTERNAL repos and 
<PACKAGE>_OVERRIDE_SRCDIR repos which are under development (e.g. main 
application).
The repo-manifest provides the option to copy files from one of the 
repos to toplevel, which I use (just like android) for the main Makefile.
This Makefile then points to our wrapper-Makefile which facilitates 
building multiple buildroot defconfigs, packing those into an update 
package, running legal-info and other steps and even trying to "save" an 
intermediate state of the output-dir just before target-finalize in 
order to reuse it for continuous application integration.
To keep things clean everything is built in out-of-tree folders, where 
Buildroot Make-targets can be called as usual.

We have chosen the repo-tool after being frustrated with git-submodules, 
however it's not without problems either, especially if you work in a 
team an try to avoid setting up a gerrit-instance.
So one of those day I'll have to look into git subtree...


regards,
Andreas


> 
> Please do! I'd really would like to have a "best practice" or a sort
> of boilerplate to use when setting up a new project!
> 
> Thanks!
> 
>>
>>   One thing though: I recently switched from git submodule to git subtree.
>> Submodules are really painful to work with when there are multiple developers
>> who need to change both the supermodule and submodule. I haven't yet gotten
>> around to using the subtree split functionality to export the upstreamable
>> changes again, but it looks pretty convenient to use.
>>
>>   Regards,
>>   Arnout
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
