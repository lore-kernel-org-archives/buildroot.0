From: =?gb2312?B?sMu95LjnuOf=?= <l0op8ack@hotmail.com>
Date: Thu, 23 Apr 2009 20:02:35 +0000
Subject: [Buildroot] ping/wget/ftpget 'Segmentation fault' while PPPoE
	interface up
Message-ID: <BLU139-W15BCD6DE5E4658EA20F91DDD750@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


hi,all
I'm a buildroot user who struggle to make an old celeron pc with 2 ethernet NICs as access router. 
The leased line is ADSL(PPPoE).
 
I statically linked busybox against uclibc 0.9.30.1 ,using buildroot.
 
Bringing up ppp0 interface by rp-pppoe pppoe-connect script,so far so good.
Executing 'ping' ip address, the 'ping' command reports 'Segmentation fault'.
In fact, any network related command , such as wget/ftpget, report 'Segmentation fault'.
 
Shutdown the ppp0 interface by killing the 'pppd' and 'pppoe' processes,
ping some local ip address, no 'Segmentation fault' reportes this time,
and wget/ftpget work.
 
Bringing up ppp interface will crash the network related command.
 
I follow the busybox-1.13.4/networking/ping.c,
and find that the reason is 'getaddrinfo' call faults in fucntion 'static len_and_sockaddr* str2sockaddr',
at line 191,busybox-1.13.4/libbb/xconnect.c 
 
135 static len_and_sockaddr* str2sockaddr(
136                 const char *host, int port,
137 USE_FEATURE_IPV6(sa_family_t af,)
138                 int ai_flags)
139 {
140         int rc;
141         len_and_sockaddr *r = NULL;
142         struct addrinfo *result = NULL;
143         struct addrinfo *used_res;
144         const char *org_host = host; /* only for error msg */
145         const char *cp;
146         struct addrinfo hint;
...
191 rc = getaddrinfo(host, NULL, &hint, &result);
...
 
I build busybox against glibc ,linked statically and try again,
busybox works fine, whether bringing up ppp interface or not.


It's a uclibc problem, maybe.

_________________________________________________________________
????????????MClub?????????
http://club.msn.cn/?from=10
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090423/9bb54549/attachment.htm>
