From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 6 Jul 2015 07:37:44 -0400
Subject: [Buildroot] [git commit] ntpd: drop unneeded uClibc workaround
 for refclock_pcf.c
In-Reply-To: <20150706080825.BCE3E7FBCC@busybox.osuosl.org>
References: <20150706080825.BCE3E7FBCC@busybox.osuosl.org>
Message-ID: <CANxTyt5E9GdPNWOz=8bngGQKcW0a7ZWrX-cy5N7MgFMf=KgbbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Mon, Jul 6, 2015 at 3:54 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=0cbe4bc52d5f1cea7d2c085e40f948a5a78183b9
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> refclock_pcf.c contains code using the tm_gmtoff member of struct tm, which
> is only available on uClibc if it is built with __UCLIBC_HAS_TM_EXTENSIONS__.
>
> This change date back to:
>
> commit 7129da009cc72575a84a30c4587bd99f745c49d4
> Author: Eric Andersen <andersen@codepoet.org>
> Date:   Sat Jan 18 21:27:22 2003 +0000
>
>     Merge a bunch of stuff over from the tuxscreen buildroot, with
>     many updates to make things be more consistant.
>      -Erik
>
> But nowadays our uClibc configs DO enable __UCLIBC_HAS_TM_EXTENSIONS__, so
> it is no longer needed and can be dropped.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ntp/ntp.mk |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
>
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index 93cefa1..110eaf8 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -40,10 +40,6 @@ else
>  NTP_CONF_OPTS += --disable-ATOM
>  endif
>
> -define NTP_PATCH_FIXUPS
> -       $(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
> -endef

So then - you can also drop this line too, I think:

NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS

Danomi -
