From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 19:01:03 +0200
Subject: [Buildroot] [PATCH 2/4] package/efl: enable elput support
In-Reply-To: <1473282523-12796-2-git-send-email-romain.naour@gmail.com>
References: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
 <1473282523-12796-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160917190103.73223a39@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Sep 2016 23:08:41 +0200, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/Config.in | 9 +++++++++
>  package/efl/efl.mk    | 5 +++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index f4d88bc..df13047 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -185,6 +185,15 @@ comment "OpenGL ES support needs an OpenGL ES w/ EGL provider"
>  
>  endchoice # OpenGL support
>  
> +config BR2_PACKAGE_EFL_ELPUT
> +	bool "Elput"
> +	select BR2_PACKAGE_LIBINPUT

It also depends on BR2_PACKAGE_LIBXKBCOMMON (I've had a build failure).

Note that libxkbcommon was already selected by the efl package if
wayland is used. But the elput functionality needs it unconditionally.


> +ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
> +EFL_CONF_OPTS += --enable-elput
> +EFL_DEPENDENCIES += libinput

I've added the libxkbcommon dependency here, and also an "else" clause
to explicitly --disable-elput.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
