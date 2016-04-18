From: Patrick Williams <patrick@stwcx.xyz>
Date: Mon, 18 Apr 2016 15:59:32 -0500
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <CAJJ6jxsBQoWmECAGtsAr2-v91a61nOXB2a4A9BJVGS_eN3dW6Q@mail.gmail.com>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
 <20160417223143.0b54cce6@free-electrons.com>
 <20160418162528.GA5827@asimov.austin.ibm.com>
 <CAJJ6jxuPyLjaZOWNJTeEebrEsyUqT81gwgoZcUDTH9A6yPX++w@mail.gmail.com>
 <20160418171435.GB5827@asimov.austin.ibm.com>
 <CAJJ6jxsBQoWmECAGtsAr2-v91a61nOXB2a4A9BJVGS_eN3dW6Q@mail.gmail.com>
Message-ID: <20160418205932.GA19968@asimov.austin.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 18, 2016 at 10:37:27AM -0700, Steve Calfee wrote:
> On Mon, Apr 18, 2016 at 10:14 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> > On Mon, Apr 18, 2016 at 10:07:58AM -0700, Steve Calfee wrote:
> >> Hi Patrick,
> >>
> >>
> >> Couldn't you get everything you want by allowing a custom user "fred"
> >> to create a symlink in your ...configs/ directory to his own custom
> >> config like:
> >>
> >> ln -s ../custom/configs/freds_defconfig
> >>
> >> Then all the buildroot infrastructure will work as designed, you can
> >> have your standard BR2_EXTERNAL tree and "fred" can have his own
> >> custom tree. Since you won't check in the symlink and only fred's
> >> development will use it, no git conflicts....?
> >>
> >> Regards, Steve
> >
> > Steve,
> >
> > That is a good idea.  I failed to mention one aspect that would prevent
> > that from working very well.
> >
> > A few of the companies we work with keep a custom tree in their own
> > repository (one of them SVN) and then as part of their build process
> > they copy it on top of the custom tree.  They don't have a mechanism to
> > maintain the symlinks because they don't actually make commits to our
> > repository.
> >
> 
> Hi Patrick,
> 
> I don't understand the problem, symlinks don't care if their targets
> are deleted and recreated.
> 
> I was already assuming users were not putting stuff into your git tree
> and stuff in yourtree/custom was someone else's repo. Having the
> symlink is nice if a custom repo is actually checked out into "custom"
> inside your tree.
> 
> If they must have an external repo and splat their repo on top of
> custom no problem -- the only thing that won't work as planned is
> save_defconfig (etc). The newly saved  configs will be properly
> updated in the custom filesystem/tree, but if it is a copy, the
> changes will have to be manually updated into the original (SVN) repo.
> 
> Similarly, a user could put a copy of his configs in your configs
> directory and just not check them into your tree. Again a manual
> update to an actual repo will be needed if it changes. But how would
> having the originally proposed second "custom" external help this
> problem? - if it isn't their actual repo config changes would have to
> be manually updated anyway.
> 
> Regards, Steve

Steve,

I re-read your proposal and missed before where you said to not check
the symlinks into git.  It seems like this is workable but creates extra
overhead on the part of people using the custom tree, in that they must
manually symlink into $(BR2_EXTERNAL)/configs.

-- 
Patrick Williams
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160418/70ca01b5/attachment.asc>
