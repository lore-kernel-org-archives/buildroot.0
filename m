From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Apr 2019 13:23:39 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/libfuse: common files from
 libfuse3 are prefered
In-Reply-To: <CADYdroPX3P09ya9Qr9YeZ2YjLxyPcCAG89O-dHgZB6Kvqqyt2g@mail.gmail.com>
References: <20190315133033.5275-1-norbert.lange@andritz.com>
 <20190315133033.5275-5-norbert.lange@andritz.com>
 <d521258a-7802-ef6f-961b-3dc52717bf43@mind.be>
 <CADYdroNPCTNv0uVUNX_h-q8EefuR6ZN8sZgDorBwE-zuARHb1w@mail.gmail.com>
 <c4b04ef3-3938-0ad4-4c7a-14ea7d3036e9@mind.be>
 <CADYdroMEDSDjoG388HcMdc8QaOX+CcToCBS9M7H6H0LFr-k-yg@mail.gmail.com>
 <72b3e43e-2150-e959-fba2-58323051bec4@mind.be>
 <CADYdroPX3P09ya9Qr9YeZ2YjLxyPcCAG89O-dHgZB6Kvqqyt2g@mail.gmail.com>
Message-ID: <cfbb1470-7082-41a7-19ff-400b27a5c76f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/03/2019 21:28, Norbert Lange wrote:
> Am Di., 26. M?rz 2019 um 21:19 Uhr schrieb Arnout Vandecappelle
> <arnout@mind.be>:
[snip]
>>>>> But more robust, specifically if you rebuild single packages (I know
>>>>> this is probably not officially supported).
>>>>
>>>>  It is supported, but I don't see how it creates a problem. There could be a
>>>> problem if libfuse3 would call it something that matches libfuse.so*, but it
>>>> doesn't (and it never will).
>>>
>>> Aslong we dont install /etc/fuse.conf =)
>>
>>  Indeed. But then, IIUC, the fuse.conf of libfuse3 should be used. So libfuse3
>> should depend on libfuse, no? That was actually my original thought when I saw
>> this dependency on libfuse3, but then I found that it was in fact entirely
>> redundant.
> 
> err. why would libfuse3 depend on libfuse, so that the files get overwritten
> in the right order? To me the latter is a (crude) implementation detail.

 When there are two packages that create the same file, we need some kind of
dependency to make sure the right version ends up in the target rootfs. This can
be a Config.in dependency (e.g. for python/python3: only one of them can be
selected), or a .mk adaptation that filters the to-be-installed files based on
whether the other package is selected (= what you've done here), or adding it to
_DEPENDENCIES in some order. In the latter case, usually the one that is
supposed to "win" will add the one that is supposed to "loose" to its
_DEPENDENCIES. The (only?) exception is busybox, because the busybox install
script will avoid overwriting files that already exist.

[snip]
>>  If we have two fronts that would like to use the tmpinstall concept, then maybe
>> we should do it in both at the same time, to maximize our learning. And since
>> this would be a kind of prototype of the eventual tmpinstall for all packages,
>> we don't need to bikeshed too much on the exact details (tmpinstall?
>> tmp-target-install? In $($(PKG)_BUILDDIR) or in $(BUILDDIR)/tmpinstall/$(pkg)? etc.)
> 
> You are giving me just more ideas.
> What if after building you end up with those
> $(BUILDDIR)/tmpinstall/$(pkg) directories,
> be free to delete all space gobbling  $($(PKG)_BUILDDIR) dirs, and be
> able to reinstall target
> or even staging purely from these "deployment packages"...

 Yes, that would be nice. It would also require moving the stamp files to the
tmpinstall directory, though. But then, it is no longer to delete the build dir
to force a clean build. So, more discussion needed...


> if you are familiar with debhelper (with multiple binary packages resulting),
> the install step installs into debian/tmp then uses textfile to define
> what-goes-where.

 Yes, that's what all distro packagers that I know are doing. Including
OpenEmbedded and OpenWrt.

> You could drop some files in the package directory, like an
> {target,staging}.install file,
> having relative paths/globs to mark the stuff that should be
> installed [1].  Or the same stuff for links [2].
> 
> The upside here is, you could copy those files into/nextto the
> "deployment packages",
> so those could be complete and self-sufficient for later Installation.
> (of course there might be always outliers that are too complex...)
> 
> [1] https://manpages.debian.org/testing/debhelper/dh_install.1.en.html
> [2] https://manpages.debian.org/testing/debhelper/dh_link.1.en.html
> 
>>  So, if you stick with the tmpinstall approach, I'm not going to oppose it any more.
> 
> Id like to finish the package (after addressing the open points),
> then I may try to brew up something.
> 
> Norbert
> 
> PS. I glanced at the qt thread (quite hard to keep track of the
> discussion entering in the middle),
> but it seems that is completely orthogonal and more about hacking into
> the qmake environment,
> not a post-processing step.

 The similarity is that the qt packages also can't do a target install with a
simple 'make -C $(@D) install DESTDIR=$(TARGET_DIR)'. And the solution chosen is
to install into a temporary install directory and from there copy to the real
target. Which is exactly what you want to do for libfuse/libfuse3.

 Regards,
 Arnout
