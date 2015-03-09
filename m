From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 18:54:05 +0100
Subject: [Buildroot] [PATCH 1/2] target-finalize: generate all *.pyc
In-Reply-To: <1425918264-1912-1-git-send-email-s.martin49@gmail.com>
References: <1425918264-1912-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150309185405.5f312f1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon,  9 Mar 2015 17:24:23 +0100, Samuel Martin wrote:
> This patch generates all *.pyc files from *.py located in
> <target>/usr/python*/site-packages, before stripping the rootfs.
> 
> This prevents modules from packages that do not compile the *.py
> files from disappearing.
> 
> Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index af043a3..ec0b923 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -564,6 +564,11 @@ $(TARGETS_ROOTFS): target-finalize
>  
>  target-finalize: $(TARGETS)
>  	@$(call MESSAGE,"Finalizing target directory")
> +ifneq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
> +	PYTHONPATH="$(PYTHON_PATH)" \
> +		$(HOST_DIR)/usr/bin/python -c "import compileall; \
> +			compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages')"
> +endif

Why not, but then don't we want to do something in the Python package
infra, and in the Python 2/3 packages themselves to avoid spending time
biulding the .pyc files?

Also, using TARGET_FINALIZE_HOOKS would be nicer. But there is the
issue that the hook is the same between python and python3, so we
wouldn't know where to put it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
