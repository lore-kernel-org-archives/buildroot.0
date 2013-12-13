From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Fri, 13 Dec 2013 03:26:42 -0600
Subject: [Buildroot] [PATCH 1/2] pkg-generick.mk: support for multiple
 patch dirs
In-Reply-To: <52AA3485.2050604@mind.be>
References: <1386784684-6546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <52AA3485.2050604@mind.be>
Message-ID: <OFB9285B3A.BDE2AE7A-ON86257C40.00314AB2-86257C40.0033E21B@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Arnout Vandecappelle <arnout@mind.be> wrote on 12/12/2013 04:11:17 PM:

> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 1fce71b..53d96c9 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -134,8 +134,11 @@ endif
> >   # The RAWNAME variable is the lowercased package name, which allows 
to
> >   # find the package directory (typically package/<pkgname>) and the
> >   # prefix of the patches
> > +#
> > +# For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
> >   $(BUILD_DIR)/%/.stamp_patched: NAMEVER = 
$(RAWNAME)-$($(PKG)_VERSION)
> > -$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = 
$($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call 
qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
> > +$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = 
$($(PKG)_DIR_PREFIX)/$(RAWNAME)
> > +$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(if 
$(BR2_GLOBAL_PATCH_DIR),$(foreach pdir,$(call 
qstrip,$(BR2_GLOBAL_PATCH_DIR)),$(pdir)/$(RAWNAME)))
> 
>   I guess you meant to avoid the "overhead" of the foreach when 
> BR2_GLOBAL_PATCH_DIR is empty? Unfortunately, the condition will always 
> be true because it is "" when empty, and "" is non-empty... So you'd 
have 
> to qstrip it first. But anyway, the overhead of foreach is nothing, so I 

> think it's both more efficient and easier to read if the condition is 
> removed.

I apologies for not putting a version on my patches. I was in a rush to 
submit a second version and forgot the step of adding a new version title. 
Lesson learned (since Thomas Petazzoni)

I wasn't attempting so save the overhead with this check. Rather, I was 
trying to prevent that when BR2_GLOBAL_PATCH_DIR is empty, from not 
generating "/$(RAWNAME)" when BR2_GLOBAL_PATCH_DIR is empty which is 
happening with current implementation of BR2_GLOBAL_PATCH_DIR.

> 
>   Minor detail: I would have used
> $(addsuffix /$(RAWNAME),$(BR2_GLOBAL_PATCH_DIR))
> but I guess that's a matter of taste.

I do prefer this - thanks for the suggestion and I will update with this 
in mind. This will also make this much simpler as it I can use addsuffix 
and it will handle the case where BR2_GLOBAL_PATCH_DIR is empty.

I will submit a v3 of this with your suggestions in mind.

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131213/24745e9f/attachment.html>
