From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Jan 2018 22:46:57 +0100
Subject: [Buildroot] [PATCH v1 2/2] dhcp: disable isc assertions
 (reproducible builds)
In-Reply-To: <20180108211857.2166f95e@windsurf>
References: <20171027192424.19760-1-ps.report@gmx.net>
 <20171027192424.19760-2-ps.report@gmx.net>
 <20180108211857.2166f95e@windsurf>
Message-ID: <20180115224657.3f049f46@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, *,

On Mon, 8 Jan 2018 21:18:57 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
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

I think yes, as std::assert does in case NDEBUG is set (or many other assert
implementations which are disabled in release code)...

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

Which would save the reproducible problem, but lags the complete space
saving advantage...

> Peter, Arnout, Yann, what do you think, especially about the
> assertions ?

Any Comments?

Regards,
Peter

> 
> Best regards,
> 
> Thomas
