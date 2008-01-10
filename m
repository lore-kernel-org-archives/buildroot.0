From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 11 Jan 2008 00:45:11 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <006901c8537a$3994aea0$6103170a@atmel.com>
References: <20080110092906.BFE9B12C57C@busybox.net>
	<20080110104222.GA31267@cloud.net.au>
	<006901c8537a$3994aea0$6103170a@atmel.com>
Message-ID: <20080110134511.GA1941@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 10, 2008 at 12:04:18PM +0100, Ulf Samuelsson wrote:
> > On Thu, Jan 10, 2008 at 01:29:06AM -0800, ulf at uclibc.org wrote:
> >> Log:
> >> Use host ldconfig, if external toolchain is used
> >> 
> >> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> >> +TARGET_LDCONFIG=/sbin/ldconfig
> >> +else
> >>  TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
> >> +endif
> > 
> > How can that be right? What does it fix?
> 
> You may be right, it may need more complex logic.
> Is testing CodeSourcery tools, which does not provide ldconfig.
> Running /sbin/ldconfig seems to allow the build to complete.

On my system, /sbin/ldconfig fails if run as a non-root user (can't
create temporary file /etc/ld.so.cache~).

Maybe the logic could detect if $(TARGET_CROSS)ldconfig exists and if
not, set TARGET_LDCONFIG=/bin/true? (I don't think there is any need to
ever run /sbin/ldconfig, because the host's ld.so.cache doesn't need
updating.)

ifeq ($(shell which $(TARGET_CROSS)ldconfig),)
TARGET_LDCONFIG=/bin/true
else
TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
endif

... appears to work here. "type" or "whence" or "command -v" might be
more portable than which, I'm not sure. I don't see any way to do it
without $(shell ..) though.


cheers
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
