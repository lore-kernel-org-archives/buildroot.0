From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 6 Jun 2013 11:51:04 -0500
Subject: [Buildroot] [Bug 6302] New: Versions of packages retrieved from
 github.com are wrong
In-Reply-To: <bug-6302-163@https.bugs.busybox.net/>
References: <bug-6302-163@https.bugs.busybox.net/>
Message-ID: <CAEBucnB9s-5TC4Z0TL7u7JNm=FyR1BDm9tdu2zGd7-3kS4mHPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for reporting this issue.  I've created a patch series to
remedy this issue.

Spenser

On Wed, Jun 5, 2013 at 8:40 PM,  <bugzilla@busybox.net> wrote:
> https://bugs.busybox.net/show_bug.cgi?id=6302
>
>            Summary: Versions of packages retrieved from github.com are
>                     wrong
>            Product: buildroot
>            Version: unspecified
>           Platform: All
>         OS/Version: All
>             Status: NEW
>           Severity: normal
>           Priority: P5
>          Component: Outdated package
>         AssignedTo: unassigned at buildroot.uclibc.org
>         ReportedBy: uclibc-bugzilla at loowis.durge.org
>                 CC: buildroot at uclibc.org
>    Estimated Hours: 0.0
>
>
> I'm no buildroot or github expert (so apologies if I get some of the
> terminology wrong), but I think I've found a bit of a nasty problem with the
> way buildroot downloads specific versions of packages from github.com. At first
> I thought it was because the .mk files for the specific rpi-* packages I was
> looking at were set up wrong, but I've been investigating the problem for much
> of this afternoon and I think it actually affects the .mk files for many
> packages :-(
>
> According to
> http://www.buildroot.org/downloads/manual/manual.html#github-download-url
> packages in github with a specific tag can be downloaded with:
> FOO_VERSION = v1.0
> FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
> (where here 'v1.0' is the tag in github)
>
> And for those packages where you don't have a specific tag but instead want to
> download a specific revision, you can use:
> FOO_VERSION = 1234567
> FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
> (where here '1234567' is the first 7 characters of the github commit hash)
>
> In my tests, the former (downloading a specific tag) works okay, but the latter
> (downloading a specific revision) actually doesn't work as expected. I can't
> tell if this used to work and has become broken recently by a change to
> github.com, or if it's always been broken (but nobody ever noticed), or if I'm
> simply misunderstanding things (to save me looking stupid, hopefully it's not
> this last one!).
>
> I'll stick with the two FOO examples above, but substituting 'fooauthor' for
> '<user>', 'foopackage' for '<package>' and 'master' for <branch>...
>
> When downloading a specific tag, the first example above would download
> http://github.com/fooauthor/foopackage/tarball/v1.0/foo-v1.0.tar.gz to
> dl/foo-v1.0.tar.gz and this is the part that works correctly.
> When downloading a specific revision, the second example above would download
> http://github.com/fooauthor/foopackage/tarball/master/foo-1234567.tar.gz to
> dl/foo-1234567.tar.gz and this appears to work fine, but it actually downloads
> the latest revision of the master branch, and not the 1234567 revision as you
> might expect! So if 1234567 _is_ indeed the latest revision, then things all
> look okay, which may be why nobody noticed this bug before, but things go
> quickly wrong if there's commits after 1234567.
>
> In my testing, it seems that _whatever_ filename you have after the .../master/
> in the URL will get ignored, and you'll always get the latest commit from the
> master branch. However it seems that you can actually specify a revision
> instead of <branch> and it will then work as expected, i.e. AFAICT the
> 'download by revision' example above should be modified to:
> FOO_VERSION = 1234567
> FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
>
> and then buildroot will download
> http://github.com/fooauthor/foopackage/tarball/1234567/foo-1234567.tar.gz to
> dl/foo-1234567.tar.gz and this *will* then work as expected. Obviously you
> could set FOO_VERSION to 'master' and it would go back to the previous
> behaviour of downloading the latest commit on the master branch, but at least
> this behaviour would then be explicit rather than implicit.
>
> Where the <branch> has been used (which I've replaced with $(FOO_VERSION)) I've
> found that you can either use a tag-name, a branch-name, or a (full or partial)
> commit-id, and then following another slash you can include any filename you
> want, which makes no difference to the file github.com serves to you.
>
> To give a more concrete example, I found a random repository with lots of
> commits, tags and branches: https://github.com/libgit2/libgit2
> As of 2012-06-06 these URLs all result in the identical file being downloaded:
> [by branch-name]
> http://github.com/libgit2/libgit2/tarball/master  (wget saves to 'master')
> http://github.com/libgit2/libgit2/tarball/master/  (wget saves to 'index.html')
> http://github.com/libgit2/libgit2/tarball/master/libgit2-master.tar.gz  (wget
> saves to 'libgit2-master.tar.gz')
> http://github.com/libgit2/libgit2/tarball/master/libgit2-dummy-filename.tgz
> [by tag-name]
> http://github.com/libgit2/libgit2/tarball/v0.18.0
> http://github.com/libgit2/libgit2/tarball/v0.18.0/libgit2-v0.18.0.tar.gz
> [by commit-id]
> http://github.com/libgit2/libgit2/tarball/a50086d
> http://github.com/libgit2/libgit2/tarball/a50086d/libgit2-a50086d.tar.gz
> http://github.com/libgit2/libgit2/tarball/a50086d174/libgit2-a50086d174.tar.gz
> http://github.com/libgit2/libgit2/tarball/a50086d174658914d4d6462afbc83b02825b1f5b
> http://github.com/libgit2/libgit2/tarball/a50086d174658914d4d6462afbc83b02825b1f5b/libgit2-a50086d174658914d4d6462afbc83b02825b1f5b.tar.gz
> (I used 'sha1sum *' to verify all the downloaded files are identical. In each
> case the files inside the tarfile are inside a 'libgit2-libgit2-a50086d'
> subdirectory)
>
> And these URLs result in identical files being downloaded:
> [by commit-id]
> http://github.com/libgit2/libgit2/tarball/36c2dfe
> http://github.com/libgit2/libgit2/tarball/36c2dfe/libgit2-36c2dfe.tar.gz
> http://github.com/libgit2/libgit2/tarball/36c2dfed69/libgit2-36c2dfed69.tar.gz
> http://github.com/libgit2/libgit2/tarball/36c2dfed696f80a20ca1352f32ec8b136b800c30/libgit2-36c2dfed696f80a20ca1352f32ec8b136b800c30.tar.gz
>
> And these URLs result in identical files being downloaded:
> [by branch-name]
> http://github.com/libgit2/libgit2/tarball/development
> http://github.com/libgit2/libgit2/tarball/development/libgit2-development.tar.gz
> [by commit-id]
> http://github.com/libgit2/libgit2/tarball/2e1fa15
> http://github.com/libgit2/libgit2/tarball/2e1fa15/libgit2-2e1fa15.tar.gz
>
> etc. etc. you get the idea. The only (unlikely occurrence) I didn't test was a
> branch-name having the same name as a tag-name. Obviously the match-ups between
> branch-names and commit-ids shown above will go 'out of sync' once more commits
> have been made to those branches.
>
>
> In summary, I believe
> http://www.buildroot.org/downloads/manual/manual.html#github-download-url
> should be updated to say that FOO_SITE should always look like:
> FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
> and then mention that FOO_VERSION can either specify a tag-name or a commit-id
> or a branch-name.
>
> In the current git version of buildroot, by constructing a funky find command:
> find package -exec grep -P
> '^[A-Z0-9_]+_SITE\s*=\s*https?://github\.com/.*/tarball/(?!.*\$\(.+\))' {} \;
> -print | grep \.mk | sort
>
> ...I believe these are the packages that need to have their _SITE setting
> updated in their .mk file:
> jsmin, libcofi, linenoise, lua-msgpack-native, mtdev2tuio, ne10,
> omap-u-boot-utils, rpi-firmware, rpi-userland, socketcand, sunxi-boards,
> sunxi-tools, ti-utils, tslib
>
> --
> Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
> ------- You are receiving this mail because: -------
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
