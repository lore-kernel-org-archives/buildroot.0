From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 11:49:09 +0200
Subject: [Buildroot] [PATCH 1/1] linux-fusion: fix build issues
In-Reply-To: <20170703090933.32566-2-matthew.shyu.amlogic@gmail.com>
References: <20170703090933.32566-1-matthew.shyu.amlogic@gmail.com>
 <20170703090933.32566-2-matthew.shyu.amlogic@gmail.com>
Message-ID: <a0e8fa00-ad61-20e4-b1d1-96ce1b4df14c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matthew,

On 03-07-17 11:09, Matthew Shyu wrote:
> From: Matthew Shyu <matthew.shyu@amlogic.com>
> 
> size parameter from sock_recvmsg was removed from kernel API since 4.7
> 
> Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
> ---
>  ... => 0004-Port-one-one_udp.c-to-Linux-4.9.patch} | 41 +++++++++++++++++-----
>  1 file changed, 32 insertions(+), 9 deletions(-)
>  rename package/linux-fusion/{0004-Port-one-one_udp.c-to-Linux-4.1.patch => 0004-Port-one-one_udp.c-to-Linux-4.9.patch} (72%)
> 
> diff --git a/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch b/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.9.patch
> similarity index 72%
> rename from package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
> rename to package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.9.patch
> index e1bff64f3b..721f1a5047 100644
> --- a/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
> +++ b/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.9.patch
> @@ -1,7 +1,16 @@
> -From be288b60278c78eccfd347aacf4d3dd8771215a9 Mon Sep 17 00:00:00 2001
> -From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> -Date: Tue, 12 Jan 2016 14:01:42 +0100
> -Subject: [PATCH] Port one/one_udp.c to Linux 4.1
> +From e41d1132d1e92fc05c51968d18dd667f552c0edc Mon Sep 17 00:00:00 2001
> +From: Matthew Shyu <matthew.shyu@amlogic.com>

 Since your change is pretty small compared to the original patch, please keep
the original author and just add your SoB and the thing you changed.

> +Date: Thu, 29 Jun 2017 16:22:59 +0800
> +Subject: [PATCH] Port one/one_udp.c to Linux 4.9

 I guess you meant 4.7, not 4.9? Anyway, it should be "4.1 and 4.7" because the
patch also still fixes things for 4.1 - 4.6.

> +
> +Kernel removed size parameter from sock_recvmsg since 4.7
> +
> +In function 'ksocket_receive'
> +one/one_udp.c:235:13: error: too many arguments to function 'sock_recvmsg'

 So move this part under the SoB of Marc.

> +
> +This patch is based on Marc Gonzalez's patch "Port one/one_udp.c to Linux 4.1"

 And remove this.

> +
> +Logs from "Port one/one_udp.c to Linux 4.1"
>  
>  Kernel commit c0371da6047a replaced msg_iov and msg_iovlen with msg_iter
>  in struct msghdr since 3.19
> @@ -23,13 +32,16 @@ since 4.1
>  one/one_udp.c: In function 'ksocket_send_iov':
>  one/one_udp.c:192:13: error: too many arguments to function 'sock_sendmsg'
>  
> -Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> +Kernel commit 2da62906b1e29 dropped the size parameter in sock_recvmsg
> +since 4.1
> +
> +Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>

 Could you also mention the upstream status of this patch?

 Regards,
 Arnout

>  ---
> - one/one_udp.c | 30 +++++++++++++++---------------
> - 1 file changed, 15 insertions(+), 15 deletions(-)
> + one/one_udp.c | 34 +++++++++++++++++++---------------
> + 1 file changed, 19 insertions(+), 15 deletions(-)
>  
>  diff --git a/one/one_udp.c b/one/one_udp.c
> -index 26b9e6a1f729..b1daae164cdf 100644
> +index 26b9e6a..9b59529 100644
>  --- a/one/one_udp.c
>  +++ b/one/one_udp.c
>  @@ -161,7 +161,7 @@ ksocket_send_iov( struct socket      *sock,
> @@ -78,7 +90,7 @@ index 26b9e6a1f729..b1daae164cdf 100644
>        struct iovec iov;
>        mm_segment_t oldfs;
>        int size = 0;
> -@@ -213,14 +215,12 @@ ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int le
> +@@ -213,18 +215,20 @@ ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int le
>        iov.iov_base = buf;
>        iov.iov_len = len;
>   
> @@ -97,3 +109,14 @@ index 26b9e6a1f729..b1daae164cdf 100644
>   
>        oldfs = get_fs();
>        set_fs(KERNEL_DS);
> ++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,7,0) // commit 2da62906b1e29
> +      size = sock_recvmsg(sock,&msg,len,msg.msg_flags);
> ++#else
> ++     size = sock_recvmsg(sock, &msg,msg.msg_flags);
> ++#endif
> +      set_fs(oldfs);
> + 
> +      return size;
> +-- 
> +2.11.0
> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
