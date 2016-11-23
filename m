From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:05:39 +0100
Subject: [Buildroot] [PATCH v4 13/18] python2: generate reproducible .pyc
In-Reply-To: <1479905937-17241-14-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <1479905937-17241-14-git-send-email-jezz@sysmic.org>
Message-ID: <20161123230539.4762ebcd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 13:58:52 +0100, J?r?me Pouiller wrote:
> .pyc files contain modification time of .py source. In order to make
> build reproducible, we fix modification time of all .py before to
> compile .pyc files.

"before to compile" -> "before compiling".

> diff --git a/package/python/python.mk b/package/python/python.mk
> index cc65376..c17b267 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -226,10 +226,18 @@ PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
>  
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +define PYTHON_FIX_TIME
> +find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
> +		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
> +endef
> +PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_FIX_TIME
> +endif
> +
>  define PYTHON_CREATE_PYC_FILES
>  	PYTHONPATH="$(PYTHON_PATH)" \

It would make more sense to just do:

	$(PYTHON_FIX_TIME)

here, rather than registering it as a PYTHON_TARGET_FINALIZE_HOOKS.
Also, maybe it should be named PYTHON_SET_PY_FILES_TIME.

>  	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
> -		support/scripts/pycompile.py \
> +		support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \

Why do we need to force?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
