From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 23:18:38 +0100
Subject: [Buildroot] [PATCH] infra: fix striping of ld.so and libpthread
In-Reply-To: <20161109105727.7068-1-jezz@sysmic.org>
References: <20161109105727.7068-1-jezz@sysmic.org>
Message-ID: <20161109231838.6c57a9f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for contributing this patch, this was definitely buggy.

In the commit title: striping -> stripping.

On Wed,  9 Nov 2016 11:57:27 +0100, J?r?me Pouiller wrote:
> If 'lib' is a symlink, 'find lib' does not return correct result. So, until now,

return *the* correct result. Also, it would have been good to explain
that this typically occurs when the "merged /usr" option is enabled.

> libpthread*.so* and ld-*.so* was not stripped when 'lib' was a symlink.
> 
> We fix tit by using 'find lib/' instead of 'find lib'

We fix *this*.

> @@ -644,7 +644,7 @@ target-finalize: $(PACKAGES)
>  		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
>  		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
>  	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
> -	find $(TARGET_DIR)/lib $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/libexec \
> +	find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ $(TARGET_DIR)/usr/libexec/ \

This change should have been explained in the commit log: it's just
done for consistency, but doesn't fix anything by itself.

I've applied to master with those various issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
