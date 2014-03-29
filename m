From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 12:23:01 +0100
Subject: [Buildroot] [PATCH 2/6] python3: rework python symlinks
 installation
In-Reply-To: <1394057085-10399-3-git-send-email-s.martin49@gmail.com>
References: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
 <1394057085-10399-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140329112301.GE3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-05 23:04 +0100, Samuel Martin spake thusly:
> This patch reworks the way python3 and python3-config symlink are
> installed.
> 
> Buildroot wants to control these symlinks' installation:
> 
> * the python3 symlink should be unconditionally installed in the target
>   tree, and the python3-config symlink in the staging tree, since it is
>   the only python package built and installed in the target tree if the
>   user selected it;
> 
> * the python3 and python3-config symlinks should only be installed in
>   the host tree when python3 is the selection of the user for the
>   target.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python3/python3.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 3d95a6d..19bef1e 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -156,11 +156,20 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
>  PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
>  endif
>  
> +#
> +# Some packages may have build scripts requiring python3, whatever is the
> +# python version chosen for the target.
> +# Only install the python symlink in the host tree if python3 is enabled
> +# for the target.
> +#

Remove the leading/trailing empty-comment lines.

> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  define HOST_PYTHON3_INSTALL_SYMLINK
>  	ln -fs python3 $(HOST_DIR)/usr/bin/python

It took me a while to see how this would not clash with the previous
change: we can only have either python2 *or* python3 on the target, so
we won't have a conflict on the python symlink.

Maybe worth mentionning on the comment, above, and maybe in the commit
log, as well.

If (and I say 'if') one day we are able to install both python2 and
python3 on the target, we'd have to revisit this.

> +	ln -fs python3-config $(HOST_DIR)/usr/bin/python-config
>  endef
>  
>  HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
> +endif
>  
>  # Provided to other packages
>  PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
> -- 
> 1.9.0

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
