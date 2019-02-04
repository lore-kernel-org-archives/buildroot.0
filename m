From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 15:44:14 +0100
Subject: [Buildroot] [NEXT] infra: add force build flag for host
 dependencies
In-Reply-To: <20181127041009.11728-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Mon, 26 Nov 2018 22:10:09 -0600")
References: <20181127041009.11728-1-matthew.weber@rockwellcollins.com>
Message-ID: <871s4nvcjl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <Matthew.Weber@collins.com> writes:

 > From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
 > This commit adds a config option which will force buildroot to
 > build all host dependencies even if they are already present on the
 > host system. This may be a desirable option if different hosts are
 > used to build the same source. In this case, some packages will be
 > built on one host that are not built on another. This is problematic
 > if build source archives are cached afterwards for offline builds.

 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
..
 > +++ b/support/dependencies/dependencies.mk
 > @@ -9,9 +9,15 @@
 >  # can be the candidate to be checked. If not present, the check-host-$(1).sh
 >  # script should use 'which' to find a candidate. The script should return
 >  # the path to the suitable host tool, or nothing if no suitable tool was found.
 > +ifeq ($(BR2_FORCE_HOST_BUILD),y)
 > +define suitable-host-package
 > +$(shell exit 1)
 > +endef

It is little confusing that the description that only applies to the
"real" suitable-host-package is above this dummy implementation, so I've
moved the conditional above.

The $(shell exit 1) part isn't really needed as we look at the string
expansion of the macro, so I've dropped that.

I also slightly reworded the help text. Committed with those changes, thanks.

-- 
Bye, Peter Korsgaard
