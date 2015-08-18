From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:37:18 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/setools: fix buid
 without wchar
In-Reply-To: <1439495681-7220-1-git-send-email-yann.morin.1998@free.fr>
References: <1439495681-7220-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150818113718.605246a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Thu, 13 Aug 2015 21:54:41 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/051/051a7f72ebadd56407700c22b57e942f08eb1c09/
>     http://autobuild.buildroot.org/results/a4b/a4b2a6f1920430af43c23239de17200e70951b3b/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/setools/0003-no-wchar-needed.patch | 45 ++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/setools/0003-no-wchar-needed.patch
> 
> diff --git a/package/setools/0003-no-wchar-needed.patch b/package/setools/0003-no-wchar-needed.patch
> new file mode 100644
> index 0000000..8b9ea9f
> --- /dev/null
> +++ b/package/setools/0003-no-wchar-needed.patch
> @@ -0,0 +1,45 @@
> +configure: do not use wchar_t in tests
> +
> +setools does not use widechars for itself, so should build on toolchains
> +missing widechars (uClibc).
> +
> +Unfortunately, one of the m4 macros does use wchar_t to check C99,
> +completely unrelated to widechar support, thus making it believe C99 is
> +not available in the compiler:

I am not really fan of this change. This c.m4 file is in fact
copy/pasted (partially) from the autoconf sources themselves, where the
same macro does test for wchar support as part of the C99 test.

Therefore, I'm a bit reluctant to change this macro originating from
the autoconf sources, and I think we should instead just make the
package depend on wchar support.

It is not clear whether C99 requires wchar support or not, I couldn't
find a very clear statement about this. But the implementation of this
macro, which explicitly includes <wchar.h> and uses a wide string
initializer, seems to say so. If not, can you raise the problem to the
autoconf developers?

In the mean time, a patch making setools only available for
wchar-capable toolchains would be preferred. In general, if there is no
easily upstreamable solution to avoid a toolchain dependency, I prefer
to have the toolchain dependency than a non-upstreamable patch.
Especially for "big" stuff like SELinux, that are unlikely to be used
in a non-wchar enabled configuration.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
