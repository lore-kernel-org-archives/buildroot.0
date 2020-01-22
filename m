From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 21 Jan 2020 22:24:37 -0300
Subject: [Buildroot] [PATCH v4 1/1] package/tar: bump target version to
 1.32 (host is kept at 1.31)
In-Reply-To: <8195e16a-ebcd-7875-a185-9d991c617037@mind.be>
References: <20200116001600.567-1-james.hilliard1@gmail.com>
 <CAJ4jsafJjUjZpVx43E7dQksCGD01A3qAh62FS+XnxjCyaYZ+QQ@mail.gmail.com>
 <8195e16a-ebcd-7875-a185-9d991c617037@mind.be>
Message-ID: <CAJ4jsafVQbo8PHgFu+qNfkSB+YBwhHu6KmF8C+jbtowPSR+VBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 21, 2020 at 6:09 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 18/01/2020 02:26, Carlos Santos wrote:
> > On Wed, Jan 15, 2020 at 9:16 PM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> >>
> >> From: Luc Creti <luc.creti@atos.net>
> >>
> >> The host tar is used to create the archives in the VCS download backends
> >> (git, cvs, svn, hg...) and tar 1.30 and forward have changed the way
> >> they generate the archives.
> >>
> >> So, all the archives that have been generated before 1.30 was released
> >> are not bit-for-bit reproducible (even though the extracted content
> >> would be), so the hashes we have for those archives would not match.
> >>
> >> Hence host-tar requires a patch to restore reproducibility.
> >>
> >> Since there is no tar-1.32.cpio.gz available we must keep host-tar at
> >> version 1.31.
> >
> > We don't actually need the cpio.gz file. We can use the installed tar,
> > whatever it is, to extract the tar-1.32.tar.xz:
> >
> > define HOST_TAR_EXTRACT_CMDS
> >         mkdir -p $(@D)
> >         cd $(@D) && \
> >                 $(call suitable-extractor,$(HOST_TAR_SOURCE))
> > $(TAR_DL_DIR)/$(HOST_TAR_SOURCE) \
> >                 | tar --strip-components=1 -xf -
>
>  IIRC, the original reason to have host-tar was because older tar didn't
> understand --strip-components. That's why tar was downloaded as a cpio archive.
>
>  Later on we became fixed on one single version because newer tar would create
> slightly different tarballs so the hash would be different.

$ cat /etc/redhat-release
Red Hat Enterprise Linux Client release 5.11 (Tikanga)

$ tar --version
tar (GNU tar) 1.15.1

$ MANWIDTH=72 man tar

       --strip-components NUMBER, --strip-path NUMBER
              strip NUMBER of leading components from file names
              before extraction

              (1)  tar-1.14 uses --strip-path, tar-1.14.90+ uses
              --strip-components

The old syntax (without "=") is supported by recent versions, so

    tar --strip-components 1 -xf -

would work even on the venerable RHEL 5.11.

-- 
Carlos Santos <unixmania@gmail.com>
