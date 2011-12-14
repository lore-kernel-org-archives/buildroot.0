From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Dec 2011 08:40:54 +0100
Subject: [Buildroot] Buildroot and GPL compliance
Message-ID: <CAAXf6LVHqHhTH_qADzZcu=zAZ=+9YYPfpfHwL4so2O_akNPGQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to bring up the topic of complying with open-source
software licenses (among which GPL/LGPL) in embedded projects using
buildroot. In part to get answers, but also to determine what needs to
be done in buildroot to automate certain aspects of this compliancy.
The topic has been touched on Buildroot Developer Day, and the report
thereof.

To set the scene, assume an embedded system running the Linux kernel,
a set of GPL applications dynamically linked against one or more LGPL
libraries, combined with a set of proprietary applications, also
dynamically linked against one or more LGPL libraries.
The whole is built with buildroot, using a toolchain built within
buildroot (either a buildroot internal one or a crosstool-ng one).
For completeness' sake, let's also assume that there are proprietary
applications (dynamically linked with LGPL libraries) built outside of
buildroot, but are copied in the output/target directory for inclusion
in the rootfs.

When the embedded system is distributed, certain obligations from the
GPL/LGPL licenses apply. In the current discussion, I think the
distribution of source code (including build scripts) and the listing
of used open-source software is most relevant.

How would one handle the GPL/LPGL compliancy?
Since the build scripts are to be included in the source distribution,
it seems most logical to provide the complete buildroot environment to
the user.

Some discussion topics:
* There has already been some discussion on BDD and the report
regarding the inclusion of the .config file or not. In my opinion, the
.config file is necessary to recreate the whole system, and as such
should be part of the distribution. Some have expressed doubts as to
whether every company would be willing to share the configuration, as
it can share too much knowledge about the system. Examples as to what
information is too sensitive is welcome.

* What about the tarballs? Should the tarballs themselves be included
in the distribution, or would they be downloaded from the web by the
user running buildroot? I think it is safer to include the tarballs,
since you never know whether the official location will continue to
exist in the future (or be temporarily out-of-order, as with
kernel.org)

* What about the toolchain? In our system, the toolchain is prebuilt
with buildroot/crosstool-ng, and used as external toolchain. If we
distribute the toolchain as such in binary form, then it will also be
subjected to GPL obligations. In that case, next to the set of sources
that make up the target embedded system, there is another set of
sources that are used to compile/link these sources. This means that
the gcc sources and the sources for various host tools that may be
used (like host-automake) should also be distributed, along with the
ways to build them.
What is the best practice? Provide the user with a unified .config
that builds the toolchain on-the-fly and then immediately uses it to
generate the embedded system? Or provide two .configs, one to generate
the toolchain, and another one to generate the actual system with the
toolchain?

* How to handle proprietary applications? Even though during
development these applications may be build from within buildroot
(when sources are available), one would typically not want to
distribute the sources to the end-user. Still, in order to be able to
regenerate the system, I think the user should have access to the
binary versions of these applications. How do we handle this, what is
the best practice?
One solution is to place them in output/target directly, before
creating the buildroot tarball. Downside is that a 'make clean' would
remove these applications. Alternatively, one could use the customize
package for this purpose. This would require a separate .config file
for use by the end-user, but this may be ok and maybe needed for the
toolchain anyhow, depending on the output of the previous point.

* What about changes to buildroot itself? Since buildroot is GPL, any
distribution of buildroot comes with obligations as well. One of these
obligations is the requirement to clearly advertise changes to the GPL
software.

[quote from the GPLv2 license:]
  2. You may modify your copy or copies of the Program or any portion
of it, thus forming a work based on the Program, and copy and
distribute such modifications or work under the terms of Section 1
above, provided that you also meet all of these conditions:

    a) You must cause the modified files to carry prominent notices
    stating that you changed the files and the date of any change.
[endquote]

 However, the way I see it, this is not the typical way of working.
The workflow in buildroot is that you submit patches to the list,
which can then be included. Although the patch itself contains the
name of the author and the e-mail header bears the date, the modified
files do not typically contain this information.
In my case, I make modifications to buildroot in our own repository. I
try to submit most of these changes to the list, but not all of them
are fit for mainstream, and submitted patches are not applied
immediately. So, when releasing the system, there will still be
unsubmitted changes. These changes do not comply with point 2a above,
since the files do not contain the required metadata.
Technically, the only solution I see is to add 'prominent notices' to
modified files in our own repository, but manually remove them when
submitting patches to the buildroot list. This is annoying but may be
the only legal possibility. How do others see this?


Other discussion points are welcome.

Thanks,
Thomas
