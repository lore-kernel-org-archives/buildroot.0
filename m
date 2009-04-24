From: =?gb2312?B?sMu95LjnuOf=?= <l0op8ack@hotmail.com>
Date: Fri, 24 Apr 2009 17:42:21 +0000
Subject: [Buildroot] ping/wget/ftpget 'Segmentation fault' while
	PPPoE	interface up
In-Reply-To: <BLU139-W15BCD6DE5E4658EA20F91DDD750@phx.gbl>
References: <BLU139-W15BCD6DE5E4658EA20F91DDD750@phx.gbl>
Message-ID: <BLU139-W90D6F0AD871AE8271A8BDDD720@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,all
  I got response from buildroot mailing-list.
 
  The reason is no ip address assigned to the physical interface 'ethx' 'ppp0' used,
  but getaddrinfo() call had no idea about that.
 
  It IS a uclibc problem, already patched in uclibc snapshot.
  This patch works in my case.
 
diff -Narup uClibc-0.9.30.1.orig/libc/inet/getaddrinfo.c uClibc-0.9.30.1/libc/inet/getaddrinfo.c
--- uClibc-0.9.30.1.orig/libc/inet/getaddrinfo.c 2009-02-26 21:49:14.000000000 +0900
+++ uClibc-0.9.30.1/libc/inet/getaddrinfo.c 2009-03-06 00:59:23.000000000 +0900
@@ -187,6 +187,8 @@ static unsigned __check_pf(void)
   }
 
   for (runp = ifa; runp != NULL; runp = runp->ifa_next) {
+   if (runp->ifa_addr == NULL)
+    continue;
 #if defined __UCLIBC_HAS_IPV4__
    if (runp->ifa_addr->sa_family == PF_INET)
     seen |= SEEN_IPV4;

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


 


From: l0op8ack@hotmail.com
To: buildroot at busybox.net
Date: Thu, 23 Apr 2009 20:02:35 +0000
Subject: [Buildroot] ping/wget/ftpget 'Segmentation fault' while PPPoE interface up



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
at line 191,busyb ox-1.13.4/libbb/xconnect.c 
 
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
191 rc = getaddrinfo(host , NULL, &hint, &result);
...
 
I build busybox against glibc ,linked statically and try again,
busybox works fine, whether bringing up ppp interface or not.

It's a uclibc problem, maybe.



?MSN???????????????? ?????
_________________________________________________________________
MSN ???????????????
http://im.live.cn/emoticons/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090424/f92f92d2/attachment.htm>
