From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jan 2012 14:42:56 +0100
Subject: [Buildroot] [PATCH] Add package for open2300
In-Reply-To: <1326375221-2223-1-git-send-email-alexandre.belloni@piout.net>
References: <1326375221-2223-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <20120112144256.1ce4bfcb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 12 Jan 2012 14:33:41 +0100,
Alexandre Belloni <alexandre.belloni@piout.net> a ?crit :

>  menu "Miscellaneous"
> +source "package/open2300/Config.in"
>  source "package/shared-mime-info/Config.in"
>  endmenu

Looking at what the application does, probably it needs to go in the
"Hardware handling" menu.

> +config BR2_PACKAGE_OPEN2300
> +	bool "open2300"
> +	help
> +	  open2300 reads (and writes) data from a Lacrosse
> +	  WS2300/WS2305/WS2310/WS2315 Weather Station

We generally add an empty line here, and then the URL of the project.

> +OPEN2300_SITE:=http://www.lavrsen.dk/svn/open2300/trunk/
> +OPEN2300_SITE_METHOD:=svn
> +OPEN2300_VERSION:=12

Use = instead of := and do some nice formatting:

OPEN2300_SITE        = http://www.lavrsen.dk/svn/open2300/trunk/
OPEN2300_SITE_METHOD = svn
OPEN2300_VERSION     = 12

> +OPEN2300_BINS = open2300 dump2300 log2300 fetch2300 wu2300 cw2300
> history2300 histlog2300 bin2300 xml2300 light2300 interval2300
> minmax2300

Please use \ at some point to avoid the very long line.

> +ifeq ($(BR2_PACKAGE_MYSQL),y)
> +	OPEN2300_BINS += mysql2300 mysqlhistlog2300
> +endif

Do those programs need the mysql client library to be built? If so,
then you need:

OPEN2300_DEPENDENCIES += mysql_client

to ensure that mysql is built before open2300.

> +define OPEN2300_BUILD_CMDS
> +	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)
> $(OPEN2300_BINS) +endef
> +
> +define OPEN2300_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(addprefix $(@D)/,$(OPEN2300_BINS))
> $(TARGET_DIR)/usr/bin/ +endef

Won't work. If you use -D, you must pass the complete path of the
target file, i.e:

	for prog in $(OPEN2300_BINS); do \
		$(INSTALL) -D -m 0755 $(@D)/$$prog $(TARGET_DIR)/usr/bin/$$prog ; \
	done

> +$(eval $(call GENTARGETS,package,open2300))

Just:

$(eval $(call GENTARGETS))

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
