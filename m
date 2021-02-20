From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 23:20:54 +0100
Subject: [Buildroot] [PATCH 1/3] package/open62541: remove unneeded files
In-Reply-To: <20210220162715.283519-1-fancp2007@gmail.com>
References: <20210220162715.283519-1-fancp2007@gmail.com>
Message-ID: <20210220222054.GU2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scott, All,

On 2021-02-21 00:27 +0800, Scott Fan spake thusly:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/open62541/open62541.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index 5a9f27562a..65742e83a1 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -54,4 +54,11 @@ else
>  OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=OFF
>  endif
>  
> +# Remove unneeded files
> +define OPEN62541_REMOVE_UNNEEDED_FILES
> +	$(RM) -r $(TARGET_DIR)/usr/share/open62541

Are you sure that we want to remove the whole dorectory? There are some
tools in there that look like they might be useful.

But hte whole directory is indeed 52MiB, with 51 for the 'ua-nodeset'
alone (whatever that is), so maybe we do indeed need to do some cleanup.

So, could you please respin this patch:

  - if really nothing is needed in that directory, then remove
    everything liek you did, but extend the commit log to explain why
    nothing in there is required,

  - if there are stuff that can be useful at runtime, then rework the
    hook to be a bit more selective in what it removes.

Regards,
Yann E. MORIN.

> +endef
> +
> +OPEN62541_POST_INSTALL_TARGET_HOOKS += OPEN62541_REMOVE_UNNEEDED_FILES
> +
>  $(eval $(cmake-package))
> -- 
> 2.25.1
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
