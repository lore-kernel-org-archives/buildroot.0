From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 09 Jan 2012 10:57:23 +0100
Subject: [Buildroot] [PATCH] python-netifaces: add -x option to fix
	cross-compilation
In-Reply-To: <8739bpffv1.fsf@macbook.be.48ers.dk>
References: <1326094927-27207-1-git-send-email-yegorslists@googlemail.com>
 <8739bpffv1.fsf@macbook.be.48ers.dk>
Message-ID: <4F0ABA03.3030206@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 09.01.2012 09:18, schrieb Peter Korsgaard:
>>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
> 
> Hi,
> 
>  yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
>  yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  yegorslists> ---
>  yegorslists>  package/python-netifaces/python-netifaces.mk |    2 +-
>  yegorslists>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
>  yegorslists> diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
>  yegorslists> index e9a7099..5bfa326 100644
>  yegorslists> --- a/package/python-netifaces/python-netifaces.mk
>  yegorslists> +++ b/package/python-netifaces/python-netifaces.mk
>  yegorslists> @@ -14,7 +14,7 @@ define PYTHON_NETIFACES_BUILD_CMDS
>  yegorslists>  	(cd $(@D); \
>  yegorslists>  		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
>  yegorslists>  		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
>  yegorslists> -	$(HOST_DIR)/usr/bin/python setup.py build)
>  yegorslists> +	$(HOST_DIR)/usr/bin/python setup.py build -x)
>  yegorslists>  endef
> 
> Thanks, so far so good, but it still doesn't build here:
> 
> building 'netifaces' extension
> /home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -fno-strict-aliasing -pipe -Os -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -DHAVE_GETNAMEINFO=1 -DHAVE_SIOCGIFCONF=1 -DHAVE_SIOCGIFHWADDR=1 -DHAVE_SIOCGIFADDR=1 -DHAVE_SIOCGIFFLAGS=1 -DHAVE_SIOCGIFDSTADDR=1 -DHAVE_SIOCGIFBRDADDR=1 -DHAVE_SIOCGIFNETMASK=1 -DHAVE_SOCKET_IOCTLS=1 -DHAVE_NETAX25_AX25_H=1 -DHAVE_NETECONET_EC_H=1 -DHAVE_NETIPX_IPX_H=1 -DHAVE_NETPACKET_PACKET_H=1 -DHAVE_LINUX_IRDA_H=1 -DHAVE_LINUX_ATM_H=1 -DHAVE_LINUX_LLC_H=1 -DHAVE_LINUX_TIPC_H=1 -DHAVE_LINUX_DN_H=1 -DHAVE_SOCKADDR_AX25=1 -DHAVE_SOCKADDR_IN=1 -DHAVE_SOCKADDR_IN6=1 -DHAVE_SOCKADDR_IPX=1 -DHAVE_SOCKADDR_UN=1 -DHAVE_SOCKADDR_EC=1 -DHAVE_SOCKADDR_LL=1 -DHAVE_SOCKADDR_ATMPVC=1 -DHAVE_SOCKADDR_ATMSVC=1 -DHAVE_SOCKADDR_DN=1 -DHAVE_SOCKADDR_IRDA=1 -DHAVE_SOCKADDR_LLC=1 -I/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/python2.7 -c netifaces.c -o build/temp.linux-x86_64-2.7/netifaces.
o
> netifaces.c: In function 'ifaddrs':
> netifaces.c:627: error: invalid type argument of '->' (have 'struct ifreq')
> netifaces.c:637: error: expected ';' before 'do'
>  
> 
> Where netifaces.c:627 is:
> 
> if (string_from_sockaddr (ifr->CNAME(ifr_addr), buffer, sizeof (buffer)) == 0) {
> 
> and netifaces.c:637 is:
> 
>         Py_XDECREF (dict);
>         Py_XDECREF (list)
>         Py_XDECREF (family);
> 
> What kind of toolchain configuration are you using?
> 
> I also notice that it detects HAVE_SOCKADDR_IN6 even though my config
> doesn't have IPv6 support, which might be a problem.

That's really strange. I used CodeSourcery toolchain and had no problems, but with native BR toolchain I have the same behavior as yours. I'll look into this issue.

Yegor
