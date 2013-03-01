From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 01 Mar 2013 15:47:38 -0300
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362163072.19802.25.camel@genx.eng.msli.com>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
Message-ID: <5130F7CA.6090203@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/01/2013 03:37 PM, John Stile wrote:

> I have a need for an RFC2131 compliant DHCP client, which dhcpcd
> advertises to be (specifically  it needs to detect if a dhcp server
> becomes available).
> 
> I am using buildroot-2011.11.
> 
> I tried to add my own package to buildroot, to build dhcpcd, but I have
> no idea how to go about integrating into the system.
> 
> I configure static vs. dynamic via /etc/network/interfaces, but should I
> do next?  
> 
> How does the default system decide what to do with networking?
> What is the default dhcp client, and why isn't it RFC2131 compliant?

Hi.
If you're using a default buildroot skeleton without touching much then
/etc/init.d/S40network is called on system startup (from
/etc/init.d/rcS, which is invoked by init [/etc/inittab]).
S40network does an "ifup -a" (interface up, all) which is a busybox
applet/command that reads /etc/network/interfaces and does what it's
appropiate according to the configuration.
If your busybox config is default then udhcpc is built (busybox's dhcp
client) and that's what's used for DHCP.
For dhcpcd you probably don't want to use ifup nor S40network, you
probably want to run dhcpcd directly, something like "dhcpcd -b eth0" or
so. If link status messages are available it'll wait until carrier is
detected, and do the usual DHCP dance.
Regards.
