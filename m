From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 21:12:54 +0200
Subject: [Buildroot] [PATCH v2] package/python-txtorcon.mk: drop _py3
 file for python 2.x to fix pycompile issue
In-Reply-To: <20200930073157.24001-1-peter@korsgaard.com>
References: <20200930073157.24001-1-peter@korsgaard.com>
Message-ID: <20200930191254.GQ11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-09-30 09:31 +0200, Peter Korsgaard spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/76b580000e6311e88584874f942517badd6fadf6/
> 
> python-txtorcon DOES support python 2.x, but it contains some optional
> python 3 / async code in controller_py3.py which is conditionally used from
> controller.py:
> 
> try:
>     from .controller_py3 import _AsyncOnionAuthContext
>     HAVE_ASYNC = True
> except Exception:
>     HAVE_ASYNC = False
> 
> pycompile unfortunately errors out on the async code:
> 
> ../scripts/pycompile.py ..
> error:   File "/usr/lib/python2.7/site-packages/txtorcon/controller_py3.py", line 13
>     async def __aenter__(self):
>             ^
> SyntaxError: invalid syntax
> 
> As a workaround, simply drop the unusable _py3 file from TARGET_DIR if
> building for python 2.x.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

BTW, next time, can you update patchwork to mark the previous one as
superseded (or changes-requested), please? ;-]

Regards,
Yann E. MORIN.

> ---
>  package/python-txtorcon/python-txtorcon.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
> index a01c0b2511..4df400c3e7 100644
> --- a/package/python-txtorcon/python-txtorcon.mk
> +++ b/package/python-txtorcon/python-txtorcon.mk
> @@ -11,4 +11,13 @@ PYTHON_TXTORCON_SETUP_TYPE = setuptools
>  PYTHON_TXTORCON_LICENSE = MIT
>  PYTHON_TXTORCON_LICENSE_FILES = LICENSE
>  
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +# only needed/valid for python 3.x
> +define PYTHON_TXTORCON_RM_PY3_FILE
> +	rm -f $(TARGET_DIR)/usr/lib/python*/site-packages/txtorcon/controller_py3.py
> +endef
> +
> +PYTHON_TXTORCON_POST_INSTALL_TARGET_HOOKS += PYTHON_TXTORCON_RM_PY3_FILE
> +endif
> +
>  $(eval $(python-package))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
