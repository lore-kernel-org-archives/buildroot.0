From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Mar 2019 11:09:32 +0100
Subject: [Buildroot] [PATCH v4 2/6] qt5: Provide generic qmake package
 infrastructure
In-Reply-To: <20190326081814.0109d351@windsurf>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-3-anaumann@ultratronik.de>
 <e5be61b9-45e1-ddea-2b8a-9ba7511383b3@mind.be>
 <20190326081814.0109d351@windsurf>
Message-ID: <42086765-6c53-b726-f09e-184209193b0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/03/2019 08:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 26 Mar 2019 00:16:47 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> This is done by re-running the install step of the qmake generated Makefile
>>> with the package build directory prepended (to the staging/host path). Even
>>> though this does create lengthy pathes it allows for easy separation of the
>>> staging files from the host destined files by just omitting the resulting
>>> BUILD_DIR+HOST_DIR path from the following rsync call to the real target folder.  
>>
>>  We have not converged yet on whether this is the right approach. So maybe, in
>> order to move forward, it would be better to split the patch up into a first bit
>> that creates the qmake package but does not define target install steps, then
>> convert the relevant packages to qmake packages, and finally change the qmake
>> infra to do target install and changes all the packages again. It's more work to
>> do it this way, obviously, but it would allow us to already commit part of the
>> series before we have converged on it completely.
> 
> While I understand your idea of splitting things up further in terms of
> patches, I think we can try to agree on how the target installation
> step should be done and use the approach proposed by Andreas to

 Sure, that's why I said "maybe". It's not a requirement, but it is also
frustrating to respinning a series and seeing no progress on it. That's why I
proposed the option.

> directly have the qmake infrastructure use this target installation
> logic. Andreas has already done lots of work on this (and building Qt5
> modules takes a lot of time, so I suppose this patch series is annoying
> like hell to build-test), so I'd like to not raise the barrier too high
> here.
> 
>>> In addition, rsync excludes all header-, documentation- and cmake-pathes as well
>>> as libtool and prl files in order to avoid unnecessary files accumulating in
>>> target.  
>>
>>  All of these (except *.prl) are anyway cleaned up in target finalize, so by
>> itself it's not that useful.
> 
> Yes, I also felt that all those exclusions were not really needed, we
> should probably keep things simple: rsync everything, and really on
> target-finalize for doing the cleanup.
> 
>>> Getting rid of the many conditional install commands is possible because qmake
>>> already takes care of this when generating the Makefile install targets with the
>>> given or autodetected configure options of each package.
>>>
>>> However, custom install steps may have to remain in cases where a particular
>>> buildroot option has no corresponding setting in the packages configuration
>>> options.  
>>
>>  This is also something that probably will need more discussion.
> 
> Why ?

 Uh, I don't see that either anymore...

 Oh, wait, now I remember: at the time I wrote that, I thought that I was going
to give the feedback somewhere that we should have a list of files (wildcards)
to copy from staging to target instead of requiring custom install commands. But
I never got around to making that comment :-)

 Anyway, keeping custom install commands is definitely the way to go as a first
step.

> 
>>> +	$$(MAKE) -C $$($$(PKG)_SRCDIR) INSTALL_ROOT=$$($$(PKG)_SRCDIR)/tmp-target-install $$($(2)_INSTALL_STAGING_OPTS)  
>>
>>  This part really needs some explanation in the comment above, because it is
>> *very* counter-intuitive. You should explain why INSTALL_ROOT is used here and
>> not for staging install, and what its effect is exactly, i.e. that qmake
>> configures things with STAGING_DIR as the prefix and that INSTALL_ROOT goes
>> before it, so you end up with everything under
>> $(@D)/tmp-target-install/$(STAGING_DIR)
>>
>>  However, I'm not sure that this is the way we want to go. What is wrong with
>> the pkg-files-list? You said before that it was incorrect, but if that is the
>> case, it should be fixed.
> 
> At this point, I find the approach proposed by Andreas to be pretty
> nice.

 I'm also starting to warm up to it... Norbert has used the same approach for
libfuse, and mentioned that it is something that could be generalized to all
packages. And I'm starting to see the merit of that.

 I feel more comfortable to do that experiment here than in the libfuse package,
because here it is in infra so relatively easy to change. For example, I guess
it would also be nice to do a common install (in an additional step that both
target and staging install depend on, or maybe just as part of the build step)
into a PPD-like additional directory, and copy from there to the actual target
and staging, preferably using the hardlink approach instead of actual copying.
I'm just dreaming out loud here.

> We don't yet use pkg-files-list really as part of the build
> process anywhere, I feel a bit more comfortable at this point with what
> Andreas is proposing. No strong argument on this, just a general
> feeling.

 Okay, fair enough, let's not go for the pkg-files-list approach.

 Andreas, could you include this sentence from Thomas in the commit message so
we remember what the reason was to choose for this approach rather than
pkg-files-list?


> One advantage of Andreas approach is that it does not create a
> dependency between the target installation step and the staging
> installation step. They can happen in whatever order, or even in
> parallel (think top-level parallel build). Indeed our package
> infrastructure does not enforce any dependency between target
> installation and staging installation.

 Actually it does:

ifeq ($$($(2)_INSTALL_STAGING),YES)
$(1)-install-staging:                   $$($(2)_TARGET_INSTALL_STAGING)
$$($(2)_TARGET_INSTALL_STAGING):        $$($(2)_TARGET_BUILD)
# Some packages use install-staging stuff for install-target
$$($(2)_TARGET_INSTALL_TARGET):         $$($(2)_TARGET_INSTALL_STAGING)
else
$(1)-install-staging:
endif


 Introduced by:

commit 6c5c08b854e4490697076ae3c5a9c587d8672c63
Author: Fabio Porcedda <fabio.porcedda@gmail.com>
Date:   Fri Feb 14 10:55:05 2014

    package: add support for top-level parallel make

    To be able to use top-level parallel make we must not depend in a rule
    on the order of evaluation of the prerequisites, so instead of relying
    on the left to right ordering of evaluation of the prerequisites add
    an explicit rule to describe the dependencies.

    We cannot use the pattern rules because they must have the same
    dependency for every package, but we need to change the dependencies
    depending on $(2)_OVERRIDE_SRCDIR variable value, so we must use a
    more flexible way like $(2)_TARGET_% variables.

    So add explicit dependencies for the following stamp files:
      $(2)_TARGET_EXTRACT
      $(2)_TARGET_PATCH
      $(2)_TARGET_CONFIGURE
      $(2)_TARGET_BUILD
      $(2)_TARGET_INSTALL_STAGING
      $(2)_TARGET_INSTALL_TARGET
      $(2)_TARGET_INSTALL_IMAGES
      $(2)_TARGET_INSTALL_HOST

    Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


2014... We've been working too long on this stuff...


 Regards,
 Arnout

> The solution of doing staging
> installation, and then use the pkg-file-list of files installed to
> staging for the target installation would require adding such a
> dependency between the target installation and staging installation.
> 
> Best regards,
> 
> Thomas
> 
