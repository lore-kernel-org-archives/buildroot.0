From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 11:30:02 +0200
Subject: [Buildroot] [PATCH 2/2] ntp: Adding pps support to ntpd
In-Reply-To: <1413405475-5179-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1413405475-5179-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1413405475-5179-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20141016113002.37bd449f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Wed, 15 Oct 2014 15:37:55 -0500, Matt Weber wrote:

> +config BR2_PACKAGE_NTP_NTPD_ATOM_PPS
> +	bool "ntpd-pps"

I'd use "PPS support" here instead.

> +	depends on BR2_PACKAGE_NTP_NTPD
> +	select BR2_PACKAGE_PPS_TOOLS
> +	help
> +	  Compile ntpd with the ability to use an ATOM PPS source.
> +
>  config BR2_PACKAGE_NTP_NTPDATE
>  	bool "ntpdate"
>  	help
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index 7c2cb8e..51598ba 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -34,6 +34,11 @@ else
>  	NTP_CONF_OPTS += --without-ntpsnmpd
>  endif
>  
> +ifeq ($(BR2_PACKAGE_NTP_NTPD_ATOM_PPS),y)
> +	NTP_CONF_OPTS += --enable-ATOM
> +	NTP_DEPENDENCIES += pps-tools
> +endif

Can you add the corresponding:

else
	NTP_CONF_OPTS += --disable-ATOM
endif

We like to be explicit about configuration options when possible.

With that fixed, you can resend this patch with my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(I did built test this).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
