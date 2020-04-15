From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 07:43:55 +0200
Subject: [Buildroot] [PATCH v3 0/8] Bump of SElinux related libs/tools
 to 3.0
In-Reply-To: <CANQCQpYUoZX=L7LMJ_Mkhvak0y_48RZuYaaHzx5MFAvwhQtArQ@mail.gmail.com>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
 <20200414182303.250cc38d@windsurf.home>
 <CANQCQpYUoZX=L7LMJ_Mkhvak0y_48RZuYaaHzx5MFAvwhQtArQ@mail.gmail.com>
Message-ID: <20200415074355.4f382f62@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann, Arnout, Adam.

On Tue, 14 Apr 2020 12:20:40 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> > Is the only benefit of that change the fact that it will match with
> > what release monitoring says ?  
> 
> Correct.  If we do stay with the x.y instead, I think it still makes
> sense to use the $(LIBSELINUX_VERION) across all those packages as the
> bumps should always be the same version for those 7 packages.

I never remember what are the rules to share a package <pkg>_VERSION
variable with other packages. For example for mesa3d/mesa3d-headers, we
do not share the version information, we duplicate it:

# Not possible to directly refer to mesa3d variables, because of
# first/second expansion trickery...
MESA3D_HEADERS_VERSION = 20.0.4

But in protobuf/python-protobuf:

# When bumping this package, make sure to also verify if the
# python-protobuf package still works, as they share the same
# version/site variables.
PROTOBUF_VERSION = 3.11.4

PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
PYTHON_PROTOBUF_SOURCE = protobuf-python-$(PYTHON_PROTOBUF_VERSION).tar.gz
PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)

Here we share the version number.

Yann, Arnout, could you re-explain this ? :-)

> > So to me, it seems like we should instead change the versions reported
> > by release-monitoring.org instead.  
> 
> Is there a way to reorder the versions on release monitoring instead?
> As it just happens the dates end up at the top of the list
> https://release-monitoring.org/project/01717/

I have filled in a bug report at
https://github.com/fedora-infra/anitya/issues/897 about this. I
*believe* that with the current description of the project, only
semantic versions should be displayed, because a prefix of libselinux-
for the tags is specified. So it should filter the tags that have the
form libselinux-<something>, and extract the <something>. The other
versions that are there might date back from when this was not
specified, and need to be purged.

Overall, I'll mark your series as Changes Requested. I would suggest to
bump to 3.0, without sharing the version for now, so that we can get
the 3.0 version bump merged soon.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
