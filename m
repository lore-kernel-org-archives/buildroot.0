From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 09:10:27 +0200
Subject: [Buildroot] [PATCH] core/download: remove support for special
	git refs
In-Reply-To: <87d1imsq36.fsf@ketchup.i-did-not-set--mail-host-address--so-tickle-me>
References: <1477512489-14710-1-git-send-email-yann.morin.1998@free.fr>
 <87d1imsq36.fsf@ketchup.i-did-not-set--mail-host-address--so-tickle-me>
Message-ID: <20161027091027.6410d400@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 18:27:57 -0400, Vivien Didelot wrote:

> > So, just remove the support for such special refs altogether.  
> 
> I don't see why it is hard to maintain. A Github pull request ref or a
> Gerrit change ref, as well as a custom ref, are valid git references.

They are valid, but moving references, right? A little bit like a
branch.

And we don't support using Git branches as the Git version. Indeed, if
you do that, Buildroot will clone the Git repo once, tarball it in
$(DL_DIR), and will never download it again, because the name of the
branch doesn't change, so the name of the tarball doesn't change.

And we don't even try to solve this problem, because using a branch
name as the <pkg>_VERSION is just plain wrong.

> That can totally end up in a customer defconfig.

And this is bogus, and precisely why we don't want to support such
thing. Github pull request and Gerrit change references are moving, so
a given Github pull request can one day contain a given version of the
code, and the next day a different version of the code. Hence you're
giving your customers something that is not reproducible. Not good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
