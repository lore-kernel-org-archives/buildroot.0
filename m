From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Feb 2017 15:51:58 +0100
Subject: [Buildroot] [PATCH v5 07/19] python3: generate reproducible .pyc
In-Reply-To: <1482241596-31688-8-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-8-git-send-email-jezz@sysmic.org>
Message-ID: <CAHXCMM+HJMtRfpVuSdL=1wXrqBxuqZdV+h0j9ewMzrah4+gQjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me, all,

On Tue, Dec 20, 2016 at 2:46 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> .pyc files contain modification time of .py source. In order to make build
> reproducible, we fix modification time of all .py before compiling .pyc files.
>
> In add, since pycompile rely on modification times to know if a file need to be
> recompiled, it is safer to force recompilation of all source files.
>
> This work was sponsored by `BA Robotic Systems'.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

> ---
>
> Notes:
>     v5:
>       - Typo in commit log
>       - Explain why we pass --force to pycompile
>     v3:
>       - Force compilation instead of removing .pyc
>
>  package/python3/python3.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 8bfae79..1817b22 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -227,10 +227,18 @@ PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdat
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
>
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +define PYTHON3_FIX_TIME
> +       find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
> +               xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
> +endef
> +PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_FIX_TIME
> +endif
> +
>  define PYTHON3_CREATE_PYC_FILES
>         PYTHONPATH="$(PYTHON3_PATH)" \
>         $(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
> -               support/scripts/pycompile.py \
> +               support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
>                 $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
>  endef
>
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
