From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2021 21:23:14 +0100
Subject: [Buildroot] [PATCH] package/tzdate: use classic 'fat' format
 for uClibc/glibc compatibility
In-Reply-To: <20210215185709.27648-1-peter@korsgaard.com>
References: <20210215185709.27648-1-peter@korsgaard.com>
Message-ID: <54a59306-dda2-fd47-7761-b0a5cf810233@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/02/2021 19:57, Peter Korsgaard wrote:
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385940
> 
> FAIL: test_run (tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/support/testing/tests/core/test_timezone.py", line 66, in test_run
>     self.assertEqual(tz[0].strip(), "EST")
> AssertionError: '' != 'EST'
> 
> Commit 7868289fd5348 (package/zic: bump version to 2020f) bumped the zic
> version to 2020f, which changed the default output format from the classic
> "fat" format to the new "slim" format:
> 
> https://github.com/eggert/tz/commit/6ba6f2117b95eab345a7ed9159cef939e30c4cd3
> 
> The slim format is unfortunately not supported by glibc < 2.28 or uClibc, so
> explicitly request the classic "fat" format.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks.

 As mentioned in the other thread: at some point we will want to switch to the
slim format if the libc supports it. But that can be done later (and by someone
who is motivated to do it :-).

 Regards,
 Arnout

> ---
>  package/tzdata/tzdata.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index 04f5d84bf0..8201dc1201 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -51,8 +51,8 @@ endef
>  define HOST_TZDATA_BUILD_CMDS
>  	(cd $(@D); \
>  		for zone in $(TZDATA_ZONELIST); do \
> -			$(ZIC) -d _output/posix $$zone || exit 1; \
> -			$(ZIC) -d _output/right -L leapseconds $$zone || exit 1; \
> +			$(ZIC) -b fat -d _output/posix $$zone || exit 1; \
> +			$(ZIC) -b fat -d _output/right -L leapseconds $$zone || exit 1; \
>  		done; \
>  	)
>  endef
> 
