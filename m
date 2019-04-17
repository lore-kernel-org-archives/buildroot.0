From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 18 Apr 2019 00:55:39 +0200
Subject: [Buildroot] [PATCH] ltp-testsuite: Fix uClibc build with
 disabled fts.h support
In-Reply-To: <20190417135458.15505-1-Nikita.Sobolev@synopsys.com>
References: <20190417135458.15505-1-Nikita.Sobolev@synopsys.com>
Message-ID: <20190417225537.GB27193@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nikita,

> Add patch, that fixes build on uClibc with disabled fts.h support
> and MUSL, which does not have fts.h at all.

Due autotools macros changes, which requires running autoreconf you need to add
into package/ltp-testsuite/ltp-testsuite.mk:
# Required by patch 0002-cpuset-Detect-missing-fts.h.patch
LTP_TESTSUITE_AUTORECONF = YES

FYI: while my patch in LTP upstream fixes uClibc with disabled fts.h, it's not
enough for MUSL build, which is disabled. I've sent some experimental support to
buildroot ML last month [2] (backported some fixes + simply delete the rest of
problematic tests), but due either my problems with patchwork or outdated
patchwork instance on ozlabs it didn't arrive to buildroot patchwork.

And I don't know whether buildroot uses (or allows user) to disable
UCLIBC_HAS_FTS (whether this patch is actually useful).

> Original patch [1] will be a part of the next LTP release and
> current patch should be removed from Buildroot when LTP version
> is bumped.
NOTE: we're planning next release in about 2 weeks, I usually update package the
same day.

> [1] https://github.com/linux-test-project/ltp/commit/b24f3d32c54006af5499da5a7ac418eafcf6e459

> Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
(with LTP_TESTSUITE_AUTORECONF = yes)


Kind regards,
Petr

[2] http://lists.busybox.net/pipermail/buildroot/2019-March/thread.html
