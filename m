From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 24 Feb 2015 00:39:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/thrift: fix build failure on
 bfin
In-Reply-To: <54EA4E53.6050401@openwide.fr>
References: <1424640307-26144-1-git-send-email-romain.naour@openwide.fr>
 <20150222222748.64849cf0@free-electrons.com> <54EA4E53.6050401@openwide.fr>
Message-ID: <54EBBA2A.4090407@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

This patch is wrong since THRIFT_CONF_OPTS is overwritten here (missing +)
THRIFT_CONF_OPTS = lt_cv_aix_libpath__CXX="/usr/lib"

So previous THRIFT_CONF_OPTS were discarded:
THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
	--with-boost=$(STAGING_DIR) \
	--disable-tests \
	--disable-tutorial

That why the tests were build...

But the issue seems to be related to --with-boost=$(STAGING_DIR) option.
There is no error if you remove this option.

So I used --with-boost-libdir=$(STAGING_DIR)/usr/lib to override boost libraries
path detection.

Please give a try to the new patch:
http://patchwork.ozlabs.org/patch/442702/

Best regards,
Romain
