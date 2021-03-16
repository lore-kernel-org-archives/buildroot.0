From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 23:16:40 +0100
Subject: [Buildroot] [PATCH] package/open62541: cleanup tools files
 after installation
In-Reply-To: <20210222053953.583102-1-fancp2007@gmail.com>
References: <20210220162715.283519-1-fancp2007@gmail.com>
 <20210222053953.583102-1-fancp2007@gmail.com>
Message-ID: <20210316231640.3c3e5b54@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the patch. Yann, since you contributed this package, could
you give your opinion on this? It is quite important, as 52 MiB on the
target is really huge.

Thanks a lot,

Thomas

On Mon, 22 Feb 2021 13:39:52 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> The open62541 tools directory is indeed 52 MiB, which built as a standalone package
> named 'libopen62541-1-tools' in launchpad. Nothing is required at runtime.
> 
> See the official debian control file template:
> https://raw.githubusercontent.com/open62541/open62541/master/debian/control-template
> 
> See https://launchpad.net/~open62541-team/+archive/ubuntu/ppa/+packages
> libopen62541-1       Open source implementation of OPC UA - shared library
> libopen62541-1-dev   Open source implementation of OPC UA - development files
> libopen62541-1-tools Open source implementation of OPC UA - tools
> open62541-doc        Open source implementation of OPC UA - documentation
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - extend the commit log to explain why nothing in there is required.
> ---
>  package/open62541/open62541.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index 102e09a429..3f75196817 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -54,4 +54,11 @@ else
>  OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=OFF
>  endif
>  
> +# Remove unneeded files
> +define OPEN62541_REMOVE_UNNEEDED_FILES
> +	$(RM) -r $(TARGET_DIR)/usr/share/open62541
> +endef
> +
> +OPEN62541_POST_INSTALL_TARGET_HOOKS += OPEN62541_REMOVE_UNNEEDED_FILES
> +
>  $(eval $(cmake-package))



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
