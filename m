From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Mar 2017 06:37:32 +0300
Subject: [Buildroot] [PATCH v1] uhtppd: fix TCP_FASTOPEN related compile
 error
In-Reply-To: <20170328202949.1762-1-ps.report@gmx.net>
References: <20170328202949.1762-1-ps.report@gmx.net>
Message-ID: <20170329033732.v3tqayzoucwx5ies@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Mar 28, 2017 at 10:29:49PM +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   .../uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82/listen.c: In function 'uh_setup_listeners':
>   .../uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82/listen.c:120:30: error: 'TCP_FASTOPEN' undeclared (first use in this function)
> 
> [1] http://autobuild.buildroot.net/results/56e/56e0727ccd1255b05e03d1b79dc238bd88701230
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---

[...]

> +diff --git a/listen.c b/listen.c
> +index 2a54888..727bff8 100644
> +--- a/listen.c
> ++++ b/listen.c
> +@@ -107,18 +107,24 @@ void uh_setup_listeners(void)
> + 		/* TCP keep-alive */
> + 		if (conf.tcp_keepalive > 0) {
> + #ifdef linux
> +-			int tcp_ka_idl, tcp_ka_int, tcp_ka_cnt, tcp_fstopn;
> ++			int tcp_ka_idl, tcp_ka_int, tcp_ka_cnt;
> ++#ifdef TCP_FASTOPEN
> ++			int tcp_fstopn;
> ++#endif

I might be cleaner to do instead:

#ifndef TCP_FASTOPEN
#define TCP_FASTOPEN 23
#endif

baruch

> + 
> + 			tcp_ka_idl = 1;
> + 			tcp_ka_cnt = 3;
> + 			tcp_ka_int = conf.tcp_keepalive;
> ++#ifdef TCP_FASTOPEN
> + 			tcp_fstopn = 5;
> +-
> ++#endif
> + 			setsockopt(sock, SOL_TCP, TCP_KEEPIDLE,  &tcp_ka_idl, sizeof(tcp_ka_idl));
> + 			setsockopt(sock, SOL_TCP, TCP_KEEPINTVL, &tcp_ka_int, sizeof(tcp_ka_int));
> + 			setsockopt(sock, SOL_TCP, TCP_KEEPCNT,   &tcp_ka_cnt, sizeof(tcp_ka_cnt));
> ++#ifdef TCP_FASTOPEN
> + 			setsockopt(sock, SOL_TCP, TCP_FASTOPEN,  &tcp_fstopn, sizeof(tcp_fstopn));
> + #endif
> ++#endif
> + 
> + 			setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE, &yes, sizeof(yes));
> + 		}

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
