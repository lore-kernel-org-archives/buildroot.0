From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Feb 2017 20:03:29 -0200
Subject: [Buildroot] [PATCH v2] kmscube: Add new package
In-Reply-To: <20170213223117.0125c14e@free-electrons.com>
References: <1487011784-24966-1-git-send-email-festevam@gmail.com>
 <20170213223117.0125c14e@free-electrons.com>
Message-ID: <CAOMZO5Dwdu5-+bV=TXA6=-wg+=W05BhE1eEYhzZk6zV71MUBdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your review.

On Mon, Feb 13, 2017 at 7:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>> diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
>> new file mode 100644
>> index 0000000..b3c3c8d
>> --- /dev/null
>> +++ b/package/kmscube/Config.in
>> @@ -0,0 +1,5 @@
>> +config BR2_PACKAGE_KMSCUBE
>> +     bool "kmscube"
>> +     depends on BR2_PACKAGE_MESA3D && BR2_PACKAGE_LIBDRM
>
> kmscube apparently wants EGL and OpenGL ES:
>
> PKG_CHECK_MODULES(EGL, egl)
> PKG_CHECK_MODULES(GLES2, glesv2)
>
> so probably this needs to be taken into account here by using the
> BR2_PACKAGE_MESA3D_OPENGL_EGL and BR2_PACKAGE_MESA3D_OPENGL_ES symbols.

When building kmscube via Buildroot I see:

checking for DRM... yes
checking for GBM... yes
checking for EGL... yes
checking for GLES2... yes

BR2_PACKAGE_MESA3D_OPENGL_EGL is selected by the Etnaviv mesa driver:
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV, which comes from a patch I
sent today.

I don't have BR2_PACKAGE_MESA3D_OPENGL_ES option selected, but I do
get "checking for GLES2... yes", so I am bit confused.

Is your suggestion to do something like this?

config BR2_PACKAGE_KMSCUBE
 bool "kmscube"
 depends on BR2_PACKAGE_MESA3D && BR2_PACKAGE_LIBDRM
 depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
 select BR2_PACKAGE_MESA3D_OPENGL_ES

> License information is also missing, and you forgot to add yourself to
> the DEVELOPERS file (should be done in the same patch).

It is not clear by looking at the header files which license this
project uses. How should I do in a case like this?

Thanks
