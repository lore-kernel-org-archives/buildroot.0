From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 21 Sep 2015 09:39:20 +0100
Subject: [Buildroot] [PATCH v2] libseccomp: Add new config option to
 build and install tests
In-Reply-To: <20150920144637.25230558@free-electrons.com>
References: <55FAF226.9080800@imgtec.com>
 <1442564371-10498-1-git-send-email-markos.chandras@imgtec.com>
 <20150920144637.25230558@free-electrons.com>
Message-ID: <55FFC238.2010202@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 09/20/2015 01:46 PM, Thomas Petazzoni wrote:
> Markos,
> 
> On Fri, 18 Sep 2015 09:19:31 +0100, Markos Chandras wrote:
> 
>> +ifeq ($(BR2_PACKAGE_LIBSECCOMP_TESTS),y)
>> +
>> +LIBSECCOMP_MAKE_OPTS += check-build
>> +
>> +define LIBSECCOMP_TESTS_INSTALL
>> +	mkdir -p $(TARGET_DIR)/usr/libseccomp/{tests,tools} && \
>> +	for x in tests tools; do \
>> +		find $(@D)/$$x -maxdepth 1 \( -name "*.tests" -o -perm -a=x \) \
>> +			-type f -exec cp {} $(TARGET_DIR)/usr/libseccomp/$$x/ \; ; \
> 
> This has the effect of installing one .py file for each test even if
> Python is not installed on the target. They are pretty small, so maybe
> we don't care, but it doesn't look really nice.

Hmm makes sense. I will rework it then.

> 
> Also, this whole thing seems pretty crappy in libseccomp. Why don't
> they have simply a --enable-tests option, which will simply do the
> right thing?

It's probably because this is yet another testsuite and like any other
package testsuite you don't really need it installed. it's supposed to
run as part of package verification during build and installation. but
for cross-builds, it's useful to have it on the target.

-- 
markos
