From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 23:00:43 +0200
Subject: [Buildroot] [PATCH v1] uhtppd: fix TCP_FASTOPEN related compile
 error
In-Reply-To: <20170329033732.v3tqayzoucwx5ies@tarshish>
References: <20170328202949.1762-1-ps.report@gmx.net>
 <20170329033732.v3tqayzoucwx5ies@tarshish>
Message-ID: <20170329230043.1696cd44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 06:37:32 +0300, Baruch Siach wrote:

> > +diff --git a/listen.c b/listen.c
> > +index 2a54888..727bff8 100644
> > +--- a/listen.c
> > ++++ b/listen.c
> > +@@ -107,18 +107,24 @@ void uh_setup_listeners(void)
> > + 		/* TCP keep-alive */
> > + 		if (conf.tcp_keepalive > 0) {
> > + #ifdef linux
> > +-			int tcp_ka_idl, tcp_ka_int, tcp_ka_cnt, tcp_fstopn;
> > ++			int tcp_ka_idl, tcp_ka_int, tcp_ka_cnt;
> > ++#ifdef TCP_FASTOPEN
> > ++			int tcp_fstopn;
> > ++#endif  
> 
> I might be cleaner to do instead:
> 
> #ifndef TCP_FASTOPEN
> #define TCP_FASTOPEN 23
> #endif

Agreed. If the kernel doesn't support it, then the setsockopt() call
will fail, but since the code doesn't check its return value, it
doesn't matter.

Also: in the commit title, there's a typo in the package name.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
