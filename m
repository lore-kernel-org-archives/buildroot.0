From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 13:02:53 +0100
Subject: [Buildroot] [PATCH 0/5] Introduce alternative archive format
In-Reply-To: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
Message-ID: <20151119130253.0dd0aebb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me,

On Thu, 19 Nov 2015 11:36:01 +0100, J?r?me Pouiller wrote:

> As suggested by Arnout [1], this series provide an alternative archive
> format. This new format contains a shallowed version of upstream
> repository. This format is a little bigger and a little longer to
> create but it allow a better workflow with upstream. I describe some
> good practice in patch 2.
> 
> Notice projects hosted by github don't yet benefit of this feature
> since I have not found any elegant way to do it :-(. 
> 
> During my tests, I have noticed current shallow clone is mostly broken
> (at least with git < 2.5 [2]). Indeed, shallow clone only work with
> symbolic references (HEAD, a tag or a branch). However, we avoid use of
> symbolic references in VERSION.

Thanks for this contribution.

Your justification in PATCH 2 is just "That simplify workflow with
upstream". However, we already have the <pkg>_OVERRIDE_SRCDIR mechanism
(and <pkg>_SITE_METHOD = local, which is the same) to specifically
address this use case.

The idea with <pkg>_OVERRIDE_SRCDIR is that if you are actively
developing on a software component, then it should not be Buildroot's
responsibility to download/extract/patch it, but it should instead use
a locally available source directory, which is managed completely
separately from Buildroot. There you can do whatever Git, Subversion or
Mercurial version control you want, Buildroot will simply rsync to the
build directory.

I think doing development in the build directory, as encouraged by your
patch, is a bad practice. The build directory is a temporary location,
people should not be encouraged to work from there.

And I fail to see what your solution brings compared to using
<pkg>_OVERRIDE_SRCDIR or <pkg>_SITE_METHOD = local. To me, the existing
solutions are in fact more flexible and don't encourage the practice of
hacking in the build directory.

Of course, if there is a specific workflow that you could describe that
doesn't work with <pkg>_OVERRIDE_SRCDIR, then I'm definitely
interested, and from this discussion we can decide whether improvements
to OVERRIDE_SRCDIR are needed, or if a completely different solution is
needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
