From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 17:36:00 +0200
Subject: [Buildroot] [PATCH 1/1] xmlstarlet: fix host package build
 errors.
In-Reply-To: <20170804010531.31789-1-Adamduskett@outlook.com>
References: <20170804010531.31789-1-Adamduskett@outlook.com>
Message-ID: <40426826-4155-413f-069c-d288102081d3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 03:05, Adam Duskett wrote:
> The host version of xmlstarlet doesn't have any conf opts.
> As such, if the host PC doesn't have libxml header files installed,
> a build error will occure because host-xmlstarlet won't be able to find
> libxml/xmlstring.h: No such file or directory.

 Weird that the autobuilders didn't catch this. Ah, of course, it's only a
dependency of kodi and kodi never gets built because of the dependency on .py
files...


> Add HOST_XMLSTARLET_CONF_OPTS to fix this issue.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/xmlstarlet/xmlstarlet.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
> index 9920dcfc7..54ed36bc8 100644
> --- a/package/xmlstarlet/xmlstarlet.mk
> +++ b/package/xmlstarlet/xmlstarlet.mk
> @@ -17,6 +17,11 @@ XMLSTARLET_CONF_OPTS += \
>  	--with-libxslt-prefix=$(STAGING_DIR)/usr \
>  	--with-libiconv-prefix=$(STAGING_DIR)/usr
>  
> +HOST_XMLSTARLET_CONF_OPTS += \
> +	--with-libxml-prefix=$(HOST_DIR)/usr \
> +	--with-libxslt-prefix=$(HOST_DIR)/usr \
> +	--with-libiconv-prefix=$(HOST_DIR)/usr

 Since $(HOST_DIR)/usr was recently removed, this can't be right...

 However, I can't reproduce this issue. Without this patch, config.log says

configure:4407: checking for xml2-config
configure:4425: found .../output/host/bin/xml2-config
configure:4437: result: .../output/host/bin/xml2-config
configure:4466: using libxml-2.9.4
configure:4548: checking for xslt-config
configure:4566: found .../output/host/bin/xslt-config
configure:4578: result: .../output/host/bin/xslt-config

and further on I can see that it's using the correct paths. Indeed, during the
build I get a warning:

.../output/host/include/libxml2/libxml/xmlstring.h:35:18: warning: pointer
targets in passing argument 3 of ?xmlStrPrintf? differ in signedness
[-Wpointer-sign]

so it is *definitely* using the correct libxml2.

 Could you investigate a little further what's going on on your end?

 Regards,
 Arnout

> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  XMLSTARLET_CONF_OPTS += --enable-static-libs
>  XMLSTARLET_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libxml-2.0 libexslt`"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
