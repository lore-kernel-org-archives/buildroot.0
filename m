From: =?gb2312?B?sMu95LjnuOf=?= <l0op8ack@hotmail.com>
Date: Fri, 24 Apr 2009 17:28:04 +0000
Subject: [Buildroot] ping/wget/ftpget 'Segmentation fault' while PPPoE
 interface up
In-Reply-To: <d6a0e5a20904231919v3a41e15ei4cde751e1be86703@mail.gmail.com>
References: <BLU139-W15BCD6DE5E4658EA20F91DDD750@phx.gbl>
	<d6a0e5a20904231919v3a41e15ei4cde751e1be86703@mail.gmail.com>
Message-ID: <BLU139-W341D9DA8E84C62448CACA2DD720@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

  Yes, this patch works.

 

  The physical interface 'eth2' 'ppp0' used has no ipv4/ipv6 address.

 

  Thanks.

 
> Date: Fri, 24 Apr 2009 11:19:41 +0900
> Subject: Re: [Buildroot] ping/wget/ftpget 'Segmentation fault' while PPPoE interface up
> From: hiroshi.shinji at gmail.com
> To: l0op8ack at hotmail.com
> CC: buildroot at busybox.net
> 
> Hi,
> 
> If the interface used by ppp0 or others has no address,
> try to patch the file append to this mail to uClibc 0.9.30.1
> (or use uClibc snapshot).
> 
> This patch already applied to uClibc snapshot.
> 
> Regards,
> 
> 
> 2009/4/24 ???????? <l0op8ack@hotmail.com>:
> > hi,all
> > I'm a buildroot user who struggle to make an old celeron pc with 2 ethernet
> > NICs as access router.
> > The leased line is ADSL(PPPoE).
> >
> > I statically linked busybox against uclibc 0.9.30.1 ,using buildroot.
> >
> > Bringing up ppp0 interface by rp-pppoe pppoe-connect script,so far so good.
> > Executing 'ping' ip address, the 'ping' command reports 'Segmentation
> > fault'.
> > In fact, any network related command , such as wget/ftpget, report
> > 'Segmentation fault'.
> >
> > Shutdown the ppp0 interface by killing the 'pppd' and 'pppoe' processes,
> > ping some local ip address, no 'Segmentation fault' reportes this time,
> > and wget/ftpget work.
> >
> > Bringing up ppp interface will crash the network related command.
> >
> > I follow the busybox-1.13.4/networking/ping.c,
> > and find that the reason is 'getaddrinfo' call faults in fucntion 'static
> > len_and_sockaddr* str2sockaddr',
> > at line 191,busyb ox-1.13.4/libbb/xconnect.c
> >
> > 135 static len_and_sockaddr* str2sockaddr(
> > 136 const char *host, int port,
> > 137 USE_FEATURE_IPV6(sa_family_t af,)
> > 138 int ai_flags)
> > 139 {
> > 140 int rc;
> > 141 len_and_sockaddr *r = NULL;
> > 142 struct addrinfo *result = NULL;
> > 143 struct addrinfo *used_res;
> > 144 const char *org_host = host; /* only for error msg */
> > 145 const char *cp;
> > 146 struct addrinfo hint;
> > ...
> > 191 rc = getaddrinfo(host , NULL, &hint, &result);
> > ...
> >
> > I build busybox against glibc ,linked statically and try again,
> > busybox works fine, whether bringing up ppp interface or not.
> >
> > It's a uclibc problem, maybe.
> >
> > ________________________________
> > ??MSN???????????????????????????????? ??????????
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> 
> 
> 
> -- 
> ?`?? ??
> hiroshi.shinji at gmail.com
> http://d.hatena.ne.jp/hshinji/

_________________________________________________________________
Live Search??????????????????????????????
http://www.live.com/?scope=video
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090424/84ac21be/attachment.htm>
