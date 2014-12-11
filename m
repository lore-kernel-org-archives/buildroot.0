From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Dec 2014 19:55:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-12-10
In-Reply-To: <5489D6E2.1010002@imgtec.com>
References: <20141211073016.EFDC7100E7A@stock.ovh.net>
 <5489D6E2.1010002@imgtec.com>
Message-ID: <20141211175508.GQ2440@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Thu, Dec 11, 2014 at 05:39:46PM +0000, Vicente Olivert Riera wrote:
> On 12/11/2014 07:30 AM, Thomas Petazzoni wrote:
> >       mipsel |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/965a3e345dc0a432043b72581bff7d33561fbe0c/
> 
> This failure is caused because in the configure script Kismet tries to
> do a compile test to check for pcap_open_live(). This works for shared
> builds because is very common the host machine has installed the shared
> library of libpcap. But when building for static, is very unlikely
> having the static library of libpcap installed on the host, so that
> compilation test (which runs in the host machine) fails.
> 
> Given that kismet depends on libpcap, we can ensure that the pcap
> library installed on the target will be fine, so we can workaround this
> error by removing the compile tests (there are three of them) from the
> configure script. And that would be a patch to fix Kismet when
> cross-compiling.
> 
> However, after doing that, we will face more problems. The first one
> will be one related of a missing "-pthread" option:
> 
> /br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libnl-3.a(socket.o):
> In function `release_local_port':
> socket.c:(.text+0x120): undefined reference to `pthread_rwlock_wrlock'
> [...]
> 
> We could fix that just by adding this to the kismet.mk file:
> 
> KISMET_CONF_ENV = LIBS="-pthread"
> 
> But that's not enough. We will face more problems like this one:
> 
> /br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpcap.a(pcap-canusb-linux.o):
> In function `canusb_close':
> pcap-canusb-linux.c:(.text+0xec): undefined reference to `libusb_close'
> 
> So, at this point I don't know if it would be better to just disable
> kismet for static builds. What do you think?

Use the pcap-config utility. See for example the packages bustle and wireshark 
among the others.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
