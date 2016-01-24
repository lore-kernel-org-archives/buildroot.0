From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Jan 2016 15:19:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: bump version to
 fix musl build
In-Reply-To: <1453635546-14992-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453635546-14992-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56A4DD58.2030106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-01-16 12:39, Bernd Kuhls wrote:
> Fixes this musl build error:
> TermBuffer.cpp: In member function ?virtual scx::Condition scx::TermBuffer::read(void*, int, int&)?:
> TermBuffer.cpp:83:10: error: ?CEOT? was not declared in this scope
>      case CEOT:
>           ^
> TermBuffer.cpp:123:10: error: ?CERASE? was not declared in this scope
>      case CERASE: // Backspace
>           ^
> The autobuilders did not catch this specific error yet because they
> failed earlier with other packages, but I am continuing the build based
> on the defconfig from:
> http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/
> 
> - added hash
> - removed 0001-fix-ssl-libs-ordering.patch, applied upstream:
>   https://github.com/sconemad/sconeserver/commit/ffb69ca18fd03d0dc976696144d215b3a8555155
> - disabled markdown module because its git submodule cmark
>   ( https://github.com/sconemad/sconeserver/tree/master/markdown )
>   has no cross-compile support provided by the sconeserver build system:
> 
> make[4]: Entering directory '/home/bernd/buildroot/br3/output/build/sconeserver-c4b8e14f6e9e06cbff5b4195f69d6fce9391a1cd/markdown/cmark'
> mkdir -p build; \
> cd build; \
> cmake .. \
> 	-G "Unix Makefiles" \
> 	-DCMAKE_BUILD_TYPE= \
> 	-DCMAKE_INSTALL_PREFIX=/usr/local
> -- The C compiler identification is GNU 5.3.1
> -- The CXX compiler identification is GNU 5.3.1
> -- Check for working C compiler: /usr/bin/cc
> -- Check for working C compiler: /usr/bin/cc -- works
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[snip]
> diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
> index 2072142..39c4586 100644
> --- a/package/sconeserver/sconeserver.mk
> +++ b/package/sconeserver/sconeserver.mk
> @@ -4,16 +4,13 @@
>  #
>  ################################################################################
>  
> -# Release 0.6.0 doesn't build cleanly, so use a recent
> -# Git commit.
> -SCONESERVER_VERSION = 3b886c3dda6eda39bcb27472d29ed7fd3185ba1d
> +SCONESERVER_VERSION = c4b8e14f6e9e06cbff5b4195f69d6fce9391a1cd
>  SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
>  SCONESERVER_LICENSE = GPLv2+
>  SCONESERVER_LICENSE_FILES = COPYING
> -# For 0001-fix-ssl-libs-ordering.patch and configure isn't up to date

 You remove this comment but keep the autoreconf. I guess that's because it's
coming from git, but I'd prefer to keep a comment explaining that.

>  SCONESERVER_AUTORECONF = YES
>  SCONESERVER_DEPENDENCIES += pcre
> -SCONESERVER_CONF_OPTS += --with-ip --with-local --with-ip6
> +SCONESERVER_CONF_OPTS += --with-ip --with-local --with-ip6 --without-markdown

 Maybe a comment about the markdown would be useful as well.

 Regards,
 Arnout

>  
>  # Sconeserver configure script fails to find the libxml2 headers.
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
