From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Apr 2014 00:20:08 +0200
Subject: [Buildroot] [PATCH WIP 16/16] xbmc: Add xbmc-send script to
 send commands to xbmc service
In-Reply-To: <1396296389-28821-17-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
 <1396296389-28821-17-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140331222008.GE5004@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-03-31 22:06 +0200, Bernd Kuhls spake thusly:
> http://wiki.xbmc.org/index.php?title=List_of_built-in_functions

Hey! That's pretty neat! :-)

We can use that to tell XBMC to exit properly, instead of killing it on
reboot. Groovy! :-)

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/xbmc.mk |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 974b4dd..d130ae2 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -204,6 +204,12 @@ define XBMC_INSTALL_BR_WRAPPER
>  endef
>  XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_BR_WRAPPER
>  
> +define XBMC_INSTALL_XBMC_SEND
> +	$(INSTALL) -D $(@D)/tools/EventClients/lib/python/xbmcclient.py $(TARGET_DIR)/usr/lib/python2.7/xbmcclient.py

If possible, please install both a .py and a .pyc to the target.

Depending on:
  - BR2_PACKAGE_PYTHON_PY_ONLY
  - BR2_PACKAGE_PYTHON_PYC_ONLY
  - BR2_PACKAGE_PYTHON_PY_PYC
some of them will be forcibly removed.

For example, if BR2_PACKAGE_PYTHON_PYC_ONLY is selected, then all .py
files will get removed from the target.

Note that I do not know how you can cross-generate a .pyc from a .py
file in cross-compilation... :-/

At the very least, if cross-generating the .pyc file is not possible,
make this conditional on !BR2_PACKAGE_PYTHON_PYC_ONLY.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
