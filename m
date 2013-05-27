From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 May 2013 18:50:54 +0200
Subject: [Buildroot] Design issue with the out-of-tree support
In-Reply-To: <20130523131251.2ffc509f@skate>
References: <20130523131251.2ffc509f@skate>
Message-ID: <51A38EEE.7000406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/05/13 13:12, Thomas Petazzoni wrote:
>   * Make autoreconf a step on its own, instead of being either a
>     pre-patch hook or a post-patch hook. This may also allow to do
>     something like a 'make <pkg>-reautoreconf' target, like we have
>     'make <pkg>-reconfigure' and 'make <pkg>-rebuild'. Then, this
>     autoreconf step would be the one that has:
>
>     $(1)-autoreconf: $$($(2)_DEPENDENCIES)
>
>     which would work ok, since the RTAI/Linux integration depends on
>     rtai-patch, which wouldn't pull the dependencies of the rtai package.
>
>     However, I am not yet sure how to insert this step into the package
>     logic, since this step is specific to autotools package, and
>     therefore would normally not belong to the pkg-generic.mk
>     infrastructure.

  I haven't read the thread in detail or thought about it very carefully, 
but some time ago I already thought that this would be better.

  It is not necessarily limited to autoreconf. For example, the way that 
xenomai patches the linux sources fits in this as well (xenomai could add 
to LINUX_POST_AUTORECONF_HOOKS).

  So I would propose to add another step to the generic infrastructure. I 
would call it the PREPARE step, and make it a full step with CMDS and HOOKS.

  The question is whether the OVERRIDE_SRCDIR infrastructure should apply 
this step or not. Conceptually, it shouldn't, but that means that users 
of OVERRIDE_SRCDIR for packages that need an autoreconf would need to do 
the autoreconf manually. Which is probably for the best anyway, but which 
is a change compared to current behaviour.

  BTW the libtool fixup should probably be done in this prepare step as 
well. But again, I haven't thought this through in detail.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
