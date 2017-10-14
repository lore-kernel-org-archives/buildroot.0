From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 14 Oct 2017 16:44:46 -0500
Subject: [Buildroot] [PATCH] uboot-tools: bugfix libfdt python build
In-Reply-To: <CANQCQpZhRskjjpSbOiUEEM0qEimpkC+R7NA1B1iV-G+HO1+=iQ@mail.gmail.com>
References: <20171013023556.25825-1-matthew.weber@rockwellcollins.com>
 <20171013161128.37827061@windsurf.lan>
 <CANQCQpZhRskjjpSbOiUEEM0qEimpkC+R7NA1B1iV-G+HO1+=iQ@mail.gmail.com>
Message-ID: <CANQCQpbf+LPbfEnw91CkD7H5kxRSywZGbPD9vcU074e3sA2puA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fabio, Peter,

On Fri, Oct 13, 2017 at 8:01 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Thomas,
>
> On Fri, Oct 13, 2017 at 9:11 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> Hello,
>>
>> On Thu, 12 Oct 2017 21:35:56 -0500, Matt Weber wrote:
>>
>> > +ifeq ($(BR2_PACKAGE_PYTHON3),y)
>> > +HOST_UBOOT_TOOLS_DEPENDENCIES += host-python3
>> > +else
>> > +HOST_UBOOT_TOOLS_DEPENDENCIES += host-python
>> > +endif
>>
>> Gaah, adding host-python as a mandatory dependency of host-uboot-tools
>> is a big change. Any way around that ?
>>
>
> I looked at the uboot python issue a bit more and I'll send something
> upstream.  I'm thinking the best option would be to define an optional
> SWIG variable providing an absolute path to the tool and include an
> update to the SWIG detection logic using it.
>
> Then Buildroot could support an option to enable the libftd in the
> menu and let that select python.  This option would be applicable to
> host and/or target, as I noticed target uboot-tools was also failing
> just not as often.
>
> So the python intepretor path is still valid, but if the plan above
> sounds good,  I'll rework and remove the unconditional dependency.
>

I dug further into the python/swig issue in uboot/uboot-tools and
their build of libfdt.  I ended up with the following conclusions.
1) Need to bump both packages to 2017.9 which I noticed was already
underway (Thanks Fabio).  This removes part of this patch submission
that fixed the python interpreter (already upstream after 9/3)
2) Need something like the following added respectively with the new
*_PYTHON_DEFS variable added to the MAKE OPTS in both uboot and
uboot-tools
(package/uboot-tools.mk)
# BR2_TARGET_UBOOT_NEEDS_PYLIBFDT enables python2/swig host dependencies
# as part of uboot's dependencies, however that means they occur after
# this package in the build sequence. We add them here conditionally,
# to move them prior to this package if the option is selected.  If
# it isn't selected, we still need to pass a swig path so that the pkg's
# logic to include the _libfdt.so target drops that target as the path
isn't valid.
HOST_UBOOT_TOOLS_PYTHON_DEFS = SWIG_TOOL="$(HOST_DIR)/bin/swig"
ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
HOST_UBOOT_TOOLS_PYTHON_DEFS +=
PYTHON="$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)"
HOST_UBOOT_TOOLS_DEPENDENCIES += host-python host-swig
endif

(boot/uboot.mk)
UBOOT_PYTHON_DEFS = SWIG_TOOL="$(HOST_DIR)/bin/swig"
ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
UBOOT_PYTHON_DEFS += PYTHON="$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)"
UBOOT_DEPENDENCIES += host-python host-swig
endif

3) I need to send a patch upstream to get the SWIG_TOOL variable used
instead of a "which swig" currently used in the tools/Makefile to
trigger the setup.py build of libfdt.so.  This doesn't fix all
versions of uboot, just uboot-tools or uboots newer then a version.
Thus I wonder for the older uboot versions that still have a host
system dependency requirement, we add something like below in the
uboot.mk above the ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)

# There is a flaw in the tools/Makefile with the swig
# checking line added on 2017-05-27 (ee95d10b).  It doesn't
# use a variable which could be set to the $(HOST_DIR)/bin/swig.
# Until this is resolved, depending on the uboot version,
# there is still a host system requirement to have the following
# packages installed (apt install swig libpython-dev).   Otherwise
# you have to always have uboot select swig/python to prevent a
# build failure, or remove swig from your host system.


If all those changes go well, it means no requirement to build python
with any uboot unless you want libfdt.

I plan to get the swig patch submitted uboot upstream this week and
supersede this patch with a new patchset dependent on the 2017.9 bump.
It will include the new MAKE OPT updates.

Matt
