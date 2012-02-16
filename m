From: Will Moore <will.moore@beraninstruments.com>
Date: Thu, 16 Feb 2012 12:17:51 -0000
Subject: [Buildroot] Report of the Buildroot Developer Day, February 3,
	2012 - Legal info
In-Reply-To: <201202160044.29316.arnout@mind.be>
References: <201202160044.29316.arnout@mind.be>
Message-ID: <BE5319E74F9A446BA391A54D7377663E@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Arnout Vandecappelle
> Sent: 15 February 2012 23:44
> 
> ---------------------------------------------------------------------
> 
> Buildroot developer day February 3, 2012
> 
> ---------------------------------------------------------------------

-- snip --

> ---------------------------------------------------------------------
> 
> 6. Legal info
> 
> ---------------------------------------------------------------------
> 
> Buildroot users are expecting a statement from the buildroot
> developers explaining how we understand that buildroot can be used to
> comply to the GPL. Note that this doesn?t need to be minimal
> compliance, e.g. we can advise to include buildroot itself even if it
> may not be required.
> 
> What do we want to save?
> 
>   * The non-proprietary packages.
>   * The license text of the packages.
>   * The scripts to create it, i.e. buildroot
>   * The buildroot config file.
>   * The cross-compiler seems to be required too for GPLv2 packages,
>     because it is not normally available on an OS.

Without getting into a lot of IANAL stuff (!) please could somebody explain to
me why the cross-compiler for GPLv2 packages is included in this list?

> 
> We will add support for preparing all of this. It is up to the user?s
> legal office to decide what will actually be released and what not.
> 
> License texts. Many packages mix many licenses, so a single license
> text per package is not sufficient.
> 
> Some licenses require to include the copyright holders in the license
> text, so you can?t have one single BSD license text that applies to
> all BSD-licensed software.
> 
> Buildroot itself. Creating a buildroot tarball is not so simple.
> You?d need to do a make distclean first, so the output is gone, and
> then tar the buildroot top directory. However, if there is an O=?
> output directory within the buildroot directory, this will be
> included as well? Note also that make distclean will remove the
> .config. So recommend that make legal-info is done from a clean
> buildroot checkout. Alternatively, do a tar of the current directory
> and exclude dl and output.
> 
> Toolchain. For external toolchains, also the source needs to be
> downloaded. For Sourcery there is a separate source tarball. For
> Linaro this is more difficult, because it distributes its source as a
> ct-ng tarball without the actual source. We?ll just mention that this
> is unsupported for this case and other cases we can?t handle.
> 
> Implementation
> 
>   * Add our advise of how to comply to GPL to the documentation.
>   * If something is difficult to do, skip it and mention it to the
>     user.
>   * In the package mk-file, specify the license file(s) from the
>     package source that have to be included. There are some cases
>     where the source doesn?t have a separate license file. In this
>     case, we can include a license file in buildroot?s package
>     directory. We could also point to a source file that contains the
>     license text (not ideal because you add redundant cruft to the
>     legal-info directory).
>   * To avoid duplicating the same license every time, we use a common
>     license file (included only once) for known licenses (GPLv2,
>     LGPLv2, LGPLv2.1, ?). This only applies for licenses for which
>     the text always is identical. In particular, the BSD license is
>     excluded because it explicitly states that the copyright
>     statement above must be retained.

Having just recently gone through doing this for a simple buildroot
configuration I would note that even when things are e.g. GPLv2 they have
different license text.  Not only do they often have (a la Linux) a little
explanation before the text of the GPLv2 but also the GPLv2 text itself can vary
subtly even when both versions are marked Version 2, June 1991.  In the cases I
saw just silly things like the address given for FSF and "19yy" changing to
"year", "St" to "Street", "Lesser" to "Library", and white space changes.  To be
"clean" I just copied the license verbatim from the source.
 
For BSD licenses this could get quite onerous in the .mk file as depending on
configurations many separately BSD licensed source files in the /dl tarball may
or may not be included in the build.

>   * make legal-info creates a directory with sources, a directory
>     with licenses, and an overview document with the packages and
>     licenses.
>   * Print and save a warning if something doesn?t work (license
>     unknown, no source found because of override or local, ?)
>   * At some point, the toolchains will need to be converted to
>     gentargets too, so they participate in the license stuff.
> 

-- snip --
