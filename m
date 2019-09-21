From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:31:34 +0200
Subject: [Buildroot] [PATCH] package/protobuf: work around gcc bug 85180
In-Reply-To: <20190918091142.79696-1-giulio.benetti@benettiengineering.com>
References: <20190918091142.79696-1-giulio.benetti@benettiengineering.com>
Message-ID: <a9152921-549d-1e54-78ef-150515cfe7f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/09/2019 11:11, Giulio Benetti wrote:
> With Microblaze Gcc version < 8.x the build hangs due to gcc bug
> 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
> shows up when building protobuf with optimization but not when building
> with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
> force using -O0.
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/73dc9610a13d6e14eec58d529617210d93d5dec4/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/protobuf/protobuf.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index e698bac228..699735ce37 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -17,6 +17,14 @@ PROTOBUF_LICENSE_FILES = LICENSE
>  PROTOBUF_DEPENDENCIES = host-protobuf
>  PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/bin/protoc
>  
> +PROTOBUF_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> +PROTOBUF_CXXFLAGS += -O0
> +endif
> +
> +PROTOBUF_CONF_ENV = CXXFLAGS="$(OPUS_CFXXLAGS)"

 OPUS_CFXXLAGS is obviously wrong. I guess it accidentally still fixed the
issue, because it causes the CXXFLAGS to be empty instead of TARGET_CXXFLAGS, so
it gets built without optimisation options.

 I fixed that and applied to master, thanks.

 Regards,
 Arnout

> +
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  PROTOBUF_CONF_ENV += LIBS=-latomic
>  endif
> 
