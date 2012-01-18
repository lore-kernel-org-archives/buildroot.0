From: Arkady Gilinsky <arcadyg@gmail.com>
Date: Wed, 18 Jan 2012 14:42:14 +0200
Subject: [Buildroot] [PATCH v3] bash: Adding features that can not be
 automatically detected while cross-compiling
In-Reply-To: <1326886311-3155-1-git-send-email-arnout@mind.be>
References: <201201181230.52774.arnout@mind.be>
 <1326886311-3155-1-git-send-email-arnout@mind.be>
Message-ID: <CA+gTGJGnxMiY9NKWhFsvsKhZT95N2QV_V2-XzDMN7aJMZRo3uA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 18, 2012 at 1:31 PM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> There are some bash features that can not be detected automatically during
> configure stage while cross-compiling. This commit forces them on.
>
> Signed-off-by: Arkady Gilinsky <arcadyg@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> ?package/bash/bash.mk | ? ?6 +++++-
> ?1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index f1f951c..60fab06 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -7,7 +7,11 @@
> ?BASH_VERSION = 4.2
> ?BASH_SITE = $(BR2_GNU_MIRROR)/bash
> ?BASH_DEPENDENCIES = ncurses
> -BASH_CONF_ENV = bash_cv_job_control_missing=no
> +BASH_CONF_ENV += ? ? ? ? ? ? ? ? ? ? ? \
> + ? bash_cv_job_control_missing=no ? ? ?\
I think it is not correct.
According to my analyze of bash configure script the variable
bash_cv_job_control_missing
not implemented straight forward - the value 'missing' means that job
control is disabled
and value 'present' means that job control supported by final binary.
Find below the fragment of configure script of bash.
"
...
  if test "$cross_compiling" = yes; then
  { $as_echo "$as_me:$LINENO: WARNING: cannot check job control if
cross-compiling -- defaulting to missing" >&5
$as_echo "$as_me: WARNING: cannot check job control if cross-compiling
-- defaulting to missing" >&2;}
     bash_cv_job_control_missing=missing
...
"
as you can see 'missing' value is set when cross compiling and
configure script can not detect
if this feature is supported or not.


> + ? bash_cv_sys_named_pipes=present ? ? \
> + ? bash_cv_func_sigsetjmp=present ? ? ?\
> + ? bash_cv_printf_a_format=yes
>
> ?# Make sure we build after busybox so that /bin/sh links to bash
> ?ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> --
> 1.7.8.3
>



-- 
Best regards
Arkady Gilinsky
