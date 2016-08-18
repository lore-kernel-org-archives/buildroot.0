From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:46:49 +0200
Subject: [Buildroot] [PATCH 1/2] libconfuse: add optional dependency on
 gettext
In-Reply-To: <1471544678-12514-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471544678-12514-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160818234649.22147c6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 23:54:37 +0530, Rahul Bedarkar wrote:
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/libconfuse/Config.in     | 1 +
>  package/libconfuse/libconfuse.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/libconfuse/Config.in b/package/libconfuse/Config.in
> index be18cbb..7dedd83 100644
> --- a/package/libconfuse/Config.in
> +++ b/package/libconfuse/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBCONFUSE
>  	bool "libconfuse"
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE

This was not correct: libconfuse does not *require* gettext, even if
locale support is enabled. It can work fine without it. However, if
it's available, it uses it. So I've changed your patch to just:

ifeq ($(BR2_PACKAGE_GETTEXT),y)
LIBCONFUSE_DEPENDENCIES += gettext
endif

which ensures that *if* gettext has been enabled in the configuration,
it will be built before libconfuse.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
