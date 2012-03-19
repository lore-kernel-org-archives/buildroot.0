From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Mar 2012 22:51:29 +0100
Subject: [Buildroot] [PATCH] pkg-infra: use ?= instead of ifdef
In-Reply-To: <20120319095747.4b571e8f@skate>
References: <1332113334-20119-1-git-send-email-arnout@mind.be>
 <20120319095747.4b571e8f@skate>
Message-ID: <201203192251.29275.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 19 March 2012 09:57:47 Thomas Petazzoni wrote:
> Hello,
> 
> Le Mon, 19 Mar 2012 00:28:54 +0100,
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :
> 
> > ifdef considers a variable undefined if it is defined as empty.  In the
> > GENTARGETS/AUTOTARGETS/CMAKETARGETS infrastructure, the ifdef construct
> > is often used to default to the value from the target-variable if the
> > host-variable is not defined.  However, this makes it impossible to
> > override the host-variable as empty.  Therefore, use ?= instead to assign
> > the defaults.
> 
> Could you share a specific example on why this would be useful? I'm
> sure there are uses cases, but I'm curious about the one you're having.

 Good question...  There was an example on the list a while back, and a
couple of days later a made a patch for it but it never got sent out.
Now I'm cleaning up my patch queue and just sent it.  But I don't remember
the original reason, and looking at the patch doesn't ring a bell either.
In fact, all the ones I fixed in this patch don't really make sense if
they're defined empty, except for the _SUBDIR and maybe _PATCH.


> > I didn't touch the _VERSION infrastructure because I'm afraid to break it.
> > In fact, I think it already is broken (I don't see how that /-to-_
> > substitution can work for host-packages).
> 
> Not sure I understand what is broken here. What does "/-to-_" means?

 /-to-_ substitution means the subsitution of / into _
$(2)_VERSION = $(subst /,_,$($(3)_VERSION))

 I think it's broken because the $($(3)_VERSION) of a host package
has already been substituted before:

$(2)_DL_VERSION = $($(2)_VERSION)
$(2)_VERSION = $(subst /,_,$($(2)_VERSION))

 Actually for PKG_VERSION it's OK, but HOST_PKG_DL_VERSION will be 
incorrect because it has _ instead of /.  Something we wouldn't
notice because we have no packages with / in the version.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120319/ffa2fddf/attachment.html>
