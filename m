From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Mar 2017 23:26:45 +0100
Subject: [Buildroot] [PATCH v4 2/2] Makefile: add check of binaries
	architecture
In-Reply-To: <8764cb7e-0547-8bd2-3075-ff3534cb1f93@mind.be>
References: <1489357076-31990-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489357076-31990-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <8764cb7e-0547-8bd2-3075-ff3534cb1f93@mind.be>
Message-ID: <20170313222645.GC3680@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-03-13 23:19 +0100, Arnout Vandecappelle spake thusly:
> On 12-03-17 23:17, Thomas Petazzoni wrote:
> > As shown recently by the firejail example, it is easy to miss that a
> > package builds and installs binaries without actually cross-compiling
> > them: they are built for the host architecture instead of the target
> > architecture.
> > 
> > This commit adds a small helper script, check-bin-arch, called as a
> > GLOBAL_INSTRUMENTATION_HOOKS at the end of the target installation of
> > each package, to verify that the files installed by this package have
> > been built for the correct architecture.
[--SNIP--]
> > +PKG_FILES=$(sed -r -e "/^${PACKAGE},(.+)$/!d; s//\1/;" ${PACKAGE_FILE_LIST})
> 
>  Fighting Yann on this one: I really find the "/.../s//\1/p" construct easier to
> parse than "/.../!d; s//\1/". Yes, found a bikeshed!

Yes, a bikeshed! :-)

> > +for f in ${PKG_FILES} ; do
> > +	# Skip firmware files, they could be ELF files for other
> > +	# architectures
> > +	if [[ "${f}" =~ ^\./(usr/)?lib/firmware/.* ]]; then
> > +		continue
> > +	fi
> > +
> > +	# Get architecture using readelf
> > +	arch=$(LC_ALL=C ${TARGET_READELF} -h "${TARGET_DIR}/${f}" 2>&1 | \
> > +		       sed -r -e '/^  Machine: +(.+)/!d; s//\1/;')
> 
>  [!!] Since we now do this before the finalize step, TARGET_DIR is still full of
> .a files. These contain several ELF files, so readelf -h will print several ELF
> headers, so this will not match. We can safely assume that all ELF files in a .a
> are going to be for the same target, so just pipe into head -1.

Or if you are concerned about a .a with multiple architectures (which
would be highly awfull and questionable), you could sort the output with
'sort -u' so that:
  - if there is noly the correct arch, it will match,
  - if there is only one incorrect arch, it won't match
  - if there are more than one arch, at least one is incorrect and it
    won't match either.

>  I tested that, so with that fixed, you can add my
>  Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> 
> > +
> > +	# If no architecture found, assume it was not an ELF file
> > +	if test "${arch}" = "" ; then
> > +		continue
> > +	fi
> > +
> > +	# Architecture is correct
> > +	if test "${arch}" = "${READELF_ARCH_NAME}" ; then
> > +		continue
> > +	fi
> > +
> > +	printf 'ERROR: architecture for %s (from %s) is %s, should be %s\n' \
>                                            ^^^^^^^^^
>  Since this is now called per-package, it isn't necessary any more to say from
> which package it comes.

Indeed.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > +	       "${f}" "${PACKAGE}" "${arch}" "${READELF_ARCH_NAME}"
> > +
> > +	exitcode=1
> > +done
> > +
> > +exit ${exitcode}
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
