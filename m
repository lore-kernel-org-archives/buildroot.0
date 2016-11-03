From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:30:47 +0100
Subject: [Buildroot] [PATCH] net-tools: add a patch to avoid struct
 redefinition
In-Reply-To: <20161103132546.52679-1-Vincent.Riera@imgtec.com>
References: <20161103132546.52679-1-Vincent.Riera@imgtec.com>
Message-ID: <20161103223047.07fbbfc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Nov 2016 13:25:46 +0000, Vicente Olivert Riera wrote:
> This fixes a struct redefinition problem like this one:
> 
> ================================
> In file included from /usr/include/linux/if_tunnel.h:6:0,
> from iptunnel.c:34:
> /usr/include/linux/ip.h:85:8: error: redefinition of 'struct iphdr'
> struct iphdr {
> ^
> In file included from iptunnel.c:29:0:
> /usr/include/netinet/ip.h:45:8: note: originally defined here
> struct iphdr
> ^
> ================================
> 
> iptunnel.c includes netinet/ip.h which contains a definition of the
> iphdr struct.
> 
> iptunnel.c also includes linux/if_tunnel.h which includes linux/ip.h
> which contains a definition of the iphdr struct.
> 
> So, both netinet/ip.h and linux/ip.h define the iphdr struct, and both
> of them have been included directly or indirectly by iptunnel.c. Because
> of that the compilation fails due to a struct redefinition.
> 
> The problem can be solved by just not including netinet/ip.h.
> 
> The patch has been sent upstream as a merge request:
>   https://sourceforge.net/p/net-tools/code/merge-requests/3/
> 
> Fixes:
>   http://autobuild.buildroot.net/results/dce/dce499da84b2a41bab946d5109a283ccb85c8b81/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...02-iptunnel.c-do-not-include-netinet-ip.h.patch | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
