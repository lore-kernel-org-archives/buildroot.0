From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 16:30:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: fix build with poppler and
 gcc 5
In-Reply-To: <20200404213245.1519848-1-fontaine.fabrice@gmail.com>
References: <20200404213245.1519848-1-fontaine.fabrice@gmail.com>
Message-ID: <20200419163025.39295d52@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Apr 2020 23:32:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -std=c++11 is needed to avoid the following build failure with poppler
> and gcc 5:
> 
> /home/naourr/work/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:40:37: note: C++11 'noexcept' only available with -std=c++11 or -std=gnu++11
> /home/naourr/work/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:70:10: error: 'unique_ptr' in namespace 'std' does not name a template type
>      std::unique_ptr<text_box_data> m_data;
>           ^
> Fixes:
>  - http://autobuild.buildroot.org/results/3428b9017168db9239756dc06cdaa5ae004cab97
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/efl/efl.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index f1e69f8a23..d8364ed76f 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -257,6 +257,8 @@ EFL_CONF_OPTS += --disable-image-loader-webp
>  endif
>  
>  ifeq ($(BR2_PACKAGE_POPPLER),y)
> +# poppler needs c++11
> +EFL_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"

I've never been a big fan of adding such flags, but I've applied your
patch nevertheless. What would be the correct thing here? Should it be
the responsibility of poppler to add -std=c++11 into the CFLAGS of its
.pc file when necessary ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
