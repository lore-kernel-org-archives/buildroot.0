From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 8 May 2018 06:48:27 +0300
Subject: [Buildroot] [PATCH v2 1/1] python-websockets: backport fix for
 upstream issue #350
In-Reply-To: <20180507221823.6364-1-joseph.kogut@gmail.com>
References: <20180507205733.2433-1-joseph.kogut@gmail.com>
 <20180507221823.6364-1-joseph.kogut@gmail.com>
Message-ID: <20180508034827.rsz55f6wyu6jmps2@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

On Mon, May 07, 2018 at 03:18:23PM -0700, Joseph Kogut wrote:
> Fetch from: https://github.com/aaugustin/websockets/commit/402059e4a46a764632eba8a669f5b012f173ee7b.patch
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
> Changes v1 -> v2:
> 	- Include patch locally (suggested by Thomas)
> 
>  ...59e4a46a764632eba8a669f5b012f173ee7b.patch | 256 ++++++++++++++++++
>  1 file changed, 256 insertions(+)
>  create mode 100644 package/python-websockets/402059e4a46a764632eba8a669f5b012f173ee7b.patch
> 
> diff --git a/package/python-websockets/402059e4a46a764632eba8a669f5b012f173ee7b.patch b/package/python-websockets/402059e4a46a764632eba8a669f5b012f173ee7b.patch

The patch file name should be numbered. See the patch naming conversion in 
section 18.1.2 of the manual:

  https://buildroot.org/downloads/manual/manual.html#_providing_patches

You can easily generate this patch using 'git format-patch':

  git format-patch -N --no-thread -s -1 402059e4a46a76

> new file mode 100644
> index 0000000000..62e93bdd2e
> --- /dev/null
> +++ b/package/python-websockets/402059e4a46a764632eba8a669f5b012f173ee7b.patch
> @@ -0,0 +1,256 @@
> +From 402059e4a46a764632eba8a669f5b012f173ee7b Mon Sep 17 00:00:00 2001
> +From: Aymeric Augustin <aymeric.augustin@m4x.org>
> +Date: Tue, 1 May 2018 17:05:05 +0200
> +Subject: [PATCH] Fix behavior of recv() in the CLOSING state.
> +
> +The behavior wasn't tested correctly: in some test cases, the connection
> +had already moved to the CLOSED state, where the close code and reason
> +are already known.
> +
> +Refactor half_close_connection_{local,remote} to allow multiple runs of
> +the event loop while remaining in the CLOSING state. Refactor affected
> +tests accordingly.
> +
> +I verified that all tests in the CLOSING state were behaving is intended
> +by inserting debug statements in recv/send/ping/pong and running:
> +
> +$ PYTHONASYNCIODEBUG=1 python -m unittest -v websockets.test_protocol.{Client,Server}Tests.test_{recv,send,ping,pong}_on_closing_connection_{local,remote}
> +
> +Fix #317, #327, #350, #357.

Your sign-off is missing. The -s option for git format-patch adds that for 
you.

> +---
> + websockets/protocol.py      | 10 +++---
> + websockets/test_protocol.py | 78 +++++++++++++++++++++++++++++++++++----------
> + 2 files changed, 66 insertions(+), 22 deletions(-)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
