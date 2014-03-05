From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 23:49:11 +0100
Subject: [Buildroot] [PATCH 01/11] opencv: bump to version 2.4.8
In-Reply-To: <1392588004-13317-2-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140305224911.GB9644@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-02-16 22:59 +0100, Samuel Martin spake thusly:
> This patch bumps OpenCV version and does a number of cleanup in the
> opencv.mk files:
> - add an extract command because the source archive is only available
>   under zip format since this 2.4.8 release. Since there is no default
>   extract command for zip archive, we have to define it;
> - add license details;
> - add new modules options and update existing ones;
> - update SSE support;
> - sort and reorder the configure options (to make easier future package
>   update);
> - clean redundant C++ dependency (in the Qt knob).

As said on IRC (and repeated here for posterity ;-] ) : it would have
been easier to review if you had split the patch:
  - shufle options around
  - bump the version (with its own options added/removed/updated)
  - add licensing info
  - add sse4/sse42 support
  - add superres config knob
  - ...

> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 42f9b0a..43aef62 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -4,23 +4,34 @@
>  #
>  ################################################################################
>  
> -OPENCV_VERSION = 2.4.2
> -OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
> -OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
> +OPENCV_VERSION = 2.4.8
> +OPENCV_SOURCE = opencv-$(OPENCV_VERSION).zip
> +OPENCV_SITE = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
>  OPENCV_INSTALL_STAGING = YES
> +OPENCV_LICENSE = BSD-3c
> +OPENCV_LICENSE_FILES = doc/license.txt
> +
> +define OPENCV_EXTRACT_CMDS
> +    unzip -d $(BUILD_DIR) $(DL_DIR)/$(OPENCV_SOURCE)
> +endef
>  
>  OPENCV_CONF_OPT += \
>  	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
> -	-DBUILD_WITH_STATIC_CRT=OFF                                  \
> +	-DBUILD_WITH_DEBUG_INFO=OFF                                  \
> +	\

Why do you add such separating empty lines? If needed, add as many
option groups as needed. But separating options in a single group is not
really useful.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
