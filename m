From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 11:55:26 +0100
Subject: [Buildroot] [PATCH] net-tools: add a patch to avoid struct
 redefinition
In-Reply-To: <20161103132546.52679-1-Vincent.Riera@imgtec.com>
References: <20161103132546.52679-1-Vincent.Riera@imgtec.com>
Message-ID: <20161106115526.37fdc53b@free-electrons.com>
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

This patch causes more build failures than it fixes. Care to have a
look at:

     sparc64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/a1b2ff0385701fba85edfacf663896d8dbc8de09
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3746f6438bc6df349b709fe0ea6e6bbe72e40c96
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/ce7bc29a60dadefa9a1e76588b6cd117b9b438d3
        i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/b0ae167ed73731a500b3a689369ecee569280f3d
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/72cc7172fad6f886aef307b353775689784feca3
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3ee0f8d998507086dc94cc06b66dc7aaea51199a
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/e7b07b8f84431664ab1c327b42d4ec508f377bd9
        bfin | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/df8500280736379c054585cf62980fb4dfeb66d2
        i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/6c1efbfb8bdc6b68b4e2ac3cc58d736125ae0dbb
        i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/404690a4f8b42f773c50eea834181bae0185c550
     sparc64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/d2e66e873fc242f87882f944abdc31a0e5243488
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/5a8d3f0e540e6123c30b4dac8832a74808e4c1e7
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/d8803422d86908b24731fff613a05ea0d40f9269
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/8e9fb71362f81fec605328bc32c4ded1376de5d4

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
