From: Yann Cardaillac <ycardaillac@sepro-group.com>
Date: Wed, 17 Mar 2021 11:33:47 +0100 (CET)
Subject: [Buildroot] [PATCH] package/open62541: cleanup tools files
 after installation
In-Reply-To: <20210316231640.3c3e5b54@windsurf.home>
References: <20210220162715.283519-1-fancp2007@gmail.com>
 <20210222053953.583102-1-fancp2007@gmail.com>
 <20210316231640.3c3e5b54@windsurf.home>
Message-ID: <1544624036.3211054.1615977227946.JavaMail.zimbra@sepro-group.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Scott,

We didn't really used open6241 yet, so we did not really go further with the integration.

However I've just built the package in buildroot mainline, here's the size of output/target/usr/share/open62541/ :

$ du -h output/target/usr/share/open62541/
20K     output/target/usr/share/open62541/tools/certs
1,1M    output/target/usr/share/open62541/tools/schema
2,4M    output/target/usr/share/open62541/tools/ua-nodeset/MTConnect
988K    output/target/usr/share/open62541/tools/ua-nodeset/TMC
228K    output/target/usr/share/open62541/tools/ua-nodeset/ISA-95
3,1M    output/target/usr/share/open62541/tools/ua-nodeset/FDI
1,2M    output/target/usr/share/open62541/tools/ua-nodeset/GDS
3,3M    output/target/usr/share/open62541/tools/ua-nodeset/ADI
24K     output/target/usr/share/open62541/tools/ua-nodeset/CSPPlusForMachine
2,6M    output/target/usr/share/open62541/tools/ua-nodeset/AnsiC
31M     output/target/usr/share/open62541/tools/ua-nodeset/Schema
2,9M    output/target/usr/share/open62541/tools/ua-nodeset/POWERLINK
192K    output/target/usr/share/open62541/tools/ua-nodeset/Sercos
880K    output/target/usr/share/open62541/tools/ua-nodeset/DotNet
276K    output/target/usr/share/open62541/tools/ua-nodeset/PLCopen
1016K   output/target/usr/share/open62541/tools/ua-nodeset/DI
824K    output/target/usr/share/open62541/tools/ua-nodeset/MDIS
51M     output/target/usr/share/open62541/tools/ua-nodeset
160K    output/target/usr/share/open62541/tools/nodeset_compiler
52M     output/target/usr/share/open62541/tools
52M     output/target/usr/share/open62541/

To be honnest I don't really know what those are for, from my point of view the only people that can answer that question would be open62541 devs.

In ua-nodeset we can find some .cs, .csv, .xml, .uanodes, .bsd, .xsd, .h, .wsdl, .c ... I would agree on the fact that most of them are probably useless, but I can't give you strong insight on this.

I've added Julius Pfrommer that is one of the biggest contributor to open62541 in the hope that he could give us some advice. 

Best regards,

Yann CARDAILLAC 
Ing?nieur d?veloppement logiciel 
SEPRO Robotique - 88 Rue Henry Bessemer - Zone Ajoncs Ouest - CS 10084 - 85003 La Roche sur Yon Cedex (France) 

[ http://www.sepro-group.com/fr | www.sepro-group.com ] | [ https://twitter.com/seprogroup | 

                @SeproGroup
             ]

----- Mail original -----
De: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
?: "Scott Fan" <fancp2007@gmail.com>, "Yann Cardaillac" <ycardaillac@sepro-group.com>
Cc: buildroot at buildroot.org
Envoy?: Mardi 16 Mars 2021 23:16:40
Objet: Re: [Buildroot] [PATCH] package/open62541: cleanup tools files after installation

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
