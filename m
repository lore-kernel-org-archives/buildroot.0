From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Dec 2014 10:53:31 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-12-10
In-Reply-To: <5489DB5F.2000101@imgtec.com>
References: <20141211073016.EFDC7100E7A@stock.ovh.net>
 <5489D6E2.1010002@imgtec.com> <20141211175508.GQ2440@tarshish>
 <5489DB5F.2000101@imgtec.com>
Message-ID: <548AC92B.8060705@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch, all,

On 12/11/2014 05:58 PM, Vicente Olivert Riera wrote:
> Dear Baruch Siac,
> 
> On 12/11/2014 05:55 PM, Baruch Siach wrote:
>> Hi Vicente,
>>
>> On Thu, Dec 11, 2014 at 05:39:46PM +0000, Vicente Olivert Riera wrote:
>>> On 12/11/2014 07:30 AM, Thomas Petazzoni wrote:
>>>>       mipsel |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/965a3e345dc0a432043b72581bff7d33561fbe0c/
>>>
>>> This failure is caused because in the configure script Kismet tries to
>>> do a compile test to check for pcap_open_live(). This works for shared
>>> builds because is very common the host machine has installed the shared
>>> library of libpcap. But when building for static, is very unlikely
>>> having the static library of libpcap installed on the host, so that
>>> compilation test (which runs in the host machine) fails.
>>>
>>> Given that kismet depends on libpcap, we can ensure that the pcap
>>> library installed on the target will be fine, so we can workaround this
>>> error by removing the compile tests (there are three of them) from the
>>> configure script. And that would be a patch to fix Kismet when
>>> cross-compiling.
>>>
>>> However, after doing that, we will face more problems. The first one
>>> will be one related of a missing "-pthread" option:
>>>
>>> /br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libnl-3.a(socket.o):
>>> In function `release_local_port':
>>> socket.c:(.text+0x120): undefined reference to `pthread_rwlock_wrlock'
>>> [...]
>>>
>>> We could fix that just by adding this to the kismet.mk file:
>>>
>>> KISMET_CONF_ENV = LIBS="-pthread"
>>>
>>> But that's not enough. We will face more problems like this one:
>>>
>>> /br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpcap.a(pcap-canusb-linux.o):
>>> In function `canusb_close':
>>> pcap-canusb-linux.c:(.text+0xec): undefined reference to `libusb_close'
>>>
>>> So, at this point I don't know if it would be better to just disable
>>> kismet for static builds. What do you think?
>>
>> Use the pcap-config utility. See for example the packages bustle and wireshark 
>> among the others.
> 
> oh, that's interesting. Thanks! I have to go now, but I will have a look
> at it tomorrow, unless someone fix it first :P

thanks to your hint I'm almost done fixing this issue. After applying
the patch for removing the compile tests in the configure script (patch
attached), and after adding the following snippet to the kismet.mk, I
have fixed the issues with libpcap:

ifeq ($(BR2_PREFER_STATIC_LIB),y)
KISMET_CONF_ENV = LIBS="-lpcap $(shell
$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
endif

Now I'm stuck with a problem regarding ncurses (panel) and I don't know
how to solve it:

/br/output/host/usr/bin/mipsel-linux-g++ -rdynamic -o kismet_client
util.o ringbuf.o globalregistry.o messagebus.o configfile.o getopt.o
soundcontrol.o timetracker.o ipc_remote.o clinetframework.o tcpclient.o
popenclient.o kis_clinetframe.o text_cliframe.o kis_panel_widgets.o
kis_panel_network.o kis_panel_windows.o kis_panel_details.o
kis_panel_preferences.o kis_panel_frontend.o kismet_client.o -lstdc++
-ldl -lncurses -lpanel
/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpanel.a(p_delete.o):
In function `del_panel':
p_delete.c:(.text+0x68): undefined reference to `_nc_panelhook'
[...]

As you can see, -ncurses and -lpanel are passed in the compile line,
so..., I don't know what to do now :/

Ideas welcome. CCing Gustavo as I think he could have some knowledge
regarding ncurses and static builds. Sorry if I'm wrong :P

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-fix-cross-compile.patch
Type: text/x-patch
Size: 2405 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141212/7824ab45/attachment.bin>
