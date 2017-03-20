From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 23:30:51 +0100
Subject: [Buildroot] [PATCH v5 06/19] python2: generate reproducible .pyc
In-Reply-To: <1482241596-31688-7-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-7-git-send-email-jezz@sysmic.org>
Message-ID: <20170320233051.0d42e149@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 14:46:23 +0100, J?r?me Pouiller wrote:
> .pyc files contain modification time of .py source. In order to make
> build reproducible, we fix modification time of all .py before compiling .pyc
> files.
> 
> In add, since pycompile rely on modification times to know if a file need to be
> recompiled, it is safer to force recompilation of all source files.
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

I've adjusted the commit log to fix various typoes.

> +ifeq ($(BR2_REPRODUCIBLE),y)
> +define PYTHON_FIX_TIME
> +	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
> +		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
> +endef
> +PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_FIX_TIME

And instead of calling this through PYTHON_TARGET_FINALIZE_HOOKS, I
called it explicitly in PYTHON_CREATE_PYC_FILES, before doing the byte
compilation. The two are very closely related so I believe it made more
sense this way.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
