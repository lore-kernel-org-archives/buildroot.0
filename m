From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 1 May 2016 22:45:55 +0200
Subject: [Buildroot] [PATCH v3 3/9] python: remove *.pyo files
In-Reply-To: <1462133720-409-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMKH31WxNPbP_5_TMwxTVa8ykKByvAuxn+5sdeCod_n56Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sun, May 1, 2016 at 10:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Even though we disable the build of .pyo files in the interpreter,
> nothing prevents other packages to install them. Since we only want to
> keep either .py or .pyc or both, let's add a target finalize hooks
> that removes all .pyo files.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python/python.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/package/python/python.mk b/package/python/python.mk
> index 819d32b..c9aa0af 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -230,3 +230,11 @@ define PYTHON_REMOVE_PYC_FILES
>  endef
>  TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
>  endif
> +
> +# In all cases, we don't want to keep the optimized .pyo files
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +define PYTHON_REMOVE_PYO_FILES
> +       find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | xargs -0 rm -f
I think xargs should be called with the --no-run-if-empty option.
And certainly PYTHON_REMOVE_PYC_FILES could benefit from similar fix.
Sorry for not noticing this earlier :-/

> +endef
> +TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYO_FILES
> +endif
> --
> 2.7.4
>

With this fix, you have my:
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
