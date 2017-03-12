From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 21:42:51 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: add check of binaries
 architecture
In-Reply-To: <aa76136f-f6cb-0746-319c-c71f0812cc26@mind.be>
References: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <aa76136f-f6cb-0746-319c-c71f0812cc26@mind.be>
Message-ID: <20170312204251.GH3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-03-12 21:27 +0100, Arnout Vandecappelle spake thusly:
> On 12-03-17 18:49, Thomas Petazzoni wrote:
> 
> [snip]
> > +READELF_ARCH_NAME = $(call qstrip,$(BR2_READELF_ARCH_NAME))
> > +
> > +ifneq ($(READELF_ARCH_NAME),)
> 
>  We set it for all arches, so this is never empty. Except when we forget to set
> it, but in that case we probably want this thing to be executed so we notice.
> 
> > +define CHECK_BIN_ARCH
> > +	support/scripts/check-bin-arch $(TARGET_DIR) \
> > +		$(TARGET_CROSS) "$(READELF_ARCH_NAME)"
> > +endef
> > +TARGET_FINALIZE_HOOKS += CHECK_BIN_ARCH
> > +endif
> 
>  It would be nice to do it immediately after package install, so it becomes a
> package error rather than some post-build error that is more difficult to
> localise. Of course, with Yann's suggestion it would still report which package
> was the culprit, but I don't think it would show up in the autobuild results
> under the right package.
> 
>  To avoid too much overhead rechecking files all the time, it could be done as
> part of step_pkg_size_end which iterates over the files installed in target for
> that particular package. It would make the code a little more complicated,
> though, and perhaps also slower.

Or it could be a step after the step_pkg_size_end, which would basically
do:

    sed -r -e "/^${pkg},(.+)$/!d; s//\1/;" "${BUILD_DIR}/packages-file-list.txt

to get the list of file installed by the current package.

Of course, that would only really and cleanly work from a clean build.

> > +    farchname=$(${TARGET_CROSS}readelf -h ${f} | \

Please be sure to run it under the C locale, to be sure we can find what
we are looking for.

> > +		       grep '^  Machine:' | \
> > +		       sed 's/^  Machine: *\(.*\)/\1/')
> 
>  Why not the simpler sed -n '/^  Machine: *\(.*\)/s//\1/p' instead of the extra
> grep?

Or a bit easier to read (at least for me):

    readelf [..] |sed -r -e '/^  Machine: +(.+)/!d; s//\1/;'

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
