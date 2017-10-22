From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Oct 2017 16:59:44 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/kodi: use package
 host-openjdk-bootstrap to provide JDK
In-Reply-To: <20171003201939.8382-2-bernd.kuhls@t-online.de>
References: <20171003201939.8382-1-bernd.kuhls@t-online.de>
 <20171003201939.8382-2-bernd.kuhls@t-online.de>
Message-ID: <d9ce345f-e008-d24e-50a6-1ef1527e9e19@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bernd,

On 03-10-17 22:19, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de> ---
> v2: removed BR2_PACKAGE_KODI_OPENJDK (Baruch)
> 
>  package/kodi/Config.in | 3 ++-
>  package/kodi/kodi.mk   | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index fc7eafa41a..8bce77d7e4 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -46,7 +46,8 @@ menuconfig BR2_PACKAGE_KODI
>  	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_PYTHON
>  	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
> -	select BR2_NEEDS_HOST_JAVA
> +	select BR2_NEEDS_HOST_JAVA if !(BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86")
> +	select BR2_PACKAGE_HOST_OPENJDK_BOOTSTRAP if (BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86")

 So basically, what this series does is to allow you to build Kodi on a distro
that doesn't have Java installed, by downloading a Java binary, instead of
telling the user that they should install Java on the host.

 Although it indeed does make it simpler for a user to build Kodi in case they
don't have Java installed, I wonder if it really is worth it. It's adding some
complexity, it only works for x86 and x86_64 anyway, and I'm not sure it's even
going to work on all hosts: the binaries are linked with glibc, libX11, etc.
etc. and the build machines where you need this the most (old distros, funky
stuff like Alpine) might not have the correct libraries installed...

 Therefore, I've marked this series as Rejected. If you have good reasons to
have this and you can show that it does work on funky build machines, please
resubmit.

 Regards,
 Arnout


>  	select BR2_PACKAGE_BZIP2
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_FFMPEG
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 28fe256b65..9a3247dbbc 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -156,6 +156,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  KODI_CXX_FLAGS += -latomic
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HOST_OPENJDK_BOOTSTRAP),y)
> +KODI_CONF_ENV = \
> +	JAVA_HOME=$(HOST_OPENJDK_BOOTSTRAP_DIR) \
> +	PATH=$(HOST_OPENJDK_BOOTSTRAP_DIR)/bin:$(BR_PATH)
> +KODI_DEPENDENCIES += host-openjdk-bootstrap
> +endif
> +
>  ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
>  KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=ON
>  KODI_DEPENDENCIES += mysql
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
