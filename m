From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 17 Dec 2010 13:11:41 +0000
Subject: [Buildroot] [PATCH v2] buildroot:download: Add option to
 download SVN or GIT repository with version control information.
In-Reply-To: <20101217113436.43ec2958@surf>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
	<20101217113436.43ec2958@surf>
Message-ID: <1292591501.6496.58.camel@dubciaranr0.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I'm glad this is being debated again.  The itch that just won't go
away... :-)

Ar Aoine, 2010-12-17 ag 11:34 +0100, scr?obh Thomas Petazzoni:

> But for some packages,
> we would like Buildroot to not take care of the download/extract/patch
> steps, and let the user point Buildroot to a particular location where
> the source tree of the component is already available. 

There are many great features in Buildroot and one of them is that you
can just give it a defconfig and off it goes to retrieve all the
required components.  It would be a pity to leave this out of the
"working tree" support structure.
I had the idea (not implemented yet) that Buildroot should try to check
out $(PKG)_DL_VERSION and if it fails, get an update from upstream and
try to checkout again, failing only at this point.  Of course changes to
the working copy would have to be cautious so that changes are not
overwritten unintentionally.  OK the thinking is a bit GIT-centric but
can be expanded to other VCS also.  Doesn't everything start by
supporting a limited set before aiming for world domination...

> The use case is
> that Buildroot users want to hack on the kernel, on a particular
> library or application: they want to have the source tree of this
> component is whatever location they want, to manage this source code
> with whatever version control system they want, and they don't want
> Buildroot to remove the source code when a global "make clean" is not
> in Buildroot.

The way I see it Buildroot is used both by developers ("I want to change
source code") and by those who just want a repeatable way to make a
bootable system ("just give me a burnable image").  It would be ideal if
the same system could be used by both camps.
Keeping the source code outside BUILD_DIR through your OVERRIDE_SRC_DIR
seems like a big step towards this.  "make clean" just deletes
BUILD_DIR, not the OVERRIDE dirs.

>  * It is only valid for components for which sourcing from git/svn is
>    done.

But didn't someone post a BZR patch recently and can't it be extended to
any other VCS with an equivalent DOWNLOAD_$(VCS) macro?  Or am I missing
your point?

>  * It still keeps the source tree in Buildroot's build directory, which
>    gets removed at "make clean".
> 
> I haven't implemented yet an alternative solution, but through a few
> discussions on IRC with other Buildroot contributors, the rough scheme
> we came up with is the following.

I did, but it's really dirty, invloving a cautious rsync at build-time
between the working copy and BUILD_DIR.  Your OVERRIDE_DIR is vastly
superior and glaringly obvious now that it's mentioned.
One nice feature of my approach was that it needed no modifications in
the package makefiles, if a VCS method was specified (in a file similar
to your "local.mk") the location and variables there override the
package makefile.
