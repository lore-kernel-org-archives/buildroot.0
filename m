From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 11 Apr 2014 09:09:12 +0200
Subject: [Buildroot] [PATCH v2] openpgm: needs host python2
In-Reply-To: <783d7d9db0c782c2317fcfc6160b6802b095164d.1397117772.git.baruch@tkos.co.il>
References: <783d7d9db0c782c2317fcfc6160b6802b095164d.1397117772.git.baruch@tkos.co.il>
Message-ID: <CAHXCMMJF0K+CjZ=gM+quvbAEJyqAfvP3i9bfz_DovzVfQLH+6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Thu, Apr 10, 2014 at 10:16 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> When BR2_PACKAGE_PYTHON3=y host python symlinks to python3. This breaks the
> version_generator.py script. Make sure we use the right host python version.
>
> We can't use the host installed python for ac_cv_path_PYTHON, but host python
> might default to python3 in the not so distant future.
>
> Fixes:
> http://autobuild.buildroot.net/results/01f/01f886a073439c0639ed93e596b68bcadf1a5824/
>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> Changes v1 -> v2:
>         * Depend on host-python unconditionally (Samuel Martin)
>         * Explain in the commit log why not to use the host python
> ---
>  package/openpgm/openpgm.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
> index 3ec5c77e28c4..a108afea903b 100644
> --- a/package/openpgm/openpgm.mk
> +++ b/package/openpgm/openpgm.mk
> @@ -12,7 +12,10 @@ OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
>  OPENPGM_INSTALL_STAGING = YES
>  OPENPGM_AUTORECONF = YES
>  OPENPGM_SUBDIR = openpgm/pgm/
> +# version_generator.py needs python2
> +OPENPGM_DEPENDENCIES = host-python
>  OPENPGM_CONF_ENV = ac_cv_file__proc_cpuinfo=yes ac_cv_file__dev_rtc=no \
> -                   ac_cv_file__dev_hpet=no
> +               ac_cv_file__dev_hpet=no \
> +               ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
>

This works fine, but maybe a patch like [1] is simple enough to avoid
a hard dependency on host-python.

>  $(eval $(autotools-package))
> --
> 1.9.1
>


Regards,

[1] http://pastebin.com/JJerR2uu

-- 
Samuel
