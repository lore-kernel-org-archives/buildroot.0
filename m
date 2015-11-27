From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 27 Nov 2015 20:14:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-26
In-Reply-To: <20151127162035.49cabe73@free-electrons.com>
References: <20151127073014.F0A24102391@stock.ovh.net>
 <1448629389.16816.4.camel@embedded.rocks>
 <20151127162035.49cabe73@free-electrons.com>
Message-ID: <1448651679.3542.9.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2015-11-27 at 16:20 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Fri, 27 Nov 2015 14:03:09 +0100, J?rg Krause wrote:
> 
> > > ?????????arm |????????????????arptables-0.0.4 | NOK | http://auto
> > > buil
> > > d.buildroot.net/results/b721e4fa24a0728c20fd2ec0663c2b5981387642/
> > 
> > I had a look at this. Build fails because of namespace collision
> > between netinet and linux headers, e.g IPPROTO_IP is both defined
> > in
> > linux/in.h and?netinet/in.h.
> > 
> > Unfortunatly, I am not sure how to fix this properly.
> 
> That's a typical case of issue exhibited by musl. You can probably
> just
> remove the <linux/in.h> include completely.
> 

Unfortunatly it is not so easy: 'libarptc.h' includes 'netinit/in.h'
through the local header file 'libarptc/arpt_kernel_headers.h' directly
and indirectly, e.g. through 'netinet/ip.h'. On the other hand it
includes 'linux/in.h' indirectly through the system header file
'linux/netfilter_arp/arp_tables.h'. The declarations from
'linux/netfilter_arp/arp_tables.h' are required, so this header cannot
be removed easily.

Any idea?

Best regards
J?rg Krause
