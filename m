From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Oct 2017 14:39:19 +0200
Subject: [Buildroot] [PATCH] package/bridge-utils: fix headers path
In-Reply-To: <20171002214009.13353-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 2 Oct 2017 23:40:09 +0200")
References: <20171002214009.13353-1-yann.morin.1998@free.fr>
Message-ID: <87d164be2w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, bridge-utils wants to grap the headers from the linux-headers
 > package, so we point it directly there, as has been the case since we
 > first added bridge-utils in 2003 (c8eea31d3f), and then further refined
 > in 2005 (178a317d26) which is the first moment we pointed to the linux-
 > headers directory.

 > However, ther are two things wrong with that.

 > First, the headers are not directly in $(LINUX_HEADERS_DIR). Instead,
 > they are in a sub-directory thereof. So, we could not have found them
 > the way we are doing now.

 > Second, this definitely does not work when using an external toolchain,
 > because there is not linux-headers package enabled then.

 > Yet, against all odds, bridge-utils has valiantly deflected all rocks
 > thrown its way, day-in day-out building without any issue in every
 > autobuilders it's been confronted with. Good boy, good boy. :-)

Heh ;)

 > And indeed, it turns out that the required headers are easily found from
 > within the sysroot of the toolchain. Wonders! :-)

 > But there's still a gotcha: the default search path is still a hard
 > coded path pointing to oft installed kernel source tree on the host.

 > So, we still have to pass this option, but we can simply point to a
 > non-existent directory.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

While this works I don't really like this does-not-exist. I've changed
it to use $(STAGING_DIR)/usr/include, tweaked the comment and committed,
thanks.

-- 
Bye, Peter Korsgaard
