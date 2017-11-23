From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Nov 2017 23:46:54 +0100
Subject: [Buildroot] [PATCH v1] busybox: Fix rtcwake to use /dev/rtc0
 properly
In-Reply-To: <20171123183914.71769-1-andriy.shevchenko@linux.intel.com>
References: <20171123183914.71769-1-andriy.shevchenko@linux.intel.com>
Message-ID: <b2f0d3bf-b8a1-c948-2013-35dc605c2cbd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andy,

On 23-11-17 19:39, Andy Shevchenko wrote:
> rtcwake from busybox has failed in case the /dev/rtc is a symlink
> (which is default case for udev enabled systems) due to wrong pathname
> used for a sysfs wakeup attribute.

 In Buildroot, we don't accept "feature patches" for packages. We try to limit
to patches that fix the build or complete breakage, sometimes also to make it
work together with other packages. I think this patch doesn't fall in that category.

 For sure, you should first send the patch upstream. Particularly in the case of
busybox, Denys often proposes improved patches. If it gets accepted upstream,
then we can consider including it in Buildroot as well.

 Regards,
 Arnout

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  ...bb-Try-dev-rtc0-first-followed-by-dev-rtc.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/busybox/0006-libbb-Try-dev-rtc0-first-followed-by-dev-rtc.patch
> 
> diff --git a/package/busybox/0006-libbb-Try-dev-rtc0-first-followed-by-dev-rtc.patch b/package/busybox/0006-libbb-Try-dev-rtc0-first-followed-by-dev-rtc.patch
> new file mode 100644
> index 0000000000..0702c3c065
> --- /dev/null
> +++ b/package/busybox/0006-libbb-Try-dev-rtc0-first-followed-by-dev-rtc.patch
> @@ -0,0 +1,45 @@
> +From b59088ab14fb9c336414e2c9b27a9f5b7447ce5b Mon Sep 17 00:00:00 2001
> +From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> +Date: Thu, 23 Nov 2017 19:33:08 +0200
> +Subject: [PATCH v1] libbb: Try /dev/rtc0 first followed by /dev/rtc
> +
> +In case we run
> +
> +% rtcwake -s5 -mmem
> +
> +in udev environment we will get an error:
> +
> +rtcwake: /dev/rtc not enabled for wakeup events
> +
> +because /dev/rtc is a symlink to /dev/rtc0 in Buildroot and other Linux
> +distributions (like Fedora) and make_wakeup() obviously fails.
> +
> +As a quick fix just reorder probe of device nodes to try /dev/rtc0
> +first.
> +
> +The proper solution, of course much expensive by code footprint,
> +is to resolve /dev/rtc to a proper device node and then
> +to follow sysfs attributes.
> +
> +Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> +---
> + libbb/rtc.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libbb/rtc.c b/libbb/rtc.c
> +index c4117ba34..e087a8fd6 100644
> +--- a/libbb/rtc.c
> ++++ b/libbb/rtc.c
> +@@ -64,8 +64,8 @@ int FAST_FUNC rtc_xopen(const char **default_rtc, int flags)
> + {
> + 	int rtc;
> + 	const char *name =
> +-		"/dev/rtc""\0"
> + 		"/dev/rtc0""\0"
> ++		"/dev/rtc""\0"
> + 		"/dev/misc/rtc""\0";
> + 
> + 	if (!*default_rtc)
> +-- 
> +2.15.0
> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
