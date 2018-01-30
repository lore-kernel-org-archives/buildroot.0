From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jan 2018 18:54:02 +0100
Subject: [Buildroot] [PATCH v1 2/2] dhcp: disable isc assertions
 (reproducible builds)
In-Reply-To: <20180108211857.2166f95e@windsurf>
References: <20171027192424.19760-1-ps.report@gmx.net>
 <20171027192424.19760-2-ps.report@gmx.net>
 <20180108211857.2166f95e@windsurf>
Message-ID: <20180130175402.GA3468@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter S., All,

On 2018-01-08 21:18 +0100, Thomas Petazzoni spake thusly:
> On Fri, 27 Oct 2017 21:24:24 +0200, Peter Seiderer wrote:
> > The isc assertions from the bundled bind dns library are
> > using the __FILE__ macro for debug messages (see
> > dhcp-4.3.5/bind/bind-9.9.9-P3/lib/isc/include/isc/assertions.h).
> > 
> > Disabling the assertions gains:
> > 
> > - reproducible builds (no built time pathes in the executable)
> > - space saving on the target:
> >   dhcpd: 1.9M -> 1.6M
> >   dhcrelay: 1.6M -> 1.3M
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/dhcp/dhcp.mk | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> > index 45cae087aa..0bae61283a 100644
> > --- a/package/dhcp/dhcp.mk
> > +++ b/package/dhcp/dhcp.mk
> > @@ -11,7 +11,9 @@ DHCP_LICENSE = ISC
> >  DHCP_LICENSE_FILES = LICENSE
> >  DHCP_CONF_ENV = \
> >  	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
> > -		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"'
> > +		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
> > +	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
> 
> I'm not sure about this one.
> 
> Do we want to remove assertions from production code ?
> 
> Regarding the __FILE__ problem, I think this is going to bite us on a
> large number of packages. So instead of a per-package solution, we
> should perhaps have a look at:
> 
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268, proposal for a
>   -ffile-map-prefix option to gcc
> 
>   https://wiki.debian.org/ReproducibleBuilds/BuildPathProposal, also
>   discussing a similar idea
> 
> Peter, Arnout, Yann, what do you think, especially about the
> assertions ?

Assertions are supposed to be usefull during development, not during
production use, so I would be fine with disabling them, yes.

At least, I would hope that no sane developer uses assertions to check
for normal error conditions in normal operation mode... ;-]

Now, about reproducibility... We could at least pass -DFILE=\"\" and so
on from inside our gcc-wrapper, like we already do for __DATE__ and
__TIME__. Yes, that would give an empty filename in assertions and the
likes, but do we care in the end?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
