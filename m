From: Lee Essen <lee.essen@nowonline.co.uk>
Date: Mon, 26 Jan 2015 19:52:49 +0400
Subject: [Buildroot] pppd makefile moves /etc/PPP/resolv.conf
In-Reply-To: <54C64A9B.5050602@zacarias.com.ar>
References: <38D70EB2-AE5E-475D-865B-7225F7CD5E26@nowonline.co.uk>
 <54C61802.4010602@zacarias.com.ar>
 <9F494D13-32F4-497C-A834-C60AA93406E9@nowonline.co.uk>
 <54C64A9B.5050602@zacarias.com.ar>
Message-ID: <229B9DED-2639-4EE5-91DC-242BA40B3239@nowonline.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 26 Jan 2015, at 18:09, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> 
> On 01/26/2015 10:27 AM, Lee Essen wrote:
> 
>> Hi Gustavo,
>> 
>> OK, makes sense, however doesn?t make it easy to do anything clever with resolv.conf.
>> 
>> In the standard DHCP client it?s actually the script and not the binary that creates resolv.conf so it?s really easy to control behaviour.
>> 
>> The problem with pppd is that if you don?t specify usepeerdns then you don?t get any information (and no env vars for the script) and you if you specify usepeerdns then it writes /etc/resolv.conf without a care!
>> 
>> The more I think about it, the more I think the problem is actually with pppd, and your ?multiple-pppd? example is another good use case that breaks, even with an unmodified pppd.
>> 
>> The best solution I can come up with is the use of a ?noresolv? option for ppp that says ?don?t create a resolve.conf file? ? then I don?t care where it points, it doesn?t write anything at all, yet the DNS vars are available to ppp-up. The default case also doesn?t break existing behaviour.
>> 
>> It?s a trivial patch that I?m happy to share if anyone is interested, otherwise I?ll just keep it in my tree.
>> 
>> Thanks,
>> 
>> Lee.
> 
> Hi again.
> A quick fix might be to throw in an ip-up script that makes
> /etc/resolv.conf (using $DNS1, $DNS2 and $USEPEERDNS i think) in the
> pppd package, and make the binary write resolv.conf to some no-op like
> /dev/null.
> This way we still got the benefit of PnP-like dns configuration that can
> be easily disabled by removing said script.
> Regards.

Yep, that would work ok, but the below feels nicer to me and doesn?t require extra scripts, plus it?s something that could probably be suggested upstream ? the default behaviour is entirely unchanged (providing you keep the path change that?s there currently) so everything should work as is unless you add the config option.

diff -Naur pppd-orig/pppd/ipcp.c pppd-2.4.7/pppd/ipcp.c
--- pppd-orig/pppd/ipcp.c	2014-08-09 13:31:39.000000000 +0100
+++ pppd-2.4.7/pppd/ipcp.c	2015-01-26 07:27:04.758264172 +0000
@@ -91,6 +91,7 @@
 static int default_route_set[NUM_PPP];	/* Have set up a default route */
 static int proxy_arp_set[NUM_PPP];	/* Have created proxy arp entry */
 static bool usepeerdns;			/* Ask peer for DNS addrs */
+static bool noresolv;			/* Don't write resolv.conf */
 static int ipcp_is_up;			/* have called np_up() */
 static int ipcp_is_open;		/* haven't called np_finished() */
 static bool ask_for_local;		/* request our address from peer */
@@ -209,6 +210,8 @@
 
     { "usepeerdns", o_bool, &usepeerdns,
       "Ask peer for DNS address(es)", 1 },
+    { "noresolv", o_bool, &noresolv,
+      "disable creation of the resolv.conf file", 1 },
 
     { "netmask", o_special, (void *)setnetmask,
       "set netmask", OPT_PRIO | OPT_A2STRVAL | OPT_STATIC, netmask_str },
@@ -1827,6 +1830,7 @@
 	script_setenv("DNS2", ip_ntoa(go->dnsaddr[1]), 0);
     if (usepeerdns && (go->dnsaddr[0] || go->dnsaddr[1])) {
 	script_setenv("USEPEERDNS", "1", 0);
+	if (!noresolv)
 	create_resolv(go->dnsaddr[0], go->dnsaddr[1]);
     }



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150126/a18d7b3e/attachment.html>
