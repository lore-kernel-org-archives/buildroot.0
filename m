From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 19 Mar 2018 16:15:17 +0000
Subject: [Buildroot] [PATCH 1/2] core/intrumetnation: don't spawn to get
 seconds-since-EPOCH
In-Reply-To: <20180318161605.GB2478@scaer>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <ef3b9c4c1ca910423b06f1374ee9461c77aaeed1.1521146096.git.yann.morin.1998@free.fr>
 <CABa6e=qZfehqQHFAkutn-WaFAw6Gp3Za-3_3ZB6mXd1ukxZq7w@mail.gmail.com>
 <20180318161605.GB2478@scaer>
Message-ID: <1521476116.10662.130.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-03-18 at 17:16 +0100, Yann E. MORIN wrote:
> > >  define step_time
> > > -       printf "%s:%-5.5s:%-20.20s: %s\n"           \
> > > -              "$$(date +%s)" "$(1)" "$(2)" "$(3)"  \
> > > +       printf "%(%s)T:%-5.5s:%-20.20s: %s\n"           \
> > > +              -1 "$(1)" "$(2)" "$(3)"  \
> > 
> > Should you note somewhere that this needs bash 4.2? I remember some
> > re-working of bash patches in the past to avoid the use of associative arrays
> > as they were not supported in the oldest version of bash supported by
> > buildroot. Is bash 4.2 ok now?
> > 
> 
> OK, I'm dropping this change, then. Thanks for noticing. :-)

If it weren't for the space padding of the fields, you could go the
other way and avoid the printf call and just use date.

define step_time
	date +"%s.%N:$(1):$(2):$(3)"

Not as pretty to look at, but just as parsable to a script.
