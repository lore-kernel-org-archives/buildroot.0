From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Tue, 1 Oct 2013 15:01:52 -0500
Subject: [Buildroot] [RFC] package: Redownload HEAD packages every build
In-Reply-To: <20131001205154.059ec4af@skate>
References: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
 <20131001205154.059ec4af@skate>
Message-ID: <OF074BC262.DC488FB4-ON86257BF7.006D21D1-86257BF7.006DFBEC@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas and Arnout,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 10/01/2013 
01:51:54 PM:

> It seems like the mechanism you're proposing overlaps quite
> significantly with that, while being a bit less flexible. Have you
> tried the <pkg>_OVERRIDE_SRCDIR mechanism?

I did a little digging into the <pkg>_OVERRIDE_SRCDIR mechanism but I 
could not find any documentation and the implementation in the make 
structure is a little unclear.  What is the full intent of that mechanism?

> Regarding the implementation, I'm not sure to understand how
> <pkg>_VERSION = HEAD is supposed to be used. For example, I have a
> software, whose source code is handled in Git, in its 'master' branch.
> How would I tell your mechanism that I want the latest source code to
> be redownloaded each time?

I failed to take git and mercurial into account with this patch. 
Subversion uses "HEAD" for its latest source code.

> Moreover, it's going to be redownloaded each time completely, which is
> quite annoying during development. The <pkg>_OVERRIDE_SRCDIR allows you
> to point to a local directory, which avoids re-downloading the entire
> source code everytime.

Arnout Vandecappelle <arnout@mind.be> wrote on 10/01/2013 11:08:23 AM:

>   Also I think I would prefer instead to have an explicit variable to 
> indicate that it should be re-downloaded, e.g.
> 
> ifneq ($($(PKG)_FORCE_DOWNLOAD),)
>    $(Q)$(RM) $(DL_DIR)/$($(PKG)_SOURCE)
> endif

I like this approach much better.  It would make this mechanism very 
explicit and avoid having to handle all of the different repository 
nuances. I would like to create a new patch that implements this method.

>   This variable can be set either from the package's .mk file or from 
the 
> local override file.
> 
> 
>   And finally, the documentation should be updated as well.

Agreed.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131001/48284d2e/attachment.html>
