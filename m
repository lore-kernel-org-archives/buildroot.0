From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 4 Feb 2014 22:06:54 +0100
Subject: [Buildroot] [PATCH 1/1] Added patch fixing absolute path in
	toolchainfile.cmake
In-Reply-To: <1391536551-57608-1-git-send-email-u.strempel@googlemail.com>
References: <1391536551-57608-1-git-send-email-u.strempel@googlemail.com>
Message-ID: <CAHXCMM+S+XdF=MsHcVFMMs2ZWwK2Mb229s-YcDz9NsKNWkfPtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Uwe,


On Tue, Feb 4, 2014 at 6:55 PM, Uwe Strempel <u.strempel@googlemail.com>
wrote:
>
> On build process of buildroot the toolchainfile.cmake is created, but
with wrong absolut path.
> When shareing the toolchain or move the folder you get problems this path
settings.
>
> A workarround for cmake files is
> - get the path of the toolchainfile.cmake and set the the variables.
> see BUG #6818
>
> Signed-off-by: Uwe Strempel <u.strempel@googlemail.com>
> ---
>  package/Makefile.in  |  5 +++++
>  package/pkg-cmake.mk | 11 ++++++-----
>>
>>  2 files changed, 11 insertions(+), 5 deletions(-)
>
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 2e433fd..aa86fca 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -140,8 +140,10 @@ endif
>
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
> +TARGET_CROSS_WITHOUT_HOST_DIR=/usr/bin/$(GNU_TARGET_NAME)-
>  else
>  TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call
qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
> +TARGET_CROSS_WITHOUT_HOST_DIR=/usr/bin/$(call
qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
>  endif
>
>  # Quotes are needed for spaces et al in path components.
> @@ -164,6 +166,9 @@ TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
>  TARGET_CC_NOCCACHE  := $(TARGET_CC)
>  TARGET_CXX_NOCCACHE := $(TARGET_CXX)
>
> +TARGET_CC_NOCCACHE_WITHOUT_HOST_DIR  :=
$(TARGET_CROSS_WITHOUT_HOST_DIR)gcc
> +TARGET_CXX_NOCCACHE_WITHOUT_HOST_DIR :=
 $(TARGET_CROSS_WITHOUT_HOST_DIR)g++
> +

Are these new variables really needed at the make level?
Cannot all of this be done in the toolchainfile.cmake generation
(e.g.: http://lists.busybox.net/pipermail/buildroot/2012-May/053770.html)?


Regards,

--
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140204/7ba3fb69/attachment.html>
