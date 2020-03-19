From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Mar 2020 15:00:18 +0100
Subject: [Buildroot] [PATCH v6 18/28] package/cmake: Fix for using -O in
 top-level make
In-Reply-To: <CALFsTFUN-zHap9eg2AVoeVCH+5Yw3gF3SPZNx9rOFRtwtvUeLw@mail.gmail.com>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-19-anaumann@ultratronik.de>
 <20200311232503.0bafe189@windsurf>
 <33267645-fd49-cb20-bb8f-f6a1edd57a15@mind.be>
 <d6125560-ca00-a4be-cfde-ff200d332756@andin.de>
 <20200317070800.6365cac6@windsurf.home>
 <CALFsTFUiXLAVUPaKE22FZE7sF2V4uhv6XmDyim0-cveKP950mA@mail.gmail.com>
 <0172c8d6-c39a-10a4-cb03-839242936287@andin.de>
 <CALFsTFVHh+K0_9Un4Gx1TKVi1HwoDqG7N=gvMgdVxpN5iB0vyQ@mail.gmail.com>
 <6e936a94-ca1a-dce4-cae5-40605344119b@andin.de>
 <CALFsTFVNjnov69twmk_kv6VdBQAkLXTG4MaFUzw6LfiW2VmgDA@mail.gmail.com>
 <20200319134951.3f8dfb85@windsurf.home>
 <CALFsTFUN-zHap9eg2AVoeVCH+5Yw3gF3SPZNx9rOFRtwtvUeLw@mail.gmail.com>
Message-ID: <20200319150018.737f5e7c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Mar 2020 15:53:23 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> > Requiring make > 4.0 on the host system is too strict, especially
> > considering that the issue we have here only happens in very specific
> > conditions: ccache support enabled, and passing of custom -O flags that
> > are only useful for top-level parallel build, which is itself an
> > experimental feature.  
> 
> Just as a side note - the problem isn't related to ccache. We
> reproduced it with -O and top-level parallel build.

Sorry, I mixed things up, and thought it was ccache related.

> In addition, if you have any suggestion how to address that case -
> I'll be more than happy to help.

I don't have any really good suggestion. But it's really a corner case:
only happens with make 4.1 if I understand correctly, and only when you
pass some variants of the -O option.

The "make -Orecurse" option, which is the most relevant for top-level
parallel build, does not exhibit the issue.

So essentially I simply wouldn't fix the problem. If you really want to
fix it, maybe we can have some fancy logic in the main Makefile to
detect that one of the problematic -O option is passed, and the make
version is not appropriate, and then error out.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
