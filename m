From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 21:46:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: build with versioned
 symbols
In-Reply-To: <20200515183353.4183611-1-joseph.kogut@gmail.com>
References: <20200515183353.4183611-1-joseph.kogut@gmail.com>
Message-ID: <20200515214657.17714f31@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Max Filippov

On Fri, 15 May 2020 11:33:53 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Is there a reason to leave --without-versioned in the package, or make
> it an optional config? I can't imagine the size difference is all that
> great.

This --without-versioned was added in commit
e90a4bf4af3b6466b2a2d8df12cfe84f5d364cca back in February 2009 (wow, 11
years ago). This commit, from Peter Korsgaard, says:

commit e90a4bf4af3b6466b2a2d8df12cfe84f5d364cca
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Mon Feb 23 13:01:26 2009 +0000

    alsa-lib: don't use versioned symbols
    
    As reported by Dirk Vermaak and Daniel Mack. Fixes runtime issues with
    alsa-lib, see
    http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/014999.html
    for details.

The mailing list thread pointed by this link contains an interesting
explanation:
https://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/015031.html,
i.e it wasn't working with uClibc because uClibc doesn't support
versioned symbols.

Interestingly, in 2015, the fact that uClibc doesn't support versioned
symbol also caused some issue with elfutils, as was reported by Max
Filippov at:

https://lists.fedorahosted.org/archives/list/elfutils-devel at lists.fedorahosted.org/thread/XIK5GQRWKOMOZ4FVBRWTPOH57DUYFNZV/

So it seems like this problem still exists.

Also, in 2017, Alexey Brokdin also reminded about this in his talk on
uClibc, see
https://elinux.org/images/9/9f/Uclibc-still-makes-sense-brodkin-elce2017_0.pdf

So, we unfortunately can't apply your patch as-is. Perhaps we should
make that conditional on uClibc ? Indeed, I assume that CEF will never
work with uClibc anyway :-)

I am puzzled though: if alsa-lib is built without symbol versioning,
how can CEF "know" about such versioning ? It is hardcoded into the CEF
source code ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
