From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:46:37 +0200
Subject: [Buildroot] [PATCH v2] libseccomp: Add new config option to
 build and install tests
In-Reply-To: <1442564371-10498-1-git-send-email-markos.chandras@imgtec.com>
References: <55FAF226.9080800@imgtec.com>
 <1442564371-10498-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20150920144637.25230558@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markos,

On Fri, 18 Sep 2015 09:19:31 +0100, Markos Chandras wrote:

> +ifeq ($(BR2_PACKAGE_LIBSECCOMP_TESTS),y)
> +
> +LIBSECCOMP_MAKE_OPTS += check-build
> +
> +define LIBSECCOMP_TESTS_INSTALL
> +	mkdir -p $(TARGET_DIR)/usr/libseccomp/{tests,tools} && \
> +	for x in tests tools; do \
> +		find $(@D)/$$x -maxdepth 1 \( -name "*.tests" -o -perm -a=x \) \
> +			-type f -exec cp {} $(TARGET_DIR)/usr/libseccomp/$$x/ \; ; \

This has the effect of installing one .py file for each test even if
Python is not installed on the target. They are pretty small, so maybe
we don't care, but it doesn't look really nice.

Also, this whole thing seems pretty crappy in libseccomp. Why don't
they have simply a --enable-tests option, which will simply do the
right thing?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
