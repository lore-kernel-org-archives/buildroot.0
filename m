From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 11 Aug 2014 23:19:18 +0200
Subject: [Buildroot] Makefile: fix Python 3 site packages when using
	PYC_ONLY
Message-ID: <trinity-0d1bf750-6b5a-466e-a8a8-763427ed879a-1407791957999@3capp-gmx-bs36>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 23, 2014 at 08:57:26PM -0400, Philippe Proulx wrote:
> The Python 3 standard lib is compiled into PYC bytecode using a
> pre-PEP-3147 mode (.pyc files beside .py files; no __pycache__)
> when BR2_PACKAGE_PYTHON3_PYC_ONLY is enabled. However, site packages
> installed with setuptools/distutils are compiled following PEP-3147.
> When BR2_PACKAGE_PYTHON3_PYC_ONLY is on, .py source files are removed
> and Python 3 (target) will not look into __pycache__ directories
> without associated .py files.
> 
> Python 2 does not suffer from this since PEP-3147 seems to be
> implemented in Python 3 only.
> 
> This commit fixes this by compiling Python 3 site packages using a
> pre-PEP-3147 mode after they are installed and then removing
> __pycache__ directories.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Tested-by: Peter Seiderer <ps.report@gmx.net>

Tested with the python3 binding of evemu-2.0.0 for raspberry pi...

Regards,
Peter


> ---
>  Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 6bd18e3..b38ccd9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -574,7 +574,15 @@ ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY)$(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
>       find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -print0 | xargs -0 rm -f
>  endif
>  ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +     for sp in $(TARGET_DIR)/usr/lib/python3*/site-packages; do \
> +             $(HOST_DIR)/usr/bin/python -m compileall -b $$sp; \
> +     done
> +endif
>       find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +     find $(TARGET_DIR)/usr/lib/python3* -name __pycache__ -type d -print0 | xargs -0 rm -rf
> +endif
>  endif
>       rm -rf $(TARGET_DIR)/usr/lib/luarocks
>       rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
