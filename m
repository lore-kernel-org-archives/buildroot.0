From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Mar 2012 11:02:22 +0100
Subject: [Buildroot] DL_TOOLS_DEPENDENCIES and PRIMARY_SITE
In-Reply-To: <20120302103747.7f8ef528@skate>
References: <CAAXf6LXfd_w5muFabHEFxYKgCFSsrsCCX0Cqibpfz0o7NZt1wQ@mail.gmail.com>
 <20120302103747.7f8ef528@skate>
Message-ID: <CAAXf6LU+=+qEUQ7FxfxBDBy3rQyvUoFrzR0Z5XWpqTMXxKKU_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 2, 2012 at 10:37 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Fri, 2 Mar 2012 10:16:53 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Suppose you have a PRIMARY_SITE set for direct retrieval of source
>> tarballs instead of fetching them from the web, for example because
>> you want a self-contained buildroot distribution to give to others.
>>
>> If you select a package that has git/svn/bzr/... as site method, then
>> the dependencies system will check for the availability of the
>> git/svn/bzr tools.
>> In case all tarballs are present on the PRIMARY_SITE, this check is
>> actually not needed and annoying, because you would have to e.g.
>> install 'git' even though it will never be used.
>
> Hum, right.
>
>> Some suggested solutions:
>> 1. change support/dependencies/dependencies.sh to output a warning
>> instead of an error for the DL_TOOLS. If the tool cannot be found when
>> used, the shell will throw an error.
>>
>> 2. when PRIMARY_SITE is set, don't fill DL_TOOLS at all (so don't
>> check in support/dependencies), and let the shell handle a missing
>> tool.
>>
>> 3. Don't check the DL_TOOLS in support/dependencies upfront, but
>> rather in the DOWNLOAD function when you actually need a certain tool.
>
> The problem with (2) is that PRIMARY_SITE is only a *preferred*
> location for download. If that location does not contain the requested
> tarball, then we fall back to the normal download method, and in that
> case we would need git/bzr/svn/etc. Or we would need to change the
> semantic of PRIMARY_SITE so that we *only* look at PRIMARY_SITE and do
> not fall back on the normal download method (and therefore abort the
> build if PRIMARY_SITE does not contain all the desired tarballs).

I have a patch (that I still have to send) that adds a new option
BR2_PRIMARY_SITE_ONLY that when enabled behaves as you describe.

Unfortunately, I cannot enable it because some sources do come from a
repository in my case (hg), and for these I don't store tarballs on
the primary site.

>
> As per (1) and (3), for sure it would work, but I think having all the
> dependencies errors upfront is really nice, because you can fix all of
> them at the beginning of the build, and then you know that the build
> will go on. There's nothing more annoying than starting a long build,
> going away for a coffee/tea/orange-juice (because I don't drink
> coffee/tea), then coming back to discover that the build has stopped 30
> seconds after we left just because of a missing dependency.

(1) could be altered to check first if a primary site was set at all.

Or a small delay could be added after the warning, so that it's
clearly visible. Then the non-coffee/non-tea drinker can first fix the
problem if needed and then go for the orange-juice break.

>
> Another option on your build servers is:
>
> echo "#!/bin/sh" > /usr/bin/git && chmod +x /usr/bin/git
> echo "#!/bin/sh" > /usr/bin/svn && chmod +x /usr/bin/svn
>
> And go ? :-)

Requires root access :)

However, your comment made me think of overwriting the BR2_GIT
variable in the configuration, which could fix my problem.
But then I noticed that the current dependency code in
package/Makefile.package.in does not respect BR2_GIT.
This may be considered a bug, if you for example set BR2_GIT to
/home/me/bin/git, but if we change it we will have to adapt the
dependency code a little bit as well, since BR2_GIT="git --verbose"
(or whatever) will cause 'which' to complain.

I could fix these things but I'm not sure if it's the right solution
for my problem. It's kind of a hack.

Thomas
