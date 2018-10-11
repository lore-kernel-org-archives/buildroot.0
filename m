From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Oct 2018 14:49:21 +0200
Subject: [Buildroot] [PATCH v2 1/4] pkg-waf: add support for <pkg>_SUBDIR
In-Reply-To: <20181011095755.9188-1-lionel.orry@gmail.com>
References: <20181011095755.9188-1-lionel.orry@gmail.com>
Message-ID: <f973c76c-84a7-117e-e5a8-e287b1d6c440@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/10/18 11:57, Lionel Orry wrote:
> diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
> index 3288dd63a0..a32d5dab33 100644
> --- a/package/pkg-waf.mk
> +++ b/package/pkg-waf.mk
> @@ -60,7 +60,7 @@ $(2)_WAF_OPTS				?=
>  #
>  ifndef $(2)_CONFIGURE_CMDS
>  define $(2)_CONFIGURE_CMDS
> -	cd $$(@D) && \
> +	cd $$($$(PKG)_SRCDIR) && \

 A little mistake on Thomas's part: this should be $$($$(PKG)_BUILDDIR), not
$$($$(PKG)_SRCDIR). They are currently the same, but the idea is to introduce
the possibility to do out-of-tree builds and to reuse the same source directory
for host and target, and also for packages that share their source trees.


 Regards,
 Arnout

>  	$$(TARGET_CONFIGURE_OPTS) \
>  	$$($(2)_CONF_ENV) \
>  	$$(HOST_DIR)/bin/python2 $$($(2)_WAF) configure \

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
