From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 02:36:44 +0200
Subject: [Buildroot] [PATCH] package/libglib2: add missing dependency on
 host-python[3]
In-Reply-To: <20170705003038.5318-1-andrew.smirnov@gmail.com>
References: <20170705003038.5318-1-andrew.smirnov@gmail.com>
Message-ID: <ec246461-b4fe-b71b-1899-fd9a43fbb1e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 02:30, Andrey Smirnov wrote:
> Building gio/gdbus-2.0/codegen/ subdirectory requires host to have a
> python interpreter. Add 'host-python'/'host-python3' as a dependency
> to reflect that fact and prevent build failures.

 Do you have an actual build failure for this? We already require a python to be
present on the host, so there shouldn't be a need to build one here. And we
really do want to avoid that libglib2 pulls in host-python (to limit the build
time).

 Regards,
 Arnout

> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/libglib2/libglib2.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 47d9f63..ba4c015 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -112,6 +112,14 @@ HOST_LIBGLIB2_DEPENDENCIES = \
>  	host-util-linux \
>  	host-zlib
>  
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_LIBGLIB2_DEPENDENCIES += host-python3
> +LIBGLIB2_DEPENDENCIES      += host-python3
> +else
> +HOST_LIBGLIB2_DEPENDENCIES += host-python
> +LIBGLIB2_DEPENDENCIES      += host-python
> +endif
> +
>  LIBGLIB2_CONF_OPTS = \
>  	--with-pcre=system
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
