From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Oct 2020 08:13:18 +0100
Subject: [Buildroot] [PATCH] package/libcurl: fix build with libssh2 and
 disabled proxy
In-Reply-To: <ff7bc375af351ebbfcc8f09c6b351fae305b24b1.1603689074.git.baruch@tkos.co.il>
References: <ff7bc375af351ebbfcc8f09c6b351fae305b24b1.1603689074.git.baruch@tkos.co.il>
Message-ID: <20201026071318.GA2805@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-10-26 07:11 +0200, Baruch Siach spake thusly:
> Add patch fixing build of libssh2 support when
> BR2_PACKAGE_LIBCURL_PROXY_SUPPORT is disabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/113407c1721b601cf2b721d0b78392622000cc3f/
> http://autobuild.buildroot.net/results/a5abdcc6a12d2326da0fe3daf9ecbb96e5c6cac3/
> http://autobuild.buildroot.net/results/ab1f7b9837ac74fad359e6c239f45ed25ad31df3/
> 
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ix-build-with-disabled-proxy-support.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/libcurl/0001-libssh2-fix-build-with-disabled-proxy-support.patch
> 
> diff --git a/package/libcurl/0001-libssh2-fix-build-with-disabled-proxy-support.patch b/package/libcurl/0001-libssh2-fix-build-with-disabled-proxy-support.patch
> new file mode 100644
> index 000000000000..180f243581a1
> --- /dev/null
> +++ b/package/libcurl/0001-libssh2-fix-build-with-disabled-proxy-support.patch
> @@ -0,0 +1,46 @@
> +From 75d2b1787b3253784a94c66016829acf1f442526 Mon Sep 17 00:00:00 2001
> +Message-Id: <75d2b1787b3253784a94c66016829acf1f442526.1603688719.git.baruch@tkos.co.il>
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Mon, 26 Oct 2020 06:56:49 +0200
> +Subject: [PATCH] libssh2: fix build with disabled proxy support
> +
> +Build breaks because the http_proxy field is missing:
> +
> +vssh/libssh2.c: In function 'ssh_connect':
> +vssh/libssh2.c:3119:10: error: 'struct connectdata' has no member named 'http_proxy'
> +   if(conn->http_proxy.proxytype == CURLPROXY_HTTPS) {
> +		  ^
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> +Upstream status: https://github.com/curl/curl/pull/6125
> +
> + lib/vssh/libssh2.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
> +index 6c6db049bf5a..74cd5d887549 100644
> +--- a/lib/vssh/libssh2.c
> ++++ b/lib/vssh/libssh2.c
> +@@ -3094,6 +3094,7 @@ static CURLcode ssh_connect(struct connectdata *conn, bool *done)
> +     return CURLE_FAILED_INIT;
> +   }
> + 
> ++#ifndef CURL_DISABLE_PROXY
> +   if(conn->http_proxy.proxytype == CURLPROXY_HTTPS) {
> +     /*
> +      * This crazy union dance is here to avoid assigning a void pointer a
> +@@ -3132,7 +3133,9 @@ static CURLcode ssh_connect(struct connectdata *conn, bool *done)
> +     libssh2_session_callback_set(ssh->ssh_session,
> +                                  LIBSSH2_CALLBACK_SEND, sshsend.sendp);
> +   }
> +-  else if(conn->handler->protocol & CURLPROTO_SCP) {
> ++  else
> ++#endif /* CURL_DISABLE_PROXY */
> ++  if(conn->handler->protocol & CURLPROTO_SCP) {
> +     conn->recv[FIRSTSOCKET] = scp_recv;
> +     conn->send[FIRSTSOCKET] = scp_send;
> +   }
> +-- 
> +2.28.0
> +
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
