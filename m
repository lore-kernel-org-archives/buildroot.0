From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 18 Dec 2011 13:31:41 +0100
Subject: [Buildroot] Buildroot and GPL compliance
In-Reply-To: <CAAXf6LVHqHhTH_qADzZcu=zAZ=+9YYPfpfHwL4so2O_akNPGQQ@mail.gmail.com>
References: <CAAXf6LVHqHhTH_qADzZcu=zAZ=+9YYPfpfHwL4so2O_akNPGQQ@mail.gmail.com>
Message-ID: <4EEDDD2D.1030801@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and all!
Am 14.12.2011 08:40, schrieb Thomas De Schampheleire:
> Hi,
>
> I would like to bring up the topic of complying with open-source
> software licenses (among which GPL/LGPL) in embedded projects using
> buildroot. In part to get answers, but also to determine what needs to
> be done in buildroot to automate certain aspects of this compliancy.
> The topic has been touched on Buildroot Developer Day, and the report
> thereof.
...
> * What about the tarballs? Should the tarballs themselves be included
> in the distribution, or would they be downloaded from the web by the
> user running buildroot? I think it is safer to include the tarballs,
> since you never know whether the official location will continue to
> exist in the future (or be temporarily out-of-order, as with
> kernel.org)
I think referring to the original download location can not be enough
since the distributor has to provide the source to be compliant with the
GPL. So I as a distributor cannot rely on some repository that I cannot
control. The same applies to github, sourceforge or whatever. I think we
have either to provide a CD with the source or a download section on our
own website.
> * What about the toolchain? 
I am not sure what the GPL requires concerning the build environment.
> In our system, the toolchain is prebuilt
> with buildroot/crosstool-ng, and used as external toolchain. If we
> distribute the toolchain as such in binary form, then it will also be
> subjected to GPL obligations.
I do not think that the toolchain should be distributed in binary form.
At least this would introduce dependency from the build OS.

If some prebuild toolchain from the web (Code Sourcery, AVR, Xilinx or
what ever) is used an advice "Download the toolchain from..." in the
release notes should be enough. Distributing a toolchain from a foreign
source does not sound like a good idea to me unless we can provide a
working build environment for it.
>  In that case, next to the set of sources
> that make up the target embedded system, there is another set of
> sources that are used to compile/link these sources. This means that
> the gcc sources and the sources for various host tools that may be
> used (like host-automake) should also be distributed, along with the
> ways to build them.
> What is the best practice? Provide the user with a unified .config
> that builds the toolchain on-the-fly and then immediately uses it to
> generate the embedded system?
That was the way buildroot did it before switching to crosstool-ng, right?
>  Or provide two .configs, one to generate
> the toolchain, and another one to generate the actual system with the
> toolchain?
I think that should depend on how the whole system is built.

If the toolchain is built with crosstool-ng outside of buildroot with a
separate make command I would distribute it as a separate package
including all its source tarballs.

If we have a close integration from crosstool-ng in buildroot (sorry, I
did not follow that discussion because of lack of time) I would prefer
to distribute both as one package.

> * How to handle proprietary applications? Even though during
> development these applications may be build from within buildroot
> (when sources are available), one would typically not want to
> distribute the sources to the end-user. Still, in order to be able to
> regenerate the system, I think the user should have access to the
> binary versions of these applications. How do we handle this, what is
> the best practice?
This is a hot iron. My customer has to be able to build and redistribute
the GPL stuff. Of course he may not be allowed to distribute the
proprietary stuff, too. So I think we have to be able to build a
distribution package without any proprietary stuff.
> One solution is to place them in output/target directly, before
> creating the buildroot tarball. Downside is that a 'make clean' would
> remove these applications. Alternatively, one could use the customize
> package for this purpose. This would require a separate .config file
> for use by the end-user, but this may be ok and maybe needed for the
> toolchain anyhow, depending on the output of the previous point.
I am not sure if the option to rebuild the embedded System (open and
closed spurce part) by the customer is required. I would even say, in
most cases he should not be able to. So I would prefer to have a kind of
"make distribution" that packs all the open source stuff into an ISO
image, a seperate directory or a tarball.

Consequence from this would be to be able to distinguish between open
source and proprietary parts of the system.

This also brings up the problem arising when one simply puts fines into
the target directory. I would not do this because I want to have a
system that can be rebuilt reliably after a "make clean". Following this
philosophy, all proprietary parts of the system have to reside in some
packages.
> * What about changes to buildroot itself? Since buildroot is GPL, any
> distribution of buildroot comes with obligations as well. One of these
> obligations is the requirement to clearly advertise changes to the GPL
> software.
>
> [quote from the GPLv2 license:]
>   2. You may modify your copy or copies of the Program or any portion
> of it, thus forming a work based on the Program, and copy and
> distribute such modifications or work under the terms of Section 1
> above, provided that you also meet all of these conditions:
>
>     a) You must cause the modified files to carry prominent notices
>     stating that you changed the files and the date of any change.
> [endquote]
>
I am not sure how this is usually handled. I do not think that this
information is usually distributed with the source code.

When I, as an example, distribute the tarball of a given Linux kernel,
the information which file has been modified when from whom is not
present. Some files carry some information about this, but the most do not.
>  However, the way I see it, this is not the typical way of working.
> The workflow in buildroot is that you submit patches to the list,
> which can then be included. Although the patch itself contains the
> name of the author and the e-mail header bears the date, the modified
> files do not typically contain this information.
I do not think that this fulfils ?2a, since it requires that the files
carry this information.

The fact that the git and email archives contain the information are
available online may not fulfil the cited paragraph because I cannot
guarantee that it will be available in the future.

As a consequence not one GPL program out there might be compliant to GPL
?2(a).
> Technically, the only solution I see is to add 'prominent notices' to
> modified files in our own repository, but manually remove them when
> submitting patches to the buildroot list. This is annoying but may be
> the only legal possibility. How do others see this?
I think we should try to find out how other projects handle this or how
lawyers or GNU comment on this.

Of course one could distribute the whole git archive along with the GPL
software, but I think that would be too much and it does not dissolve
the above problems.
> Other discussion points are welcome.
I think it has been discussed before, but I'd like to come back to the
topic "license management". Since every package within biuldroot has its
license it should not be too complicated to add this information to the
metadata contained in xxx.mk. Having this, a "make license" could
produce a simple list of all included packages and their licenses. We
couls even include this information in the target system, if desired.
Packages without this information could print as "Package xxx: license
unknown". So we could include the license information when a package
gets updated or when someone needs this information for this package and
would not have to change all packages at once.

Kind regards

Stephan
> Thanks,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
