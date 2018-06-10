From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jun 2018 10:12:17 +0200
Subject: [Buildroot] [PATCH] docs/manual: document filesystems
In-Reply-To: <1806912659.2037633.1528582803656.JavaMail.zimbra@datacom.com.br>
References: <20180609094647.21460-1-yann.morin.1998@free.fr>
 <1806912659.2037633.1528582803656.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180610081217.GB2471@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

Thanks for the review! :-)

On 2018-06-09 19:20 -0300, Carlos Santos spake thusly:
> > From: "Yann Morin" <yann.morin.1998@free.fr>
[--SNIP--]
> > diff --git a/docs/manual/adding-filesystems.txt
> > b/docs/manual/adding-filesystems.txt
> > new file mode 100644
> > index 0000000000..4731526c0f
> > --- /dev/null
> > +++ b/docs/manual/adding-filesystems.txt
> > @@ -0,0 +1,119 @@
> > +// -*- mode:doc; -*-
> > +// vim: set syntax=asciidoc:
> > +
> > +=== Infrastructure for filesystems
> 
> Shouldn't this be a separate chapter instead of a section of packages?
> Filesystems are different from packages, regardless the syntactical
> similarities in the configurations and recipe files. See also the
> comment below about the hooks section.

I also wondered about that.

But I was a bit wary of creating another chapter just for filesystems.

And notice that in the package chapter, we also talk about the
'asciidoc-document' infra, which is already not a package infra.

I'd like input from others. Thomas, Peter, Arnout?

[--SNIP--]
> There are two fundamental differences between packages and filesystem
> images:
> 
> Filesystem images are always rebuilt and installed while packages are
> built/installed once and rebuilt/re-installed only on explicit calls
> to "make pkg-name-{reconfigure,rebuild,reinstall}".

ACK, good point. I'll add this to the first section, that explains the
infra.

> Packages are supposed to install, remove or modify files in the global
> $(TARGET_DIR) hierarchy.

Well, in the first part of this patch, I added a description of the
sequence, making it obvious (or so I hoped) that indeed filesystems were
acting on a transient copy:

    2.  Then for each filesystem:
      * extract the intermediate tarball to a filesystem-specific $(TARGET_DIR),
      [...]
      * remove the filesystem-specific $(TARGET_DIR);

> Genarating filesystem images do not modify the
> contents of the global $(TARGET_DIR) and user-provided rootfs extensions
> must not do this.

Why do you insist on modifying the global target/ directory from your
filesystem? If you do that, and build two or more filesystems [*], they
might each try to modify target/ is incompatible ways, and this is not
even safe, concurrency-wise (e.g. ony may try to archive the content of
/var while another is doing a rm -rf on it.)

The filesystem infra has been changed to provide each filesystem a copy
of the target/ directory, so that each filesystem can do their own
tweaks without impacting the others, without the need to be idempotent,
and allowing filesystems to be run in parallel.

I have still not seen a *compelling* reason to let filesystems muck in
the original target/ directory.

[*] Buildroot terminology, like BR2_TARGET_ROOTFS_SQUASHFS=y and
BR2_TARGET_ROOTFS_ISO9660=y at the same time.

> [Side note: we could add an optional "paranoid mode" config which would
> trigger a checksum generation/checking right before/after the creation
> of the rootfs images.] 

Not needed, since there is no reason to let them do.

> > +And here is a list of variables that may be used (but may *not* be set):
> "must" not be set.

https://www.merriam-webster.com/dictionary/may

4. : SHALL, MUST ? used in law where the sense, purpose, or policy
     requires this interpretation

(yes, I tend to use a pedant or/and archaic english. ;-])

> > +* +$(TARGET_DIR)+ is the directory containing the +target/+ directory.
> > +
> > +* +$(@)+ is the filename where to store the filesystem image into.
> > diff --git a/docs/manual/adding-packages-hooks.txt
> > b/docs/manual/adding-packages-hooks.txt
> > index 0ce79f8907..34d5801169 100644
> > --- a/docs/manual/adding-packages-hooks.txt
> > +++ b/docs/manual/adding-packages-hooks.txt
> 
> Consider moving the hooks section to a separate chapter if you put the
> filesystem text in a separate chapter too.

If others agreee that the filesystem infra requires its own chapter,
then I will, yes.

Thanks again for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
