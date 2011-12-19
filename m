From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 19 Dec 2011 22:02:25 +0100
Subject: [Buildroot] Buildroot and GPL compliance
In-Reply-To: <CAAXf6LVHqHhTH_qADzZcu=zAZ=+9YYPfpfHwL4so2O_akNPGQQ@mail.gmail.com>
References: <CAAXf6LVHqHhTH_qADzZcu=zAZ=+9YYPfpfHwL4so2O_akNPGQQ@mail.gmail.com>
Message-ID: <4EEFA661.5010503@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
thank you for having started the discussion on this topic.

Thomas De Schampheleire wrote:
> Hi,
>
> I would like to bring up the topic of complying with open-source
> software licenses (among which GPL/LGPL) in embedded projects using
> buildroot. In part to get answers, but also to determine what needs to
> be done in buildroot to automate certain aspects of this compliancy.
> The topic has been touched on Buildroot Developer Day, and the report
> thereof.

...

> Some discussion topics:
> * There has already been some discussion on BDD and the report
> regarding the inclusion of the .config file or not. In my opinion, the
> .config file is necessary to recreate the whole system, and as such
> should be part of the distribution. Some have expressed doubts as to
> whether every company would be willing to share the configuration, as
> it can share too much knowledge about the system. Examples as to what
> information is too sensitive is welcome.

I don't think it is mandatory to allow the recreation of the whole
system, but I discuss this point in detail below.

Nevertheless, I think the .config (or a defconfig) should be
distributed as well, but for different reasons.
Some packages have menuconfig options to tweak the configuration flags
(e.g. BR2_PACKAGE_FFMPEG_ENCODERS), and as such I think they fall in the
category of "scripts used to control compilation".

>
> * What about the tarballs? Should the tarballs themselves be included
> in the distribution, or would they be downloaded from the web by the
> user running buildroot? I think it is safer to include the tarballs,
> since you never know whether the official location will continue to
> exist in the future (or be temporarily out-of-order, as with
> kernel.org)

GPL allows the source to be distributed as "copy from a designated
place", but only when the object code is distributed in the same way.
But I cannot think of an embedded system made using Buildroot that is
shipped without any rootfs already on board...

So, unless there are counterexamples, I think distributing the tarballs
is the only option for BR.

>
> * What about the toolchain? In our system, the toolchain is prebuilt
> with buildroot/crosstool-ng, and used as external toolchain. If we
> distribute the toolchain as such in binary form, then it will also be
> subjected to GPL obligations. In that case, next to the set of sources
> that make up the target embedded system, there is another set of
> sources that are used to compile/link these sources. This means that
> the gcc sources and the sources for various host tools that may be
> used (like host-automake) should also be distributed, along with the
> ways to build them.
> What is the best practice? Provide the user with a unified .config
> that builds the toolchain on-the-fly and then immediately uses it to
> generate the embedded system? Or provide two .configs, one to generate
> the toolchain, and another one to generate the actual system with the
> toolchain?

The choice of external or internal toolchain should be primarily based
on technical and practical engineering choices, among which the
simplicity of the GPL compliance procedures plays only a limited role.

The GPL simply states that these sources have to be provided, which
is feasible whichever kind on toolchain is used in Buildroot.

>
> * How to handle proprietary applications? Even though during
> development these applications may be build from within buildroot
> (when sources are available), one would typically not want to
> distribute the sources to the end-user. Still, in order to be able to
> regenerate the system, I think the user should have access to the
> binary versions of these applications. How do we handle this, what is
> the best practice?
> One solution is to place them in output/target directly, before
> creating the buildroot tarball. Downside is that a 'make clean' would
> remove these applications. Alternatively, one could use the customize
> package for this purpose. This would require a separate .config file
> for use by the end-user, but this may be ok and maybe needed for the
> toolchain anyhow, depending on the output of the previous point.

Is it really mandatory to make the end user able to build the entire
system?
Here's why I don't think so.

For programs and libraries, there is a clear relationship between the
"source code" and the "object code or executable form": the latter is
a binary form of the former, from which it is obtained through a
process that is automated by the toolchain and the build scripts.

OTOH, the product of Buildroot is a root filesystem, which is not
a binary form of BR's sources. Buildroot is what the GPLv2 defines "the
scripts used to control compilation and installation of the executable".
In fact, just like gcc or make, Buildroot itself is not present in the
final image (well, except for the skeleton files and a little more).

Each executable or library file in the rootfs is a binary form of
a package: /bin/busybox is a binary form of Busybox's sources,
/usr/bin/myapp is a binary form of my own (proprietary) application
source code.

So, Buildroot has to be distributed because it is required to build each
single executable and library whose sources are GPL-licensed, not
because one has to be able to build the entire root filesystem.

For example, if an embedded device contains a modified busybox and a
proprietary application, anybody who receives the device has the right
to obtain the modified busybox's sources and the tools+scripts
necessary to compile it (which in our case means toolchain + buildroot).
But I do not see any legal obligation to make him able to build the
entire rootfs.

But of course I am not a lawyer.

It would be good the hear the main BR developers' opinion about this
and, why not, to add a notice at the beginning of COPYING clarifying
what is the intention of Buildroot developers.
I think of something like the note on top of the COPYING file in the
Linux source tree.

>
> * What about changes to buildroot itself? Since buildroot is GPL, any
> distribution of buildroot comes with obligations as well. One of these
> obligations is the requirement to clearly advertise changes to the GPL
> software.
>
> [quote from the GPLv2 license:]
>    2. You may modify your copy or copies of the Program or any portion
> of it, thus forming a work based on the Program, and copy and
> distribute such modifications or work under the terms of Section 1
> above, provided that you also meet all of these conditions:
>
>      a) You must cause the modified files to carry prominent notices
>      stating that you changed the files and the date of any change.
> [endquote]
>
>   However, the way I see it, this is not the typical way of working.
> The workflow in buildroot is that you submit patches to the list,
> which can then be included. Although the patch itself contains the
> name of the author and the e-mail header bears the date, the modified
> files do not typically contain this information.
> In my case, I make modifications to buildroot in our own repository. I
> try to submit most of these changes to the list, but not all of them
> are fit for mainstream, and submitted patches are not applied
> immediately. So, when releasing the system, there will still be
> unsubmitted changes. These changes do not comply with point 2a above,
> since the files do not contain the required metadata.
> Technically, the only solution I see is to add 'prominent notices' to
> modified files in our own repository, but manually remove them when
> submitting patches to the buildroot list. This is annoying but may be
> the only legal possibility. How do others see this?

If've never really understood the rationale behind this GPL requirement,
although it might have had some use in the pre-VCS era.

For Buildroot recipe files in particular, many of which are very small, 
these notices would sometimes take more space than the actual code.
This would quickly become unsustainable bloat.

I'm afraid I have no strong opinion about this point. I can only observe
that nobody seems to miss these prominent notes in the Buildroot
sources.


Luca
