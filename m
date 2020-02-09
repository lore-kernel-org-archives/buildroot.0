From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 9 Feb 2020 17:21:33 -0300
Subject: [Buildroot] [PATCH v4 1/1] package/tar: bump target version to
 1.32 (host is kept at 1.31)
In-Reply-To: <af8253ab-5f26-abaa-118e-47a188178de0@mind.be>
References: <20200116001600.567-1-james.hilliard1@gmail.com>
 <CAJ4jsafJjUjZpVx43E7dQksCGD01A3qAh62FS+XnxjCyaYZ+QQ@mail.gmail.com>
 <8195e16a-ebcd-7875-a185-9d991c617037@mind.be>
 <CAJ4jsafVQbo8PHgFu+qNfkSB+YBwhHu6KmF8C+jbtowPSR+VBQ@mail.gmail.com>
 <af8253ab-5f26-abaa-118e-47a188178de0@mind.be>
Message-ID: <CAJ4jsacVXwHCg-Dd2WSLg0=sXPy0dcKJL7Qb9JfaD39KCQfndw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 22, 2020 at 5:00 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 22/01/2020 02:24, Carlos Santos wrote:
> > On Tue, Jan 21, 2020 at 6:09 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 18/01/2020 02:26, Carlos Santos wrote:
> >>> On Wed, Jan 15, 2020 at 9:16 PM James Hilliard
> >>> <james.hilliard1@gmail.com> wrote:
> >>>>
> >>>> From: Luc Creti <luc.creti@atos.net>
> >>>>
> >>>> The host tar is used to create the archives in the VCS download backends
> >>>> (git, cvs, svn, hg...) and tar 1.30 and forward have changed the way
> >>>> they generate the archives.
> >>>>
> >>>> So, all the archives that have been generated before 1.30 was released
> >>>> are not bit-for-bit reproducible (even though the extracted content
> >>>> would be), so the hashes we have for those archives would not match.
> >>>>
> >>>> Hence host-tar requires a patch to restore reproducibility.
> >>>>
> >>>> Since there is no tar-1.32.cpio.gz available we must keep host-tar at
> >>>> version 1.31.
> >>>
> >>> We don't actually need the cpio.gz file. We can use the installed tar,
> >>> whatever it is, to extract the tar-1.32.tar.xz:
> >>>
> >>> define HOST_TAR_EXTRACT_CMDS
> >>>         mkdir -p $(@D)
> >>>         cd $(@D) && \
> >>>                 $(call suitable-extractor,$(HOST_TAR_SOURCE))
> >>> $(TAR_DL_DIR)/$(HOST_TAR_SOURCE) \
> >>>                 | tar --strip-components=1 -xf -
> >>
> >>  IIRC, the original reason to have host-tar was because older tar didn't
> >> understand --strip-components. That's why tar was downloaded as a cpio archive.
> >>
> >>  Later on we became fixed on one single version because newer tar would create
> >> slightly different tarballs so the hash would be different.
> >
> > $ cat /etc/redhat-release
> > Red Hat Enterprise Linux Client release 5.11 (Tikanga)
> >
> > $ tar --version
> > tar (GNU tar) 1.15.1
> >
> > $ MANWIDTH=72 man tar
> >
> >        --strip-components NUMBER, --strip-path NUMBER
> >               strip NUMBER of leading components from file names
> >               before extraction
> >
> >               (1)  tar-1.14 uses --strip-path, tar-1.14.90+ uses
> >               --strip-components
> >
> > The old syntax (without "=") is supported by recent versions, so
> >
> >     tar --strip-components 1 -xf -
> >
> > would work even on the venerable RHEL 5.11.
>
>  Sorry, it's not that the old tar doesn't understand it, it's that it doesn't
> work correctly. From check-host-tar.sh:
>
> # Minimal version = 1.27 (previous versions do not correctly unpack archives
> # containing hard-links if the --strip-components option is used or create
>
>
>  Regards,
>  Arnout

The hard link bug would not affect host-tar, since the tar source
tarball does not contain hard links: I tested it on RHEL 5.11:

$ cat /etc/redhat-release
Red Hat Enterprise Linux Client release 5.11 (Tikanga)
$ tar --version
tar (GNU tar) 1.15.1
$ xz --version
xz (XZ Utils) 4.999.9beta
liblzma 4.999.9beta
$ mkdir host-tar-1.32
$ xz -dc tar-1.32.tar.xz | tar --strip-components 1 -xf - -C host-tar-1.32
$ ls --width=72 host-tar-1.32
ABOUT-NLS    INSTALL      README    build-aux     gnu  scripts
AUTHORS      Make.rules   THANKS    config.h.in   lib  src
COPYING      Makefile.am  TODO        configure     m4   tests
ChangeLog    Makefile.in  acinclude.m4    configure.ac  po
ChangeLog.1  NEWS      aclocal.m4    doc          rmt

Sorry for the very late reply. I started composing it but  forgot to send.

-- 
Carlos Santos <unixmania@gmail.com>
