From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 14:04:55 +0200
Subject: [Buildroot] [PATCH 4/5] package/freerdp: prepare for adding
	another client
In-Reply-To: <b26d6437e140b49c39a7a4887b9bbf4ec6f2754d.1441569038.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 6 Sep 2015 21:54:21 +0200")
References: <cover.1441569038.git.yann.morin.1998@free.fr>
 <b26d6437e140b49c39a7a4887b9bbf4ec6f2754d.1441569038.git.yann.morin.1998@free.fr>
Message-ID: <87zj009mzc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the only client we can build is the X11 client.
 > FreeRDP now has support for building a wayland client.

 > However, that means we need to rethink the way we build FreeRDP, because
 > of some "inconsistencies" in its build system. This is because FreeRDP's
 > buildsystem does not have orthogonal options; some of the options can be
 > used for different components.

 > For example, the set of X11 libraries needed to build the server is a
 > superset of the X11 libraries needed to build the X11 client. So,
 > whenever the server is enabled, it means the X11 libraries required to
 > build the X11 client are available.

 > Now, if the user also wants to build the waland client (but not the X11
 > client), there is no way to tell FreeRDP not to build the X11 client,
 > because there is a single option, WITH_CLIENT, to drive whether any of
 > the clients is built. The decision is made on the availability of the
 > required libraries. And since the server is enabled, the X11 libs
 > required to build the X11 client are available. So, we end up with the
 > X11 client, even though it is not wanted.

 > And conversely with wayland...

 > So, we redesign the way we build FreeRDP. WE do not care what is
 > actually built; we just build whatever is buildable with the current
 > set of enabled libraries. But at install time (both in staging/ and
 > target/) we remove whatever the user does not want.

 > We also take the opportunity to rename the X11 client option, so it is
 > coherent with the soon-to-be-introduced wayland client.

 > Note: since FreeRDP has gained new dependencies, we can not just
 > introduce the legacy option as-is, otherwise we run the risk that it
 > selects the new option even though the new FreeRDP dependencies are not
 > enabled, spitting out the infamous 'unmet direct dependencies" kconfig
 > error.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > +# Remove static libraries in unusual dir
 > +define FREERDP_CLEANUP
 > +	rm -rf $(TARGET_DIR)/usr/lib/freerdp
 > +endef
 > +FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_CLEANUP
 > +

This part doesn't really seem directly related to the rest, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
