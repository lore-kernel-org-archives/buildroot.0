From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Feb 2011 21:34:33 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: fix upper case
 $(PKG)_SITE_METHOD
In-Reply-To: <1296559129-5595-1-git-send-email-bjorn.forsman@gmail.com>
References: <1296559129-5595-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20110201213433.1d527342@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Feb 2011 12:18:49 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

>  		case "$($(PKG)_SITE_METHOD)" in \
> -			git) $($(DL_MODE)_GIT) && exit ;; \
> -			svn) $($(DL_MODE)_SVN) && exit ;; \
> -			bzr) $($(DL_MODE)_BZR) && exit ;; \
> +			GIT) $($(DL_MODE)_GIT) && exit ;; \
> +			SVN) $($(DL_MODE)_SVN) && exit ;; \
> +			BZR) $($(DL_MODE)_BZR) && exit ;; \
>  			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
>  		esac ; \
>  	fi ; \

No. This is going to break:

        # Try automatic detection using the scheme part of the URI
        $(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))

is used to detect the site method from the URI, like :

	git://....

or

	svn://....

so if only upper case site methods are accepted, it's not going to work.

And more generally, I'd prefer to keep the existing lower-case writing
of the site method, since it is coherent with how it's written in the
URI.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
