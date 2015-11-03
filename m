From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 18:57:33 +0100
Subject: [Buildroot] [PATCH] elfutils: fix sparc64 build, -fPIC required
In-Reply-To: <20151103171832.GA7668@waldemar-brodkorb.de>
References: <20151103171832.GA7668@waldemar-brodkorb.de>
Message-ID: <20151103185733.364482c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 3 Nov 2015 18:18:32 +0100, Waldemar Brodkorb wrote:
> Fixes following autobuild errors:
> http://autobuild.buildroot.net/results/82cc7766d2c805146e94baf82a24d1002f56593d/
> http://autobuild.buildroot.net/results/ca4ca362581ee0111cba389d1afbff287692c21b/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/elfutils/elfutils.mk |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 838c3b8..261849a 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -21,6 +21,11 @@ ELFUTILS_CONF_ENV += \
>  	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
>  	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
>  
> +# sparc64 needs -fPIC instead of -fpic
> +ifeq ($(BR2_sparc64),y)
> +ELFUTILS_CONF_ENV += CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS)) -fPIC"

I don't like the duplication of the _FILE_OFFSET_BITS dance. Can you
introduce an ELFUTILS_CFLAGS instead ?

Also, for libpcap, -fPIC is needed instead of -fpic for both microblaze
and sparc64. But for elfutils, -fPIC is only needed for sparc64 ? I
just tested a quick build of elfutils on microblaze, and it indeed
works without any change.

Do you have any clue why?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
