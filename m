From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 14:56:57 +0100
Subject: [Buildroot] Question on udhcpc script
In-Reply-To: <CAL2JCb8RWKzBciDr6mGs3gUy1onKAnm3SQj04Ti3MzBG_wHG-w@mail.gmail.com>
 (Bhattiprolu RaviKumar's message of "Mon, 1 Feb 2021 18:50:30 +0530")
References: <CAL2JCb_UdG5-PpWbz3Yd84mSM47pGJHsjyUOn7Tzm6r_=Q4Dkg@mail.gmail.com>
 <87a6sonfgu.fsf@dell.be.48ers.dk>
 <CAL2JCb8RWKzBciDr6mGs3gUy1onKAnm3SQj04Ti3MzBG_wHG-w@mail.gmail.com>
Message-ID: <875z3bopqu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bhattiprolu" == Bhattiprolu RaviKumar <ravikumar.bhattiprolu@gmail.com> writes:

 > Peter,

 >  All,
 >   We are using busybox to get DHCPv6  address. However, I am bit confused
 > on the part of the script /etc/udhcpc.d/50default:

 > wait_for_ipv6_default_route() {
 > *        printf "Waiting for IPv6 default route to appear"*
 >         while [ $IF_WAIT_DELAY -gt 0 ]; do
 > *                if [ -z "$(ip -6 route list | grep default)" ]; then*
 >                         printf "\n"
 >                         return
 >                 fi
 >                 sleep 1
 >                 printf "."
 >                 : $((IF_WAIT_DELAY -= 1))
 >         done
 >         printf " timeout!\n"
 > }

 > The print says "Waiting for IPv6 default route to appear". However the if
 > statement is checking for "$(ip -6 route list | grep default)"to be null
 > (-z check) which means default route is not present.

 > In our case, after DHCP, default route gets setup and "$(ip -6 route list |
 > grep default)"returns an entry starting with default and since check is -z,
 > it continues in the loop and finally prints "timeout".

 > I am confused here. Am I missing something here?

 >   The script in yocto seems to be derived from
 > package/busybox/udhcpc.script in buildroot. It also had the same
 > "wait_for_ipv6_default_route" function and same check.

Ok, but please be specific when you ask questions. So your question is
really about the code in package/busybox/udhcpc.script which got added
by:

commit 2d458a2d7c7f3418242aae52464306ef9f4a407f
Author: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date:   Tue May 21 12:54:28 2019 +1000

   package/busybox: udhcpc.script: wait for ipv6 default route from RA for stateful DHCPv6

   udhcpc6 implements "stateful" DHCPv6 for explicitly requesting an address
   and other configuration information. A major difference between DHCPv4
   and DHCPv6 is that DHCPv6 does *not* advertise a default route; this is
   determined by normal IPv6 autoconfiguration.

   Add logic to wait up to IF_WAIT_DELAY seconds for the IPv6 route to be
   configured; as above this doesn't come from DHCPv6 but rather the IPv6
   Router Advertisement (RA) which happens independently from udhcpc6.  The
   intent here is to try and ensure that the interface is route-able upon the
   script's completion as it would be if called from udhcpc.

   Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
   Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


The test indeed seems to be inverted. Samuel, any comments?

-- 
Bye, Peter Korsgaard
