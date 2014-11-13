From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Nov 2014 19:23:28 +0100
Subject: [Buildroot] github helper is broken
Message-ID: <20141113182328.GC3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

The github helper is now broken, because GitHub changed their download
scheme, again.

The new scheme is:
    https://github.com/USER/REPO/archive/VERSION.tar.gz

What is not-so-obvious in this new scheme, is that it omits the package
name from the final component of the URU, so we can no longer rely on
the default value of the FOO_SOURCE variable to construct the URL.

So we now have to set FOO_SOURCE explicitly, which was not needed so far,
and set it to $(FOO_VERSION).tar.gz

But then, it means we would store tarballs named FOO_VERSION.tar.gz,
which is not so nice in the end.

We've discussed this on IRC, and came to three main proposals:

1) rely on the server to pass an appropriate content-disposition header
with the filename.

Unfortunately, that's not doable in Buildroot:
  - we need to know the filename prior to doing the download. We could
    use a workaround by having wget do a HEAD fetch to just get the
    filename;
  - but then this would not work for off-line builds.

So this solution is a no-no.

2) differentiate upstream tarball name from local tarball name

This introduces a new variable, like FOO_UPSTREAM_SOURCE, which besides
not being nice, would require quite some work in the pkg-download infra,
which is a bit risky that close to the release.

3) no longer do tarball downloads from github, but do a git clone

This would protect us from any future change in the GitHub tarballs
download naming scheme. And after all, GitHub is a git hosting forge,
so let's use it for what it is.

The problems with that solution are two fold:
  - downloads might take more time than a tarball download, since a
    complete repository would probably be bigger than a single tarball;
  - we must use the http:// scheme for the URL (because, proxies), so
    all packages must now specify FOO_SITE_METHOD = git

Although the download time is not much of an issue, the way we are using
the github helper for now does not allow for setting more than one
variable.


In the end, solution 3 seems the most appropriate, and would require
just a bit of easy modifications:

  - tweaking the github helper to emit the repository URL instead of the
    tarball URL;

  - add FOO_SITE_METHOD to all packages.

The first one is trivial, and the second one is relatively easy with a
bit of 'find' and some clever 'sed' experession.

I have all setup and ready to implement solution 3, but before I do, I'd
like some feedback on those proposals, and if possible new proposals
that are easy to implement for the release.


Notes: I thought of a few other proposals, like:

  - define the github helper so that it emits the necessary variables:
        $(eval $(call github,user,repo))
    would expand to:
        FOO_SITE = https://github.com/user/repo
        FOO_SITE_METHOD = git

    That would allow us to introduce new types of forges, like gitorious
    of bitbucket.

    But that's not so nice, because so far we always relied on only
    setting variables, not generating Makefile code.

    Also, it implies changing all packages as well.

  - introduce new vriables to define a new semantic for the downloads:
        FOO_FORGE = github
        FOO_FORGE_PATH = /user/repo
    which would be interpreted by the pkg-download infra to generate the
    correct URL

    That would also allow us to add more forge-related handlers, like
    gitorious or bitbucket (others?), but is really diverging from the
    current semantics of the variables we already have.

    Also, it implies changing all packages as well.

So, we could not find a solution that would limit the changes to just the
github helper; all solutions we have for now imply touching all packages
hosted on GitHub.

Comments and suggestions most welcome! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
