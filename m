From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Nov 2014 20:54:27 +0100
Subject: [Buildroot] github helper is broken
In-Reply-To: <20141113182328.GC3641@free.fr>
References: <20141113182328.GC3641@free.fr>
Message-ID: <CAAXf6LVZO90SpiTm-PpOxBQ3GHLHtd=WvYp96wVee59tKYd9qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Nov 13, 2014 at 7:23 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hello All,
>
> The github helper is now broken, because GitHub changed their download
> scheme, again.
>
> The new scheme is:
>     https://github.com/USER/REPO/archive/VERSION.tar.gz

bummer!

>
> What is not-so-obvious in this new scheme, is that it omits the package
> name from the final component of the URU, so we can no longer rely on
> the default value of the FOO_SOURCE variable to construct the URL.

I wonder what drives people to invent such a scheme.
Shouldn't we (in addition to actions as discussed below) discuss the
issue with Github? They may understand our concerns, which surely are
present for other build systems as well.
Of course, we cannot fight every repo hosting site. Google code also
provides tarballs with scheme version.tar.gz, unfortunately.

>
> So we now have to set FOO_SOURCE explicitly, which was not needed so far,
> and set it to $(FOO_VERSION).tar.gz
>
> But then, it means we would store tarballs named FOO_VERSION.tar.gz,
> which is not so nice in the end.
>
> We've discussed this on IRC, and came to three main proposals:
>
> 1) rely on the server to pass an appropriate content-disposition header
> with the filename.
>
> Unfortunately, that's not doable in Buildroot:
>   - we need to know the filename prior to doing the download. We could
>     use a workaround by having wget do a HEAD fetch to just get the
>     filename;
>   - but then this would not work for off-line builds.
>
> So this solution is a no-no.
>
> 2) differentiate upstream tarball name from local tarball name
>
> This introduces a new variable, like FOO_UPSTREAM_SOURCE, which besides
> not being nice, would require quite some work in the pkg-download infra,
> which is a bit risky that close to the release.
>
> 3) no longer do tarball downloads from github, but do a git clone
>
> This would protect us from any future change in the GitHub tarballs
> download naming scheme. And after all, GitHub is a git hosting forge,
> so let's use it for what it is.
>
> The problems with that solution are two fold:
>   - downloads might take more time than a tarball download, since a
>     complete repository would probably be bigger than a single tarball;
>   - we must use the http:// scheme for the URL (because, proxies), so
>     all packages must now specify FOO_SITE_METHOD = git
>
> Although the download time is not much of an issue, the way we are using
> the github helper for now does not allow for setting more than one
> variable.

How do you conclude that the download time is not an issue?
Some repos may be significantly larger than the size of one revision,
we cannot know this in advance. Moreover, the complete repo is
complete overhead in the Buildroot case.

>
>
> In the end, solution 3 seems the most appropriate, and would require
> just a bit of easy modifications:
>
>   - tweaking the github helper to emit the repository URL instead of the
>     tarball URL;
>
>   - add FOO_SITE_METHOD to all packages.
>
> The first one is trivial, and the second one is relatively easy with a
> bit of 'find' and some clever 'sed' experession.
>
> I have all setup and ready to implement solution 3, but before I do, I'd
> like some feedback on those proposals, and if possible new proposals
> that are easy to implement for the release.
>
>
> Notes: I thought of a few other proposals, like:
>
>   - define the github helper so that it emits the necessary variables:
>         $(eval $(call github,user,repo))
>     would expand to:
>         FOO_SITE = https://github.com/user/repo
>         FOO_SITE_METHOD = git
>
>     That would allow us to introduce new types of forges, like gitorious
>     of bitbucket.
>
>     But that's not so nice, because so far we always relied on only
>     setting variables, not generating Makefile code.
>
>     Also, it implies changing all packages as well.

A similar strategy (for SITE/SOURCE) was discussed earlier in the
context of gitorious, following a patch from Alexandre Belloni that
was proposed earlier.
See http://lists.busybox.net/pipermail/buildroot/2014-January/086309.html
and ThomasP's reply:
http://lists.busybox.net/pipermail/buildroot/2014-January/086495.html

>
>   - introduce new vriables to define a new semantic for the downloads:
>         FOO_FORGE = github
>         FOO_FORGE_PATH = /user/repo
>     which would be interpreted by the pkg-download infra to generate the
>     correct URL
>
>     That would also allow us to add more forge-related handlers, like
>     gitorious or bitbucket (others?), but is really diverging from the
>     current semantics of the variables we already have.
>
>     Also, it implies changing all packages as well.
>
> So, we could not find a solution that would limit the changes to just the
> github helper; all solutions we have for now imply touching all packages
> hosted on GitHub.
>
> Comments and suggestions most welcome! ;-)
>

Best regards,
Thomas
