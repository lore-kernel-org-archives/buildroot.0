From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 17:21:48 +0100
Subject: [Buildroot] [PATCH 1/1] conntrack-tools: work around build
	issue with musl
In-Reply-To: <1448898039-27784-1-git-send-email-rprebello@gmail.com> (Rodrigo
 Rebello's message of "Mon, 30 Nov 2015 13:40:39 -0200")
References: <1448898039-27784-1-git-send-email-rprebello@gmail.com>
Message-ID: <87610jlaoz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rodrigo" == Rodrigo Rebello <rprebello@gmail.com> writes:

 > Building conntrack-tools with kernel headers >= 4.2 + musl fails due to
 > a well-known symbol clash that occurs when userspace and kernel headers
 > are included simultaneously (see [1], question 7, for details).

 > In the case of conntrack-tools, the inclusion of both 'netinet/in.h' and
 > 'linux/in.h' occurs inside the C helper files (src/helpers/*.c)
 > indirectly via e.g. 'libnetfilter_conntrack/libnetfilter_conntrack.h',
 > which itself includes 'netinet/in.h', and 'linux/netfilter.h', which
 > includes 'linux/in.h' in kernel headers >= 4.2.

 > The approach to solving this type of conflict with musl usually involves
 > removing the inclusion of kernel headers or refactoring the code so as
 > to avoid the mentioned simultaneous inclusion. This is unfortunately
 > non-trivial in the case of conntrack-tools since the clashing headers
 > get included indirectly by headers that are strictly necessary (because
 > of definitions used in some helper callbacks).

 > Work around the issue by defining __GLIBC__ when musl is used. This
 > eliminates the conflicts as the kernel headers avoid redefining certain
 > symbols when they see __GLIBC__ defined (linux/libc-compat.h). Note that
 > other glibc-compatible libraries, like uClibc, already do that
 > internally.

 > Fixes:
 >   http://autobuild.buildroot.net/results/66e/66ec247fa0fc385bef8d2084c65bf5cad3a8e8ca/
 >   http://autobuild.buildroot.net/results/624/624a0d48decd819eb58cbb3c58ee904b87ebfb21/

 > [1] http://wiki.musl-libc.org/wiki/FAQ

 > Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
