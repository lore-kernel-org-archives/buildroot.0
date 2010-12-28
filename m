From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Dec 2010 13:30:08 +0100
Subject: [Buildroot] [PATCH 1/1] package: correct usage of
	PKG_CONFIG_LIBDIR and PKG_CONFIG_PATH
In-Reply-To: <dfd500e8d6ee6be7e90583199314956adcce265f.1293535143.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 28 Dec 2010 12:19:09 +0100")
References: <cover.1293535143.git.thomas.petazzoni@free-electrons.com>
	<cover.1293535143.git.thomas.petazzoni@free-electrons.com>
	<dfd500e8d6ee6be7e90583199314956adcce265f.1293535143.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87oc86krlb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> In TARGET_CONFIGURE_OPTS (used to build packages for the target), we
 Thomas> were doing:

 Thomas>  PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"

 Thomas> This is incorrect for two reasons:

 Thomas>  * Adding $(PKG_CONFIG_PATH) to the PKG_CONFIG_PATH is useless, as
 Thomas>    PKG_CONFIG_PATH only *adds* new paths to the existing search paths.

 Thomas>  * PKG_CONFIG_PATH keeps default path (/usr/lib/pkgconfig) in the
 Thomas>    search path, which is incorrect for target packages: we should only
 Thomas>    look in $(STAGING_DIR)/usr/lib/pkgconfig. Lionel was hit by an
 Thomas>    issue caused by this: while compiling packages for the target, it
 Thomas>    was looking at .pc files in /usr/lib/pkgconfig on his host machine.

Hmm, but we compile a dedicated (host) pkg-config for this, where we
have set --pc-path=staging, so none of this should be needed, right?
(with the possible exception of ensuring PKG_CONFIG_PATH isn't set in
the environment).

 Thomas>    PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"

 Thomas> But there's no real reason to use PKG_CONFIG_LIBDIR here: as we are
 Thomas> compiling for the host, we may well have some interesting libraries in
 Thomas> /usr/lib/pkgconfig. So searching through them after
 Thomas> $(HOST_DIR)/usr/lib/pkgconfig sounds like the right thing to do.

That seems wrong as our pkg-config looks in staging by default, and
random host libraries shouldn't get picked up if that then breaks the
build for people without those libs.

-- 
Bye, Peter Korsgaard
