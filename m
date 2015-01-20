From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jan 2015 17:45:07 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if
 QT_SHARED is not selected
In-Reply-To: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <20150120174507.1d11ab61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Tue, 20 Jan 2015 11:17:28 +0100, Richard Genoud wrote:
> If Qt is compile as a static library, there's no point compiling qwt as
> a shared library, otherwise, we will have a huge qwt lib and a huge Qt
> application.
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>  package/qwt/qwt.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index a92d6b4b1540..d783314f7e40 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -32,6 +32,12 @@ else
>  	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT_SHARED),y)
> +	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/QWT_CONFIG += QwtDll/'
> +else
> +	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/\# QWT_CONFIG += QwtDll/'
> +endif

I think we should get rid of BR2_PACKAGE_QT_SHARED completely, and use
BR2_STATIC_LIBS here instead.

Moreover, we're using Qwt 6.1.0, and this version is in fact compatible
with both Qt >= 4.4 and Qt >= 5.0, so it should be adapted to this, and
not use a qt4 specific Config.in option.

Can you work on this and resend an updated version?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
