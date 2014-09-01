From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 31 Aug 2014 22:27:45 -0500
Subject: [Buildroot] [PATCH v2 1/1] autobuilder: branch support
In-Reply-To: <20140829192443.0fb6c813@free-electrons.com>
References: <1408625696-42975-1-git-send-email-Matthew.Weber@rockwellcollins.com>
 <20140829192443.0fb6c813@free-electrons.com>
Message-ID: <CANQCQpZ7jtdTCEBq4tRWUGeqXMO8GsxHwyCQWzWFgfJPXpnxgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Fri, Aug 29, 2014 at 12:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matt Weber,
>
> On Thu, 21 Aug 2014 07:54:56 -0500, Matt Weber wrote:
>> Adds an option to specify a specific branch for the autobuilder
>> to execute against (Defaults to the master branch).
>>
>> Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>
>> ---
>>
>> Changes v1 -> v2
>>  - Fixed assignment of br_branch value to variable
>>    when reading config from file. (Suggested by Clayton S)
>
> What is the intended usage of this? Because customizing the branch
> without being able to customize the Git repository from which we're
> getting the Buildroot sources seems a bit odd. Or is it just to test
> the 'next' branch?

I hadn't thought about testing the 'next' branch.  That's could be a
good idea to reduce the number of days after a release where things
aren't stable.

I'm making an assumption that the autobuilder script could also be
used for testing a personal/corporate mirror of the Buildroot
repository where development is being done on branches before
submission of patch sets to the mailing list.  My initial use case for
doing this is for the SELinux patch set.  I'm hoping to do a bunch of
internal regressions before submitting the v6 patch set.
For this branch cfg option patch, we didn't include the option to
configure the repository since it seemed the primary purpose of the
autobuilder was for testing the mainline Buildroot repository.
Instead we currently carry the commit of the repository path change as
a local modification that we rebase on top of our local buildroot-test
repository clone.  I'd gladly update the patch to include the
repository cfg option and have it default to the main Buildroot repo.

Another item to note about how we're using the script... We're
currently not thinking about sending results to the autobuilder
results server, since they would reflect our personal branchs/commits.
The results would purely be used to refine the proposed updates that
haven't yet been posted as a patch set or to refine revisions of a
patchset.   Since the results aren't submitted and kept local, I'm
thinking about adding some scripting to the autobuilder script that
provides an option to create a static website from the archive files
on the fly, which would make going through the failure cases a bit
easier.


Related to build resources, I might be able to dedicate some resources
to running another instance of the autobuilder,  however with the
results submission, does it upload all the logfiles and information to
your server or does it link back to mine (webhosting content)?  I
think I can http 'post' results, but serving up any content would
probably not be possible at this point.

>
> Also, there's the issue of the build results being submitted on
> autobuild.buildroot.org: on this site, for now, we don't have any
> concept of "branch" or multiple versions being tested. We simply assume
> that the only thing we're testing is the master branch, and that this
> branch is evolving progressively over time. If the autobuild-run script
> then grows the capability of testing other branches/repositories than
> just the master branch of the official Buildroot repository, it raises
> the question of what happens when those build results are submitted to
> autobuild.buildroot.org.

Agreed, per my comments above it wasn't my original intention to use
the script against branches and have it actively do a submission to
the autobuilder site.  However it might be an interesting discussion
item to see if it would be worth having for the 'next' branch. (At
this point, I'm guessing it isn't worth doing since it would split
resources away from regressioning the 'master' branch)

Thanks!
-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com
