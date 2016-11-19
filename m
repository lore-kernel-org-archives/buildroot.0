From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 10:02:46 +0100
Subject: [Buildroot] [PATCH v2 03/15] reproducible: add '-n' to gzip
 invocations
In-Reply-To: <1479460224-6119-4-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-4-git-send-email-jezz@sysmic.org>
Message-ID: <ce34ec94-7d1f-56d9-0063-42fd003a2418@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 10:10, J?r?me Pouiller wrote:
> Default invocation to gzip include timestamp in output file. This feature is
> incompatible with BR2_REPRODUCIBLE. It is possible to disable it with '-n'.
> 
> The environment variable GZIP can hold a set of default options for gzip. So
> instead to find all gzip invocation in build process, we just export 'GZIP=-n'.
> 
> Notice bzip2, lzma and xz are impacted by this problem. On the other hand, lzop

 Unless I'm very mistaken, they are NOT impacted by this problem.

> include timestamp and does not provide any way to disable it.
 ^ does include a timestamp and does not...

> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 17e49e4..c21ba4a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -249,6 +249,7 @@ ifeq ($(BR2_REPRODUCIBLE),y)
>  export TZ=UTC
>  export LANG=C
>  export LC_ALL=C
> +export GZIP=-n
>  export SOURCE_DATE_EPOCH=$(SOURCE_DATE_EPOCH)

 In this whole hunk, there are spaces missing:

export LC_ALL = C
export GZIP = -n
...

You only need to fix the ones you add of course.

 All of the above can be fixed up while applying, so:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

>  SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
>  SOURCE_DATE_CHANGES = $(shell date -d `echo $(BR2_VERSION) | sed 's/^\(....\)\.\(..\).*/\1-\2-01T23:59:59/'` +%s)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
