From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 29 Aug 2011 09:48:47 +0200
Subject: [Buildroot] [PATCH] git fetcher: do not remove the tree after
 initial clone
In-Reply-To: <1314538324-24679-1-git-send-email-n-dechesne@ti.com>
References: <1314538324-24679-1-git-send-email-n-dechesne@ti.com>
Message-ID: <4E5B445F.5050603@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

Nicolas Dechesne wrote:
> With the current implementation of the 'git fetcher' the project git tree is
> cloned for every build (if the commit ID has changed, otherwise the .tar.gz
> would already exist). This appears to me quite inefficient since rebuilding
> with a more recent commit is a common use case.
>
> With this patch I am changing how the 'git fetch algorithm' works as follows:
>
> - if project<foobar>  uses git, the tree will be cloned in dl/git/foobar
> - the tree is cloned using 'git clone -n' to make sure that we can reliably
>    update the tree later (--bare does not create the correct refspec, and
>    --mirror would work but is doing more than necessary)
> - the clone is done only the first time, e.g. when dl/git/foobar does not
>    exist
> - when making another build, if dl/git/foobar exists, the tree is not
>    cloned, but instead we run 'git fetch --all --tags' to update the existing
>    tree. that can save a lot of time, especially with large trees since only
>    the delta is downloaded. '--all --tags' is required to make sure that all
>    remotes commits are downloaded.

The git downloader was the subject of a pretty long discussion around
July 2010, and two different use cases were conceived with respect to
git-hosted packages:

- integrate in BR an externally-developed package that is not
   released in tarballs, but only in a git repository (use BR for
   integration);
- integrate in BR a package that is internally under development,
   so that it can be easily tested inside the entire root fs (use BR for
   integration and development).

In the first case updates to the BR package would happen rarely,
typically once per each new upstream release.

In the second case updates would be frequent, probably many per day,
on the developer workstation.

Mine vision at the time was more close to the second case, as I do
develop software that I test within buildroot. This is also your idea
with this proposed patch.
In fact the implementation I submitted at that time was similar to
yours in principle: clone once, fetch the following times.

Instead the choice for mainline BR was to privilege the first
use case (use BR for integration).

I was not enthusiast of course, but I found that in my case it was not
a big problem anyway since I clone from local servers, which makes
clones relatively fast. This would be different if the repositories you
want to clone are large or remote (or both!).

Using BR for development has not been completely neglected anyway.
Recently, Thomas Petazzoni submitted a patch that would allow to use a
local directory to build the package. This is much different from using
git fetches, but is expected to serve the "use BR for development" use
case effectively.
You might want to test it and comment to the author. Here it is:
http://lists.busybox.net/pipermail/buildroot/2011-July/044479.html

Luca
