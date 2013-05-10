From: Nathan Lynch <ntl@pobox.com>
Date: Fri, 10 May 2013 08:09:11 -0500
Subject: [Buildroot] [PATCH] package-infra: limit the number of // jobs
In-Reply-To: <1368137000-2766-1-git-send-email-yann.morin.1998@free.fr>
References: <1368137000-2766-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1368191351.17778.19.camel@orca.stoopid.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, 2013-05-10 at 00:03 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The current code spawns as many jobs as up to twice the number of CPUs.
> 
> On small-class machines like laptops, with a limitted amount of memory,
> but still a few CPUs (real or hyperthreads), the HDD becomes a bottleneck,
> and it becomes almost impossible to do anythiong else while there is a
> build in progress.
> 
> Limit the number of jobs to the number of CPUs plus one.
> 
> Even on fast machines with fast HDDs, this settings keeps the machine
> fully busy (for those packages that can build in parallel, of course).
> 
> For example, building qemu or the linux kernel kept my hyperthreaded
> hexa Core i7 with 18GiB of RAM, busy at 99% (I never ever managed to
> get 100% even with more jobs, not even 200); while on my hyperthreaded
> dual Core i5 with only 4GiB and a slow HDD, I still topped at 100% CPU,
> while still able to do some work involving the HDD.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index a449089..a575f17 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -11,7 +11,7 @@ HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
>  # while waiting on I/O.
>  ifeq ($(BR2_JLEVEL),0)
>  PARALLEL_JOBS:=$(shell echo \
> -	$$((2 * `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
> +	$$((2 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 0`)))

You'll need to update/remove the comment preceding this code too...

When I submitted this feature there was some discussion of what the
heuristic should be here.  Given your experience I am fine with making
it more conservative, especially since this is the default behavior.
