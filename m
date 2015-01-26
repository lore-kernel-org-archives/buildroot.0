From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Jan 2015 11:09:31 -0300
Subject: [Buildroot] pppd makefile moves /etc/PPP/resolv.conf
In-Reply-To: <9F494D13-32F4-497C-A834-C60AA93406E9@nowonline.co.uk>
References: <38D70EB2-AE5E-475D-865B-7225F7CD5E26@nowonline.co.uk>
 <54C61802.4010602@zacarias.com.ar>
 <9F494D13-32F4-497C-A834-C60AA93406E9@nowonline.co.uk>
Message-ID: <54C64A9B.5050602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/26/2015 10:27 AM, Lee Essen wrote:

> Hi Gustavo,
> 
> OK, makes sense, however doesn?t make it easy to do anything clever with resolv.conf.
> 
> In the standard DHCP client it?s actually the script and not the binary that creates resolv.conf so it?s really easy to control behaviour.
> 
> The problem with pppd is that if you don?t specify usepeerdns then you don?t get any information (and no env vars for the script) and you if you specify usepeerdns then it writes /etc/resolv.conf without a care!
> 
> The more I think about it, the more I think the problem is actually with pppd, and your ?multiple-pppd? example is another good use case that breaks, even with an unmodified pppd.
> 
> The best solution I can come up with is the use of a ?noresolv? option for ppp that says ?don?t create a resolve.conf file? ? then I don?t care where it points, it doesn?t write anything at all, yet the DNS vars are available to ppp-up. The default case also doesn?t break existing behaviour.
> 
> It?s a trivial patch that I?m happy to share if anyone is interested, otherwise I?ll just keep it in my tree.
> 
> Thanks,
> 
> Lee.

Hi again.
A quick fix might be to throw in an ip-up script that makes
/etc/resolv.conf (using $DNS1, $DNS2 and $USEPEERDNS i think) in the
pppd package, and make the binary write resolv.conf to some no-op like
/dev/null.
This way we still got the benefit of PnP-like dns configuration that can
be easily disabled by removing said script.
Regards.
