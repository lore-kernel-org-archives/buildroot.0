From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 May 2015 06:22:19 +0300
Subject: [Buildroot] [PATCH v2] dieharder: new package
In-Reply-To: <1431778802-15637-1-git-send-email-julien.viarddegalbert@openwide.fr>
References: <1431778802-15637-1-git-send-email-julien.viarddegalbert@openwide.fr>
Message-ID: <20150517032219.GA2845@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Sat, May 16, 2015 at 02:20:02PM +0200, julien.viarddegalbert at openwide.fr wrote:
> +# fix endiannes detection
> +ifeq ($(BR2_ENDIAN),"BIG")
> +BR2_AC_CV_C_ENDIAN = ac_cv_c_endian=big
> +else
> +BR2_AC_CV_C_ENDIAN = ac_cv_c_endian=little
> +endif
> +DIEHARDER_CONF_OPTS = $(BR2_AC_CV_C_ENDIAN) --includedir=$(STAGING_DIR)/usr/include

The make variables namespace is global. Variables with the BR2_ prefix are 
reserved for Buildroot use. You should not use the BR2_ prefix for package 
specific variables. But you don't need this helper variable here, anyway:

DIEHARDER_CONF_OPTS = --includedir=$(STAGING_DIR)/usr/include
ifeq ($(BR2_ENDIAN),"BIG")
DIEHARDER_CONF_OPTS += ac_cv_c_endian=big
else
DIEHARDER_CONF_OPTS += ac_cv_c_endian=little
endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
