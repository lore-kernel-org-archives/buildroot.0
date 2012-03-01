From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2012 01:00:02 +0000
Subject: [Buildroot] Buildroot 2012.02-rc3 released
In-Reply-To: <CAJJ6jxvuCDspQ7eFe=1-=Zp00PygaFcXkyNh20sPsiAN77h3zQ@mail.gmail.com>
References: <87ehtg2r6n.fsf@macbook.be.48ers.dk>
 <201203010017.12296.arnout@mind.be>
 <CAJJ6jxvuCDspQ7eFe=1-=Zp00PygaFcXkyNh20sPsiAN77h3zQ@mail.gmail.com>
Message-ID: <201203010100.03660.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 01 March 2012 00:52:20 Steve Calfee wrote:
> On Wed, Feb 29, 2012 at 4:17 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On Wednesday 29 February 2012 23:48:36 Steve Calfee wrote:
> >> Both systems sit on a NAT LAN with 192.168* ip addresses. I don't know
> >> if that affects things, shouldn't.
> >
> >  It will.  The DNS on the NAT will cache the authoritive server for
> > uclibc.org.  If the original uclibc.org DNS server still replies to DNS
> > requests, but doesn't give answers for uclibc.org addresses, then the NAT
> > will not look further.  You can verify this by issuing
> >
> > host -v -t SOA uclibc.org
> >
> > which should reply
> >
> > uclibc.org.             86125   IN      SOA     ns1.auth.osuosl.org. hostmaster.osuosl.org. 1330554603 300 900 604800 86400
> >
> > but will probably reply with the old DNS server.
> >
> >  There is unfortunately no way to force your NAT to forget the cached
> > record.  You can try to NOT access any uclibc.org site for 48 hours,
> > which may expire the cache.
> >
> I did what you suggested, But I don't know if the differences are important:
> me:~$ host -v -t SOA uclibc.org
> Trying "uclibc.org"
> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 64103
> ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1
> 
> ;; QUESTION SECTION:
> ;uclibc.org.			IN	SOA
> 
> ;; ANSWER SECTION:
> uclibc.org.		86400	IN	SOA	ns1.auth.osuosl.org. hostmaster.osuosl.org.
> 1330554603 300 900 604800 86400
> 
> ;; ADDITIONAL SECTION:
> ns1.auth.osuosl.org.	67451	IN	A	140.211.166.140
> 
> Received 107 bytes from 192.168.3.31#53 in 305 ms

 That looks OK though...  So my explanation has some flaws :-)

 What does host -v -t SOA git.buildroot.net tell you?

Trying "git.buildroot.net"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 44693
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 1, ADDITIONAL: 0

;; QUESTION SECTION:
;git.buildroot.net.             IN      SOA

;; ANSWER SECTION:
git.buildroot.net.      36219   IN      CNAME   buildroot.uclibc.org.
buildroot.uclibc.org.   79420   IN      CNAME   www.uclibc.org.

;; AUTHORITY SECTION:
uclibc.org.             10664   IN      SOA     ns1.auth.osuosl.org. hostmaster.osuosl.org. 1330554603 300 900 604800 86400

Received 150 bytes from 192.168.22.22#53 in 70 ms

-- 
Arnout Vandecappelle                               arnout@mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
