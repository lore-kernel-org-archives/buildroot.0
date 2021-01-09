From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 14:45:16 +0100
Subject: [Buildroot] [PATCH 04/10 v3] WIP: support/download: change
 format of archives generated from git
In-Reply-To: <3800d541-8e4a-1e76-c1bc-30567505b85c@mind.be>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <40590de01b9e5f003d38c9728ad04439cb17a72c.1609239666.git.yann.morin.1998@free.fr>
 <3800d541-8e4a-1e76-c1bc-30567505b85c@mind.be>
Message-ID: <20210109134516.GS1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-01-05 23:13 +0100, Arnout Vandecappelle spake thusly:
> 
> 
> On 29/12/2020 12:01, Yann E. MORIN wrote:
> > ** WIP: needs an update to all the hashes.
> > 
> > Switch to using the tarball helper, that can generate reproducible
> > archives whatever the tar version >= 1.27.
> > 
> > However, those archives are not identical to the previous ones generated
> > in the (now-broken) gnu format.
> > 
> > To avoid any clashing between old and new archives, and new and old
> > Buildroot versions, we need to name the new generated archives
> > differently from the existing ones.
> > 
> > So, we bump the git-specific format-version to _br1.
> 
>  I'm thinking that a . would be better than _. That would give us a filename
> like foo-1.3.4.br1.tar.gz, which IMHO looks a little bit better than
> foo-1.3.4_br1.tar.gz - the latter looks as if the _br1 belongs with the 4.

Honestly, this is really trhe opposite for me:

  - 1.3.4.br1 really looks like a version in and of itself

  - 1.3.4_br1 ahs a clear separation between the version and the
    non-version parts

>  Bikeshedding, yay!

Let's nikeshed, indeed. ;-)

I'll settle for -br1, not unlike the debian packages that use '-NNN'
to represent the version of the packaging. Which is roughly similar, so
people should not be too surprised.

> > The %ci date  has been supported by git back to 1.6.0, released August
> > 2008); it is not strictly ISO8601, but is still accepted as a PAX date
> > header. The strict ISO8601 placeholder, %cI, was only intriduced with
> > 2.2.0, release in November 2014, so too recent to be widely available.
> 
>  How recent is %ct? The unix timestamp is the canonical input for the pax
> option, so it would make sense to use that.

OK, %ct has been available even earlier, sine 2007, which is not that
much earlier than %ci.

Also, I found no information about the canonical timestamp to be used by
pax.

From the tar man page:

    --pax-option=keyword[[:]=value][,keyword[[:]=value]]...
        Control pax keywords when creating PAX archives (-H pax). This
        option is equivalent to the -o option of the pax(1)utility.

From the pax man page:

    -o options
        Information to modify the algorithm for extracting or writing
        archive files which is specific to the archive format specified
        by -x. In general, options take the form: name=value. The
        following options are available for the ustar and old BSD tar
        formats:

        write_opt=nodir
            When writing archives, omit the storage of directories.

Som no specific mention of the extra options we pass. However, the only
reference to a date/time format in the pax man page is about the '-T
range' optio, and reads: [[[[[cc]yy]mm]dd]HH]MM[.SS]

This closer to ISO8601 than a UNIX timestamp...

> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Vincent Fazio <vfazio@xes-inc.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
>  Bikeshedding only, so:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks for your reviews!

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > ---
> >  package/pkg-download.mk |  4 ++++
> >  support/download/git    | 31 +++++++++++++------------------
> >  2 files changed, 17 insertions(+), 18 deletions(-)
> > 
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index 951d2fb554..272f56a826 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -17,6 +17,10 @@ export HG := $(call qstrip,$(BR2_HG))
> >  export SCP := $(call qstrip,$(BR2_SCP))
> >  export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
> >  
> > +# Version of the format of the archives we generate in the corresponding
> > +# download backend:
> > +BR_FMT_VERSION_git = _br1
> > +
> >  DL_WRAPPER = support/download/dl-wrapper
> >  
> >  # DL_DIR may have been set already from the environment
> > diff --git a/support/download/git b/support/download/git
> > index 15d8c66e05..fa98198fe0 100755
> > --- a/support/download/git
> > +++ b/support/download/git
> > @@ -1,5 +1,10 @@
> >  #!/usr/bin/env bash
> >  
> > +# NOTE: if the output of this backend has to change (e.g. we change what gets
> > +# included in the archive (e.g. LFS), or we change the format of the archive
> > +# (e.g. tar options, compression ratio or method)), we MUST update the format
> > +# version in the variable BR_FMT_VERSION_git, in package/pkg-download.mk.
> > +
> >  # We want to catch any unexpected failure, and exit immediately
> >  set -E
> >  
> > @@ -16,6 +21,8 @@ set -E
> >  # Environment:
> >  #   GIT      : the git command to call
> >  
> > +. "${0%/*}/helpers"
> > +
> >  # Save our path and options in case we need to call ourselves again
> >  myname="${0}"
> >  declare -a OPTS=("${@}")
> > @@ -170,8 +177,8 @@ _git checkout -f -q "'${cset}'"
> >  _git clean -ffdx
> >  
> >  # Get date of commit to generate a reproducible archive.
> > -# %cD is RFC2822, so it's fully qualified, with TZ and all.
> > -date="$( _git log -1 --pretty=format:%cD )"
> > +# %ci is ISO 8601, so it's fully qualified, with TZ and all.
> > +date="$( _git log -1 --pretty=format:%ci )"
> >  
> >  # There might be submodules, so fetch them.
> >  if [ ${recurse} -eq 1 ]; then
> > @@ -191,24 +198,12 @@ if [ ${recurse} -eq 1 ]; then
> >      done
> >  fi
> >  
> > -# Generate the archive, sort with the C locale so that it is reproducible.
> > +popd >/dev/null
> > +
> > +# Generate the archive.
> >  # We do not want the .git dir; we keep other .git files, in case they are the
> >  # only files in their directory.
> >  # The .git dir would generate non reproducible tarballs as it depends on
> >  # the state of the remote server. It also would generate large tarballs
> >  # (gigabytes for some linux trees) when a full clone took place.
> > -find . -not -type d \
> > -       -and -not -path "./.git/*" >"${output}.list"
> > -LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
> > -
> > -# Create GNU-format tarballs, since that's the format of the tarballs on
> > -# sources.buildroot.org and used in the *.hash files
> > -tar cf - --transform="s#^\./#${basename}/#" \
> > -         --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
> > -         -T "${output}.list.sorted" >"${output}.tar"
> > -gzip -6 -n <"${output}.tar" >"${output}"
> > -
> > -rm -f "${output}.list"
> > -rm -f "${output}.list.sorted"
> > -
> > -popd >/dev/null
> > +mk_tar_gz "${git_cache}" "${basename}" "${date}" "${output}" ".git/*"
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
