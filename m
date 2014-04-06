From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Apr 2014 11:30:00 +0300
Subject: [Buildroot] [PATCH] python: fix host-python symlink
 installation when no python is selected
In-Reply-To: <1396769715-28635-1-git-send-email-s.martin49@gmail.com>
References: <1396769715-28635-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140406083000.GD4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Sun, Apr 06, 2014 at 09:35:15AM +0200, Samuel Martin wrote:
> When no python interpreter is selected, all host-python symlink
> installation were disabled.
> This could lead to a non-existing $(HOST_DIR)/usr/bin/python program.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/6e7/6e74a343b4e8e113fd34d45c9279419e233afe8a/

I'm working on a similar problem 
(http://autobuild.buildroot.net/results/dd0/dd04833b11a0ebb0193c861cb375b2112dd339d1/). 
The following configure log shows the problem:

checking for a Python interpreter with version >= 2.6... python
checking for python... /usr/bin/python
checking for python version... 2.6

The host packaged python (2.6) is detected instead of the buildroot built one 
(2.7), because the python symlink is missing. In this case 
BR2_PACKAGE_PYTHON3=y so even with this patch the problem is not fixed. Your 
commit e1584b7d3350 (python: rework python symlinks installation) originally 
limited host python symlink creation, but I could not understand the reason 
for this from the commit log.

baruch

> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/python/python.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python/python.mk b/package/python/python.mk
> index feff644..8a2ba65 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -192,9 +192,9 @@ PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLIN
>  PYTHON_AUTORECONF = YES
>  
>  # Some packages may have build scripts requiring python2.
> -# Only install the python symlink in the host tree if python2 is enabled
> -# for the target.
> -ifeq ($(BR2_PACKAGE_PYTHON),y)
> +# Only install the python symlink in the host tree if python3 is not enabled
> +# for the target, otherwise the default python program may be missing.
> +ifneq ($(BR2_PACKAGE_PYTHON3),y)
>  define HOST_PYTHON_INSTALL_PYTHON_SYMLINK
>  	ln -sf python2 $(HOST_DIR)/usr/bin/python
>  	ln -sf python2-config $(HOST_DIR)/usr/bin/python-config
> -- 
> 1.9.1

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
