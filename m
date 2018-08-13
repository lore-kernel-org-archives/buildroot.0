From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 13 Aug 2018 11:33:17 -0300
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
References: <20180812224139.2b81b839@windsurf>
Message-ID: <5b7196ad77a28_5d773f801c6b6e18120e9@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Aug 12, 2018 at 05:41 PM, Thomas Petazzoni wrote:

> On Sun, 12 Aug 2018 22:25:43 +0200, Yann E. MORIN wrote:
> 
>> > Commit 'refs/pull/1014/head' is a branch name.
>> > Using a branch name is not supported.  
>> 
>> But then, the special refs also suffer from the same problems as
>> branches do: they can't work for the very same reasons as explained in
>> the previous patch.
>> 
>> So, I would be of the opinion that we should just drop support for those
>> special refs altogether, based on the same explanations.

Indeed using the name of a special ref as version is not guaranteed to be
reproducible for all special refs providers.

>> 
>> Now, I do understand that one will want to be able to test github MRs,
>> or gerrit reviews or whatnots... But in that case, we already civer this
>> by way of local.mk and overide-srcdir.
>> 
>> So, I would argue (as I always had since we introduced this special refs
>> support) that this should better be handled by an upper layer.
>> 
>> Sure, you'd argue that an automated build job could do the build. But
>> you anyway have to write some scripting for that automated job anyway.
>> Just have it prepare a git clone of the affected package, checkout the
>> correct commit, and prepare a local.mk with the correct override-srcdir
>> befor attempting the buildroot build.

It seems a lot of scripting for something that git supports natively and that
could be added to the backend to support the right way: using sha1 for
reproducibility.

> 
> I don't remember all the discussion about special refs, but if I

Most can be seen on [0].

> understand correctly, it's for example a Github pull request. And if I
> understood how Github works, you can push a new version of a pull
> request as the same pull request number. This means that what you fetch
> from a pull request is not stable. So it suffers from the same
> reproducibility issue as regular branches.

Gerrit Changes (when the server has the 'Draft' mode disabled) do not suffer
from the same. Each new revision ('Patch Set') has its own sha1. The refs for
many revisions of Change 1001 look like this:
refs/changes/01/1001/1
refs/changes/01/1001/2
refs/changes/01/1001/3
...

Aside: if someone wants to give a try, a test server can be run in minutes:
docker run -ti -p 8080:8080 -p 29418:29418 gerritcodereview/gerrit
No. It's not for Buildroot as it doesn't fit well for e-mail oriented reviews.
But the diff between any pair of revisions in the web interface is its awesome
feature IMO.
No. I have nothing to do with the Gerrit project, I am just a happy user.

> 
> Therefore, if we decide to officially not support branches, then we
> should also not support special refs. Unless of course I misunderstood
> the use case of special refs.

Fair enough. Let's officially don't support name of branches and name of
special refs as package version as they are not guaranteed to be reproducible,
taking in account all special ref providers.

What I think we should do is:
 - to re-add support to download of the sha1 of any ref (branch, tag, special
   ref).
 - add automated tests to avoid going back and forth, supporting some refs,
   then dropping support for them and then supporting them.
 - drop the support to the name of a special ref as it is not guaranteed to be
   reproducible.

At DATACOM we never used the name of special-ref as version.
The only occasion was when we updated the buildroot version to 2016.08 and the
support to sha1 of special-ref was removed. Then we used the name for a while as
immediate workaround, but it brings double effort to the developers.
Then I created a patch, submitted to the mailing list, with tests, and we are
maintaining inhouse ever since. We did not updated to the new download infra.

I can send a patch series for the first 2. An early version is at [1].
But due to the lack of time (testing linux trees takes time) I so far only
tested it with all packages that use the git download method in the tree. More
tests are needed for git versions (specially git 1.7.1 for RHEL6 and the brand
new one at the time) and also changing among linux trees. It also lacks a
nice commit message and probably some patch splitting. Notice in the series I
already assumed the support for name of special ref as package version will be
dropped.
This series certainly will not be applied to 2018.08 as we are so close to the
release.

But maybe even this patch "detect and abort" should not be applied to 2018.08
either as it is not so trivial, demonstrated by this review.
Just to be clear: please do not apply v1 of this patch. It will break things.

[0] http://patchwork.ozlabs.org/patch/654418/
[1] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27791462

Regards,
Ricardo
