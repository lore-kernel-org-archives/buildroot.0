From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 00:19:14 +0200
Subject: [Buildroot] [PATCH] libmemcached: don't use -fPIE and -pie with
	FLAT binaries
In-Reply-To: <1431377736-2574-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 May 2015 22:55:36 +0200")
References: <1431377736-2574-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d226iwpp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > FLAT binaries cannot use -fPIE and -pie code, so let's teach
 > libmemcached to not use such flags when BR2_BINFMT_FLAT=y.

 > Fixes:

 >   http://autobuild.buildroot.org/results/8cb/8cbf57f9136cb42be31c88e0f1f32d3d2353e5ff/
 >   and many previous similar build failures

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
 > +# Help libmemcached to understand that -fPIE and -pie should not be
 > +# used when FLAT binaries are used (shared libraries are not
 > +# supported).
 > +ifeq ($(BR2_BINFMT_FLAT),y)
 > +LIBMEMCACHED_CONF_ENV += \
 > +	ax_cv_check_cflags__Werror__fPIE=no \
 > +	ax_cv_check_cflags__Werror__pie=no \
 > +	ax_cv_check_cxxflags__Werror__fPIE=no \
 > +	ax_cv_check_cxxflags__Werror__pie=no
 > +endif

BINFMT_FLAT implies BR2_STATIC_LIBS and (elf) static libraries should
also not be built with -fPIE / -pie, right?

Is there any specific reason to only do this workaround for BINFMT_FLAT?

-- 
Bye, Peter Korsgaard
