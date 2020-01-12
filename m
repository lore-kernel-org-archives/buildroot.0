From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 21:31:31 +0100
Subject: [Buildroot] [PATCH 1/6] package/alure: new package
In-Reply-To: <20200105113204.30356-1-romain.naour@gmail.com>
References: <20200105113204.30356-1-romain.naour@gmail.com>
Message-ID: <20200112213131.6154c8f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Jan 2020 12:31:59 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Use the latest commit since there is no release since 1.2 (8 years ago).
> 
> While testing with test-pkg, the last build issue was
> due to the gcc 4.8.3 compiler missing C++11 feature:
> "std::list.erase(const_iterator pos) not implemented" [1]
> 
> arm-none-linux-gnueabi/include/c++/4.8.3/bits/vector.tcc:134:5: note:
> no known conversion for argument 1 from '__gnu_cxx::__normal_iterator<const alure::Source*, std::vector<alure::Source> >'
> to 'std::vector<alure::Source>::iterator {aka __gnu_cxx::__normal_iterator<alure::Source*, std::vector<alure::Source> >}
> 
> https://github.com/kcat/alure/blob/14beed2a86d5a36030e907b21c46614d505f07cd/src/context.cpp#L1357
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57158
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

I've applied the entire series, but with a few changes. I'll comment
only on the patches where changes were needed, including this one.

> ---
>  package/Config.in        |  1 +
>  package/alure/Config.in  | 27 +++++++++++++++++++++++++++
>  package/alure/alure.hash |  2 ++
>  package/alure/alure.mk   | 34 ++++++++++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+)

Missing entry in the DEVELOPERS file.


> diff --git a/package/alure/alure.hash b/package/alure/alure.hash
> new file mode 100644
> index 0000000000..3387f76f9d
> --- /dev/null
> +++ b/package/alure/alure.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 9b808e5b5a54d156348221dc86704c7831115047d5238691e6088f8c4814b2ca  alure-14beed2a86d5a36030e907b21c46614d505f07cd.tar.gz

Hash of the license file is missing... and I forgot to add it as well,
I'm only seeing this now that I review the patch once again. A
follow-up patch to add it would be good.

> +ALURE_VERSION = 14beed2a86d5a36030e907b21c46614d505f07cd
> +ALURE_SITE = $(call github,kcat,alure,$(ALURE_VERSION))
> +ALURE_LICENSE = MIT, Public Domain (src/decoders/dr_flac.h)

The license is not MIT, but Zlib. Make sure to compare the license text
when determining the license type.

> +ifeq ($(BR2_STATIC_LIBS),y)
> +ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=OFF \
> +	-DALURE_BUILD_STATIC=ON
> +else
> +ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=ON \
> +	-DALURE_BUILD_STATIC=OFF
> +endif

You forgot to handle the BR2_STATIC_SHARED_LIBS=y case, where both the
static and the shared libraries must be built.

That being said, the static library support of alure is quite broken:
it installs the library as libalure_s.a, i.e with a different name than
the shared library. This means that any application/library using alure
must now whether it should use -lalure or -lalure_s.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
