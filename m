From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2014 16:41:56 +0100
Subject: [Buildroot] [PATCH v2 1/3] skeleton: add support for
 /etc/ld.so.conf.d/*.conf files
In-Reply-To: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
References: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141031164156.6a386482@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri, 31 Oct 2014 16:19:07 +0100, J?r?me Pouiller wrote:

> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +define GENERATE_LD_SO_CONF_FILE
> +	ls $(TARGET_DIR)/etc/ld.so.conf.d/*.conf > /dev/null 2>&1 && \
> +	    echo "Usage of /etc/ld.so.conf.d/*.conf files with musl libc is not supported"

We should error out here.

Does musl supports /etc/ld.so.conf ? If so, then I believe we should
simply not use the /etc/ld.so.conf.d/ feature of glibc, and instead
keep using /etc/ld.so.conf only, like MySQL was doing.

If you don't want to see repeated entries, you can do something like:

	grep -q "^/usr/lib/mysql$" $(TARGET_DIR)/etc/ld.so.conf ||
		echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf

We could even imagine having a make function to do that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
