From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Apr 2020 09:40:29 +0200
Subject: [Buildroot] [PATCH v3 0/8] Bump of SElinux related libs/tools
 to 3.0
In-Reply-To: <20200415074355.4f382f62@windsurf.home>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
 <20200414182303.250cc38d@windsurf.home>
 <CANQCQpYUoZX=L7LMJ_Mkhvak0y_48RZuYaaHzx5MFAvwhQtArQ@mail.gmail.com>
 <20200415074355.4f382f62@windsurf.home>
Message-ID: <1427fb1c-7f5b-1a83-a735-107745b842ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2020 07:43, Thomas Petazzoni wrote:
> Hello,
> 
> +Yann, Arnout, Adam.
> 
> On Tue, 14 Apr 2020 12:20:40 -0500
> Matthew Weber <matthew.weber@collins.com> wrote:
> 
>>> Is the only benefit of that change the fact that it will match with
>>> what release monitoring says ?  
>>
>> Correct.  If we do stay with the x.y instead, I think it still makes
>> sense to use the $(LIBSELINUX_VERION) across all those packages as the
>> bumps should always be the same version for those 7 packages.
> 
> I never remember what are the rules to share a package <pkg>_VERSION
> variable with other packages. 

 You can only do that if it's included from a place that guarantees the
ordering, like e.g. for qt5: package/qt5/qt5.mk sets the version and *then*
include's package/qt5/qt5base/qt5base.mk.

 In any other case, it should be duplicated.

> For example for mesa3d/mesa3d-headers, we
> do not share the version information, we duplicate it:
> 
> # Not possible to directly refer to mesa3d variables, because of
> # first/second expansion trickery...
> MESA3D_HEADERS_VERSION = 20.0.4
> 
> But in protobuf/python-protobuf:
> 
> # When bumping this package, make sure to also verify if the
> # python-protobuf package still works, as they share the same
> # version/site variables.
> PROTOBUF_VERSION = 3.11.4
> 
> PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)

 This *accidentally* works because we sort the included files in the top-level
Makefile and protobuf < python-protobuf. It's a pretty dangerous thing to do though.

> PYTHON_PROTOBUF_SOURCE = protobuf-python-$(PYTHON_PROTOBUF_VERSION).tar.gz
> PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
> 
> Here we share the version number.
> 
> Yann, Arnout, could you re-explain this ? :-)
> 
>>> So to me, it seems like we should instead change the versions reported
>>> by release-monitoring.org instead.  
>>
>> Is there a way to reorder the versions on release monitoring instead?
>> As it just happens the dates end up at the top of the list
>> https://release-monitoring.org/project/01717/
> 
> I have filled in a bug report at
> https://github.com/fedora-infra/anitya/issues/897 about this. I
> *believe* that with the current description of the project, only
> semantic versions should be displayed, because a prefix of libselinux-
> for the tags is specified. So it should filter the tags that have the
> form libselinux-<something>, and extract the <something>. The other
> versions that are there might date back from when this was not
> specified, and need to be purged.
> 
> Overall, I'll mark your series as Changes Requested. I would suggest to
> bump to 3.0, without sharing the version for now, so that we can get
> the 3.0 version bump merged soon.

 Ack, no sharing of versions please.


 Note that I have a vague idea of how we may be able to share versions (+ some
other features). It is currently not possible because the _VERSION is used
(indirectly) in some rules and conditions in the expansion of
inner-generic-package. So my idea was to delay expansion of
inner-generic-package until after all the packages have been included. This
would also make it possible, for instance, to override a package version in a
br2_external, and indeed modify any package variable in the external. And it
would also make it possible to limit the expansion to just what is specified in
PACKAGES, which would speed up the `make` invocation significantly (I estimate a
factor of two).

 Regards,
 Arnout
